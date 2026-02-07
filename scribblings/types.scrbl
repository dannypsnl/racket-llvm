#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Types}

LLVM types represent the type system of the intermediate representation. Every value in LLVM IR has a type.

@section{Integer Types}

@defproc[(llvm-int1-type) LLVMTypeRef?]{Creates an @code{i1} (boolean) type.}
@defproc[(llvm-int8-type) LLVMTypeRef?]{Creates an @code{i8} type.}
@defproc[(llvm-int16-type) LLVMTypeRef?]{Creates an @code{i16} type.}
@defproc[(llvm-int32-type) LLVMTypeRef?]{Creates an @code{i32} type.}
@defproc[(llvm-int64-type) LLVMTypeRef?]{Creates an @code{i64} type.}
@defproc[(llvm-int128-type) LLVMTypeRef?]{Creates an @code{i128} type.}
@defproc[(llvm-int-type [num-bits exact-nonnegative-integer?]) LLVMTypeRef?]{Creates an integer type with the given bit width.}

@section{Floating-Point Types}

@defproc[(llvm-half-type) LLVMTypeRef?]{Creates a 16-bit floating-point type (IEEE 754 half).}
@defproc[(llvm-float-type) LLVMTypeRef?]{Creates a 32-bit floating-point type (IEEE 754 single).}
@defproc[(llvm-double-type) LLVMTypeRef?]{Creates a 64-bit floating-point type (IEEE 754 double).}

@section{Other Scalar Types}

@defproc[(llvm-void-type) LLVMTypeRef?]{Creates the void type, used for functions that return nothing.}
@defproc[(llvm-label-type) LLVMTypeRef?]{Creates the label type, used for basic block addresses.}

@section{Composite Types}

@defproc[(llvm-function-type [return-type LLVMTypeRef?] [param-types (listof LLVMTypeRef?) '()] [variadic? boolean? #f])
    LLVMTypeRef?
]{
    Creates a function type. @racket[return-type] is the return type, @racket[param-types] is a list of parameter types,
    and @racket[variadic?] indicates whether the function accepts variable arguments.
}

@defproc[(llvm-pointer-type [type LLVMTypeRef?] [address-space exact-nonnegative-integer? 0])
    LLVMTypeRef?
]{
    Creates a pointer type pointing to @racket[type] in the given @racket[address-space].
}

@defproc[(llvm-array-type [element-type LLVMTypeRef?] [count exact-nonnegative-integer?])
    LLVMTypeRef?
]{
    Creates an array type of @racket[count] elements of @racket[element-type].
}

@defproc[(llvm-vector-type [element-type LLVMTypeRef?] [count exact-nonnegative-integer?])
    LLVMTypeRef?
]{
    Creates a fixed-size vector type of @racket[count] elements of @racket[element-type].
}

@defproc[(llvm-struct-type [element-types (listof LLVMTypeRef?)] [packed? boolean? #f])
    LLVMTypeRef?
]{
    Creates a literal (anonymous) struct type with the given element types. If @racket[packed?] is true, the struct has no padding between elements.
}

@defproc[(llvm-struct-create-named [context LLVMContextRef?] [name string?])
    LLVMTypeRef?
]{
    Creates a named struct type in the given context. Use @racket[llvm-struct-set-body] to define its fields.
}

@defproc[(llvm-struct-set-body [struct-type LLVMTypeRef?] [element-types (listof LLVMTypeRef?) (list)] [pack? boolean? #f])
    void?
]{
    Sets the body of a named struct type created with @racket[llvm-struct-create-named].
}

@defproc[(llvm-add-struct-type [mod LLVMModuleRef?] [element-types (listof LLVMTypeRef?)] [pack? boolean? #f])
    LLVMTypeRef?
]{
    Convenience function that creates a named struct in the module's context and sets its body in one step.
}

@section{Type Queries}

@defproc[(llvm-get-type-kind [type LLVMTypeRef?]) _llvm-type-kind]{
    Returns the kind (classification) of a type.
}

@defproc[(llvm-get-int-type-width [type LLVMTypeRef?]) exact-nonnegative-integer?]{Returns the bit width of an integer type.}
@defproc[(llvm-get-return-type [function-type LLVMTypeRef?]) LLVMTypeRef?]{Returns the return type of a function type.}
@defproc[(llvm-count-param-types [function-type LLVMTypeRef?]) exact-nonnegative-integer?]{Returns the number of parameter types in a function type.}
@defproc[(llvm-is-function-var-arg [function-type LLVMTypeRef?]) boolean?]{Returns whether a function type is variadic.}
@defproc[(llvm-get-element-type [type LLVMTypeRef?]) LLVMTypeRef?]{Returns the element type of an array, vector, or pointer type.}
@defproc[(llvm-get-array-length2 [type LLVMTypeRef?]) exact-nonnegative-integer?]{Returns the length of an array type.}
@defproc[(llvm-get-vector-size [type LLVMTypeRef?]) exact-nonnegative-integer?]{Returns the number of elements in a vector type.}
@defproc[(llvm-print-type-to-string [type LLVMTypeRef?]) string?]{Returns the string representation of a type.}
