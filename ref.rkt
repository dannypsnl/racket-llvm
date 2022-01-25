#lang at-exp racket/base
(provide  _LLVMModuleRef
          _LLVMContextRef
          _LLVMTypeRef
          _LLVMValueRef
          _LLVMBasicBlockRef
          _LLVMBuilderRef
          _LLVMGenericValueRef
          _LLVMPassManagerRef
          _LLVMPassManagerBuilderRef
          LLVMModuleRef?
          LLVMContextRef?
          LLVMTypeRef?
          LLVMValueRef?
          LLVMBasicBlockRef?
          LLVMBuilderRef?
          LLVMGenericValueRef?
          LLVMPassManagerRef?
          LLVMPassManagerBuilderRef?)

(require ffi/unsafe)

(define-cpointer-type _LLVMModuleRef #:tag 'LLVMOpaqueModule)
(define-cpointer-type _LLVMContextRef #:tag 'LLVMContextRef)
(define-cpointer-type _LLVMTypeRef #:tag 'LLVMOpaqueType)
(define-cpointer-type _LLVMValueRef #:tag 'LLVMOpaqueValue)
(define-cpointer-type _LLVMBasicBlockRef #:tag 'LLVMOpaqueBasicBlock)
(define-cpointer-type _LLVMBuilderRef #:tag 'LLVMOpaqueBuilder)
(define-cpointer-type _LLVMGenericValueRef #:tag 'LLVMOpaqueGenericValue)
(define-cpointer-type _LLVMPassManagerRef #:tag 'LLVMOpaquePassManager)
(define-cpointer-type _LLVMPassManagerBuilderRef #:tag 'LLVMOpaquePassManagerBuilder)
