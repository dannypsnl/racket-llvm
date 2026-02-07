#lang scribble/manual
@require[@for-label[racket-llvm
                    racket/base]]

@title{Enumerations}

LLVM uses enumerations to represent various configuration options, types, and flags. This section documents the commonly used enumerations in racket-llvm.

@section{Type and Value Classification}

@defidform[_llvm-type-kind]{
A classification of LLVM types. Used by @racket[llvm-get-type-kind] to determine the kind of a type.

Possible values:
@itemlist[
@item{@racket[llvm-void-type-kind] — Void type}
@item{@racket[llvm-integer-type-kind] — Integer type}
@item{@racket[llvm-float-type-kind] — IEEE 754 single-precision float}
@item{@racket[llvm-double-type-kind] — IEEE 754 double-precision float}
@item{@racket[llvm-label-type-kind] — Label type for basic blocks}
@item{@racket[llvm-function-type-kind] — Function type}
@item{@racket[llvm-struct-type-kind] — Struct type}
@item{@racket[llvm-array-type-kind] — Array type}
@item{@racket[llvm-pointer-type-kind] — Pointer type}
@item{@racket[llvm-vector-type-kind] — Vector type}
@item{@racket[llvm-metadata-type-kind] — Metadata type}
@item{Other floating-point and special types}
]
}

@defidform[_llvm-value-kind]{
A classification of LLVM values (operands in instructions). Used by @racket[llvm-get-value-kind] to determine the kind of a value.

Possible values include:
@itemlist[
@item{@racket[llvm-argument-value-kind] — Function argument}
@item{@racket[llvm-basic-block-value-kind] — Basic block}
@item{@racket[llvm-function-value-kind] — Function}
@item{@racket[llvm-global-variable-value-kind] — Global variable}
@item{@racket[llvm-global-alias-value-kind] — Global alias}
@item{@racket[llvm-constant-int-value-kind] — Constant integer}
@item{@racket[llvm-constant-fp-value-kind] — Constant floating-point}
@item{@racket[llvm-instruction-value-kind] — Instruction}
@item{Other constant and special value kinds}
]
}

@section{Linkage and Visibility}

@defidform[_llvm-linkage]{
Specifies how a global value is linked. Used by @racket[llvm-get-linkage] and @racket[llvm-set-linkage] to control global symbol visibility and linking behavior.

Possible values:
@itemlist[
@item{@racket[llvm-external-linkage] — External linkage (default)}
@item{@racket[llvm-available-externally-linkage] — Available externally}
@item{@racket[llvm-link-once-any-linkage] — Link once, any definition}
@item{@racket[llvm-link-once-odr-linkage] — Link once, one definition rule (ODR)}
@item{@racket[llvm-weak-any-linkage] — Weak linkage, any definition}
@item{@racket[llvm-weak-odr-linkage] — Weak linkage, ODR}
@item{@racket[llvm-appending-linkage] — Appending linkage}
@item{@racket[llvm-internal-linkage] — Internal (static) linkage}
@item{@racket[llvm-private-linkage] — Private linkage}
@item{@racket[llvm-external-weak-linkage] — External weak linkage}
@item{@racket[llvm-common-linkage] — Common linkage}
]
}

@defidform[_llvm-visibility]{
Controls the visibility of a global symbol. Used by @racket[llvm-get-visibility] and @racket[llvm-set-visibility].

Possible values:
@itemlist[
@item{@racket[llvm-default-visibility] — Default visibility}
@item{@racket[llvm-hidden-visibility] — Hidden visibility (not exported from shared library)}
@item{@racket[llvm-protected-visibility] — Protected visibility (exported but not overridable)}
]
}

@section{Addressing and Storage}

@defidform[_llvm-unnamed-addr]{
Specifies the unnamed address mode for global values. Used by @racket[llvm-get-unnamed-address] and @racket[llvm-set-unnamed-address].

Possible values:
@itemlist[
@item{@racket[llvm-no-unnamed-addr] — Address is significant}
@item{@racket[llvm-local-unnamed-addr] — Address is locally unnamed}
@item{@racket[llvm-global-unnamed-addr] — Address is globally unnamed}
]
}

@defidform[_llvmdll-storage-class]{
Specifies DLL storage class for symbols on Windows. Used by @racket[llvm-get-dll-storage-class] and @racket[llvm-set-dll-storage-class].

Possible values:
@itemlist[
@item{@racket[llvm-default-storage-class] — Default storage class}
@item{@racket[llvmdll-import-storage-class] — DLL import}
@item{@racket[llvmdll-export-storage-class] — DLL export}
]
}

@section{Thread-Local Storage}

@defidform[_llvm-thread-local-mode]{
Specifies the thread-local storage model for global variables. Used by @racket[llvm-get-thread-local-mode] and @racket[llvm-set-thread-local-mode].

Possible values:
@itemlist[
@item{@racket[llvm-not-thread-local] — Not thread-local (default)}
@item{@racket[llvm-general-dynamic-tls-model] — General dynamic TLS model}
@item{@racket[llvm-local-dynamic-tls-model] — Local dynamic TLS model}
@item{@racket[llvm-initial-exec-tls-model] — Initial exec TLS model}
@item{@racket[llvm-local-exec-tls-model] — Local exec TLS model}
]
}

@section{Calling Conventions}

@defidform[_llvm-call-conv]{
Specifies the calling convention for functions. Used by @racket[llvm-get-function-call-conv].

Possible values include:
@itemlist[
@item{@racket[llvmc-call-conv] — C calling convention (default)}
@item{@racket[llvm-fast-call-conv] — Fast calling convention}
@item{@racket[llvm-cold-call-conv] — Cold calling convention}
@item{@racket[llvmx86-stdcall-call-conv] — x86 stdcall}
@item{@racket[llvmx86-fastcall-call-conv] — x86 fastcall}
@item{@racket[llvm-arm-aapcs-call-conv] — ARM AAPCS}
@item{@racket[llvmx8664-sys-v-call-conv] — x86-64 System V}
@item{@racket[llvm-win64-call-conv] — Windows x64}
@item{@racket[llvm-preserve-most-call-conv] — Preserve most registers}
@item{@racket[llvm-preserve-all-call-conv] — Preserve all registers}
@item{Other platform and architecture specific conventions}
]
}

@section{Enums for Atomic Operations}

@defidform[_llvm-atomic-ordering]{
Specifies memory ordering semantics for atomic operations. Used by @racket[llvm-build-atomic-rmw], @racket[llvm-build-atomic-cmp-xchg], and related functions.

Possible values:
@itemlist[
@item{@racket[llvm-atomic-ordering-not-atomic] — Non-atomic}
@item{@racket[llvm-atomic-ordering-unordered] — Unordered}
@item{@racket[llvm-atomic-ordering-monotonic] — Monotonic}
@item{@racket[llvm-atomic-ordering-acquire] — Acquire semantics}
@item{@racket[llvm-atomic-ordering-release] — Release semantics}
@item{@racket[llvm-atomic-ordering-acquire-release] — Acquire-release semantics}
@item{@racket[llvm-atomic-ordering-sequentially-consistent] — Sequential consistency}
]
}

@defidform[_llvm-atomic-rmw-bin-op]{
Specifies the atomic read-modify-write operation. Used by @racket[llvm-build-atomic-rmw], @racket[llvm-get-atomic-rmw-bin-op], and @racket[llvm-set-atomic-rmw-bin-op].

Possible values:
@itemlist[
@item{@racket[llvm-atomic-rmw-bin-op-xchg] — Exchange}
@item{@racket[llvm-atomic-rmw-bin-op-add] — Add}
@item{@racket[llvm-atomic-rmw-bin-op-sub] — Subtract}
@item{@racket[llvm-atomic-rmw-bin-op-and] — Bitwise AND}
@item{@racket[llvm-atomic-rmw-bin-op-or] — Bitwise OR}
@item{@racket[llvm-atomic-rmw-bin-op-xor] — Bitwise XOR}
@item{@racket[llvm-atomic-rmw-bin-op-max] — Maximum (signed)}
@item{@racket[llvm-atomic-rmw-bin-op-min] — Minimum (signed)}
@item{@racket[llvm-atomic-rmw-bin-op-u-max] — Maximum (unsigned)}
@item{@racket[llvm-atomic-rmw-bin-op-u-min] — Minimum (unsigned)}
@item{Floating-point operations: @racket[llvm-atomic-rmw-bin-op-f-add], @racket[llvm-atomic-rmw-bin-op-f-sub], etc.}
]
}

@section{Function Call Optimization}

@defidform[_llvm-tail-call-kind]{
Specifies tail call optimization hints for function calls. Used by @racket[llvm-get-tail-call-kind] and @racket[llvm-set-tail-call-kind].

Possible values:
@itemlist[
@item{@racket[llvm-tail-call-kind-none] — No tail call optimization}
@item{@racket[llvm-tail-call-kind-tail] — May be tail called}
@item{@racket[llvm-tail-call-kind-must-tail] — Must be tail called}
@item{@racket[llvm-tail-call-kind-no-tail] — Cannot be tail called}
]
}

@section{Enums for Inline Assembly}

@defidform[_llvm-inline-asm-dialect]{
Specifies the assembly dialect for inline assembly. Used by @racket[llvm-get-inline-asm], @racket[llvm-get-inline-asm-dialect].

Possible values:
@itemlist[
@item{@racket[llvm-inline-asm-dialect-att] — AT&T assembly syntax}
@item{@racket[llvm-inline-asm-dialect-intel] — Intel assembly syntax}
]
}

@section{Code Generation Configuration}

@defidform[_llvm-code-gen-opt-level]{
Specifies the code generation optimization level. Used by @racket[llvm-create-target-machine] and @racket[llvm-target-machine-options-set-code-gen-opt-level].

Possible values:
@itemlist[
@item{@racket[llvm-code-gen-level-none] — No optimization}
@item{@racket[llvm-code-gen-level-less] — Less optimization (faster compilation)}
@item{@racket[llvm-code-gen-level-default] — Default optimization}
@item{@racket[llvm-code-gen-level-aggressive] — Aggressive optimization}
]
}

@defidform[_llvm-reloc-mode]{
Specifies the relocation model for code generation. Used by @racket[llvm-create-target-machine] and @racket[llvm-target-machine-options-set-reloc-mode].

Possible values:
@itemlist[
@item{@racket[llvm-reloc-default] — Default relocation model}
@item{@racket[llvm-reloc-static] — Static relocation}
@item{@racket[llvm-reloc-pic] — Position-independent code (PIC)}
@item{@racket[llvm-reloc-dynamic-no-pic] — Dynamic with no PIC}
@item{@racket[llvm-reloc-ropi] — Read-only position-independent}
@item{@racket[llvm-reloc-rwpi] — Read-write position-independent}
@item{@racket[llvm-reloc-ropi-rwpi] — Both read-only and read-write PIC}
]
}

@defidform[_llvm-code-model]{
Specifies the code model for memory addressing. Used by @racket[llvm-create-target-machine] and @racket[llvm-target-machine-options-set-code-model].

Possible values:
@itemlist[
@item{@racket[llvm-code-model-default] — Default code model}
@item{@racket[llvm-code-model-jit-default] — JIT default}
@item{@racket[llvm-code-model-tiny] — Tiny (32KB code)}
@item{@racket[llvm-code-model-small] — Small (2GB code)}
@item{@racket[llvm-code-model-kernel] — Kernel (512MB absolute addresses)}
@item{@racket[llvm-code-model-medium] — Medium (2GB code, unlimited data)}
@item{@racket[llvm-code-model-large] — Large (unlimited)}
]
}

@defidform[_llvm-code-gen-file-type]{
Specifies the output file type for code generation. Used by @racket[llvm-target-machine-emit-to-file] and @racket[llvm-target-machine-emit-to-memory-buffer].

Possible values:
@itemlist[
@item{@racket[llvm-assembly-file] — Emit assembly code}
@item{@racket[llvm-object-file] — Emit object file}
]
}

@section{Module and Debug Information}

@defidform[_llvm-module-flag-behavior]{
Specifies the behavior when module flags conflict. Used by @racket[llvm-add-module-flag] and @racket[llvm-module-flag-entries-get-flag-behavior].

Possible values:
@itemlist[
@item{@racket[llvm-module-flag-behavior-error] — Error on conflict}
@item{@racket[llvm-module-flag-behavior-warning] — Warn on conflict}
@item{@racket[llvm-module-flag-behavior-require] — Require the flag}
@item{@racket[llvm-module-flag-behavior-override] — Override existing flag}
@item{@racket[llvm-module-flag-behavior-append] — Append to existing flag}
@item{@racket[llvm-module-flag-behavior-append-unique] — Append only if unique}
]
}

@defidform[_llvmdi-flags]{
Specifies debug information flags for DIType and related nodes. Used by @racket[llvmdi-type-get-flags].

Flags are bitwise combinations of debug info properties controlling visibility, virtuality, and other metadata properties for debug information.
}

@defidform[_llvmdwarf-source-language]{
Specifies the source language for debug information. Used by @racket[llvmdi-builder-create-compile-unit].

Possible values include languages such as:
@itemlist[
@item{@racket[llvmdwarf-source-language-c] — C}
@item{@racket[llvmdwarf-source-language-c-plus-plus] — C++}
@item{@racket[llvmdwarf-source-language-c99] — C99}
@item{@racket[llvmdwarf-source-language-java] — Java}
@item{@racket[llvmdwarf-source-language-obj-c] — Objective-C}
@item{@racket[llvmdwarf-source-language-obj-c-plus-plus] — Objective-C++}
@item{Other language identifiers}
]
}

@defidform[_llvmdwarf-emission-kind]{
Specifies the DWARF debug information emission mode. Used by @racket[llvmdi-builder-create-compile-unit].

Possible values:
@itemlist[
@item{@racket[llvmdwarf-emission-kind-none] — No debug information}
@item{@racket[llvmdwarf-emission-kind-full] — Full debug information}
@item{@racket[llvmdwarf-emission-kind-line-tables-only] — Line tables only}
]
}

@section{Other Enumerations}

@defidform[_llvm-diagnostic-severity]{
Specifies the severity level of a diagnostic message. Used by @racket[llvm-get-diag-info-severity].

Possible values:
@itemlist[
@item{@racket[llvmds-error] — Error}
@item{@racket[llvmds-warning] — Warning}
@item{@racket[llvmds-remark] — Remark}
@item{@racket[llvmds-note] — Note}
]
}

@defidform[_llvm-comdat-selection-kind]{
Specifies COMDAT symbol selection strategy for linker deduplication. Used by @racket[llvm-get-comdat-selection-kind] and @racket[llvm-set-comdat-selection-kind].

Possible values:
@itemlist[
@item{@racket[llvm-any-comdat-selection-kind] — Any definition}
@item{@racket[llvm-exact-match-comdat-selection-kind] — Exact match required}
@item{@racket[llvm-largest-comdat-selection-kind] — Select largest}
@item{@racket[llvm-no-deduplicate-comdat-selection-kind] — No deduplication}
@item{@racket[llvm-same-size-comdat-selection-kind] — Same size only}
]
}

@defidform[_llvm-binary-type]{
Specifies the type of a binary object file. Used by @racket[llvm-binary-get-type].

Possible values include:
@itemlist[
@item{@racket[llvm-binary-type-archive] — Archive (static library)}
@item{@racket[llvm-binary-type-coff] — COFF object file (Windows)}
@item{@racket[llvm-binary-type-elf32l] — ELF 32-bit little-endian}
@item{@racket[llvm-binary-type-elf64l] — ELF 64-bit little-endian}
@item{@racket[llvm-binary-type-mach-o64l] — Mach-O 64-bit (macOS)}
@item{@racket[llvm-binary-type-wasm] — WebAssembly}
@item{@racket[llvm-binary-type-ir] — LLVM IR}
@item{Other binary formats}
]
}

@defidform[_llvm-global-i-sel-abort-mode]{
Controls the behavior of GlobalISel (global instruction selector) when it fails. Used by @racket[llvm-set-target-machine-global-i-sel-abort].

Possible values:
@itemlist[
@item{@racket[llvm-global-i-sel-abort-enable] — Enable, abort on failure}
@item{@racket[llvm-global-i-sel-abort-disable] — Disable GlobalISel}
@item{@racket[llvm-global-i-sel-abort-disable-with-diag] — Disable and show diagnostics}
]
}
