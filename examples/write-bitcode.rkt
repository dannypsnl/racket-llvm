#lang racket
(require racket-llvm)

(define mod (llvm-module "test_mod"))

(define sum (llvm-add-function mod "sum" (llvm-function-type (llvm-int32-type) (list (llvm-int32-type) (llvm-int32-type)))))
(define entry (llvm-append-basic-block sum))
(define builder (llvm-builder-create))
(llvm-builder-position-at-end builder entry)
(llvm-build-ret builder (llvm-build-add builder (llvm-get-param sum 0) (llvm-get-param sum 1)))

(llvm-module-verify mod)
(llvm-write-bitcode-to-file mod "test.bc")
