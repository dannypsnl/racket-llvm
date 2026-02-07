#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Builder}

The builder is used to construct LLVM IR instructions. Create a builder, position it at the end of a basic block, then use the @racket[llvm-build-*] functions to emit instructions.

@section{Builder Setup}

@defproc[(llvm-builder-create) LLVMBuilderRef?]{Creates a new instruction builder.}
@defproc[(llvm-append-basic-block [function LLVMValueRef?] [name string? ""]) LLVMBasicBlockRef?]{Creates and appends a new basic block to the given @racket[function].}
@defproc[(llvm-builder-position-at-end [builder LLVMBuilderRef?] [basic-block LLVMBasicBlockRef?]) void?]{
 Sets @racket[builder] insert position to the end of @racket[basic-block].
}
@defproc[(llvm-get-param [function LLVMValueRef?] [index integer?]) LLVMValueRef?]{Gets parameter from @racket[function] by index.}
@defproc[(llvm-get-insert-block [builder LLVMBuilderRef?]) LLVMBasicBlockRef?]{Returns the basic block the builder is currently positioned at.}

@section{Return Instructions}

@defproc[(llvm-build-ret [builder LLVMBuilderRef?] [value LLVMValueRef?]) LLVMValueRef?]{Builds a return instruction returning @racket[value].}
@defproc[(llvm-build-ret-void [builder LLVMBuilderRef?]) LLVMValueRef?]{Builds a void return instruction.}
@defproc[(llvm-build-aggregate-ret [builder LLVMBuilderRef?] [ret-vals (listof LLVMValueRef?)]) LLVMValueRef?]{Builds a return instruction returning multiple values.}

@section{Arithmetic Instructions}

All arithmetic instructions take a @racket[builder], operands, and an optional @racket[name] string (defaulting to @racket[""]) for the result register.

@defproc[(llvm-build-add [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer addition.}
@defproc[(llvm-build-sub [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer subtraction.}
@defproc[(llvm-build-mul [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer multiplication.}
@defproc[(llvm-build-sdiv [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Signed integer division.}
@defproc[(llvm-build-udiv [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Unsigned integer division.}
@defproc[(llvm-build-srem [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Signed integer remainder.}
@defproc[(llvm-build-urem [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Unsigned integer remainder.}
@defproc[(llvm-build-neg [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer negation.}

@defproc[(llvm-build-nswadd [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer addition with NSW (no signed wrap) flag.}
@defproc[(llvm-build-nswsub [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer subtraction with NSW flag.}
@defproc[(llvm-build-nswmul [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer multiplication with NSW flag.}
@defproc[(llvm-build-nswneg [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer negation with NSW flag.}
@defproc[(llvm-build-nuwadd [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer addition with NUW (no unsigned wrap) flag.}
@defproc[(llvm-build-nuwsub [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer subtraction with NUW flag.}
@defproc[(llvm-build-nuwmul [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer multiplication with NUW flag.}
@defproc[(llvm-build-nuwneg [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Integer negation with NUW flag.}

@defproc[(llvm-build-fadd [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Floating-point addition.}
@defproc[(llvm-build-fsub [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Floating-point subtraction.}
@defproc[(llvm-build-fmul [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Floating-point multiplication.}
@defproc[(llvm-build-fdiv [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Floating-point division.}
@defproc[(llvm-build-frem [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Floating-point remainder.}
@defproc[(llvm-build-fneg [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Floating-point negation.}

@section{Bitwise Instructions}

@defproc[(llvm-build-and [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Bitwise AND.}
@defproc[(llvm-build-or [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Bitwise OR.}
@defproc[(llvm-build-xor [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Bitwise XOR.}
@defproc[(llvm-build-not [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Bitwise NOT.}
@defproc[(llvm-build-shl [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Shift left.}
@defproc[(llvm-build-lshr [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Logical shift right.}
@defproc[(llvm-build-ashr [builder LLVMBuilderRef?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Arithmetic shift right.}

@section{Comparison Instructions}

@defproc[(llvm-build-icmp [builder LLVMBuilderRef?] [predicate symbol?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""])
    LLVMValueRef?
]{
    Integer comparison. @racket[predicate] is one of:
    @racket['int-eq], @racket['int-ne],
    @racket['int-ugt], @racket['int-uge], @racket['int-ult], @racket['int-ule] (unsigned),
    @racket['int-sgt], @racket['int-sge], @racket['int-slt], @racket['int-sle] (signed).

    The alias @racket[llvm-build-int-cmp] is also available.
}

@defproc[(llvm-build-fcmp [builder LLVMBuilderRef?] [predicate symbol?] [lhs LLVMValueRef?] [rhs LLVMValueRef?] [name string? ""])
    LLVMValueRef?
]{
    Floating-point comparison. @racket[predicate] is one of:
    @racket['real-oeq], @racket['real-ogt], @racket['real-oge], @racket['real-olt], @racket['real-ole], @racket['real-one], @racket['real-ord] (ordered),
    @racket['real-ueq], @racket['real-ugt], @racket['real-uge], @racket['real-ult], @racket['real-ule], @racket['real-uno] (unordered),
    @racket['real-predicate-false], @racket['real-predicate-true].

    The alias @racket[llvm-build-float-cmp] is also available.
}

@defproc[(llvm-build-is-null [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Checks if value is null.}
@defproc[(llvm-build-is-not-null [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Checks if value is not null.}

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
@defproc[(llvm-build-select [builder LLVMBuilderRef?] [if LLVMValueRef?] [then LLVMValueRef?] [else LLVMValueRef?] [name string? ""])
    LLVMValueRef?
]{Selects between two values based on a condition (like a ternary operator).}

@section{Memory Instructions}

@defproc[(llvm-build-alloca [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Allocates memory on the stack for the given type.}
@defproc[(llvm-build-malloc [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Allocates memory on the heap for the given type.}
@defproc[(llvm-build-array-alloca [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [val LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Allocates an array on the stack.}
@defproc[(llvm-build-array-malloc [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [val LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Allocates an array on the heap.}
@defproc[(llvm-build-load2 [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [pointer-val LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Loads a value of @racket[ty] from the pointer @racket[pointer-val].}
@defproc[(llvm-build-store [builder LLVMBuilderRef?] [val LLVMValueRef?] [ptr LLVMValueRef?]) LLVMValueRef?]{Stores @racket[val] to the pointer @racket[ptr].}
@defproc[(llvm-build-gep2 [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [pointer LLVMValueRef?] [indices (listof LLVMValueRef?)] [name string? ""])
    LLVMValueRef?
]{Computes a pointer to a sub-element of an aggregate type (GEP — Get Element Pointer). @racket[indices] is a list of index values.}
@defproc[(llvm-build-in-bounds-gep2 [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [pointer LLVMValueRef?] [indices (listof LLVMValueRef?)] [name string? ""])
    LLVMValueRef?
]{Like @racket[llvm-build-gep2] but with the @code{inbounds} flag set.}
@defproc[(llvm-build-struct-gep2 [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [pointer LLVMValueRef?] [idx exact-nonnegative-integer?] [name string? ""])
    LLVMValueRef?
]{Computes a pointer to a field of a struct type.}
@defproc[(llvm-build-free [builder LLVMBuilderRef?] [ptr LLVMValueRef?]) LLVMValueRef?]{Frees heap-allocated memory.}

@section{Function Calls}

@defproc[(llvm-build-call2 [builder LLVMBuilderRef?] [fn-type LLVMTypeRef?] [fn LLVMValueRef?] [args (listof LLVMValueRef?)] [name string? ""])
    LLVMValueRef?
]{
    Calls @racket[fn] with the given @racket[args]. @racket[fn-type] is the function's type. @racket[name] names the return value (use @racket[""] for void calls).
}

@defproc[(llvm-build-invoke2 [builder LLVMBuilderRef?] [fn-ty LLVMTypeRef?] [fn LLVMValueRef?] [args (listof LLVMValueRef?)] [then LLVMBasicBlockRef?] [catch LLVMBasicBlockRef?] [name string? ""])
    LLVMValueRef?
]{
    Invokes @racket[fn] with the given @racket[args]. On normal return, control goes to @racket[then]; on exception, to @racket[catch].
}

@section{Type Cast Instructions}

@defproc[(llvm-build-trunc [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Truncates an integer to a narrower type.}
@defproc[(llvm-build-zext [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Zero-extends an integer to a wider type.}
@defproc[(llvm-build-sext [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Sign-extends an integer to a wider type.}
@defproc[(llvm-build-fp->si [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Converts a floating-point value to a signed integer.}
@defproc[(llvm-build-fp->ui [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Converts a floating-point value to an unsigned integer.}
@defproc[(llvm-build-si->fp [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Converts a signed integer to a floating-point value.}
@defproc[(llvm-build-ui->fp [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Converts an unsigned integer to a floating-point value.}
@defproc[(llvm-build-fp-trunc [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Truncates a float to a narrower float type.}
@defproc[(llvm-build-fp-ext [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Extends a float to a wider float type.}
@defproc[(llvm-build-bitcast [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Reinterprets the bits of a value as a different type of the same size.}
@defproc[(llvm-build-ptr->int [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Converts a pointer to an integer.}
@defproc[(llvm-build-int->ptr [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Converts an integer to a pointer.}
@defproc[(llvm-build-addrspace-cast [builder LLVMBuilderRef?] [val LLVMValueRef?] [dest-ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{Casts a pointer to a different address space.}

@section{PHI Nodes}

@defproc[(llvm-build-phi [builder LLVMBuilderRef?] [ty LLVMTypeRef?] [name string? ""]) LLVMValueRef?]{
    Creates a PHI node of the given type. Use @racket[llvm-add-incoming] to add incoming values from predecessor blocks.
}
@defproc[(llvm-add-incoming [phi LLVMValueRef?] [incoming-values (listof LLVMValueRef?)] [incoming-blocks (listof LLVMBasicBlockRef?)]) void?]{
    Adds incoming values to a PHI node. Each value in @racket[incoming-values] comes from the corresponding predecessor basic block in @racket[incoming-blocks]. The two lists must have the same length.
}

@section{Vector Instructions}

@defproc[(llvm-build-extract-element [builder LLVMBuilderRef?] [vec-val LLVMValueRef?] [index LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Extracts an element from a vector at the given index.}
@defproc[(llvm-build-insert-element [builder LLVMBuilderRef?] [vec-val LLVMValueRef?] [elt-val LLVMValueRef?] [index LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Inserts an element into a vector at the given index.}
@defproc[(llvm-build-shuffle-vector [builder LLVMBuilderRef?] [v1 LLVMValueRef?] [v2 LLVMValueRef?] [mask LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Shuffles elements from two vectors using the given mask.}

@section{Aggregate Instructions}

@defproc[(llvm-build-extract-value [builder LLVMBuilderRef?] [agg-val LLVMValueRef?] [index exact-nonnegative-integer?] [name string? ""]) LLVMValueRef?]{Extracts a field from an aggregate (struct or array) at the given index.}
@defproc[(llvm-build-insert-value [builder LLVMBuilderRef?] [agg-val LLVMValueRef?] [elt-val LLVMValueRef?] [index exact-nonnegative-integer?] [name string? ""]) LLVMValueRef?]{Inserts a value into an aggregate at the given index.}

@section{Other Instructions}

@defproc[(llvm-build-freeze [builder LLVMBuilderRef?] [v LLVMValueRef?] [name string? ""]) LLVMValueRef?]{Freezes a potentially undefined or poison value to a fixed value.}
@defproc[(llvm-build-global-string [builder LLVMBuilderRef?] [str string?] [name string? ""]) LLVMValueRef?]{Creates a global string constant.}
@defproc[(llvm-build-global-string-ptr [builder LLVMBuilderRef?] [str string?] [name string? ""]) LLVMValueRef?]{Creates a pointer to a global string constant. The alias @racket[llvm-build-string-ptr] is also available.}
@defproc[(llvm-build-string-ptr [builder LLVMBuilderRef?] [str string?] [name string? ""]) LLVMValueRef?]{Alias of @racket[llvm-build-global-string-ptr]}

@section{Atomic Operations}

@defproc[(llvm-build-atomic-rmw [builder LLVMBuilderRef?] [op _llvm-atomic-rmw-bin-op] [ptr LLVMValueRef?] [val LLVMValueRef?] [ordering _llvm-atomic-ordering] [single-thread? boolean?] [name string? ""])
    LLVMValueRef?
]{
    Builds an atomic read-modify-write instruction. @racket[op] specifies the operation, @racket[ordering] specifies memory semantics.
}

@defproc[(llvm-build-atomic-cmp-xchg [builder LLVMBuilderRef?] [ptr LLVMValueRef?] [cmp LLVMValueRef?] [new LLVMValueRef?] [success-order _llvm-atomic-ordering] [failure-order _llvm-atomic-ordering] [single-thread? boolean?] [name string? ""])
    LLVMValueRef?
]{
    Builds an atomic compare-and-swap instruction. Returns a struct with the old value and a boolean indicating success.
}

@defproc[(llvm-get-atomic-rmw-bin-op [inst LLVMValueRef?]) _llvm-atomic-rmw-bin-op]{
    Returns the atomic RMW operation of an atomic RMW instruction.
}

@defproc[(llvm-set-atomic-rmw-bin-op [inst LLVMValueRef?] [op _llvm-atomic-rmw-bin-op]) void?]{
    Sets the atomic RMW operation of an atomic RMW instruction.
}

@section{Call Optimization}

@defproc[(llvm-get-tail-call-kind [call LLVMValueRef?]) _llvm-tail-call-kind]{
    Returns the tail call kind of a function call instruction.
}

@defproc[(llvm-set-tail-call-kind [call LLVMValueRef?] [kind _llvm-tail-call-kind]) void?]{
    Sets the tail call kind of a function call instruction.
}

@section{Inline Assembly}

@defproc[(llvm-get-inline-asm [ty LLVMTypeRef?] [asm-string string?] [constraint-string string?] [has-side-effects? boolean?] [is-align-stack? boolean?] [dialect _llvm-inline-asm-dialect] [can-throw? boolean?])
    LLVMValueRef?
]{
    Creates an inline assembly value. @racket[dialect] specifies AT&T or Intel syntax.
}

@defproc[(llvm-get-inline-asm-dialect [value LLVMValueRef?]) _llvm-inline-asm-dialect]{
    Returns the assembly dialect (AT&T or Intel) of an inline assembly value.
}

@section{Value Queries}

@defproc[(llvm-typeof [val LLVMValueRef?]) LLVMTypeRef?]{Returns the type of a value.}
@defproc[(llvm-constant? [val LLVMValueRef?]) boolean?]{Returns whether the value is a constant.}
@defproc[(llvm-undef? [val LLVMValueRef?]) boolean?]{Returns whether the value is undefined.}
@defproc[(llvm-poison? [val LLVMValueRef?]) boolean?]{Returns whether the value is a poison value.}
