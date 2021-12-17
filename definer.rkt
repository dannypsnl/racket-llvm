#lang racket

(provide define-llvm
         _LLVMModuleRef
         _LLVMContextRef
         _LLVMTypeRef
         _LLVMValueRef
         _LLVMBasicBlockRef
         _LLVMBuilderRef
         _LLVMGenericValueRef
         _LLVMPassManagerRef
         _LLVMPassManagerBuilderRef)

(require ffi/unsafe
         ffi/unsafe/define)
(require scribble/srcdoc (for-doc scribble/manual ffi/unsafe racket/base))

(define (get-llvm-lib-dir)
  (let ([path (find-executable-path "llvm-config")])
    (list (string-trim
           (with-output-to-string
             (λ () (system* path "--libdir")))))))

(provide (form-doc (define-llvm id function-type #:c-id c-function-id)
                   ((racket define-llvm)
                    " takes an id as its produces function name, then is a C " (racket _fun) " defined types for C function. Finally, takes the link name of C function."
                    " "
                    "Using " (racket define-llvm) " to extend any functions missing in this library will be important.")))
(define-ffi-definer define-llvm (ffi-lib "libLLVM" '(#f)
                                         #:get-lib-dirs get-llvm-lib-dir))

(define _LLVMModuleRef (_cpointer 'LLVMOpaqueModule))
(define _LLVMContextRef (_cpointer 'LLVMContextRef))
(define _LLVMTypeRef (_cpointer 'LLVMOpaqueType))
(define _LLVMValueRef (_cpointer 'LLVMOpaqueValue))
(define _LLVMBasicBlockRef (_cpointer 'LLVMOpaqueBasicBlock))
(define _LLVMBuilderRef (_cpointer 'LLVMOpaqueBuilder))
(define _LLVMGenericValueRef (_cpointer 'LLVMOpaqueGenericValue))
(define _LLVMPassManagerRef (_cpointer 'LLVMOpaquePassManager))
(define _LLVMPassManagerBuilderRef (_cpointer 'LLVMOpaquePassManagerBuilder))
