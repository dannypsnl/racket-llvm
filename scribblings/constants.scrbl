#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Constants}

Functions for creating constant values in LLVM IR.

@section{Integer Constants}

@defproc[(llvm-const-int [type LLVMTypeRef?] [value exact-nonnegative-integer?] [sign-extend boolean? #f])
    LLVMValueRef?
]{
    Creates a constant integer of the given @racket[type] with @racket[value]. If @racket[sign-extend] is true, the value is sign-extended to the type's width.
}

@defproc[(llvm-const-int-of-string [type LLVMTypeRef?] [text string?] [radix exact-nonnegative-integer?])
    LLVMValueRef?
]{
    Creates a constant integer by parsing @racket[text] in the given @racket[radix] (e.g., 10 for decimal, 16 for hex).
}

@defproc[(llvm-const-int-get-s-ext-value [const-val LLVMValueRef?]) integer?]{Returns the sign-extended value of a constant integer.}
@defproc[(llvm-const-int-get-z-ext-value [const-val LLVMValueRef?]) exact-nonnegative-integer?]{Returns the zero-extended value of a constant integer.}

@section{Floating-Point Constants}

@defproc[(llvm-const-real [type LLVMTypeRef?] [value number?])
    LLVMValueRef?
]{
    Creates a constant floating-point value of the given @racket[type].
}

@defproc[(llvm-const-real-of-string [type LLVMTypeRef?] [text string?])
    LLVMValueRef?
]{
    Creates a constant floating-point value by parsing @racket[text].
}

@section{Special Constants}

@defproc[(llvm-const-null [type LLVMTypeRef?]) LLVMValueRef?]{Creates a null constant of the given type.}
@defproc[(llvm-const-all-ones [type LLVMTypeRef?]) LLVMValueRef?]{Creates a constant with all bits set for the given type.}
@defproc[(llvm-const-pointer-null [type LLVMTypeRef?]) LLVMValueRef?]{Creates a null pointer constant of the given pointer type.}
@defproc[(llvm-get-undef [type LLVMTypeRef?]) LLVMValueRef?]{Creates an undefined value of the given type.}
@defproc[(llvm-get-poison [type LLVMTypeRef?]) LLVMValueRef?]{Creates a poison value of the given type.}
