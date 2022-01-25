#lang scribble/manual
@require[scribble/extract
         @for-label[racket-llvm
                    racket/base]]

@title{Racket LLVM}

A racket LLVM C-API bindings, document will show you how to use this library as simple as possible.

@defmodule[racket-llvm]
@include-extracted["../definer.rkt"]

@include-section["module.scrbl"]
@include-section["llvm-structure.scrbl"]
