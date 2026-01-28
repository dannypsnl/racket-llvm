#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{JIT}

Functions for JIT compilation and execution of LLVM IR.

@section{Execution Engine}

@defproc[(llvm-create-execution-engine-for-module [module LLVMModuleRef?])
    LLVMExecutionEngineRef?
]{
    return an execution engine for given module
}

@defproc[(llvm-get-function-address [engine LLVMExecutionEngineRef?] [name string?])
    exact-nonnegative-integer?
]{
    Returns the address of the compiled function with the given @racket[name]. The returned integer can be cast to a function pointer using Racket FFI.
}

@defproc[(llvm-get-execution-engine-target-data [engine LLVMExecutionEngineRef?])
    LLVMTargetDataRef?
]{
    Returns the target data associated with the execution engine.
}

@defproc[(llvm-get-execution-engine-target-machine [engine LLVMExecutionEngineRef?])
    LLVMTargetMachineRef?
]{
    Returns the target machine associated with the execution engine.
}

@section{Running Functions}

@defproc[(llvm-run-function [engine LLVMExecutionEngineRef?] [function LLVMValueRef?])
    LLVMGenericValueRef?
]{
    run given @racket[function] on @racket[engine], it returns result as @racket[LLVMGenericValueRef?]
}

@section{Generic Values}

Generic values are used to pass arguments to and receive results from JIT-compiled functions.

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

@defproc[(llvm-generic-value-to-float [type LLVMTypeRef?] [generic-value LLVMGenericValueRef?])
    number?
]{
    convert @racket[generic-value] back to racket @racket[number?]
}
