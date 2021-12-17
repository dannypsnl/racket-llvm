#lang racket

(require racket-llvm13)

(define mod (llvm-module "test_mod"))

(define sum (llvm-add-function mod "sum" (llvm-function-type (llvm-int32-type) (list (llvm-int32-type) (llvm-int32-type)))))
(define entry (llvm-append-basic-block sum))
(define builder (llvm-builder-create))
(llvm-builder-position-at-end builder entry)
(llvm-build-ret builder (llvm-build-add builder (llvm-get-param sum 0) (llvm-get-param sum 1)))

(llvm-module-verify mod)

(define eng (llvm-create-execution-engine-for-module mod))

(llvm-link-in-mcjit)

(define (ask-integer)
  (printf "enter integer: ")
  (read))
(define-values (x y) (values (ask-integer) (ask-integer)))

(define res (llvm-run-function eng sum
                               (list (llvm-create-generic-value-of-int (llvm-int32-type) x #f)
                                     (llvm-create-generic-value-of-int (llvm-int32-type) y #f))))
(printf "JIT result: ~a\n" (llvm-generic-value->int res #f))
