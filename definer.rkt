#lang racket

(provide define-llvm
         _LLVMModuleRef
         _LLVMTypeRef
         _LLVMValueRef
         _LLVMBasicBlockRef
         _LLVMBuilderRef
         _LLVMGenericValueRef
         _LLVMPassManagerRef
         _LLVMPassManagerBuilderRef)

(require ffi/unsafe
         ffi/unsafe/define)

(define (get-llvm-lib-dir)
  (let ([path (find-executable-path "llvm-config")])
    (list (string-trim
           (with-output-to-string
             (λ () (system* path "--libdir")))))))

(define-ffi-definer define-llvm (ffi-lib "libLLVM" '("13" #f)
                                         #:get-lib-dirs get-llvm-lib-dir))

(define _LLVMModuleRef (_cpointer 'LLVMOpaqueModule))
(define _LLVMTypeRef (_cpointer 'LLVMOpaqueType))
(define _LLVMValueRef (_cpointer 'LLVMOpaqueValue))
(define _LLVMBasicBlockRef (_cpointer 'LLVMOpaqueBasicBlock))
(define _LLVMBuilderRef (_cpointer 'LLVMOpaqueBuilder))
(define _LLVMGenericValueRef (_cpointer 'LLVMOpaqueGenericValue))
(define _LLVMPassManagerRef (_cpointer 'LLVMOpaquePassManager))
(define _LLVMPassManagerBuilderRef (_cpointer 'LLVMOpaquePassManagerBuilder))
