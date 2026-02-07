#lang scribble/manual
@require[scribble/extract
         @for-label[racket-llvm
                    racket/base]]

@title{Racket LLVM}

A racket LLVM C-API bindings, document will show you how to use this library as simple as possible.

@defmodule[racket-llvm]
@defform[(define-llvm id function-type maybe-c-id)
    #:grammar ([maybe-c-id (code:line #:c-id c-function-id)])
]{
    @racket[define-llvm] takes an id as its produces function name, then is a C @racket[_fun] defined types for C function. Finally, takes the link name of C function. Using @racket[define-llvm] to extend any functions missing in this library will be important.
}

@include-section["llvm-structure.scrbl"]
@include-section["types.scrbl"]
@include-section["module.scrbl"]
@include-section["builder.scrbl"]
@include-section["constants.scrbl"]
@include-section["enums.scrbl"]
@include-section["jit.scrbl"]
