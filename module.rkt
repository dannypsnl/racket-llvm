#lang at-exp racket

(provide llvm-function-verify
         llvm-get-module-context
         llvm-add-struct-type
         llvm-add-function
         llvm-view-function-cfg
         llvm-view-function-cfg-only)

(require ffi/unsafe
         "definer.rkt"
         "ref.rkt"
         "types.rkt"
         "error.rkt")
(require (rename-in racket/contract/base [-> c->])
         (for-doc racket/base scribble/manual ffi/unsafe))

(define-llvm (llvm-module module-name) (_fun _string -> _LLVMModuleRef)
  #:contract (c-> string? cpointer?)
  #:doc @{@racket[llvm-module] returns a module, the core concept in LLVM. We puts global variables, functions, and type definitions in module.}
  #:c-id LLVMModuleCreateWithName)

(define _LLVMVerifierFailureAction
  (_enum '(llvm-abort-process-action
           llvm-print-message-action
           llvm-return-status-action)))

(define-llvm (llvm-module-verify module) (_fun _LLVMModuleRef
                                               (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                               (err : (_ptr o _string))
                                               -> (failure : _bool)
                                               -> (when failure (llvm-dispose-message err)))
  #:contract (c-> cpointer? boolean?)
  #:doc @{verify given module}
  #:c-id LLVMVerifyModule)

(define-llvm llvm-function-verify (_fun _LLVMValueRef
                                        (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                        (err : (_ptr o _string))
                                        -> (failure : _bool)
                                        -> (when failure (llvm-dispose-message err)))
  #:c-id LLVMVerifyFunction)

(define-llvm (llvm-module->string module) (_fun _LLVMModuleRef -> _string)
  #:contract (c-> cpointer? string?)
  #:doc @{convert given module as string}
  #:c-id LLVMPrintModuleToString)

(define-llvm llvm-get-module-context (_fun _LLVMModuleRef -> _LLVMContextRef)
  #:c-id LLVMGetModuleContext)

(define (llvm-add-struct-type mod element-types [pack? #f])
  (define ctx (llvm-get-module-context mod))
  (define struct-ty (llvm-struct-create-named ctx ""))
  (llvm-struct-set-body struct-ty element-types pack?)
  struct-ty)

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
    (check-equal? (llvm-module->string mod)
                  "; ModuleID = 'test_mod'
source_filename = \"test_mod\"

declare i32 @printf(i8*, ...)
")))
(module+ test
  (require rackunit
           "types.rkt")
  (let ([mod (llvm-module "test_mod")])
    (define struct-ty (llvm-add-struct-type mod (list (llvm-int8-type) (llvm-double-type))))
    (llvm-add-global mod struct-ty "hello")
    (check-equal? (llvm-module->string mod)
                  "; ModuleID = 'test_mod'
source_filename = \"test_mod\"

%0 = type { i8, double }

@hello = external global %0
")))
