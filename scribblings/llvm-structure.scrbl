#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{LLVM Structure}

@defthing*[([_LLVMModuleRef ctype?]
            [_LLVMContextRef ctype?]
            [_LLVMTypeRef ctype?]
            [_LLVMValueRef ctype?]
            [_LLVMBasicBlockRef ctype?]
            [_LLVMBuilderRef ctype?]
            [_LLVMGenericValueRef ctype?]
            [_LLVMPassManagerRef ctype?]
            [_LLVMPassManagerBuilderRef ctype?])]{
    LLVM primitive types.
}

@defproc[(LLVMModuleRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueModule or not
}
@defproc[(LLVMContextRef? [v any/c])
    boolean?
]{
    check a value is LLVMContextRef or not
}
@defproc[(LLVMTypeRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueType or not
}
@defproc[(LLVMValueRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueValue or not
}
@defproc[(LLVMBasicBlockRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueBasicBlock or not
}
@defproc[(LLVMBuilderRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueBuilder or not
}
@defproc[(LLVMGenericValueRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueGenericValue or not
}
@defproc[(LLVMPassManagerRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaquePassManager or not
}
@defproc[(LLVMPassManagerBuilderRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaquePassManagerBuilder or not
}
