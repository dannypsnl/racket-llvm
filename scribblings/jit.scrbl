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
    _LLVMTargetDataRef?
]{
    Returns the target data associated with the execution engine.
}

@defproc[(llvm-get-execution-engine-target-machine [engine LLVMExecutionEngineRef?])
    _LLVMTargetMachineRef?
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

@section{Target Machine Configuration}

@defproc[(llvm-create-target-machine [target LLVMTargetRef?] [triple string?] [cpu string?] [features string?] [level _llvm-code-gen-opt-level] [reloc _llvm-reloc-mode] [model _llvm-code-model])
    LLVMTargetMachineRef?
]{
    Creates a target machine for the given target, CPU, and features.
    @racket[level] specifies optimization level.
    @racket[reloc] specifies the relocation model.
    @racket[model] specifies the code model.
}

@defproc[(llvm-target-machine-emit-to-file [target-machine LLVMTargetMachineRef?] [module LLVMModuleRef?] [filename string?] [codegen _llvm-code-gen-file-type])
    void?
]{
    Emits the module as code to the given file. @racket[codegen] specifies whether to emit assembly or object code.
}

@defproc[(llvm-target-machine-emit-to-memory-buffer [target-machine LLVMTargetMachineRef?] [module LLVMModuleRef?] [codegen _llvm-code-gen-file-type])
    bytes?
]{
    Emits the module as code to a memory buffer. Returns the generated code as bytes.
}

@defproc[(llvm-target-machine-options-set-code-gen-opt-level [options _LLVMTargetMachineOptionsRef?] [level _llvm-code-gen-opt-level]) void?]{
    Sets the code generation optimization level for target machine options.
}

@defproc[(llvm-target-machine-options-set-code-model [options _LLVMTargetMachineOptionsRef?] [model _llvm-code-model]) void?]{
    Sets the code model for target machine options.
}

@defproc[(llvm-target-machine-options-set-reloc-mode [options _LLVMTargetMachineOptionsRef?] [reloc _llvm-reloc-mode]) void?]{
    Sets the relocation mode for target machine options.
}

@defproc[(llvm-set-target-machine-global-i-sel-abort [machine LLVMTargetMachineRef?] [mode _llvm-global-i-sel-abort-mode]) void?]{
    Controls whether GlobalISel aborts on failure.
}
