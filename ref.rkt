#lang at-exp racket/base
(provide LLVMModuleRef?
         LLVMContextRef?
         LLVMTypeRef?
         LLVMValueRef?
         LLVMBasicBlockRef?
         LLVMBuilderRef?
         LLVMGenericValueRef?
         LLVMPassManagerRef?
         LLVMPassManagerBuilderRef?)

(require ffi/unsafe)
(require scribble/srcdoc
         (for-doc scribble/manual ffi/unsafe racket/base))

(provide
 (thing-doc _LLVMModuleRef ctype? @{pointer to LLVMOpaqueModule})
 (thing-doc _LLVMContextRef ctype? @{pointer to LLVMContextRef})
 (thing-doc _LLVMTypeRef ctype? @{pointer to LLVMOpaqueType})
 (thing-doc _LLVMValueRef ctype? @{pointer to LLVMOpaqueValue})
 (thing-doc _LLVMBasicBlockRef ctype? @{pointer to LLVMOpaqueBasicBlock})
 (thing-doc _LLVMBuilderRef ctype? @{pointer to LLVMOpaqueBuilder})
 (thing-doc _LLVMGenericValueRef ctype? @{pointer to LLVMOpaqueGenericValue})
 (thing-doc _LLVMPassManagerRef ctype? @{pointer to LLVMOpaquePassManager})
 (thing-doc _LLVMPassManagerBuilderRef ctype? @{pointer to LLVMOpaquePassManagerBuilder}))
(define-cpointer-type _LLVMModuleRef #:tag 'LLVMOpaqueModule)
(define-cpointer-type _LLVMContextRef #:tag 'LLVMContextRef)
(define-cpointer-type _LLVMTypeRef #:tag 'LLVMOpaqueType)
(define-cpointer-type _LLVMValueRef #:tag 'LLVMOpaqueValue)
(define-cpointer-type _LLVMBasicBlockRef #:tag 'LLVMOpaqueBasicBlock)
(define-cpointer-type _LLVMBuilderRef #:tag 'LLVMOpaqueBuilder)
(define-cpointer-type _LLVMGenericValueRef #:tag 'LLVMOpaqueGenericValue)
(define-cpointer-type _LLVMPassManagerRef #:tag 'LLVMOpaquePassManager)
(define-cpointer-type _LLVMPassManagerBuilderRef #:tag 'LLVMOpaquePassManagerBuilder)
