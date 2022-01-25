#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{LLVM Structure}

@defthing[_LLVMModuleRef ctype?]{
    pointer to LLVMOpaqueModule
}
@defproc[(LLVMModuleRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueModule or not
}
@defthing[_LLVMContextRef ctype?]{
    pointer to LLVMContextRef
}
@defproc[(LLVMContextRef? [v any/c])
    boolean?
]{
    check a value is LLVMContextRef or not
}
@defthing[_LLVMTypeRef ctype?]{
    pointer to LLVMOpaqueType
}
@defproc[(LLVMTypeRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueType or not
}
@defthing[_LLVMValueRef ctype?]{
    pointer to LLVMOpaqueValue
}
@defproc[(LLVMValueRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueValue or not
}
@defthing[_LLVMBasicBlockRef ctype?]{
    pointer to LLVMOpaqueBasicBlock
}
@defproc[(LLVMBasicBlockRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueBasicBlock or not
}
@defthing[_LLVMBuilderRef ctype?]{
    pointer to LLVMOpaqueBuilder
}
@defproc[(LLVMBuilderRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueBuilder or not
}
@defthing[_LLVMGenericValueRef ctype?]{
    pointer to LLVMOpaqueGenericValue
}
@defproc[(LLVMGenericValueRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaqueGenericValue or not
}
@defthing[_LLVMPassManagerRef ctype?]{
    pointer to LLVMOpaquePassManager
}
@defproc[(LLVMPassManagerRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaquePassManager or not
}
@defthing[_LLVMPassManagerBuilderRef ctype?]{
    pointer to LLVMOpaquePassManagerBuilder
}
@defproc[(LLVMPassManagerBuilderRef? [v any/c])
    boolean?
]{
    check a value is LLVMOpaquePassManagerBuilder or not
}
