#lang racket

(provide llvm-append-basic-block
         llvm-builder-create
         llvm-builder-position-at-end
         llvm-get-param
         llvm-build-ret
         llvm-build-br
         llvm-build-cond-br
         _LLVMIntPredicate
         llvm-build-int-cmp
         llvm-const-int
         llvm-build-add
         llvm-build-sub
         llvm-build-mul
         llvm-build-udiv
         llvm-build-fadd)

(require ffi/unsafe
         "definer.rkt")

(define-llvm llvm-append-basic-block (_fun _LLVMValueRef
                                           _string
                                           -> _LLVMBasicBlockRef)
  #:c-id LLVMAppendBasicBlock)

(define-llvm llvm-builder-create (_fun -> _LLVMBuilderRef) #:c-id LLVMCreateBuilder)

(define-llvm llvm-builder-position-at-end (_fun _LLVMBuilderRef
                                                _LLVMBasicBlockRef
                                                -> _void)
  #:c-id LLVMPositionBuilderAtEnd)
(define-llvm llvm-get-param (_fun _LLVMValueRef _int -> _LLVMValueRef) #:c-id LLVMGetParam)

(module+ test
  (require rackunit
           "module.rkt"
           "jit.rkt"
           "types.rkt")

  (define mod (llvm-module "test"))

  (llvm-link-in-mcjit)
  (llvm-initialize-native-target)

  (define eng (llvm-create-execution-engine-for-module mod))

  (define (check-binary-inst make-inst
                             make-type
                             create-value
                             get-value
                             rhs
                             lhs
                             result)
    (define builder (llvm-builder-create))

    (define func-type (llvm-function-type (make-type) (list (make-type) (make-type))))
    (define func (llvm-add-function mod "func" func-type))

    (define entry (llvm-append-basic-block func "entry"))
    (llvm-builder-position-at-end builder entry)

    (define tmp (make-inst builder (llvm-get-param func 0) (llvm-get-param func 1) "tmp"))

    (llvm-build-ret builder tmp)

    (define args (map create-value (list rhs lhs)))

    (define res (llvm-run-function eng func args))

    (check-equal? result (get-value res)))

  (define (check-binary-int32-inst make-inst rhs lhs result)
    (check-binary-inst make-inst
                       llvm-int32-type
                       (λ (x) (llvm-create-generic-value-of-int (llvm-int32-type) x #f))
                       (λ (x) (llvm-generic-value-to-int x #f))
                       rhs lhs result))

  (define (check-binary-float-inst make-inst rhs lhs result)
    (check-binary-inst make-inst
                       llvm-float-type
                       (λ (x) (llvm-create-generic-value-of-float (llvm-float-type) x))
                       (λ (x) (llvm-generic-value-to-float (llvm-float-type) x))
                       rhs lhs result)))

#| Control flow |#

(define-llvm llvm-build-ret (_fun _LLVMBuilderRef _LLVMValueRef -> _LLVMValueRef)
  #:c-id LLVMBuildRet)

(define-llvm llvm-build-br (_fun _LLVMBuilderRef
                                 _LLVMBasicBlockRef ; dest
                                 -> _LLVMValueRef)
  #:c-id LLVMBuildBr)

(define-llvm llvm-build-cond-br (_fun _LLVMBuilderRef
                                      _LLVMValueRef ; if
                                      _LLVMBasicBlockRef ; then
                                      _LLVMBasicBlockRef ; else
                                      -> _LLVMValueRef)
  #:c-id LLVMBuildCondBr)

#| Comparisons |#

(define _LLVMIntPredicate
  (_enum '(llvm-int-eq = 32
                       llvm-int-ne
                       llvm-int-ugt
                       llvm-int-uge
                       llvm-int-ult
                       llvm-int-ule
                       llvm-int-sgt
                       llvm-int-sge
                       llvm-int-slt
                       llvm-int-sle)))

(define-llvm llvm-build-int-cmp (_fun _LLVMBuilderRef
                                      _LLVMIntPredicate
                                      _LLVMValueRef ; lhs
                                      _LLVMValueRef ; rhs
                                      _string ; name
                                      -> _LLVMValueRef)
  #:c-id LLVMBuildICmp)
(module+ test

  ; if 42 > 16 then 1234 else 937
  (define (test-cond-br)
    (define builder (llvm-builder-create))

    (define func
      (llvm-add-function mod
                         "func"
                         (llvm-function-type (llvm-int32-type))))

    (define entry (llvm-append-basic-block func "entry"))
    (llvm-builder-position-at-end builder entry)

    (define x (llvm-const-int (llvm-int32-type) 42))
    (define y (llvm-const-int (llvm-int32-type) 16))
    (define cmp (llvm-build-int-cmp builder 'llvm-int-ugt x y "greaterThan"))

    (define then (llvm-append-basic-block func "then"))
    (define els (llvm-append-basic-block func "else"))

    (define cond-br (llvm-build-cond-br builder cmp then els))

    (llvm-builder-position-at-end builder then)
    (llvm-build-ret builder (llvm-const-int (llvm-int32-type) 1234))

    (llvm-builder-position-at-end builder els)
    (llvm-build-ret builder (llvm-const-int (llvm-int32-type) 937))

    (define res (llvm-generic-value-to-int (llvm-run-function eng func (list)) #f))

    (check-equal? 1234 res))

  (test-cond-br))

#| Constants |#

(define-llvm llvm-const-int (_fun (type value [sign-extend? #f]) ::
                                  (type : _LLVMTypeRef)
                                  (value : _llong)
                                  (sign-extend? : _bool)
                                  -> _LLVMValueRef)
  #:c-id LLVMConstInt)

#| Operators |#

(define-llvm llvm-build-add (_fun _LLVMBuilderRef
                                  _LLVMValueRef
                                  _LLVMValueRef
                                  _string
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildAdd)

(module+ test
  (check-binary-int32-inst llvm-build-add 20 22 42))

(define-llvm llvm-build-sub (_fun _LLVMBuilderRef
                                  _LLVMValueRef
                                  _LLVMValueRef
                                  _string
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSub)
(module+ test
  (check-binary-int32-inst llvm-build-sub 4321 321 4000))

(define-llvm llvm-build-mul (_fun _LLVMBuilderRef
                                  _LLVMValueRef
                                  _LLVMValueRef
                                  _string
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildMul)
(module+ test
  (check-binary-int32-inst llvm-build-mul 17 123 2091))

(define-llvm llvm-build-udiv (_fun _LLVMBuilderRef
                                   _LLVMValueRef
                                   _LLVMValueRef
                                   _string
                                   -> _LLVMValueRef)
  #:c-id LLVMBuildUDiv)
(module+ test
  (check-binary-int32-inst llvm-build-udiv 8 2 4)
  (check-binary-int32-inst llvm-build-udiv 57 7 8))

(define-llvm llvm-build-fadd (_fun _LLVMBuilderRef
                                   _LLVMValueRef
                                   _LLVMValueRef
                                   _string
                                   -> _LLVMValueRef)
  #:c-id LLVMBuildFAdd)
(module+ test
  (check-binary-float-inst llvm-build-fadd 2.5 3.82 6.319999694824219)
  (check-binary-float-inst llvm-build-fadd 2.5 -3.82 -1.3199999332427979))
