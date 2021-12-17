#lang racket

(provide llvm-module
         llvm-dispose-message
         llvm-module-verify
         llvm-module-to-string
         llvm-add-function)

(require ffi/unsafe
         "definer.rkt")

(define-llvm llvm-module (_fun _string -> _LLVMModuleRef)
  #:c-id LLVMModuleCreateWithName)

(define _LLVMVerifierFailureAction
  (_enum '(llvm-abort-process-action
           llvm-print-message-action
           llvm-return-status-action)))

(define-llvm llvm-dispose-message (_fun (_ptr i _string) -> _void)
  #:c-id LLVMDisposeMessage)

(define-llvm llvm-module-verify (_fun _LLVMModuleRef
                                      (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                      (err : (_ptr o _string))
                                      -> (failure : _bool)
                                      ; TODO: should call llvm-dispose-message
                                      -> (when failure (error err)))
  #:c-id LLVMVerifyModule)

(define-llvm llvm-module-to-string (_fun _LLVMModuleRef -> _string)
  #:c-id LLVMPrintModuleToString)

(define-llvm llvm-add-function (_fun _LLVMModuleRef
                                     _string
                                     _LLVMTypeRef
                                     -> _LLVMValueRef)
  #:c-id LLVMAddFunction)

(module+ test
  (require rackunit
           "types.rkt")
  (define mod (llvm-module "test_mod"))
  (define ft (llvm-function-type (llvm-int32-type)
                                 (list (llvm-int32-type)
                                       (llvm-int32-type))))
  (define printf-fun (llvm-add-function mod "printf" ft))
  (check-equal? (llvm-module-to-string mod)
                "; ModuleID = 'test_mod'
source_filename = \"test_mod\"

declare i32 @printf(i32, i32)
")
  )
