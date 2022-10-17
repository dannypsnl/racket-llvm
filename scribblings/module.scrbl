#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Module}

@defproc[(llvm-module [module-name string?])
    LLVMModuleRef?
]{
    @racket[llvm-module] returns a module, the core concept in LLVM. We puts global variables, functions, and type definitions in module.
}

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

@defproc[(llvm-add-function [module LLVMModuleRef?] [function-name string?] [function-type LLVMTypeRef?])
    LLVMValueRef?
]{
    Add function into given module, return a function value. The function name is given by function-name, the function type is given by function-type.
}

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

@defproc[(llvm-write-bitcode-to-file [module LLVMModuleRef?] [file-path string?])
    void?
]{
    Write @code{module} as content of @code{file-path}.
}
