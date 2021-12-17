#lang racket

(provide llvm-append-basic-block
         llvm-builder-create
         llvm-builder-position-at-end
         llvm-get-param
         ; control flow
         llvm-build-ret
         llvm-build-br
         llvm-build-cond-br
         _LLVMIntPredicate
         ; compare
         llvm-build-int-cmp
         ; arithmetic
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

(define-llvm llvm-const-int (_fun (type value [sign-extend? #f]) ::
                                  (type : _LLVMTypeRef)
                                  (value : _llong)
                                  (sign-extend? : _bool)
                                  -> _LLVMValueRef)
  #:c-id LLVMConstInt)

(define binary-fun (_fun (builder lhs rhs [name ""]) ::
                         (builder : _LLVMBuilderRef)
                         (lhs : _LLVMValueRef)
                         (rhs : _LLVMValueRef)
                         (name : _string)
                         -> _LLVMValueRef))
(define-llvm llvm-build-add binary-fun #:c-id LLVMBuildAdd)
(define-llvm llvm-build-nswadd binary-fun #:c-id LLVMBuildNSWAdd)
(define-llvm llvm-build-nuwadd binary-fun #:c-id LLVMBuildNUWAdd)
(define-llvm llvm-build-fadd binary-fun #:c-id LLVMBuildFAdd)
(define-llvm llvm-build-sub binary-fun #:c-id LLVMBuildSub)
(define-llvm llvm-build-nswsub binary-fun #:c-id LLVMBuildNSWSub)
(define-llvm llvm-build-nuwsub binary-fun #:c-id LLVMBuildNUWSub)
(define-llvm llvm-build-fsub binary-fun #:c-id LLVMBuildFSub)
(define-llvm llvm-build-mul binary-fun #:c-id LLVMBuildMul)
(define-llvm llvm-build-nswmul binary-fun #:c-id LLVMBuildNSWMul)
(define-llvm llvm-build-nuwmul binary-fun #:c-id LLVMBuildNUWMul)
(define-llvm llvm-build-fmul binary-fun #:c-id LLVMBuildFMul)
(define-llvm llvm-build-udiv binary-fun #:c-id LLVMBuildUDiv)
(define-llvm llvm-build-exactudiv binary-fun #:c-id LLVMBuildExactUDiv)
(define-llvm llvm-build-sdiv binary-fun #:c-id LLVMBuildSDiv)
(define-llvm llvm-build-exactsdiv binary-fun #:c-id LLVMBuildExactSDiv)
(define-llvm llvm-build-fdiv binary-fun #:c-id LLVMBuildFDiv)
(define-llvm llvm-build-urem binary-fun #:c-id LLVMBuildURem)
(define-llvm llvm-build-srem binary-fun #:c-id LLVMBuildSRem)
(define-llvm llvm-build-frem binary-fun #:c-id LLVMBuildFRem)
(define-llvm llvm-build-shl binary-fun #:c-id LLVMBuildShl)
(define-llvm llvm-build-lshr binary-fun #:c-id LLVMBuildLShr)
(define-llvm llvm-build-ashr binary-fun #:c-id LLVMBuildAShr)
(define-llvm llvm-build-and binary-fun #:c-id LLVMBuildAnd)
(define-llvm llvm-build-or binary-fun #:c-id LLVMBuildOr)
(define-llvm llvm-build-xor binary-fun #:c-id LLVMBuildXor)

(define unary-fun (_fun (builder v [name ""]) ::
                        (builder : _LLVMBuilderRef)
                        (v : _LLVMValueRef)
                        (name : _string)
                        -> _LLVMValueRef))
(define-llvm llvm-build-neg unary-fun #:c-id LLVMBuildNeg)
(define-llvm llvm-build-nswneg unary-fun #:c-id LLVMBuildNSWNeg)
(define-llvm llvm-build-nuwneg unary-fun #:c-id LLVMBuildNUWNeg)
(define-llvm llvm-build-fneg unary-fun #:c-id LLVMBuildFNeg)
(define-llvm llvm-build-not unary-fun #:c-id LLVMBuildNot)

(module+ test
  (require rackunit
           "module.rkt"
           "jit.rkt"
           "types.rkt")
  (define mod (llvm-module "test"))

  (llvm-link-in-mcjit)

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
    (define func (llvm-add-function mod "" func-type))

    (define entry (llvm-append-basic-block func ""))
    (llvm-builder-position-at-end builder entry)
    (llvm-build-ret builder (make-inst builder (llvm-get-param func 0) (llvm-get-param func 1)))

    (check-equal? result (get-value (llvm-run-function eng func (map create-value (list rhs lhs))))))

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
(module+ test
  ; if 42 > 16 then 1234 else 937
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
(module+ test
  (check-binary-int32-inst llvm-build-add 20 22 42)
  (check-binary-int32-inst llvm-build-sub 4321 321 4000)
  (check-binary-int32-inst llvm-build-mul 17 123 2091)
  (check-binary-int32-inst llvm-build-udiv 8 2 4)
  (check-binary-int32-inst llvm-build-udiv 57 7 8)
  (check-binary-float-inst llvm-build-fadd 2.5 3.82 6.319999694824219)
  (check-binary-float-inst llvm-build-fadd 2.5 -3.82 -1.3199999332427979))
