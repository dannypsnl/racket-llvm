#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Builder}

@defproc[(llvm-append-basic-block [function LLVMValueRef?]) LLVMBasicBlockRef?]{create new basic block for given @racket[function]}
@defproc[(llvm-builder-create) LLVMBuilderRef?]{new @racket[LLVMBuilderRef?]}
@defproc[(llvm-builder-position-at-end [builder LLVMBuilderRef?] [basic-block LLVMBasicBlockRef?]) void?]{
    set @racket[builder] insert position to the end of @racket[basic-block]
}
@defproc[(llvm-get-param [function LLVMValueRef?] [index integer?]) LLVMValueRef?]{get parameter from @racket[function] by index}
