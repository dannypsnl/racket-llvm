#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Setters (Modification Functions)}

Functions to modify properties of LLVM IR objects.

@section{Value Properties}

@defproc[(llvm-set-alignment [val LLVMValueRef?] [bytes exact-nonnegative-integer?])
    void?
]{
    Sets the alignment of a value to @racket[bytes] bytes.
}

@defproc[(llvm-set-arg-operand [fn LLVMValueRef?] [index exact-nonnegative-integer?] [arg LLVMValueRef?])
    void?
]{
    Sets the operand at @racket[index] to @racket[arg] for a function call or invoke instruction.
}

@section{Atomic Operation Properties}

@defproc[(llvm-set-atomic-single-thread [inst LLVMValueRef?] [single-thread? boolean?])
    void?
]{
    Sets whether an atomic instruction is single-threaded.
}

@defproc[(llvm-set-atomic-sync-scope-id [inst LLVMValueRef?] [scope-id exact-nonnegative-integer?])
    void?
]{
    Sets the synchronization scope ID of an atomic instruction.
}

@defproc[(llvm-set-cmp-xchg-failure-ordering [inst LLVMValueRef?] [ordering _llvm-atomic-ordering])
    void?
]{
    Sets the failure memory ordering of a compare-and-exchange instruction.
}

@defproc[(llvm-set-cmp-xchg-success-ordering [inst LLVMValueRef?] [ordering _llvm-atomic-ordering])
    void?
]{
    Sets the success memory ordering of a compare-and-exchange instruction.
}

@section{Exception Handling Properties}

@defproc[(llvm-set-cleanup [pad LLVMValueRef?] [cleanup? boolean?])
    void?
]{
    Sets the cleanup flag on an exception handling pad.
}

@defproc[(llvm-set-condition [br LLVMValueRef?] [cond LLVMValueRef?])
    void?
]{
    Sets the condition value for a conditional branch instruction.
}

@section{Metadata and Debug Info}

@defproc[(llvm-set-current-debug-location [builder LLVMBuilderRef?] [location LLVMValueRef?])
    void?
]{
    Sets the current debug location for IR instructions being built.
}

@defproc[(llvm-set-current-debug-location2 [builder LLVMBuilderRef?] [location LLVMMetadataRef?])
    void?
]{
    Sets the current debug location for IR instructions being built using metadata.
}

@section{Module Properties}

@defproc[(llvm-set-data-layout [module LLVMModuleRef?] [data-layout string?])
    void?
]{
    Sets the data layout specification for a module.
}

@defproc[(llvm-set-target-triple [module LLVMModuleRef?] [triple string?])
    void?
]{
    Sets the target triple (architecture, vendor, operating system) for a module.
}

@defproc[(llvm-set-source-file-name [module LLVMModuleRef?] [name string?])
    void?
]{
    Sets the source file name for a module.
}

@section{Global and Function Properties}

@defproc[(llvm-set-externally-initialized [global LLVMValueRef?] [externally-init boolean?])
    void?
]{
    Sets whether a global variable is externally initialized.
}

@defproc[(llvm-set-comdat [global LLVMValueRef?] [comdat LLVMComdatRef?])
    void?
]{
    Sets the COMDAT symbol for a global value.
}

@section{Instruction Properties}

@defproc[(llvm-set-exact [inst LLVMValueRef?] [is-exact boolean?])
    void?
]{
    Sets whether a binary operation is exact (no remainder).
}

@defproc[(llvm-set-fast-math-flags [inst LLVMValueRef?] [flags exact-nonnegative-integer?])
    void?
]{
    Sets the fast-math flags on a floating-point operation.
}

@defproc[(llvm-set-inbound [gep LLVMValueRef?] [in-bounds boolean?])
    void?
]{
    Sets whether a GEP (GetElementPtr) instruction has inbounds semantics.
}

@defproc[(llvm-set-nsw [inst LLVMValueRef?] [has-nsw boolean?])
    void?
]{
    Sets the no-signed-wrap flag on an instruction.
}

@defproc[(llvm-set-nuw [inst LLVMValueRef?] [has-nuw boolean?])
    void?
]{
    Sets the no-unsigned-wrap flag on an instruction.
}

@defproc[(llvm-set-is-tail-call [call LLVMValueRef?] [is-tail boolean?])
    void?
]{
    Sets whether a function call should be tail-called.
}

@defproc[(llvm-set-volatile [inst LLVMValueRef?] [is-volatile boolean?])
    void?
]{
    Sets whether a memory operation is volatile.
}

@defproc[(llvm-set-weak [global LLVMValueRef?] [is-weak boolean?])
    void?
]{
    Sets whether a global value has weak linkage.
}
