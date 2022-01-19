#lang racket/base

(provide (all-defined-out))

(require ffi/unsafe
         "definer.rkt"
         "ref.rkt")

(define-llvm llvm-constant? (_fun _LLVMValueRef -> _bool) #:c-id LLVMIsConstant)
(define-llvm llvm-undef? (_fun _LLVMValueRef -> _bool) #:c-id LLVMIsUndef)
(define-llvm llvm-poison? (_fun _LLVMValueRef -> _bool) #:c-id LLVMIsPoison)
