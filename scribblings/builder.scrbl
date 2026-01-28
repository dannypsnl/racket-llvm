#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Builder}

The builder is used to construct LLVM IR instructions. Create a builder, position it at the end of a basic block, then use the @racket[llvm-build-*] functions to emit instructions.

@section{Builder Setup}

@defproc[(llvm-builder-create) LLVMBuilderRef?]{Creates a new instruction builder.}
@defproc[(llvm-append-basic-block [function LLVMValueRef?]) LLVMBasicBlockRef?]{Creates and appends a new basic block to the given @racket[function].}
@defproc[(llvm-builder-position-at-end [builder LLVMBuilderRef?] [basic-block LLVMBasicBlockRef?]) void?]{
 Sets @racket[builder] insert position to the end of @racket[basic-block].
}
@defproc[(llvm-get-param [function LLVMValueRef?] [index integer?]) LLVMValueRef?]{Gets parameter from @racket[function] by index.}
@defproc[(llvm-get-insert-block [builder LLVMBuilderRef?]) LLVMBasicBlockRef?]{Returns the basic block the builder is currently positioned at.}

@section{Return Instructions}

@defproc[(llvm-build-ret [builder LLVMBuilderRef?] [value LLVMValueRef?]) LLVMValueRef?]{Builds a return instruction returning @racket[value].}
@defproc[(llvm-build-ret-void [builder LLVMBuilderRef?]) LLVMValueRef?]{Builds a void return instruction.}

@section{Arithmetic Instructions}

All arithmetic instructions take a @racket[builder], operands, and a @racket[name] string for the result register.

@defproc[(llvm-build-add [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer addition.}
@defproc[(llvm-build-sub [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Integer subtraction.}
@defproc[(llvm-build-mul [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Integer multiplication.}
@defproc[(llvm-build-s-div [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Signed integer division.}
@defproc[(llvm-build-u-div [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Unsigned integer division.}
@defproc[(llvm-build-s-rem [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Signed integer remainder.}
@defproc[(llvm-build-u-rem [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Unsigned integer remainder.}
@defproc[(llvm-build-neg [builder LLVMBuilderRef?] [val LLVMValueRef?] [name string?]) LLVMValueRef?]{Integer negation.}

@defproc[(llvm-build-f-add [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Floating-point addition.}
@defproc[(llvm-build-f-sub [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Floating-point subtraction.}
@defproc[(llvm-build-f-mul [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Floating-point multiplication.}
@defproc[(llvm-build-f-div [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Floating-point division.}
@defproc[(llvm-build-f-rem [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Floating-point remainder.}
@defproc[(llvm-build-f-neg [builder LLVMBuilderRef?] [val LLVMValueRef?] [name string?]) LLVMValueRef?]{Floating-point negation.}

@section{Bitwise Instructions}

@defproc[(llvm-build-and [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Bitwise AND.}
@defproc[(llvm-build-or [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Bitwise OR.}
@defproc[(llvm-build-xor [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Bitwise XOR.}
@defproc[(llvm-build-not [builder LLVMBuilderRef?] [val LLVMValueRef?] [name string?]) LLVMValueRef?]{Bitwise NOT.}
@defproc[(llvm-build-shl [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Shift left.}
@defproc[(llvm-build-l-shr [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Logical shift right.}
@defproc[(llvm-build-a-shr [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string?]) LLVMValueRef?]{Arithmetic shift right.}

@section{Comparison Instructions}

@defproc[(llvm-build-i-cmp [builder LLVMBuilderRef?] [predicate symbol?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""])
    LLVMValueRef?
]{
    Integer comparison. @racket[predicate] is one of:
    @racket['int-eq], @racket['int-ne],
    @racket['int-ugt], @racket['int-uge], @racket['int-ult], @racket['int-ule] (unsigned),
    @racket['int-sgt], @racket['int-sge], @racket['int-slt], @racket['int-sle] (signed).
}

@defproc[(llvm-build-f-cmp [builder LLVMBuilderRef?] [predicate symbol?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""])
    LLVMValueRef?
]{
    Floating-point comparison. @racket[predicate] is one of:
    @racket['real-oeq], @racket['real-ogt], @racket['real-oge], @racket['real-olt], @racket['real-ole], @racket['real-one], @racket['real-ord] (ordered),
    @racket['real-ueq], @racket['real-ugt], @racket['real-uge], @racket['real-ult], @racket['real-ule], @racket['real-uno] (unordered),
    @racket['real-predicate-false], @racket['real-predicate-true].
}

@defproc[(llvm-build-is-null [builder LLVMBuilderRef?] [val LLVMValueRef?] [name string?]) LLVMValueRef?]{Checks if value is null.}
@defproc[(llvm-build-is-not-null [builder LLVMBuilderRef?] [val LLVMValueRef?] [name string?]) LLVMValueRef?]{Checks if value is not null.}

@section{Control Flow}

@defproc[(llvm-build-br [builder LLVMBuilderRef?] [dest LLVMBasicBlockRef?]) LLVMValueRef?]{Unconditional branch to @racket[dest].}
@defproc[(llvm-build-cond-br [builder LLVMBuilderRef?] [cond LLVMValueRef?] [then-block LLVMBasicBlockRef?] [else-block LLVMBasicBlockRef?])
    LLVMValueRef?
]{Conditional branch. Jumps to @racket[then-block] if @racket[cond] is true, otherwise @racket[else-block].}
@defproc[(llvm-build-switch [builder LLVMBuilderRef?] [val LLVMValueRef?] [default-block LLVMBasicBlockRef?] [num-cases exact-nonnegative-integer?])
    LLVMValueRef?
]{Creates a switch instruction. Use @racket[llvm-add-case] to add cases.}
@defproc[(llvm-add-case [switch LLVMValueRef?] [on-val LLVMValueRef?] [dest LLVMBasicBlockRef?]) void?]{Adds a case to a switch instruction.}
@defproc[(llvm-build-unreachable [builder LLVMBuilderRef?]) LLVMValueRef?]{Marks a point in code as unreachable.}
@defproc[(llvm-build-select [builder LLVMBuilderRef?] [cond LLVMValueRef?] [then-val LLVMValueRef?] [else-val LLVMValueRef?] [name string?])
    LLVMValueRef?
]{Selects between two values based on a condition (like a ternary operator).}

@section{Memory Instructions}

@defproc[(llvm-build-alloca [builder LLVMBuilderRef?] [type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Allocates memory on the stack for the given type.}
@defproc[(llvm-build-malloc [builder LLVMBuilderRef?] [type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Allocates memory on the heap for the given type.}
@defproc[(llvm-build-load2 [builder LLVMBuilderRef?] [type LLVMTypeRef?] [ptr LLVMValueRef?] [name string?]) LLVMValueRef?]{Loads a value of @racket[type] from the pointer @racket[ptr].}
@defproc[(llvm-build-store [builder LLVMBuilderRef?] [val LLVMValueRef?] [ptr LLVMValueRef?]) LLVMValueRef?]{Stores @racket[val] to the pointer @racket[ptr].}
@defproc[(llvm-build-ge2 [builder LLVMBuilderRef?] [type LLVMTypeRef?] [ptr LLVMValueRef?] [indices cpointer?] [num-indices exact-nonnegative-integer?] [name string?])
    LLVMValueRef?
]{Computes a pointer to a sub-element of an aggregate type (GEP — Get Element Pointer).}
@defproc[(llvm-build-struct-ge2 [builder LLVMBuilderRef?] [type LLVMTypeRef?] [ptr LLVMValueRef?] [index exact-nonnegative-integer?] [name string?])
    LLVMValueRef?
]{Computes a pointer to a field of a struct type.}
@defproc[(llvm-build-free [builder LLVMBuilderRef?] [ptr LLVMValueRef?]) LLVMValueRef?]{Frees heap-allocated memory.}

@section{Function Calls}

@defproc[(llvm-build-call2 [builder LLVMBuilderRef?] [fn-type LLVMTypeRef?] [fn LLVMValueRef?] [args (listof LLVMValueRef?)] [name string? ""])
    LLVMValueRef?
]{
    Calls @racket[fn] with the given @racket[args]. @racket[fn-type] is the function's type. @racket[name] names the return value (use @racket[""] for void calls).
}

@section{Type Cast Instructions}

@defproc[(llvm-build-trunc [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Truncates an integer to a narrower type.}
@defproc[(llvm-build-z-ext [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Zero-extends an integer to a wider type.}
@defproc[(llvm-build-s-ext [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Sign-extends an integer to a wider type.}
@defproc[(llvm-build-fp-to-si [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Converts a floating-point value to a signed integer.}
@defproc[(llvm-build-fp-to-ui [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Converts a floating-point value to an unsigned integer.}
@defproc[(llvm-build-si-to-fp [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Converts a signed integer to a floating-point value.}
@defproc[(llvm-build-ui-to-fp [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Converts an unsigned integer to a floating-point value.}
@defproc[(llvm-build-fp-trunc [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Truncates a float to a narrower float type.}
@defproc[(llvm-build-fp-ext [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Extends a float to a wider float type.}
@defproc[(llvm-build-bit-cast [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Reinterprets the bits of a value as a different type of the same size.}
@defproc[(llvm-build-ptr-to-int [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Converts a pointer to an integer.}
@defproc[(llvm-build-int-to-ptr [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-type LLVMTypeRef?] [name string?]) LLVMValueRef?]{Converts an integer to a pointer.}

@section{PHI Nodes}

@defproc[(llvm-build-phi [builder LLVMBuilderRef?] [type LLVMTypeRef?] [name string?]) LLVMValueRef?]{
    Creates a PHI node of the given type. Use @racket[llvm-add-incoming] to add incoming values from predecessor blocks.
}
@defproc[(llvm-add-incoming [phi LLVMValueRef?] [values cpointer?] [blocks cpointer?] [count exact-nonnegative-integer?]) void?]{
    Adds incoming values to a PHI node. Each value comes from a corresponding predecessor basic block.
}

@section{Other Instructions}

@defproc[(llvm-build-freeze [builder LLVMBuilderRef?] [val LLVMValueRef?] [name string?]) LLVMValueRef?]{Freezes a potentially undefined or poison value to a fixed value.}
@defproc[(llvm-build-global-string [builder LLVMBuilderRef?] [str string?] [name string?]) LLVMValueRef?]{Creates a global string constant.}
@defproc[(llvm-build-global-string-ptr [builder LLVMBuilderRef?] [str string?] [name string?]) LLVMValueRef?]{Creates a pointer to a global string constant.}
