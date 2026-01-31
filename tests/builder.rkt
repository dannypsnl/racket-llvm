#lang racket
(module+ test
  (require rackunit
           "../main.rkt")

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

    (define entry (llvm-append-basic-block func))
    (llvm-builder-position-at-end builder entry)
    (llvm-build-ret builder (make-inst builder (llvm-get-param func 0) (llvm-get-param func 1)))

    (check-equal? (get-value (llvm-run-function eng func (map create-value (list rhs lhs))))
                  result))

  (define (check-binary-int32-inst make-inst rhs lhs result)
    (check-binary-inst make-inst
                       llvm-int32-type
                       (λ (x) (llvm-create-generic-value-of-int (llvm-int32-type) x #f))
                       (λ (x) (llvm-generic-value->int x #f))
                       rhs lhs result))

  (define (check-binary-float-inst make-inst rhs lhs result)
    (check-binary-inst make-inst
                       llvm-float-type
                       (λ (x) (llvm-create-generic-value-of-float (llvm-float-type) x))
                       (λ (x) (llvm-generic-value-to-float (llvm-float-type) x))
                       rhs lhs result))

  (define (check-unary-inst make-inst
                            make-type
                            create-value
                            get-value
                            v
                            result)
    (define builder (llvm-builder-create))
    (define func-type (llvm-function-type (make-type) (list (make-type))))
    (define func (llvm-add-function mod "" func-type))
    (define entry (llvm-append-basic-block func))
    (llvm-builder-position-at-end builder entry)
    (llvm-build-ret builder (make-inst builder (llvm-get-param func 0)))
    (check-equal? (get-value (llvm-run-function eng func (map create-value (list v))))
                  result))

  (define (check-unary-int-inst make-inst make-type v result)
    (check-unary-inst make-inst
                      make-type
                      (λ (x) (llvm-create-generic-value-of-int (make-type) x #t))
                      (λ (x) (llvm-generic-value->int x #t))
                      v result))

  (define (check-unary-float-inst make-inst make-type v result)
    (check-unary-inst make-inst
                      make-type
                      (λ (x) (llvm-create-generic-value-of-float (make-type) x))
                      (λ (x) (llvm-generic-value-to-float (make-type) x))
                      v result))

  ;; Wrap generated functions that require a mandatory name argument
  ;; so they work with the check-binary-inst / check-unary-inst helpers
  (define (wrap-binary f) (λ (builder lhs rhs) (f builder lhs rhs "")))
  (define (wrap-unary f) (λ (builder v) (f builder v "")))

  ;; Test: if 42 > 16 then 1234 else 937
  (let ()
    (define builder (llvm-builder-create))
    (let* ([func (llvm-add-function mod "" (llvm-function-type (llvm-int32-type)))]
           [entry (llvm-append-basic-block func)])
      (llvm-builder-position-at-end builder entry)
      (define then (llvm-append-basic-block func))
      (define els (llvm-append-basic-block func))
      (llvm-build-cond-br builder
                          (llvm-build-int-cmp builder 'int-ugt
                                              (llvm-const-int (llvm-int32-type) 42)
                                              (llvm-const-int (llvm-int32-type) 16))
                          then
                          els)
      (llvm-builder-position-at-end builder then)
      (llvm-build-ret builder (llvm-const-int (llvm-int32-type) 1234))
      (llvm-builder-position-at-end builder els)
      (llvm-build-ret builder (llvm-const-int (llvm-int32-type) 937))
      (check-equal? 1234 (llvm-generic-value->int (llvm-run-function eng func (list)) #f))))

  ;; Test: binary and unary instructions
  (check-binary-int32-inst llvm-build-add 20 22 42)
  (check-binary-int32-inst (wrap-binary llvm-build-sub) 4321 321 4000)
  (check-binary-int32-inst (wrap-binary llvm-build-mul) 17 123 2091)
  (check-binary-int32-inst (wrap-binary llvm-build-u-div) 8 2 4)
  (check-binary-int32-inst (wrap-binary llvm-build-u-div) 57 7 8)
  (check-binary-int32-inst (wrap-binary llvm-build-l-shr) 4 2 1)
  (check-binary-int32-inst (wrap-binary llvm-build-shl) 4 2 16)
  (check-binary-float-inst (wrap-binary llvm-build-f-add) 2.5 3.82 6.319999694824219)
  (check-binary-float-inst (wrap-binary llvm-build-f-add) 2.5 -3.82 -1.3199999332427979)
  (check-binary-float-inst (wrap-binary llvm-build-f-rem) 2.1 3.9 2.0999999046325684)
  (check-unary-int-inst (wrap-unary llvm-build-neg) llvm-int32-type 1 18446744073709551615)
  (check-unary-int-inst (wrap-unary llvm-build-not) llvm-int1-type 1 0)
  (check-unary-float-inst (wrap-unary llvm-build-f-neg) llvm-float-type 1. -1.)
  (check-unary-float-inst (wrap-unary llvm-build-f-neg) llvm-float-type 2.1 -2.0999999046325684)
  )
