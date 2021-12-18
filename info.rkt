#lang info
(define collection "racket-llvm")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/racket-llvm.scrbl" ())))
(define pkg-desc "LLVM C-API bindings for Racket")
(define version "0.0")
(define license '(Apache-2.0 OR MIT))
(define pkg-authors '(dannypsnl))

(define test-omit-paths '("examples"))
