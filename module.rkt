#lang racket

(provide llvm-module
         llvm-module-verify
         llvm-function-verify
         llvm-module-to-string
         llvm-add-function
         llvm-view-function-cfg
         llvm-view-function-cfg-only)

(require ffi/unsafe
         "definer.rkt"
         "error.rkt")

(define-llvm llvm-module (_fun _string -> _LLVMModuleRef)
  #:c-id LLVMModuleCreateWithName)

(define _LLVMVerifierFailureAction
  (_enum '(llvm-abort-process-action
           llvm-print-message-action
           llvm-return-status-action)))

(define-llvm llvm-module-verify (_fun _LLVMModuleRef
                                      (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                      (err : (_ptr o _string))
                                      -> (failure : _bool)
                                      -> (when failure (llvm-dispose-message err)))
  #:c-id LLVMVerifyModule)

(define-llvm llvm-function-verify (_fun _LLVMValueRef
                                        (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                        (err : (_ptr o _string))
                                        -> (failure : _bool)
                                        -> (when failure (llvm-dispose-message err)))
  #:c-id LLVMVerifyFunction)

(define-llvm llvm-module-to-string (_fun _LLVMModuleRef -> _string)
  #:c-id LLVMPrintModuleToString)

(define-llvm llvm-add-function (_fun _LLVMModuleRef
                                     _string
                                     _LLVMTypeRef
                                     -> _LLVMValueRef)
  #:c-id LLVMAddFunction)
(define-llvm llvm-get-named-function (_fun _LLVMModuleRef _string -> _LLVMValueRef)
  #:c-id LLVMGetNamedFunction)

(define-llvm llvm-add-global (_fun _LLVMModuleRef _LLVMTypeRef _string -> _LLVMValueRef)
  #:c-id LLVMAddGlobal)

(define-llvm llvm-view-function-cfg (_fun _LLVMValueRef -> _void)
  #:c-id LLVMViewFunctionCFG)
(define-llvm llvm-view-function-cfg-only (_fun _LLVMValueRef -> _void)
  #:c-id LLVMViewFunctionCFGOnly)

(module+ test
  (require rackunit
           "types.rkt")
  (let ([mod (llvm-module "test_mod")])
    (define ft (llvm-function-type (llvm-int32-type)
                                   (list (llvm-pointer-type (llvm-int8-type)))
                                   #t))
    (define printf-fun (llvm-add-function mod "printf" ft))
    (check-equal? (llvm-module-to-string mod)
                  "; ModuleID = 'test_mod'
source_filename = \"test_mod\"

declare i32 @printf(i8*, ...)
")))
(module+ test
  (require rackunit
           "types.rkt")
  (let ([mod (llvm-module "test_mod")])
    (llvm-add-global mod (llvm-struct-type (list (llvm-int8-type) (llvm-double-type)))
                     "hello")
    (check-equal? (llvm-module-to-string mod)
                  "; ModuleID = 'test_mod'
source_filename = \"test_mod\"

@hello = external global { i8, double }
")))
