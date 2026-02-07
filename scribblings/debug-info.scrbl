#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Debug Information}

Functions for creating and manipulating LLVM debug information metadata.

@section{Debug Info Builder}

@defproc[(llvmdi-builder-create-compile-unit [builder _LLVMDIBuilderRef] [language _llvmdwarf-source-language] [file _LLVMMetadataRef] [producer string?] [is-optimized? boolean?] [flags string?] [runtime-ver exact-nonnegative-integer?] [split-name string?] [kind _llvmdwarf-emission-kind] [dwoid exact-nonnegative-integer?] [split-debug-inlining? boolean?] [debug-info-for-profiling? boolean?] [gnuPubnames? boolean?] [gnuStrictDwarf? boolean?])
    _LLVMMetadataRef
]{
    Creates a compile unit for debug information. @racket[language] specifies the source language,
    @racket[kind] specifies the DWARF emission mode (none, full, or line-tables-only).
}

@section{Debug Info Type Operations}

@defproc[(llvmdi-type-get-flags [ditype _LLVMMetadataRef])
    _llvmdi-flags
]{
    Returns the debug information flags of a debug type node.
}
