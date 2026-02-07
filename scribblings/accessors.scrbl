#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Accessors (Getter Functions)}

Functions to query and retrieve information from LLVM IR objects.

@section{Value Accessors}

@defproc[(llvm-get-aggregate-element [agg-val LLVMValueRef?] [index exact-nonnegative-integer?])
    LLVMValueRef?
]{
    Returns the element at @racket[index] from an aggregate value.
}

@defproc[(llvm-get-alignment [val LLVMValueRef?])
    exact-nonnegative-integer?
]{
    Returns the alignment of a value in bytes.
}

@defproc[(llvm-get-allocated-type [val LLVMValueRef?])
    LLVMTypeRef?
]{
    Returns the allocated type of an allocation instruction (e.g., from malloc or alloca).
}

@defproc[(llvm-get-arg-operand [val LLVMValueRef?] [index exact-nonnegative-integer?])
    LLVMValueRef?
]{
    Returns the operand at @racket[index] for a function call or invoke instruction.
}

@section{Basic Block Accessors}

@defproc[(llvm-get-basic-block-name [bb LLVMBasicBlockRef?])
    string?
]{
    Returns the name of a basic block.
}

@defproc[(llvm-get-basic-block-parent [bb LLVMBasicBlockRef?])
    LLVMValueRef?
]{
    Returns the function that contains the given basic block.
}

@defproc[(llvm-get-basic-block-terminator [bb LLVMBasicBlockRef?])
    LLVMValueRef?
]{
    Returns the terminator instruction of a basic block, or @racket[#f] if none exists.
}

@section{Instruction Accessors}

@defproc[(llvm-get-atomic-sync-scope-id [inst LLVMValueRef?])
    exact-nonnegative-integer?
]{
    Returns the synchronization scope ID of an atomic instruction.
}

@defproc[(llvm-get-attribute-count-at-index [fn LLVMValueRef?] [index exact-nonnegative-integer?])
    exact-nonnegative-integer?
]{
    Returns the number of attributes at the given index on a function.
}

@defproc[(llvm-get-block-address-basic-block [fn LLVMValueRef?])
    LLVMBasicBlockRef?
]{
    Returns the basic block for a block address value.
}

@section{Constant Accessors}

@defproc[(llvm-get-as-string [c LLVMValueRef?] [out-param (box/c any?)])
    string?
]{
    Returns the string value of a string constant.
}

@section{Module and Function Accessors}

@defproc[(llvm-get-first-basic-block [fn LLVMValueRef?])
    LLVMBasicBlockRef?
]{
    Returns the first basic block of a function.
}

@defproc[(llvm-get-last-basic-block [fn LLVMValueRef?])
    LLVMBasicBlockRef?
]{
    Returns the last basic block of a function.
}

@defproc[(llvm-get-next-basic-block [bb LLVMBasicBlockRef?])
    LLVMBasicBlockRef?
]{
    Returns the next basic block in a function, or @racket[#f] if this is the last block.
}

@defproc[(llvm-get-previous-basic-block [bb LLVMBasicBlockRef?])
    LLVMBasicBlockRef?
]{
    Returns the previous basic block in a function, or @racket[#f] if this is the first block.
}

@defproc[(llvm-get-first-instruction [bb LLVMBasicBlockRef?])
    LLVMValueRef?
]{
    Returns the first instruction in a basic block.
}

@defproc[(llvm-get-last-instruction [bb LLVMBasicBlockRef?])
    LLVMValueRef?
]{
    Returns the last instruction in a basic block.
}

@section{Instruction Navigation}

@defproc[(llvm-get-next-instruction [inst LLVMValueRef?])
    LLVMValueRef?
]{
    Returns the next instruction after the given instruction, or @racket[#f] if none exists.
}

@defproc[(llvm-get-previous-instruction [inst LLVMValueRef?])
    LLVMValueRef?
]{
    Returns the previous instruction before the given instruction, or @racket[#f] if none exists.
}

@section{Operand Access}

@defproc[(llvm-get-num-operands [val LLVMValueRef?])
    exact-nonnegative-integer?
]{
    Returns the number of operands in a value.
}

@defproc[(llvm-get-operand [val LLVMValueRef?] [index exact-nonnegative-integer?])
    LLVMValueRef?
]{
    Returns the operand at @racket[index] in a value.
}

@section{Value and Type Classification}

@defproc[(llvm-get-value-kind [val LLVMValueRef?])
    _llvm-value-kind
]{
    Returns the kind (classification) of a value.
}

@defproc[(llvm-get-function-call-conv [fn LLVMValueRef?])
    _llvm-call-conv
]{
    Returns the calling convention of a function.
}

@section{Diagnostic Information}

@defproc[(llvm-get-diag-info-severity [diag-info LLVMDiagnosticInfoRef?])
    _llvm-diagnostic-severity
]{
    Returns the severity level of a diagnostic message.
}
