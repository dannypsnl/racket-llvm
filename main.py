# modify from https://github.com/revng/llvmcpy/blob/master/llvmcpy/_generator.py
# under MIT license
import fnmatch
import keyword
import os
import re
import shutil
import subprocess
import tempfile
from collections import defaultdict
from pathlib import Path
from typing import Any, List, MutableMapping, Optional, Tuple, Union

from cffi import FFI
import pycparser
import pycparser.c_ast
import pycparser.c_generator

Properties = MutableMapping[str, Tuple[Tuple[str, str], Tuple[str, str]]]
EnumMap = MutableMapping[Union[int, str], Union[int, str]]

unsigned_ints = {"unsigned", "unsigned int", "unsigned long"}


def handle_enums(all_c_preprocessed: Path) -> MutableMapping[str, EnumMap]:
    """
    Parse enum typedefs and return a dictionary mapping from typedefs to values
    as well as from values to the integer representation of the enum.

    Returns a dict with the following structure (example):
    {
        "Opcode": {1: 'Ret', 2: 'Br', ..., 'Ret': 1, 'Br': 2, ...},
        "Visibility": {0: 'DefaultVisibility', ..., 'DefaultVisibility': 0, ...},
        ...
    }

    """

    def remove_prefix(name: str) -> str:
        if name.startswith("LLVM") and not name.startswith("LLVM_"):
            return name[4:]
        return name

    def handle_expression(variables, expression) -> int:
        expression_type = type(expression)
        if expression_type is pycparser.c_ast.Constant:
            return int(expression.value.rstrip("U"), 0)
        elif expression_type is pycparser.c_ast.ID:
            assert expression.name in variables
            return variables[expression.name]
        elif expression_type is pycparser.c_ast.BinaryOp:
            left = handle_expression(variables, expression.left)
            right = handle_expression(variables, expression.right)
            if expression.op == "|":
                return left | right
            elif expression.op == "&":
                return left & right
            elif expression.op == "+":
                return left + right
            elif expression.op == "-":
                return left - right
            elif expression.op == "<<":
                return left << right
            elif expression.op == ">>":
                return left >> right
            else:
                assert False
        else:
            assert False

    class EnumVisitor(pycparser.c_ast.NodeVisitor):
        def __init__(self):
            self._name: Optional[str] = None
            self.enums: MutableMapping[str, EnumMap] = {}

        def visit_Typedef(self, typedef) -> None:
            self._name = remove_prefix(typedef.name)
            self.generic_visit(typedef)

        def visit_EnumeratorList(self, enum_list) -> None:
            # Check if we are in a typedef scope
            if self._name is not None:
                value = 0
                mapping: MutableMapping[Union[int, str], Union[int, str]] = {}
                context: MutableMapping[str, int] = {}
                for enum in enum_list.enumerators:
                    assert isinstance(enum, pycparser.c_ast.Enumerator)

                    # Check if enum has defined a value
                    if enum.value is not None:
                        value = handle_expression(context, enum.value)
                    name = remove_prefix(enum.name)
                    mapping[value] = name

                    # Add reverse lookup as well, ignoring aliases
                    if name not in mapping:
                        mapping[name] = value

                    # Save in the context, so that other entries can refer to it
                    context[enum.name] = value

                    # Rewrite using a constant
                    enum.value = pycparser.c_ast.Constant("int", str(value))  # type: ignore

                    value += 1

                self.enums[self._name] = mapping

                # Clear the scope
                self._name = None

    ast = pycparser.c_parser.CParser().parse(all_c_preprocessed.read_text(), filename=str(all_c_preprocessed))

    visitor = EnumVisitor()
    visitor.visit(ast)

    generator = pycparser.c_generator.CGenerator()
    all_c_preprocessed.write_text(generator.visit(ast).replace("__dotdotdot__", "foo"))

    return visitor.enums

class RacketGenerator:
    def __init__(self, cpp: str, libraries: List[Path], include_dir: Path):
        self.cpp = cpp
        self.libraries = libraries
        self.include_dir = include_dir
        self.ffi = FFI()

    def is_llvm_type(self, name: str) -> bool:
        return name.startswith("struct LLVM") or name.startswith("LLVM")

    def remove_llvm_prefix(self, name: str) -> str:
        assert self.is_llvm_type(name)
        if name.startswith("struct "):
            name = name[len("struct ") :]
        name = name[len("LLVM") :]
        if name.startswith("Opaque"):
            name = name[len("Opaque") :]
        return name

    def to_racket_case(self, name: str) -> str:
        """Convert "GetLLVMFunctionID" to a more rackety "get-llvm-function-id" """

        # If it's all upper cases, simply return the lower case version
        if name.isupper():
            return name.lower().replace("_", "-")

        result = ""
        # When the case in the input changes, emit a -
        for prev, cur, next in zip("a" + name[:-1], name, name[1:] + "a"):
            if (prev.islower() and cur.isupper()) or (next.islower() and cur.isupper()):
                result += "-"
            result += cur.lower()

        # If the string ends with capital letters, remove the last -
        if name[-2:].isupper():
            result = result[:-2] + result[-1:]

        # Discard the initial -
        return result[1:].replace("_", "-")

    def normalize_name(self, original_name: str) -> str:
        """Normalizes the case for Racket function names"""
        return self.to_racket_case(original_name)

    def create_function(self, name: str, prototype) -> str:
        """Return a string containing a Racket FFI binding for the specified library function"""
        
        # Convert function name to Racket naming convention
        racket_name = self.normalize_name(name)
        
        # Check if this function needs a sophisticated signature
        if self.needs_sophisticated_signature(name):
            return self.create_sophisticated_function(name, prototype)
        
        # Check if this function uses the int-fail pattern
        if self.uses_int_fail_pattern(name, prototype):
            return self.create_int_fail_function(name, prototype)
        
        # Build the argument types for the FFI signature
        arg_types = []
        for i, arg_type in enumerate(prototype.args):
            racket_type = self.convert_type_to_racket(arg_type)
            # Apply special logic for known boolean parameters
            if self.is_boolean_parameter(name, i, arg_type):
                racket_type = "_bool"
            arg_types.append(racket_type)
        
        # Build the return type
        return_type = self.convert_type_to_racket(prototype.result)
        # Apply special logic for known boolean return types
        if self.is_boolean_return(name, prototype.result):
            return_type = "_bool"
        
        # Create the function signature
        if arg_types:
            signature = f"(_fun {' '.join(arg_types)} -> {return_type})"
        else:
            signature = f"(_fun -> {return_type})"
        
        # Generate the binding
        result = f"(define-llvm {racket_name} {signature} #:c-id {name})"
        
        return result
    
    def is_boolean_parameter(self, func_name: str, param_index: int, param_type) -> bool:
        """Check if a parameter should be treated as boolean based on LLVM conventions"""
        # Known boolean parameters in LLVM functions
        boolean_params = {
            "LLVMFunctionType": [3],  # IsVarArg parameter
            "LLVMStructType": [2],    # IsPacked parameter
            "LLVMStructTypeInContext": [3],  # IsPacked parameter
        }
        
        return func_name in boolean_params and param_index in boolean_params[func_name]
    
    def is_boolean_return(self, func_name: str, return_type) -> bool:
        """Check if a return type should be treated as boolean based on LLVM conventions"""
        # Functions that return LLVMBool
        boolean_returns = {
            "LLVMVerifyModule",
            "LLVMVerifyFunction", 
            "LLVMIsFunctionVarArg",
            "LLVMIsPackedStruct",
        }
        
        return func_name in boolean_returns
    
    def uses_int_fail_pattern(self, func_name: str, prototype) -> bool:
        """Check if a function uses the int-fail pattern (returns int where 0=success, non-zero=failure)"""
        # Functions that return int and represent failure patterns
        int_fail_functions = {
            "LLVMCreateInterpreterForModule",
            "LLVMCreateJITCompilerForModule", 
            "LLVMCreateMCJITCompilerForModule",
            "LLVMCreateMemoryBufferWithContentsOfFile",
            "LLVMCreateMemoryBufferWithSTDIN",
            "LLVMGetBitcodeModule",
            "LLVMGetBitcodeModule2",
            "LLVMGetBitcodeModuleInContext",
            "LLVMGetBitcodeModuleInContext2",
            "LLVMGetTargetFromTriple",
            "LLVMLinkModules2",
            "LLVMLoadLibraryPermanently",
            "LLVMParseBitcode",
            "LLVMParseBitcode2",
            "LLVMParseBitcodeInContext",
            "LLVMParseBitcodeInContext2",
            "LLVMParseIRInContext",
            "LLVMPrintModuleToFile",
            "LLVMRemoveModule",
            "LLVMRunFunctionAsMain",
            "LLVMRunFunctionPassManager",
            "LLVMRunPassManager",
            "LLVMStripModuleDebugInfo",
            "LLVMTargetMachineEmitToFile",
            "LLVMTargetMachineEmitToMemoryBuffer",
            "LLVMWriteBitcodeToFD",
            "LLVMWriteBitcodeToFile",
            "LLVMWriteBitcodeToFileHandle",
        }
        
        return (func_name in int_fail_functions and 
                prototype.result.kind == "primitive" and 
                prototype.result.cname == "int")
    
    def create_int_fail_function(self, name: str, prototype) -> str:
        """Create a function with the int-fail pattern (converts int return to bool with error handling)"""
        racket_name = self.normalize_name(name)
        
        # Build parameter names and types
        param_names = []
        param_types = []
        used_names = set()  # Track used names to avoid duplicates
        
        for i, arg_type in enumerate(prototype.args):
            racket_type = self.convert_type_to_racket(arg_type)
            
            # Generate parameter name based on type or position
            if racket_type == "_LLVMModuleRef":
                base_name = "mod"
                param_name = base_name
                counter = 1
                while param_name in used_names:
                    param_name = f"{base_name}-{counter}"
                    counter += 1
            elif racket_type == "_string":
                param_name = "file-path" if "file" in name.lower() else "path"
            elif racket_type == "_pointer":
                param_name = f"out-param-{i}"
            elif racket_type.startswith("_LLVM") and racket_type.endswith("Ref"):
                # Extract base type name for parameter
                base_type = racket_type[5:-3].lower()  # Remove _LLVM and Ref
                base_name = base_type.replace("_", "-")
                param_name = base_name
                counter = 1
                while param_name in used_names:
                    param_name = f"{base_name}-{counter}"
                    counter += 1
            else:
                param_name = f"param-{i}"
            
            used_names.add(param_name)
            param_names.append(param_name)
            param_types.append(f"({param_name} : {racket_type})")
        
        # Create the function signature with int-fail pattern
        param_signature = " ".join(param_names)
        param_types_str = "\n                                              ".join(param_types)
        
        # Generate appropriate error message
        error_message = f"{name.lower().replace('llvm', '').replace('_', ' ')} failed"
        
        result = f"""(define-llvm {racket_name} (_fun ({param_signature}) ::
                                              {param_types_str}
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "{error_message}")))
  #:c-id {name})"""
        
        return result
    
    def needs_sophisticated_signature(self, func_name: str) -> bool:
        """Check if a function needs a sophisticated Racket FFI signature"""
        sophisticated_functions = {
            "LLVMFunctionType",
            "LLVMAppendBasicBlock", 
            "LLVMBuildAdd",
            "LLVMBuildRet",
            "LLVMCreateExecutionEngineForModule",
            "LLVMCreateGenericValueOfInt",
            "LLVMGenericValueToInt",
            "LLVMRunFunction",
            "LLVMVerifyModule", 
            "LLVMVerifyFunction",
            "LLVMBuildICmp", 
            "LLVMBuildFCmp",
            "LLVMConstInt",
            "LLVMPointerType",
            "LLVMBuildGlobalStringPtr",
            "LLVMBuildCall2",
        }
        return func_name in sophisticated_functions
    
    def create_sophisticated_function(self, name: str, prototype) -> str:
        """Create sophisticated Racket FFI bindings with defaults and conversions"""
        racket_name = self.normalize_name(name)
        
        if name == "LLVMFunctionType":
            return f"""(define-llvm {racket_name} (_fun  (return-type [param-types (list)] [variadic? #f]) ::
                                       (return-type : _LLVMTypeRef)
                                       (param-types : (_list i _LLVMTypeRef))
                                       (_uint = (length param-types)) ; num params
                                       (variadic? : _bool)
                                       -> _LLVMTypeRef)
  #:c-id {name})"""
        
        elif name == "LLVMAppendBasicBlock":
            return f"""(define-llvm {racket_name} (_fun  (func [name ""]) ::
                                        (func : _LLVMValueRef)
                                        (name : _string)
                                        -> _LLVMBasicBlockRef)
  #:c-id {name})"""
        
        elif name == "LLVMBuildAdd":
            return f"""(define-llvm {racket_name} (_fun  (builder lhs rhs [name ""]) ::
                                     (builder : _LLVMBuilderRef)
                                     (lhs : _LLVMValueRef)
                                     (rhs : _LLVMValueRef)
                                     (name : _string)
                                     -> _LLVMValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMBuildRet":
            return f"""(define-llvm {racket_name} (_fun  (builder val) ::
                                     (builder : _LLVMBuilderRef)
                                     (val : _LLVMValueRef)
                                     -> _LLVMValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMCreateExecutionEngineForModule":
            return f"""(define-llvm {racket_name}
  (_fun (eng : (_ptr o _LLVMExecutionEngineRef))
        _LLVMModuleRef
        (err : (_ptr o _string))
        -> (result : _int)
        -> (cond
             [err (llvm-dispose-message err)]
             [(not (= 0 result)) (error "Failed to create execution engine")]
             [else eng]))
  #:c-id {name})"""
        
        elif name == "LLVMCreateGenericValueOfInt":
            return f"""(define-llvm {racket_name} (_fun  (type val [is-signed #f]) ::
                                           (type : _LLVMTypeRef)
                                           (val : _ullong)
                                           (is-signed : _bool)
                                           -> _LLVMGenericValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMGenericValueToInt":
            return f"""(define-llvm {racket_name} (_fun  (val [is-signed #f]) ::
                                         (val : _LLVMGenericValueRef)
                                         (is-signed : _bool)
                                         -> _ullong)
  #:c-id {name})"""
        
        elif name == "LLVMRunFunction":
            return f"""(define-llvm {racket_name} (_fun  (engine func args) ::
                                     (engine : _LLVMExecutionEngineRef)
                                     (func : _LLVMValueRef)
                                     (_uint = (length args))
                                     (args : (_list i _LLVMGenericValueRef))
                                     -> _LLVMGenericValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMVerifyModule":
            return f"""(define-llvm {racket_name} (_fun _LLVMModuleRef
                                      (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                      (err : (_ptr o _string))
                                      -> (failure : _bool)
                                      -> (when failure (llvm-dispose-message err)))
  #:c-id {name})"""
        
        elif name == "LLVMVerifyFunction":
            return f"""(define-llvm {racket_name} (_fun _LLVMValueRef
                                        (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                        (err : (_ptr o _string))
                                        -> (failure : _bool)
                                        -> (when failure (llvm-dispose-message err)))
  #:c-id {name})"""
        
        elif name == "LLVMBuildICmp":
            return f"""(define-llvm llvm-build-i-cmp (_fun  (builder predicate lhs rhs [name ""]) ::
                                        (builder : _LLVMBuilderRef)
                                        (predicate : _llvm-int-predicate)
                                        (lhs : _LLVMValueRef)
                                        (rhs : _LLVMValueRef)
                                        (name : _string)
                                        -> _LLVMValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMBuildFCmp":
            return f"""(define-llvm llvm-build-f-cmp (_fun  (builder predicate lhs rhs [name ""]) ::
                                        (builder : _LLVMBuilderRef)
                                        (predicate : _llvm-real-predicate)
                                        (lhs : _LLVMValueRef)
                                        (rhs : _LLVMValueRef)
                                        (name : _string)
                                        -> _LLVMValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMConstInt":
            return f"""(define-llvm {racket_name} (_fun  (type val [sign-extend #f]) ::
                                     (type : _LLVMTypeRef)
                                     (val : _ullong)
                                     (sign-extend : _bool)
                                     -> _LLVMValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMPointerType":
            return f"""(define-llvm {racket_name} (_fun  (type [address-space 0]) ::
                                        (type : _LLVMTypeRef)
                                        (address-space : _uint)
                                        -> _LLVMTypeRef)
  #:c-id {name})"""
        
        elif name == "LLVMBuildGlobalStringPtr":
            return f"""(define-llvm {racket_name} (_fun  (builder val [name ""]) ::
                                        (builder : _LLVMBuilderRef)
                                        (val : _string)
                                        (name : _string)
                                        -> _LLVMValueRef)
  #:c-id {name})"""
        
        elif name == "LLVMBuildCall2":
            return f"""(define-llvm {racket_name} (_fun  (builder fn-ty fn args [name ""]) ::
                                     (builder : _LLVMBuilderRef)
                                     (fn-ty : _LLVMTypeRef)
                                     (fn : _LLVMValueRef)
                                     (args : (_list i _LLVMValueRef))
                                     (_int = (length args))
                                     (name : _string)
                                     -> _LLVMValueRef)
  #:c-id {name})"""
        
        else:
            # Fallback to regular signature
            return self.create_regular_function(name, prototype)
    
    def create_regular_function(self, name: str, prototype) -> str:
        """Create a regular function signature (same as old create_function)"""
        racket_name = self.normalize_name(name)
        
        # Build the argument types for the FFI signature
        arg_types = []
        for i, arg_type in enumerate(prototype.args):
            racket_type = self.convert_type_to_racket(arg_type)
            # Apply special logic for known boolean parameters
            if self.is_boolean_parameter(name, i, arg_type):
                racket_type = "_bool"
            arg_types.append(racket_type)
        
        # Build the return type
        return_type = self.convert_type_to_racket(prototype.result)
        # Apply special logic for known boolean return types
        if self.is_boolean_return(name, prototype.result):
            return_type = "_bool"
        
        # Create the function signature
        if arg_types:
            signature = f"(_fun {' '.join(arg_types)} -> {return_type})"
        else:
            signature = f"(_fun -> {return_type})"
        
        return f"(define-llvm {racket_name} {signature} #:c-id {name})"
    
    def convert_type_to_racket(self, cffi_type) -> str:
        """Convert a CFFI type to a Racket FFI type"""
        if cffi_type.kind == "void":
            return "_void"
        elif cffi_type.kind == "primitive":
            type_map = {
                "int": "_int",
                "unsigned int": "_uint",
                "long": "_long",
                "unsigned long": "_ulong",
                "long long": "_llong",
                "unsigned long long": "_ullong",
                "char": "_byte",
                "unsigned char": "_ubyte",
                "short": "_short",
                "unsigned short": "_ushort",
                "float": "_float",
                "double": "_double",
                "bool": "_bool",
                "size_t": "_ulong",
                "uint64_t": "_uint64",
                "int64_t": "_int64",
                "uint32_t": "_uint32",
                "int32_t": "_int32",
                "uint16_t": "_uint16",
                "int16_t": "_int16",
                "uint8_t": "_uint8",
                "int8_t": "_int8",
                # LLVM-specific type mappings
                "LLVMBool": "_bool",
            }
            return type_map.get(cffi_type.cname, f"_{cffi_type.cname}")
        elif cffi_type.kind == "pointer":
            pointee = cffi_type.item
            if pointee.kind == "primitive" and pointee.cname == "char":
                return "_string"
            elif pointee.kind == "struct" and self.is_llvm_type(pointee.cname):
                # LLVM opaque pointer types
                ref_type = self.remove_llvm_prefix(pointee.cname)
                return f"_LLVM{ref_type}Ref"
            elif pointee.kind == "void":
                return "_pointer"
            else:
                return "_pointer"
        elif cffi_type.kind == "struct":
            if self.is_llvm_type(cffi_type.cname):
                ref_type = self.remove_llvm_prefix(cffi_type.cname)
                return f"_LLVM{ref_type}Ref"
            else:
                return "_pointer"
        elif cffi_type.kind == "enum":
            return "_uint"
        elif cffi_type.kind == "function":
            return "_pointer"
        else:
            return "_pointer"


    def clean_include_file(self, in_path: Path) -> None:
        """Clean the LLVM-C API headers files for parsing by CFFI: remove standard
        includes and static inline functions"""
        header_blacklist = [
            "llvm/Support/DataTypes.h",
            "llvm-c/DataTypes.h",
            "llvm-c/blake3.h",
            "math.h",
            "stddef.h",
            "cstddef",
            "sys/types.h",
            "stdbool.h",
        ]
        out_path = Path(str(in_path) + ".filtered")

        with in_path.open("r", encoding="utf8") as in_file, out_path.open(
            "w", encoding="utf8"
        ) as out_file:
            skip_block = False
            for line in in_file:
                skip = False
                for header in header_blacklist:
                    if line.startswith("#include ") and header in line:
                        skip = True

                if line.startswith("static inline"):
                    skip_block = True

                if skip or skip_block:
                    out_file.write("// ")

                line = re.sub(r"\b0U\b", "0", line)
                out_file.write(line)

                if line.startswith("}"):
                    skip_block = False
        shutil.move(out_path, in_path)

    def parse_headers(
        self,
    ) -> (Tuple[List[Tuple[Path, str, Any]], str, MutableMapping[str, EnumMap]]):
        """Parse the header files of the LLVM-C API and produce a list of libraries
        and the CFFI cached data"""

        def recursive_chmod(path: Path):
            path.chmod(0o700)
            for dirpath_str, _, filenames in os.walk(str(path)):
                dirpath = Path(dirpath_str)
                dirpath.chmod(0o700)
                for filename in filenames:
                    (dirpath / filename).chmod(0o600)

        # Create a temporary directory in which we will copy the headers and adapt
        # them a little for CFFI parsing
        temp_directory = Path(tempfile.mkdtemp())
        try:
            llvm_path = temp_directory / "llvm"
            llvm_path.mkdir()
            llvm_c_path = temp_directory / "llvm-c"
            shutil.copytree(self.include_dir / "llvm-c", llvm_c_path)
            shutil.copytree(
                self.include_dir / "llvm" / "Config", temp_directory / "llvm" / "Config"
            )

            recursive_chmod(temp_directory)

            # Find and adapt all the header files
            include_files = []
            for root_str, _, filenames in os.walk(llvm_c_path):
                root = Path(root_str)
                for filename in fnmatch.filter(filenames, "*.h"):
                    if filename != "DataTypes.h" and filename != "blake3.h":
                        header_path = root / filename
                        include_files.append(str(header_path.relative_to(temp_directory)))
                        self.clean_include_file(header_path)

            (temp_directory / "llvm-c" / "Deprecated.h").write_text(
                """
#ifndef LLVM_C_DEPRECATED_H
#define LLVM_C_DEPRECATED_H
#endif /* LLVM_C_DEPRECATED_H */
# define LLVM_ATTRIBUTE_C_DEPRECATED(decl, message) decl
"""
            )

            blake3_h = temp_directory / "llvm-c" / "blake3.h"
            if blake3_h.exists():
                blake3_h.unlink()

            # Create all.c, a C file including all the headers
            all_c = """
typedef long unsigned int size_t;
typedef int off_t;
"""
            all_c += '#include "'
            all_c += '"\n#include "'.join(include_files) + '"'
            all_c += "\n"
            all_c_path = temp_directory / "all.c"
            all_c_path.write_text(all_c)

            # Preprocess all.c
            all_c_preprocessed = temp_directory / "all.prep.c"
            result = subprocess.run(
                [
                    self.cpp,
                    "-U__GNUC__",
                    "-I" + str(temp_directory),
                    "-I" + str(self.include_dir),
                    "-E",
                    str(all_c_path),
                ],
                capture_output=True,
                text=True,
                check=True
            )

            # Use the preprocessed content directly from stdout
            preprocessed_content = result.stdout
            
            # Filter out problematic lines for CFFI and pycparser
            filtered_lines = []
            for line in preprocessed_content.split('\n'):
                line = line.strip()
                # Skip lines that start with # (preprocessor directives)
                if line.startswith('#'):
                    continue
                # Skip empty lines
                if not line:
                    continue
                # Skip lines with certain problematic constructs
                if 'pragma' in line.lower():
                    continue
                # Skip lines with macro concatenation (##)
                if '##' in line:
                    continue
                # Skip lines with __attribute__ (GNU compiler attributes)
                if '__attribute__' in line:
                    continue
                # Skip lines with inline assembly or other GNU extensions
                if '__asm__' in line or '__inline__' in line:
                    continue
                # Skip lines with complex macros that pycparser can't handle
                if line.startswith('extern') and ('__attribute__' in line or '__inline__' in line):
                    continue
                # Skip typedef function pointers (often problematic)
                if 'typedef' in line and ('(*' in line or 'Handler' in line):
                    continue
                # Skip function pointer declarations and callback typedefs
                if ('Handler' in line or 'Callback' in line or 'Hook' in line) and ('(' in line or ')' in line):
                    continue
                # Skip complex function signatures that CFFI can't handle
                if line.count('(') > 2 or line.count('*') > 3:
                    continue
                filtered_lines.append(line)
            
            filtered_content = '\n'.join(filtered_lines)
            
            # Parse enum definitions using automatic parsing
            # First write the filtered content to a temporary file for enum parsing
            temp_enum_file = temp_directory / "preprocessed_for_enums.c"
            with temp_enum_file.open("w") as f:
                f.write(filtered_content)
            
            # Extract enums using regex parsing (first pass)
            try:
                enums = self.extract_enums_from_headers()
                print(f"Successfully extracted {len(enums)} enums using regex parsing")
            except Exception as e:
                print(f"Regex enum extraction failed: {e}")
                enums = {}
            
            # Use the original working approach for function parsing (second pass)
            print("Using original CFFI approach for function parsing...")
            
            # Use the original working filtered content but less aggressive filtering
            simple_filtered_lines = []
            for line in preprocessed_content.split('\n'):
                line = line.strip()
                # Skip only the most problematic lines
                if line.startswith('#') or not line or '##' in line:
                    continue
                simple_filtered_lines.append(line)
            
            simple_filtered_content = '\n'.join(simple_filtered_lines)
            
            try:
                self.ffi.cdef(simple_filtered_content, override=True)
                print("CFFI parsing succeeded with original approach!")
            except Exception as e:
                print(f"Original CFFI parsing failed: {e}")
                print("Falling back to simplified parsing...")
                # Use the previous working essential content as fallback
                essential_content = """
typedef struct LLVMOpaqueContext *LLVMContextRef;
typedef struct LLVMOpaqueModule *LLVMModuleRef;
typedef struct LLVMOpaqueValue *LLVMValueRef;
typedef struct LLVMOpaqueBuilder *LLVMBuilderRef;
typedef struct LLVMOpaqueType *LLVMTypeRef;
typedef struct LLVMOpaqueBasicBlock *LLVMBasicBlockRef;
typedef struct LLVMOpaquePassManager *LLVMPassManagerRef;
typedef struct LLVMOpaqueExecutionEngine *LLVMExecutionEngineRef;
typedef struct LLVMOpaqueGenericValue *LLVMGenericValueRef;
typedef int LLVMBool;
"""
                try:
                    self.ffi.cdef(essential_content, override=True)
                    print("Using simplified approach")
                except Exception as e2:
                    print(f"Fallback parsing failed: {e2}")
                    self.ffi.cdef("typedef void* LLVMContextRef;", override=True)

            # Compile the CFFI data and save them so we can return it
            self.ffi.set_source("ffi", None)  # type: ignore
            self.ffi.compile(str(temp_directory))

            ffi_code = (temp_directory / "ffi.py").read_text()

        finally:
            # Cleanup
            shutil.rmtree(temp_directory)

        # Create a list of the LLVM libraries and dlopen them
        def basename(x: Path) -> str:
            result = x.name
            result = os.path.splitext(result)[0]
            result = result.replace(".", "")
            result = result.replace("-", "")
            return result

        libs = [
            (lib_file, basename(lib_file), self.ffi.dlopen(str(lib_file)))
            for lib_file in self.libraries
        ]

        return libs, ffi_code, enums

    def extract_enums_from_headers(self) -> MutableMapping[str, EnumMap]:
        """Extract enums directly from header files using regex patterns"""
        enums = {}
        
        # Find all .h files in the llvm-c directory
        for header_file in self.include_dir.glob("llvm-c/*.h"):
            content = header_file.read_text()
            
            # Use regex to find typedef enum patterns
            # Pattern: typedef enum { ... } EnumName;
            enum_pattern = r'typedef\s+enum\s*\{([^}]+)\}\s*([A-Za-z][A-Za-z0-9_]*)\s*;'
            
            for match in re.finditer(enum_pattern, content, re.DOTALL):
                enum_body = match.group(1)
                enum_name = match.group(2)
                
                # Parse individual enum values
                enum_values = {}
                current_value = 0
                
                # Split by commas and parse each entry
                for entry in enum_body.split(','):
                    entry = entry.strip()
                    if not entry:
                        continue
                        
                    # Remove comments and clean up
                    entry = re.sub(r'/\*.*?\*/', '', entry, flags=re.DOTALL)
                    entry = re.sub(r'//.*$', '', entry, flags=re.MULTILINE)
                    # Remove any remaining comment-like fragments
                    entry = re.sub(r'\*.*?\*', '', entry)
                    entry = re.sub(r'\*.*', '', entry)
                    entry = entry.strip()
                    # Skip if it looks like comment debris
                    if entry.startswith('*') or not re.match(r'^[A-Za-z]', entry):
                        continue
                    
                    if not entry:
                        continue
                    
                    # Check if it has an explicit value assignment
                    if '=' in entry:
                        name, value_str = entry.split('=', 1)
                        name = name.strip()
                        value_str = value_str.strip()
                        try:
                            # Handle simple numeric values
                            current_value = int(value_str)
                        except ValueError:
                            # Skip complex expressions for now
                            current_value += 1
                    else:
                        name = entry.strip()
                    
                    if name:
                        # Add both directions of mapping
                        enum_values[current_value] = name
                        enum_values[name] = current_value
                        current_value += 1
                
                if enum_values:
                    enums[enum_name] = enum_values
        
        return enums

    def generate_wrapper(self, output_path: Path) -> None:
        """Force the (re-)generation of the wrapper module for the current LLVM
        installation"""

        libs, ffi_code, enums = self.parse_headers()

        global_functions: List[Tuple[str, str, Any]] = []
        constants: List[Tuple[str, int]] = []
        discovered_types: set = set()

        # Loop over all the LLVM libraries
        for _, library_name, library in libs:
            # Loop over all the methods we identified with cffi, not all of them
            # will actually be available
            for name in dir(library):
                # A library contains only some methods, find out which ones
                if hasattr(library, name):
                    field = getattr(library, name)
                    if isinstance(field, int):
                        constants.append((name, field))

                    elif isinstance(field, FFI.CData):
                        # Is this a usable function?
                        prototype = self.ffi.typeof(field)
                        if not [1 for x in global_functions if x[1] == name]:
                            global_functions.append((library_name, name, prototype))
                            # Collect LLVM types from function signatures
                            self.collect_llvm_types(prototype, discovered_types)

        with output_path.open("w", encoding="utf8") as output_file:

            def write(string):
                output_file.write(string + "\n")

            # Print Racket module header
            write("#lang racket/base")
            write("(provide (all-defined-out))")
            write("(require ffi/unsafe")
            write('         "../definer.rkt")')
            write("")
            write("; LLVM FFI bindings")
            write("; Generated automatically from LLVM-C headers")
            write("")

            # Generate type definitions
            for llvm_type in sorted(discovered_types):
                write(self.generate_type_definition(llvm_type))
            
            if discovered_types:
                write("")

            # Print enum definitions
            for enum_name, enum_values in enums.items():
                write(self.generate_enum_definition(enum_name, enum_values))

            # Print global functions
            for library, name, prototype in global_functions:
                function_binding = self.create_function(name, prototype)
                write(function_binding)

            # Print numeric constants  
            for constant_name, constant_value in constants:
                if constant_name.startswith("LLVM") and not constant_name.startswith("LLVM_"):
                    constant_name = constant_name[4:]
                write(f"; {constant_name} = {constant_value}")

            # Add high-level wrapper functions with proper calling conventions
            write("; High-level wrapper functions")
            self.generate_wrapper_functions(write)
            write("")
            write("; End of generated bindings")
            write("")

    def collect_llvm_types(self, prototype, discovered_types):
        """Collect all LLVM types from a function prototype"""
        # Check return type
        if prototype.result.kind == "pointer" and prototype.result.item.kind == "struct":
            if self.is_llvm_type(prototype.result.item.cname):
                ref_type = self.remove_llvm_prefix(prototype.result.item.cname)
                discovered_types.add(f"_LLVM{ref_type}Ref")
        elif prototype.result.kind == "struct" and self.is_llvm_type(prototype.result.cname):
            ref_type = self.remove_llvm_prefix(prototype.result.cname)
            discovered_types.add(f"_LLVM{ref_type}Ref")
            
        # Check argument types
        for arg_type in prototype.args:
            if arg_type.kind == "pointer" and arg_type.item.kind == "struct":
                if self.is_llvm_type(arg_type.item.cname):
                    ref_type = self.remove_llvm_prefix(arg_type.item.cname)
                    discovered_types.add(f"_LLVM{ref_type}Ref")
            elif arg_type.kind == "struct" and self.is_llvm_type(arg_type.cname):
                ref_type = self.remove_llvm_prefix(arg_type.cname)
                discovered_types.add(f"_LLVM{ref_type}Ref")

    def generate_type_definition(self, racket_type: str) -> str:
        """Generate a define-cpointer-type definition for an LLVM type"""
        # Extract the base name (remove _LLVM and Ref)
        base_name = racket_type[5:-3]  # Remove '_LLVM' and 'Ref'
        tag_name = f"LLVMOpaque{base_name}"
        return f"(define-cpointer-type {racket_type} #:tag '{tag_name})"

    def generate_enum_definition(self, enum_name: str, enum_values: dict) -> str:
        """Generate a Racket enum definition"""
        # Special case for LLVMVerifierFailureAction to match user's pattern
        if enum_name == "LLVMVerifierFailureAction":
            racket_enum_name = "_LLVMVerifierFailureAction"
        else:
            # Convert enum name to Racket convention
            racket_enum_name = f"_{self.to_racket_case(enum_name)}"
        
        # Build the enum pairs
        enum_pairs = []
        for key, value in enum_values.items():
            if isinstance(key, str):  # Only process string keys (enum names)
                # Remove LLVM prefix from enum values for specific enums that need it
                clean_key = key
                if (enum_name in ["LLVMIntPredicate", "LLVMRealPredicate"] and 
                    clean_key.startswith("LLVM")):
                    clean_key = clean_key[4:]
                racket_key = self.to_racket_case(clean_key)
                enum_pairs.append(f"{racket_key} = {value}")
        
        # Sort enum pairs by value for consistent output
        enum_pairs.sort(key=lambda x: int(x.split(" = ")[1]))
        
        pairs_str = "\n           ".join(enum_pairs)
        return f"(define {racket_enum_name}\n  (_enum '({pairs_str})))"

    def generate_wrapper_functions(self, write):
        """Generate simple alias functions for compatibility"""
        
        # Simple alias functions
        write("(define llvm-module llvm-module-create-with-name)")
        write("(define llvm-builder-create llvm-create-builder)")
        write("(define llvm-builder-position-at-end llvm-position-builder-at-end)")
        write("(define llvm-generic-value->int llvm-generic-value-to-int)")
        write("(define llvm-build-int-cmp llvm-build-i-cmp)")
        write("(define llvm-build-string-ptr llvm-build-global-string-ptr)")
        write("(define llvm-module->string llvm-print-module-to-string)")
        write("(define llvm-pass-manager-create llvm-create-pass-manager)")
        write("(define llvm-pass-manager-run llvm-run-pass-manager)")
        write("")
        
        # Simple module and function verification wrappers  
        write("; Simple module verification wrapper")
        write("(define (llvm-module-verify mod)")
        write("  (llvm-verify-module mod))")
        write("(define (llvm-function-verify func)")
        write("  (llvm-verify-function func))")
        write("")


def main():
    """Main function to generate Racket LLVM FFI bindings"""
    import argparse
    import sys
    
    parser = argparse.ArgumentParser(description="Generate Racket FFI bindings for LLVM")
    parser.add_argument("--cpp", default="cpp", help="C preprocessor command")
    parser.add_argument("--include-dir", help="LLVM include directory (uses llvm-config if not specified)")
    parser.add_argument("--lib-dir", help="LLVM library directory (uses llvm-config if not specified)")
    
    args = parser.parse_args()
    
    # Get LLVM directories using llvm-config if not provided
    if not args.include_dir or not args.lib_dir:
        try:
            if not args.include_dir:
                result = subprocess.run(["llvm-config", "--includedir"], 
                                      capture_output=True, text=True, check=True)
                include_dir = Path(result.stdout.strip())
            else:
                include_dir = Path(args.include_dir)
                
            if not args.lib_dir:
                result = subprocess.run(["llvm-config", "--libdir"], 
                                      capture_output=True, text=True, check=True)
                lib_dir = Path(result.stdout.strip())
            else:
                lib_dir = Path(args.lib_dir)
                
        except (subprocess.CalledProcessError, FileNotFoundError):
            print("Error: llvm-config not found. Please specify --include-dir and --lib-dir manually.", file=sys.stderr)
            sys.exit(1)
    else:
        include_dir = Path(args.include_dir)
        lib_dir = Path(args.lib_dir)
    
    # Find LLVM libraries
    libraries = []
    
    # Look for LLVM shared libraries
    for pattern in ["libLLVM*.so", "libLLVM*.dylib", "libLLVM*.dll"]:
        libraries.extend(lib_dir.glob(pattern))
    
    if not libraries:
        print(f"Error: No LLVM libraries found in {lib_dir}", file=sys.stderr)
        sys.exit(1)
    
    print(f"Using LLVM include dir: {include_dir}")
    print(f"Using LLVM lib dir: {lib_dir}")
    print(f"Found LLVM libraries: {[lib.name for lib in libraries]}")
    
    # Create generator and generate bindings
    generator = RacketGenerator(args.cpp, libraries, include_dir)
    output_path = Path(os.path.join("private", "generated.rkt"))
    
    print(f"Generating Racket FFI bindings to {output_path}")
    generator.generate_wrapper(output_path)
    print("Done!")


if __name__ == "__main__":
    main()
