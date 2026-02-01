#lang info
(define collection "racket-llvm")
(define deps '("base"
               "scribble-lib"))
(define build-deps '("scribble-lib"
                     "racket-doc"
                     "rackunit-lib"
                     "at-exp-lib"))
(define scribblings '(("scribblings/racket-llvm.scrbl" (multi-page))))
(define pkg-desc "LLVM C-API bindings for Racket")
(define version "1.0")
(define license '(Apache-2.0 OR MIT))
(define pkg-authors '(dannypsnl))

(define test-omit-paths '("examples"))
