# Collect and print all C definitions from LLVM-C headers
# so we can compare what's missing in the Racket bindings.
#
# Modified from https://github.com/revng/llvmcpy/blob/master/llvmcpy/_generator.py
# under MIT license

import fnmatch
import os
import re
import shutil
import subprocess
import tempfile
from pathlib import Path
from typing import Any, List, MutableMapping, Tuple, Union

from cffi import FFI

Properties = MutableMapping[str, Tuple[Tuple[str, str], Tuple[str, str]]]
EnumMap = MutableMapping[Union[int, str], Union[int, str]]


def extract_enums_from_headers(include_dir: Path) -> MutableMapping[str, EnumMap]:
    """Extract enums directly from header files using regex patterns"""
    enums = {}

    for header_file in include_dir.glob("llvm-c/**/*.h"):
        content = header_file.read_text()

        # Pattern: typedef enum { ... } EnumName;
        enum_pattern = r"typedef\s+enum\s*\{([^}]+)\}\s*([A-Za-z][A-Za-z0-9_]*)\s*;"

        for match in re.finditer(enum_pattern, content, re.DOTALL):
            enum_body = match.group(1)
            enum_name = match.group(2)

            enum_values = {}
            current_value = 0

            for entry in enum_body.split(","):
                entry = entry.strip()
                if not entry:
                    continue

                # Remove comments
                entry = re.sub(r"/\*.*?\*/", "", entry, flags=re.DOTALL)
                entry = re.sub(r"//.*$", "", entry, flags=re.MULTILINE)
                entry = re.sub(r"\*.*?\*", "", entry)
                entry = re.sub(r"\*.*", "", entry)
                entry = entry.strip()
                if entry.startswith("*") or not re.match(r"^[A-Za-z]", entry):
                    continue
                if not entry:
                    continue

                if "=" in entry:
                    name, value_str = entry.split("=", 1)
                    name = name.strip()
                    value_str = value_str.strip()
                    try:
                        current_value = int(value_str)
                    except ValueError:
                        current_value += 1
                else:
                    name = entry.strip()

                if name:
                    enum_values[current_value] = name
                    enum_values[name] = current_value
                    current_value += 1

            if enum_values:
                enums[enum_name] = enum_values

    return enums


def clean_include_file(in_path: Path) -> None:
    """Clean LLVM-C API headers for parsing by CFFI"""
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
    cpp: str, libraries: List[Path], include_dir: Path
) -> Tuple[List[Tuple[Path, str, Any]], FFI, MutableMapping[str, EnumMap]]:
    """Parse LLVM-C headers and return libraries, FFI instance, and enums"""

    def recursive_chmod(path: Path):
        path.chmod(0o700)
        for dirpath_str, _, filenames in os.walk(str(path)):
            dirpath = Path(dirpath_str)
            dirpath.chmod(0o700)
            for filename in filenames:
                (dirpath / filename).chmod(0o600)

    ffi = FFI()
    temp_directory = Path(tempfile.mkdtemp())
    try:
        llvm_path = temp_directory / "llvm"
        llvm_path.mkdir()
        llvm_c_path = temp_directory / "llvm-c"
        shutil.copytree(include_dir / "llvm-c", llvm_c_path)
        shutil.copytree(
            include_dir / "llvm" / "Config", temp_directory / "llvm" / "Config"
        )

        recursive_chmod(temp_directory)

        include_files = []
        for root_str, _, filenames in os.walk(llvm_c_path):
            root = Path(root_str)
            for filename in fnmatch.filter(filenames, "*.h"):
                if filename != "DataTypes.h" and filename != "blake3.h":
                    header_path = root / filename
                    include_files.append(
                        str(header_path.relative_to(temp_directory))
                    )
                    clean_include_file(header_path)

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

        all_c = """
typedef long unsigned int size_t;
typedef int off_t;
"""
        all_c += '#include "'
        all_c += '"\n#include "'.join(include_files) + '"'
        all_c += "\n"
        all_c_path = temp_directory / "all.c"
        all_c_path.write_text(all_c)

        result = subprocess.run(
            [
                cpp,
                "-U__GNUC__",
                "-I" + str(temp_directory),
                "-I" + str(include_dir),
                "-E",
                str(all_c_path),
            ],
            capture_output=True,
            text=True,
            check=True,
        )

        preprocessed_content = result.stdout

        simple_filtered_lines = []
        for line in preprocessed_content.split("\n"):
            line = line.strip()
            if line.startswith("#") or not line or "##" in line:
                continue
            simple_filtered_lines.append(line)

        simple_filtered_content = "\n".join(simple_filtered_lines)

        # Remove __attribute__((...)) which CFFI cannot parse
        def strip_attributes(text: str) -> str:
            result = []
            i = 0
            while i < len(text):
                if text[i:].startswith("__attribute__"):
                    j = i + len("__attribute__")
                    # skip whitespace
                    while j < len(text) and text[j] in " \t\n":
                        j += 1
                    if j < len(text) and text[j] == "(":
                        depth = 0
                        while j < len(text):
                            if text[j] == "(":
                                depth += 1
                            elif text[j] == ")":
                                depth -= 1
                                if depth == 0:
                                    j += 1
                                    break
                            j += 1
                        i = j
                        continue
                result.append(text[i])
                i += 1
            return "".join(result)

        simple_filtered_content = strip_attributes(simple_filtered_content)

        try:
            ffi.cdef(simple_filtered_content, override=True)
        except Exception as e:
            print(f"CFFI parsing failed: {e}")
            print("Falling back to simplified parsing...")
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
            ffi.cdef(essential_content, override=True)

        ffi.set_source("ffi", None)
        ffi.compile(str(temp_directory))

        # Extract enums from the original headers
        enums = extract_enums_from_headers(include_dir)

    finally:
        shutil.rmtree(temp_directory)

    def basename(x: Path) -> str:
        result = x.name
        result = os.path.splitext(result)[0]
        result = result.replace(".", "")
        result = result.replace("-", "")
        return result

    libs = [
        (lib_file, basename(lib_file), ffi.dlopen(str(lib_file)))
        for lib_file in libraries
    ]

    return libs, ffi, enums


def format_cffi_type(cffi_type) -> str:
    """Format a CFFI type as a human-readable C type string"""
    if cffi_type.kind == "void":
        return "void"
    elif cffi_type.kind == "primitive":
        return cffi_type.cname
    elif cffi_type.kind == "pointer":
        pointee = cffi_type.item
        return format_cffi_type(pointee) + " *"
    elif cffi_type.kind == "struct":
        return cffi_type.cname
    elif cffi_type.kind == "enum":
        return cffi_type.cname
    elif cffi_type.kind == "function":
        return "function_pointer"
    elif cffi_type.kind == "array":
        return format_cffi_type(cffi_type.item) + "[]"
    else:
        return cffi_type.cname if hasattr(cffi_type, "cname") else str(cffi_type)


def format_function_signature(name: str, prototype) -> str:
    """Format a function prototype as a C declaration string"""
    ret = format_cffi_type(prototype.result)
    args = []
    for arg in prototype.args:
        args.append(format_cffi_type(arg))
    args_str = ", ".join(args) if args else "void"
    return f"{ret} {name}({args_str})"


def main():
    import argparse
    import json
    import sys

    parser = argparse.ArgumentParser(
        description="Collect and print all C definitions from LLVM-C headers"
    )
    parser.add_argument("--cpp", default="cpp", help="C preprocessor command")
    parser.add_argument(
        "--include-dir", help="LLVM include directory (uses llvm-config if not specified)"
    )
    parser.add_argument(
        "--lib-dir", help="LLVM library directory (uses llvm-config if not specified)"
    )
    parser.add_argument(
        "--format",
        choices=["text", "json"],
        default="text",
        help="Output format (default: text)",
    )

    args = parser.parse_args()

    # Get LLVM directories using llvm-config if not provided
    if not args.include_dir or not args.lib_dir:
        try:
            if not args.include_dir:
                result = subprocess.run(
                    ["llvm-config", "--includedir"],
                    capture_output=True,
                    text=True,
                    check=True,
                )
                include_dir = Path(result.stdout.strip())
            else:
                include_dir = Path(args.include_dir)

            if not args.lib_dir:
                result = subprocess.run(
                    ["llvm-config", "--libdir"],
                    capture_output=True,
                    text=True,
                    check=True,
                )
                lib_dir = Path(result.stdout.strip())
            else:
                lib_dir = Path(args.lib_dir)

        except (subprocess.CalledProcessError, FileNotFoundError):
            print(
                "Error: llvm-config not found. Please specify --include-dir and --lib-dir manually.",
                file=sys.stderr,
            )
            sys.exit(1)
    else:
        include_dir = Path(args.include_dir)
        lib_dir = Path(args.lib_dir)

    # Find LLVM libraries
    libraries = []
    for pattern in ["libLLVM*.so", "libLLVM*.dylib", "libLLVM*.dll"]:
        libraries.extend(lib_dir.glob(pattern))

    if not libraries:
        print(f"Error: No LLVM libraries found in {lib_dir}", file=sys.stderr)
        sys.exit(1)

    print(f"Using LLVM include dir: {include_dir}", file=sys.stderr)
    print(f"Using LLVM lib dir: {lib_dir}", file=sys.stderr)
    print(
        f"Found LLVM libraries: {[lib.name for lib in libraries]}", file=sys.stderr
    )

    # Parse headers
    libs, ffi, enums = parse_headers(args.cpp, libraries, include_dir)

    # Collect all definitions
    functions = []
    constants = []
    seen_functions = set()

    for _, library_name, library in libs:
        for name in dir(library):
            if hasattr(library, name):
                field = getattr(library, name)
                if isinstance(field, int):
                    constants.append((name, field))
                elif isinstance(field, FFI.CData):
                    prototype = ffi.typeof(field)
                    if name not in seen_functions:
                        seen_functions.add(name)
                        functions.append((name, prototype))

    # Sort for stable output
    functions.sort(key=lambda x: x[0])
    constants.sort(key=lambda x: x[0])

    if args.format == "json":
        output = {
            "functions": [],
            "enums": {},
            "constants": [],
        }
        for name, prototype in functions:
            ret = format_cffi_type(prototype.result)
            func_args = [format_cffi_type(a) for a in prototype.args]
            output["functions"].append(
                {
                    "name": name,
                    "return_type": ret,
                    "args": func_args,
                    "signature": format_function_signature(name, prototype),
                }
            )
        for enum_name, enum_values in enums.items():
            # Only keep string->int mappings for JSON
            output["enums"][enum_name] = {
                k: v for k, v in enum_values.items() if isinstance(k, str)
            }
        for name, value in constants:
            output["constants"].append({"name": name, "value": value})

        print(json.dumps(output, indent=2))
    else:
        # Text output
        print(f"=== LLVM-C Definitions ({len(functions)} functions, {len(enums)} enums, {len(constants)} constants) ===")
        print()

        print("--- Enums ---")
        for enum_name, enum_values in sorted(enums.items()):
            print(f"typedef enum {enum_name} {{")
            # Print only string->int entries, sorted by value
            entries = sorted(
                [(k, v) for k, v in enum_values.items() if isinstance(k, str)],
                key=lambda x: x[1],
            )
            for entry_name, entry_value in entries:
                print(f"  {entry_name} = {entry_value},")
            print("}")
            print()

        print("--- Functions ---")
        for name, prototype in functions:
            print(format_function_signature(name, prototype) + ";")
        print()

        print("--- Constants ---")
        for name, value in constants:
            print(f"{name} = {value}")


if __name__ == "__main__":
    main()
