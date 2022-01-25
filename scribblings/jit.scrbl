#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{JIT}

@defthing[_LLVMExecutionEngineRef ctype?]{pointer to LLVMExecutionEngine}
@defproc[(LLVMExecutionEngineRef? [v any/c]) boolean?]{check a value is LLVMExecutionEngine or not}

@defproc[(llvm-create-execution-engine-for-module [module LLVMModuleRef?])
    LLVMExecutionEngineRef?
]{
    return an execution engine for given module
}

@defproc[(llvm-run-function [engine LLVMExecutionEngineRef?] [function LLVMValueRef?])
    LLVMGenericValueRef?
]{
    run given @racket[function] on @racket[engine], it returns result as @racket[LLVMGenericValueRef?]
}

@defproc[(llvm-create-generic-value-of-int [type LLVMTypeRef?] [value integer?] [signed? boolean?])
    LLVMGenericValueRef?
]{
    Converted given @racket[value] to @racket[LLVMGenericValueRef?].
    @racket[type] decided it's LLVM type corresponding.
    @racket[signed?] decided it's signed integer or not.
}

@defproc[(llvm-create-generic-value-of-float [type LLVMTypeRef?] [value number?])
    LLVMGenericValueRef?
]{
    Converted given @racket[value] to @racket[LLVMGenericValueRef?].
    @racket[type] decided it's LLVM type corresponding.
}

@defproc[(llvm-generic-value->int [generic-value LLVMGenericValueRef?] [signed? boolean?])
    integer?
]{
    convert @racket[generic-value] back to racket @racket[integer?]. @racket[signed?] decided treat it as a signed integer or not.
}

@defproc[(llvm-generic-value->float [type LLVMTypeRef?] [generic-value LLVMGenericValueRef?])
    number?
]{
    convert @racket[generic-value] back to racket @racket[number?]
}
