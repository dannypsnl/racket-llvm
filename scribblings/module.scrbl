#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Module}

@section{Module Creation and Management}

@defproc[(llvm-module [module-name string?])
    LLVMModuleRef?
]{
    @racket[llvm-module] returns a module, the core concept in LLVM. We puts global variables, functions, and type definitions in module.
}

@defproc[(llvm-dispose-module [module LLVMModuleRef?]) void?]{
    Disposes a module and frees its resources.
}

@defproc[(llvm-clone-module [module LLVMModuleRef?]) LLVMModuleRef?]{
    Creates a deep copy of the given module.
}

@section{Module Verification and Output}

@defproc[(llvm-module-verify [module LLVMModuleRef?])
    boolean?
]{
    verify given module
}

@defproc[(llvm-module->string [module LLVMModuleRef?])
    string?
]{
    convert given module as string
}

@defproc[(llvm-dump-module [module LLVMModuleRef?]) void?]{
    Dumps the module's IR to stderr for debugging.
}

@defproc[(llvm-print-module-to-string [module LLVMModuleRef?]) string?]{
    Returns the module's LLVM IR as a string.
}

@defproc[(llvm-write-bitcode-to-file [module LLVMModuleRef?] [file-path string?])
    void?
]{
    Write @code{module} as content of @code{file-path}.
}

@section{Functions}

@defproc[(llvm-add-function [module LLVMModuleRef?] [function-name string?] [function-type LLVMTypeRef?])
    LLVMValueRef?
]{
    Add function into given module, return a function value. The function name is given by function-name, the function type is given by function-type.
}

@defproc[(llvm-get-function [module LLVMModuleRef?] [name string?]) LLVMValueRef?]{
    Gets a function from the module by name. Returns @racket[#f] if not found.
}

@defproc[(llvm-set-function-call-conv [function LLVMValueRef?] [cc exact-nonnegative-integer?]) void?]{
    Sets the calling convention of a function.
}

@defproc[(llvm-count-params [function LLVMValueRef?]) exact-nonnegative-integer?]{
    Returns the number of parameters of a function.
}

@defproc[(llvm-verify-function [function LLVMValueRef?] [action exact-nonnegative-integer?]) boolean?]{
    Verifies that a function is well-formed.
}

@section{Global Variables}

@defproc[(llvm-add-global [module LLVMModuleRef?] [var-type LLVMTypeRef?] [var-name string?])
    LLVMValueRef?
]{
    Add a global variable into given module.
}

@defproc[(llvm-get-named-global [module LLVMModuleRef?] [global-variable-name string?])
    LLVMValueRef?
]{
    Get global variable reference by its name.
}

@defproc[(llvm-set-initializer [global LLVMValueRef?] [constant-val LLVMValueRef?]) void?]{
    Sets the initializer for a global variable.
}

@defproc[(llvm-get-initializer [global LLVMValueRef?]) LLVMValueRef?]{
    Gets the initializer of a global variable.
}

@section{Global Value Properties}

@defproc[(llvm-get-linkage [global LLVMValueRef?]) _llvm-linkage]{
    Returns the linkage type of a global value.
}

@defproc[(llvm-set-linkage [global LLVMValueRef?] [linkage _llvm-linkage]) void?]{
    Sets the linkage type of a global value.
}

@defproc[(llvm-get-visibility [global LLVMValueRef?]) _llvm-visibility]{
    Returns the visibility of a global symbol (default, hidden, or protected).
}

@defproc[(llvm-set-visibility [global LLVMValueRef?] [visibility _llvm-visibility]) void?]{
    Sets the visibility of a global symbol.
}

@defproc[(llvm-get-unnamed-address [global LLVMValueRef?]) _llvm-unnamed-addr]{
    Returns the unnamed address mode of a global value.
}

@defproc[(llvm-set-unnamed-address [global LLVMValueRef?] [addr _llvm-unnamed-addr]) void?]{
    Sets the unnamed address mode of a global value.
}

@defproc[(llvm-get-dll-storage-class [global LLVMValueRef?]) _llvmdll-storage-class]{
    Returns the DLL storage class of a global value (Windows: import or export).
}

@defproc[(llvm-set-dll-storage-class [global LLVMValueRef?] [storage-class _llvmdll-storage-class]) void?]{
    Sets the DLL storage class of a global value.
}

@defproc[(llvm-get-thread-local-mode [global LLVMValueRef?]) _llvm-thread-local-mode]{
    Returns the thread-local storage mode of a global variable.
}

@defproc[(llvm-set-thread-local-mode [global LLVMValueRef?] [mode _llvm-thread-local-mode]) void?]{
    Sets the thread-local storage mode of a global variable.
}

@section{COMDAT (Common Data)}

@defproc[(llvm-get-comdat-selection-kind [comdat _LLVMComdatRef]) _llvm-comdat-selection-kind]{
    Returns the selection strategy for a COMDAT symbol.
}

@defproc[(llvm-set-comdat-selection-kind [comdat _LLVMComdatRef] [kind _llvm-comdat-selection-kind]) void?]{
    Sets the selection strategy for a COMDAT symbol (how duplicates are handled during linking).
}

@section{Module Flags}

@defproc[(llvm-add-module-flag [module LLVMModuleRef?] [behavior _llvm-module-flag-behavior] [key string?] [value _LLVMMetadataRef]) void?]{
    Adds a module flag with the specified behavior for handling conflicts.
}

@defproc[(llvm-module-flag-entries-get-flag-behavior [entry _LLVMModuleFlagEntryRef] [index exact-nonnegative-integer?]) _llvm-module-flag-behavior]{
    Returns the behavior of a module flag entry.
}

@section{Context}

@defproc[(llvm-context-create) LLVMContextRef?]{
    Creates a new LLVM context. Contexts allow multiple independent compilations in the same process.
}

@defproc[(llvm-get-global-context) LLVMContextRef?]{
    Returns the global LLVM context shared by all modules that don't use a specific context.
}

@section{Initialization}

@defproc[(llvm-link-in-mcjit) void?]{
    Links in the MCJIT execution engine. Must be called before creating an MCJIT-based execution engine.
}

@defproc[(llvm-link-in-interpreter) void?]{
    Links in the LLVM interpreter. Must be called before creating an interpreter-based execution engine.
}
