#lang racket/base
(provide (all-defined-out))
(require ffi/unsafe
         "../definer.rkt")

; LLVM FFI bindings
; Generated automatically from LLVM-C headers

(define-cpointer-type _LLVMAttributeRefRef #:tag 'LLVMOpaqueAttributeRef)
(define-cpointer-type _LLVMBasicBlockRef #:tag 'LLVMOpaqueBasicBlock)
(define-cpointer-type _LLVMBinaryRef #:tag 'LLVMOpaqueBinary)
(define-cpointer-type _LLVMBuilderRef #:tag 'LLVMOpaqueBuilder)
(define-cpointer-type _LLVMComdatRef #:tag 'LLVMOpaqueComdat)
(define-cpointer-type _LLVMContextRef #:tag 'LLVMOpaqueContext)
(define-cpointer-type _LLVMDIBuilderRef #:tag 'LLVMOpaqueDIBuilder)
(define-cpointer-type _LLVMDbgRecordRef #:tag 'LLVMOpaqueDbgRecord)
(define-cpointer-type _LLVMDiagnosticInfoRef #:tag 'LLVMOpaqueDiagnosticInfo)
(define-cpointer-type _LLVMErrorRef #:tag 'LLVMOpaqueError)
(define-cpointer-type _LLVMExecutionEngineRef #:tag 'LLVMOpaqueExecutionEngine)
(define-cpointer-type _LLVMGenericValueRef #:tag 'LLVMOpaqueGenericValue)
(define-cpointer-type _LLVMJITEventListenerRef #:tag 'LLVMOpaqueJITEventListener)
(define-cpointer-type _LLVMMCJITCompilerOptionsRef #:tag 'LLVMOpaqueMCJITCompilerOptions)
(define-cpointer-type _LLVMMCJITMemoryManagerRef #:tag 'LLVMOpaqueMCJITMemoryManager)
(define-cpointer-type _LLVMMemoryBufferRef #:tag 'LLVMOpaqueMemoryBuffer)
(define-cpointer-type _LLVMMetadataRef #:tag 'LLVMOpaqueMetadata)
(define-cpointer-type _LLVMModuleFlagEntryRef #:tag 'LLVMOpaqueModuleFlagEntry)
(define-cpointer-type _LLVMModuleProviderRef #:tag 'LLVMOpaqueModuleProvider)
(define-cpointer-type _LLVMModuleRef #:tag 'LLVMOpaqueModule)
(define-cpointer-type _LLVMNamedMDNodeRef #:tag 'LLVMOpaqueNamedMDNode)
(define-cpointer-type _LLVMObjectFileRef #:tag 'LLVMOpaqueObjectFile)
(define-cpointer-type _LLVMOperandBundleRef #:tag 'LLVMOpaqueOperandBundle)
(define-cpointer-type _LLVMOrcCJITDylibSearchOrderElementRef #:tag 'LLVMOpaqueOrcCJITDylibSearchOrderElement)
(define-cpointer-type _LLVMOrcCLookupSetElementRef #:tag 'LLVMOpaqueOrcCLookupSetElement)
(define-cpointer-type _LLVMOrcCSymbolAliasMapPairRef #:tag 'LLVMOpaqueOrcCSymbolAliasMapPair)
(define-cpointer-type _LLVMOrcCSymbolDependenceGroupRef #:tag 'LLVMOpaqueOrcCSymbolDependenceGroup)
(define-cpointer-type _LLVMOrcCSymbolFlagsMapPairRef #:tag 'LLVMOpaqueOrcCSymbolFlagsMapPair)
(define-cpointer-type _LLVMOrcCSymbolMapPairRef #:tag 'LLVMOpaqueOrcCSymbolMapPair)
(define-cpointer-type _LLVMOrcOpaqueDefinitionGeneratorRef #:tag 'LLVMOpaqueOrcOpaqueDefinitionGenerator)
(define-cpointer-type _LLVMOrcOpaqueDumpObjectsRef #:tag 'LLVMOpaqueOrcOpaqueDumpObjects)
(define-cpointer-type _LLVMOrcOpaqueExecutionSessionRef #:tag 'LLVMOpaqueOrcOpaqueExecutionSession)
(define-cpointer-type _LLVMOrcOpaqueIRTransformLayerRef #:tag 'LLVMOpaqueOrcOpaqueIRTransformLayer)
(define-cpointer-type _LLVMOrcOpaqueIndirectStubsManagerRef #:tag 'LLVMOpaqueOrcOpaqueIndirectStubsManager)
(define-cpointer-type _LLVMOrcOpaqueJITDylibRef #:tag 'LLVMOpaqueOrcOpaqueJITDylib)
(define-cpointer-type _LLVMOrcOpaqueJITTargetMachineBuilderRef #:tag 'LLVMOpaqueOrcOpaqueJITTargetMachineBuilder)
(define-cpointer-type _LLVMOrcOpaqueLLJITBuilderRef #:tag 'LLVMOpaqueOrcOpaqueLLJITBuilder)
(define-cpointer-type _LLVMOrcOpaqueLLJITRef #:tag 'LLVMOpaqueOrcOpaqueLLJIT)
(define-cpointer-type _LLVMOrcOpaqueLazyCallThroughManagerRef #:tag 'LLVMOpaqueOrcOpaqueLazyCallThroughManager)
(define-cpointer-type _LLVMOrcOpaqueLookupStateRef #:tag 'LLVMOpaqueOrcOpaqueLookupState)
(define-cpointer-type _LLVMOrcOpaqueMaterializationResponsibilityRef #:tag 'LLVMOpaqueOrcOpaqueMaterializationResponsibility)
(define-cpointer-type _LLVMOrcOpaqueMaterializationUnitRef #:tag 'LLVMOpaqueOrcOpaqueMaterializationUnit)
(define-cpointer-type _LLVMOrcOpaqueObjectLayerRef #:tag 'LLVMOpaqueOrcOpaqueObjectLayer)
(define-cpointer-type _LLVMOrcOpaqueObjectTransformLayerRef #:tag 'LLVMOpaqueOrcOpaqueObjectTransformLayer)
(define-cpointer-type _LLVMOrcOpaqueResourceTrackerRef #:tag 'LLVMOpaqueOrcOpaqueResourceTracker)
(define-cpointer-type _LLVMOrcOpaqueSymbolStringPoolEntryRef #:tag 'LLVMOpaqueOrcOpaqueSymbolStringPoolEntry)
(define-cpointer-type _LLVMOrcOpaqueSymbolStringPoolRef #:tag 'LLVMOpaqueOrcOpaqueSymbolStringPool)
(define-cpointer-type _LLVMOrcOpaqueThreadSafeContextRef #:tag 'LLVMOpaqueOrcOpaqueThreadSafeContext)
(define-cpointer-type _LLVMOrcOpaqueThreadSafeModuleRef #:tag 'LLVMOpaqueOrcOpaqueThreadSafeModule)
(define-cpointer-type _LLVMPassBuilderOptionsRef #:tag 'LLVMOpaquePassBuilderOptions)
(define-cpointer-type _LLVMPassManagerRef #:tag 'LLVMOpaquePassManager)
(define-cpointer-type _LLVMRelocationIteratorRef #:tag 'LLVMOpaqueRelocationIterator)
(define-cpointer-type _LLVMRemarkOpaqueArgRef #:tag 'LLVMOpaqueRemarkOpaqueArg)
(define-cpointer-type _LLVMRemarkOpaqueDebugLocRef #:tag 'LLVMOpaqueRemarkOpaqueDebugLoc)
(define-cpointer-type _LLVMRemarkOpaqueEntryRef #:tag 'LLVMOpaqueRemarkOpaqueEntry)
(define-cpointer-type _LLVMRemarkOpaqueParserRef #:tag 'LLVMOpaqueRemarkOpaqueParser)
(define-cpointer-type _LLVMRemarkOpaqueStringRef #:tag 'LLVMOpaqueRemarkOpaqueString)
(define-cpointer-type _LLVMSectionIteratorRef #:tag 'LLVMOpaqueSectionIterator)
(define-cpointer-type _LLVMSymbolIteratorRef #:tag 'LLVMOpaqueSymbolIterator)
(define-cpointer-type _LLVMTargetDataRef #:tag 'LLVMOpaqueTargetData)
(define-cpointer-type _LLVMTargetLibraryInfotDataRef #:tag 'LLVMOpaqueTargetLibraryInfotData)
(define-cpointer-type _LLVMTargetMachineOptionsRef #:tag 'LLVMOpaqueTargetMachineOptions)
(define-cpointer-type _LLVMTargetMachineRef #:tag 'LLVMOpaqueTargetMachine)
(define-cpointer-type _LLVMTargetRef #:tag 'LLVMOpaqueTarget)
(define-cpointer-type _LLVMTypeRef #:tag 'LLVMOpaqueType)
(define-cpointer-type _LLVMUseRef #:tag 'LLVMOpaqueUse)
(define-cpointer-type _LLVMValueMetadataEntryRef #:tag 'LLVMOpaqueValueMetadataEntry)
(define-cpointer-type _LLVMValueRef #:tag 'LLVMOpaqueValue)

(define _llvm-opcode
  (_enum '(llvm-ret = 1
           llvm-br = 2
           llvm-switch = 3
           llvm-indirect-br = 4
           llvm-invoke = 5
           llvm-unreachable = 7
           llvm-add = 8
           llvmf-add = 9
           llvm-sub = 10
           llvmf-sub = 11
           llvm-mul = 12
           llvmf-mul = 13
           llvmu-div = 14
           llvms-div = 15
           llvmf-div = 16
           llvmu-rem = 17
           llvms-rem = 18
           llvmf-rem = 19
           llvm-shl = 20
           llvml-shr = 21
           llvma-shr = 22
           llvm-and = 23
           llvm-or = 24
           llvm-xor = 25
           llvm-alloca = 26
           llvm-load = 27
           llvm-store = 28
           llvm-get-element-ptr = 29
           llvm-trunc = 30
           llvmz-ext = 31
           llvms-ext = 32
           llvmfp-to-ui = 33
           llvmfp-to-si = 34
           llvmui-to-fp = 35
           llvmsi-to-fp = 36
           llvmfp-trunc = 37
           llvmfp-ext = 38
           llvm-ptr-to-int = 39
           llvm-int-to-ptr = 40
           llvm-bit-cast = 41
           llvmi-cmp = 42
           llvmf-cmp = 43
           llvmphi = 44
           llvm-call = 45
           llvm-select = 46
           llvm-user-op1 = 47
           llvm-user-op2 = 48
           llvmva-arg = 49
           llvm-extract-element = 50
           llvm-insert-element = 51
           llvm-shuffle-vector = 52
           llvm-extract-value = 53
           llvm-insert-value = 54
           llvm-fence = 55
           llvm-atomic-cmp-xchg = 56
           llvm-atomic-rmw = 57
           llvm-resume = 58
           llvm-landing-pad = 59
           llvm-addr-space-cast = 60
           llvm-cleanup-ret = 61
           llvm-catch-ret = 62
           llvm-catch-pad = 63
           llvm-cleanup-pad = 64
           llvm-catch-switch = 65
           llvmf-neg = 66
           llvm-call-br = 67
           llvm-freeze = 68)))
(define _llvm-type-kind
  (_enum '(llvm-void-type-kind = 0
           llvm-half-type-kind = 1
           llvm-float-type-kind = 2
           llvm-double-type-kind = 3
           llvmx86-fp80-type-kind = 4
           llvmfp128-type-kind = 5
           llvmppc-fp128-type-kind = 6
           llvm-label-type-kind = 7
           llvm-integer-type-kind = 8
           llvm-function-type-kind = 9
           llvm-struct-type-kind = 10
           llvm-array-type-kind = 11
           llvm-pointer-type-kind = 12
           llvm-vector-type-kind = 13
           llvm-metadata-type-kind = 14
           llvm-token-type-kind = 16
           llvm-scalable-vector-type-kind = 17
           llvmb-float-type-kind = 18
           llvmx86-amx-type-kind = 19
           llvm-target-ext-type-kind = 20)))
(define _llvm-linkage
  (_enum '(llvm-external-linkage = 0
           llvm-available-externally-linkage = 1
           llvm-link-once-any-linkage = 2
           llvm-link-once-odr-linkage = 3
           llvm-link-once-odr-auto-hide-linkage = 4
           llvm-weak-any-linkage = 5
           llvm-weak-odr-linkage = 6
           llvm-appending-linkage = 7
           llvm-internal-linkage = 8
           llvm-private-linkage = 9
           llvm-dll-import-linkage = 10
           llvm-dll-export-linkage = 11
           llvm-external-weak-linkage = 12
           llvm-ghost-linkage = 13
           llvm-common-linkage = 14
           llvm-linker-private-linkage = 15
           llvm-linker-private-weak-linkage = 16)))
(define _llvm-visibility
  (_enum '(llvm-default-visibility = 0
           llvm-hidden-visibility = 1
           llvm-protected-visibility = 2)))
(define _llvm-unnamed-addr
  (_enum '(llvm-no-unnamed-addr = 0
           llvm-local-unnamed-addr = 1
           llvm-global-unnamed-addr = 2)))
(define _llvmdll-storage-class
  (_enum '(llvm-default-storage-class = 0
           llvmdll-import-storage-class = 1
           llvmdll-export-storage-class = 2)))
(define _llvm-call-conv
  (_enum '(llvmc-call-conv = 0
           llvm-fast-call-conv = 8
           llvm-cold-call-conv = 9
           llvmghc-call-conv = 10
           llvm-hi-pe-call-conv = 11
           llvm-any-reg-call-conv = 13
           llvm-preserve-most-call-conv = 14
           llvm-preserve-all-call-conv = 15
           llvm-swift-call-conv = 16
           llvmcxxfasttls-call-conv = 17
           llvmx86-stdcall-call-conv = 64
           llvmx86-fastcall-call-conv = 65
           llvmarmapcs-call-conv = 66
           llvmarmaapcs-call-conv = 67
           llvmarmaapcsvfp-call-conv = 68
           llvmmsp430intr-call-conv = 69
           llvmx86-this-call-call-conv = 70
           llvmptx-kernel-call-conv = 71
           llvmptx-device-call-conv = 72
           llvmspirfunc-call-conv = 75
           llvmspirkernel-call-conv = 76
           llvm-intel-oclbi-call-conv = 77
           llvmx8664-sys-v-call-conv = 78
           llvm-win64-call-conv = 79
           llvmx86-vector-call-call-conv = 80
           llvmhhvm-call-conv = 81
           llvmhhvmc-call-conv = 82
           llvmx86intr-call-conv = 83
           llvmavrintr-call-conv = 84
           llvmavrsignal-call-conv = 85
           llvmavrbuiltin-call-conv = 86
           llvmamdgpuvs-call-conv = 87
           llvmamdgpugs-call-conv = 88
           llvmamdgpups-call-conv = 89
           llvmamdgpucs-call-conv = 90
           llvmamdgpukernel-call-conv = 91
           llvmx86-reg-call-call-conv = 92
           llvmamdgpuhs-call-conv = 93
           llvmmsp430builtin-call-conv = 94
           llvmamdgpuls-call-conv = 95
           llvmamdgpues-call-conv = 96)))
(define _llvm-value-kind
  (_enum '(llvm-argument-value-kind = 0
           llvm-basic-block-value-kind = 1
           llvm-memory-use-value-kind = 2
           llvm-memory-def-value-kind = 3
           llvm-memory-phi-value-kind = 4
           llvm-function-value-kind = 5
           llvm-global-alias-value-kind = 6
           llvm-global-i-func-value-kind = 7
           llvm-global-variable-value-kind = 8
           llvm-block-address-value-kind = 9
           llvm-constant-expr-value-kind = 10
           llvm-constant-array-value-kind = 11
           llvm-constant-struct-value-kind = 12
           llvm-constant-vector-value-kind = 13
           llvm-undef-value-value-kind = 14
           llvm-constant-aggregate-zero-value-kind = 15
           llvm-constant-data-array-value-kind = 16
           llvm-constant-data-vector-value-kind = 17
           llvm-constant-int-value-kind = 18
           llvm-constant-fp-value-kind = 19
           llvm-constant-pointer-null-value-kind = 20
           llvm-constant-token-none-value-kind = 21
           llvm-metadata-as-value-value-kind = 22
           llvm-inline-asm-value-kind = 23
           llvm-instruction-value-kind = 24
           llvm-poison-value-value-kind = 25
           llvm-constant-target-none-value-kind = 26
           llvm-constant-ptr-auth-value-kind = 27)))
(define _llvm-int-predicate
  (_enum '(int-eq = 32
           int-ne = 33
           int-ugt = 34
           int-uge = 35
           int-ult = 36
           int-ule = 37
           int-sgt = 38
           int-sge = 39
           int-slt = 40
           int-sle = 41)))
(define _llvm-real-predicate
  (_enum '(real-predicate-false = 0
           real-oeq = 1
           real-ogt = 2
           real-oge = 3
           real-olt = 4
           real-ole = 5
           real-one = 6
           real-ord = 7
           real-uno = 8
           real-ueq = 9
           real-ugt = 10
           real-uge = 11
           real-ult = 12
           real-ule = 13
           real-une = 14
           real-predicate-true = 15)))
(define _llvm-landing-pad-clause-ty
  (_enum '(llvm-landing-pad-catch = 0
           llvm-landing-pad-filter = 1)))
(define _llvm-thread-local-mode
  (_enum '(llvm-not-thread-local = 0
           llvm-general-dynamic-tls-model = 1
           llvm-local-dynamic-tls-model = 2
           llvm-initial-exec-tls-model = 3
           llvm-local-exec-tls-model = 4)))
(define _llvm-atomic-ordering
  (_enum '(llvm-atomic-ordering-not-atomic = 0
           llvm-atomic-ordering-unordered = 1
           llvm-atomic-ordering-monotonic = 2
           llvm-atomic-ordering-acquire = 4
           llvm-atomic-ordering-release = 5
           llvm-atomic-ordering-acquire-release = 6
           llvm-atomic-ordering-sequentially-consistent = 7)))
(define _llvm-atomic-rmw-bin-op
  (_enum '(llvm-atomic-rmw-bin-op-xchg = 0
           llvm-atomic-rmw-bin-op-add = 1
           llvm-atomic-rmw-bin-op-sub = 2
           llvm-atomic-rmw-bin-op-and = 3
           llvm-atomic-rmw-bin-op-nand = 4
           llvm-atomic-rmw-bin-op-or = 5
           llvm-atomic-rmw-bin-op-xor = 6
           llvm-atomic-rmw-bin-op-max = 7
           llvm-atomic-rmw-bin-op-min = 8
           llvm-atomic-rmw-bin-op-u-max = 9
           llvm-atomic-rmw-bin-op-u-min = 10
           llvm-atomic-rmw-bin-op-f-add = 11
           llvm-atomic-rmw-bin-op-f-sub = 12
           llvm-atomic-rmw-bin-op-f-max = 13
           llvm-atomic-rmw-bin-op-f-min = 14
           llvm-atomic-rmw-bin-op-u-inc-wrap = 15
           llvm-atomic-rmw-bin-op-u-dec-wrap = 16
           llvm-atomic-rmw-bin-op-u-sub-cond = 17
           llvm-atomic-rmw-bin-op-u-sub-sat = 18
           llvm-atomic-rmw-bin-op-f-maximum = 19
           llvm-atomic-rmw-bin-op-f-minimum = 20)))
(define _llvm-diagnostic-severity
  (_enum '(llvmds-error = 0
           llvmds-warning = 1
           llvmds-remark = 2
           llvmds-note = 3)))
(define _llvm-inline-asm-dialect
  (_enum '(llvm-inline-asm-dialect-att = 0
           llvm-inline-asm-dialect-intel = 1)))
(define _llvm-module-flag-behavior
  (_enum '(llvm-module-flag-behavior-error = 0
           llvm-module-flag-behavior-warning = 1
           llvm-module-flag-behavior-require = 2
           llvm-module-flag-behavior-override = 3
           llvm-module-flag-behavior-append = 4
           llvm-module-flag-behavior-append-unique = 5)))
(define _llvm-tail-call-kind
  (_enum '(llvm-tail-call-kind-none = 0
           llvm-tail-call-kind-tail = 1
           llvm-tail-call-kind-must-tail = 2
           llvm-tail-call-kind-no-tail = 3)))
(define _llvmdi-flags
  (_enum '(llvmdi-flag-zero = 0
           llvmdi-flag-private = 1
           llvmdi-flag-protected = 2
           llvmdi-flag-public = 3
           llvmdi-flag-fwd-decl = 5
           llvmdi-flag-apple-block = 7
           llvmdi-flag-reserved-bit4 = 9
           llvmdi-flag-virtual = 11
           llvmdi-flag-artificial = 13
           llvmdi-flag-explicit = 15
           llvmdi-flag-prototyped = 17
           llvmdi-flag-objc-class-complete = 19
           llvmdi-flag-object-pointer = 21
           llvmdi-flag-vector = 23
           llvmdi-flag-static-member = 25
           llvmdi-flag-l-value-reference = 27
           llvmdi-flag-r-value-reference = 29
           llvmdi-flag-reserved = 31
           llvmdi-flag-single-inheritance = 33
           llvmdi-flag-multiple-inheritance = 35
           llvmdi-flag-virtual-inheritance = 37
           llvmdi-flag-introduced-virtual = 39
           llvmdi-flag-bit-field = 41
           llvmdi-flag-no-return = 43
           llvmdi-flag-type-pass-by-value = 45
           llvmdi-flag-type-pass-by-reference = 47
           llvmdi-flag-enum-class = 49
           llvmdi-flag-fixed-enum = 51
           llvmdi-flag-thunk = 53
           llvmdi-flag-non-trivial = 55
           llvmdi-flag-big-endian = 57
           llvmdi-flag-little-endian = 59
           llvmdi-flag-indirect-virtual-base = 61
           llvmdi-flag-accessibility = 63
           llvmdi-flag-ptr-to-member-rep = 65)))
(define _llvmdwarf-source-language
  (_enum '(llvmdwarf-source-language-c89 = 0
           llvmdwarf-source-language-c = 1
           llvmdwarf-source-language-ada83 = 2
           llvmdwarf-source-language-c-plus-plus = 3
           llvmdwarf-source-language-cobol74 = 4
           llvmdwarf-source-language-cobol85 = 5
           llvmdwarf-source-language-fortran77 = 6
           llvmdwarf-source-language-fortran90 = 7
           llvmdwarf-source-language-pascal83 = 8
           llvmdwarf-source-language-modula2 = 9
           llvmdwarf-source-language-java = 10
           llvmdwarf-source-language-c99 = 11
           llvmdwarf-source-language-ada95 = 12
           llvmdwarf-source-language-fortran95 = 13
           llvmdwarf-source-language-pli = 14
           llvmdwarf-source-language-obj-c = 15
           llvmdwarf-source-language-obj-c-plus-plus = 16
           llvmdwarf-source-language-upc = 17
           llvmdwarf-source-language-d = 18
           llvmdwarf-source-language-python = 19
           llvmdwarf-source-language-open-cl = 20
           llvmdwarf-source-language-go = 21
           llvmdwarf-source-language-modula3 = 22
           llvmdwarf-source-language-haskell = 23
           llvmdwarf-source-language-c-plus-plus-03 = 24
           llvmdwarf-source-language-c-plus-plus-11 = 25
           llvmdwarf-source-language-o-caml = 26
           llvmdwarf-source-language-rust = 27
           llvmdwarf-source-language-c11 = 28
           llvmdwarf-source-language-swift = 29
           llvmdwarf-source-language-julia = 30
           llvmdwarf-source-language-dylan = 31
           llvmdwarf-source-language-c-plus-plus-14 = 32
           llvmdwarf-source-language-fortran03 = 33
           llvmdwarf-source-language-fortran08 = 34
           llvmdwarf-source-language-render-script = 35
           llvmdwarf-source-language-bliss = 36
           llvmdwarf-source-language-kotlin = 37
           llvmdwarf-source-language-zig = 38
           llvmdwarf-source-language-crystal = 39
           llvmdwarf-source-language-c-plus-plus-17 = 40
           llvmdwarf-source-language-c-plus-plus-20 = 41
           llvmdwarf-source-language-c17 = 42
           llvmdwarf-source-language-fortran18 = 43
           llvmdwarf-source-language-ada2005 = 44
           llvmdwarf-source-language-ada2012 = 45
           llvmdwarf-source-language-hip = 46
           llvmdwarf-source-language-assembly = 47
           llvmdwarf-source-language-c-sharp = 48
           llvmdwarf-source-language-mojo = 49
           llvmdwarf-source-language-glsl = 50
           llvmdwarf-source-language-glsl-es = 51
           llvmdwarf-source-language-hlsl = 52
           llvmdwarf-source-language-open-cl-cpp = 53
           llvmdwarf-source-language-cpp-for--open-cl = 54
           llvmdwarf-source-language-sycl = 55
           llvmdwarf-source-language-ruby = 56
           llvmdwarf-source-language-move = 57
           llvmdwarf-source-language-hylo = 58
           llvmdwarf-source-language-metal = 59
           llvmdwarf-source-language-mips--assembler = 60
           llvmdwarf-source-language-google--render-script = 61
           llvmdwarf-source-language-borland--delphi = 62)))
(define _llvmdwarf-emission-kind
  (_enum '(llvmdwarf-emission-none = 0
           llvmdwarf-emission-full = 1
           llvmdwarf-emission-line-tables-only = 2)))
(define _llvmdwarf-macinfo-record-type
  (_enum '(llvmdwarf-macinfo-record-type-define = 1
           llvmdwarf-macinfo-record-type-macro = 3
           llvmdwarf-macinfo-record-type-start-file = 5
           llvmdwarf-macinfo-record-type-end-file = 7
           llvmdwarf-macinfo-record-type-vendor-ext = 9)))
(define _llvm-code-gen-opt-level
  (_enum '(llvm-code-gen-level-none = 0
           llvm-code-gen-level-less = 1
           llvm-code-gen-level-default = 2
           llvm-code-gen-level-aggressive = 3)))
(define _llvm-reloc-mode
  (_enum '(llvm-reloc-default = 0
           llvm-reloc-static = 1
           llvm-reloc-pic = 2
           llvm-reloc-dynamic-no-pic = 3
           llvm-reloc-ropi = 4
           llvm-reloc-rwpi = 5
           llvm-reloc-ropi-rwpi = 6)))
(define _llvm-code-model
  (_enum '(llvm-code-model-default = 0
           llvm-code-model-jit-default = 1
           llvm-code-model-tiny = 2
           llvm-code-model-small = 3
           llvm-code-model-kernel = 4
           llvm-code-model-medium = 5
           llvm-code-model-large = 6)))
(define _llvm-code-gen-file-type
  (_enum '(llvm-assembly-file = 0
           llvm-object-file = 1)))
(define _llvm-global-i-sel-abort-mode
  (_enum '(llvm-global-i-sel-abort-enable = 0
           llvm-global-i-sel-abort-disable = 1
           llvm-global-i-sel-abort-disable-with-diag = 2)))
(define _llvm-comdat-selection-kind
  (_enum '(llvm-any-comdat-selection-kind = 0
           llvm-exact-match-comdat-selection-kind = 1
           llvm-largest-comdat-selection-kind = 2
           llvm-no-deduplicate-comdat-selection-kind = 3
           llvm-same-size-comdat-selection-kind = 4)))
(define _llvm-binary-type
  (_enum '(llvm-binary-type-archive = 0
           llvm-binary-type-mach-o-universal-binary = 1
           llvm-binary-type-coff-import-file = 2
           llvm-binary-type-ir = 3
           llvm-binary-type-win-res = 4
           llvm-binary-type-coff = 5
           llvm-binary-type-elf32l = 6
           llvm-binary-type-elf32b = 7
           llvm-binary-type-elf64l = 8
           llvm-binary-type-elf64b = 9
           llvm-binary-type-mach-o32l = 10
           llvm-binary-type-mach-o32b = 11
           llvm-binary-type-mach-o64l = 12
           llvm-binary-type-mach-o64b = 13
           llvm-binary-type-wasm = 14
           llvm-binary-type-offload = 15)))
(define _llvmjit-symbol-generic-flags
  (_enum '(llvmjit-symbol-generic-flags-none = 0
           llvmjit-symbol-generic-flags-exported = 2
           llvmjit-symbol-generic-flags-weak = 4
           llvmjit-symbol-generic-flags-callable = 6
           llvmjit-symbol-generic-flags-materialization-side-effects-only = 8)))
(define _llvm-orc-lookup-kind
  (_enum '(llvm-orc-lookup-kind-static = 0
           llvm-orc-lookup-kind-dl-sym = 1)))
(define _llvm-orc-jit-dylib-lookup-flags
  (_enum '(llvm-orc-jit-dylib-lookup-flags-match-exported-symbols-only = 0
           llvm-orc-jit-dylib-lookup-flags-match-all-symbols = 1)))
(define _llvm-orc-symbol-lookup-flags
  (_enum '(llvm-orc-symbol-lookup-flags-required-symbol = 0
           llvm-orc-symbol-lookup-flags-weakly-referenced-symbol = 1)))
(define _llvm-linker-mode
  (_enum '(llvm-linker-destroy-source = 0
           llvm-linker-preserve-source--removed = 1)))
(define _LLVMVerifierFailureAction
  (_enum '(llvm-abort-process-action = 0
           llvm-print-message-action = 1
           llvm-return-status-action = 2)))
(define _to-symbol-attributes
  (_enum '(lto-symbol-alignment-mask = #x0000001F
           lto-symbol-permissions-mask = #x000000E0
           lto-symbol-permissions-code = #x000000A0
           lto-symbol-permissions-data = #x000000C0
           lto-symbol-permissions-rodata = #x00000080
           lto-symbol-definition-mask = #x00000700
           lto-symbol-definition-regular = #x00000100
           lto-symbol-definition-tentative = #x00000200
           lto-symbol-definition-weak = #x00000300
           lto-symbol-definition-undefined = #x00000400
           lto-symbol-definition-weakundef = #x00000500
           lto-symbol-scope-mask = #x00003800
           lto-symbol-scope-internal = #x00000800
           lto-symbol-scope-hidden = #x00001000
           lto-symbol-scope-protected = #x00002000
           lto-symbol-scope-default = #x00001800
           lto-symbol-scope-default-can-be-hidden = #x00002800
           lto-symbol-comdat = #x00004000
           lto-symbol-alias = #x00008000)))
(define _to-debug-model
  (_enum '(lto-debug-model-none = 0
           lto-debug-model-dwarf = 1)))
(define _to-codegen-model
  (_enum '(lto-codegen-pic-model-static = 0
           lto-codegen-pic-model-dynamic = 1
           lto-codegen-pic-model-dynamic-no-pic = 2
           lto-codegen-pic-model-default = 3)))
(define _to-codegen-diagnostic-severity-t
  (_enum '(lto-ds-error = 0
           lto-ds-warning = 1
           lto-ds-note = 2
           lto-ds-remark = 3)))
(define-llvm llvmabi-alignment-of-type (_fun _LLVMTargetDataRef _LLVMTypeRef -> _uint) #:c-id LLVMABIAlignmentOfType)
(define-llvm llvmabi-size-of-type (_fun _LLVMTargetDataRef _LLVMTypeRef -> _ullong) #:c-id LLVMABISizeOfType)
(define-llvm llvm-add-alias2 (_fun _LLVMModuleRef _LLVMTypeRef _uint _LLVMValueRef _string -> _LLVMValueRef) #:c-id LLVMAddAlias2)
(define-llvm llvm-add-analysis-passes (_fun _LLVMTargetMachineRef _LLVMPassManagerRef -> _void) #:c-id LLVMAddAnalysisPasses)
(define-llvm llvm-add-attribute-at-index (_fun _LLVMValueRef _uint _LLVMAttributeRefRef -> _void) #:c-id LLVMAddAttributeAtIndex)
(define-llvm llvm-add-call-site-attribute (_fun _LLVMValueRef _uint _LLVMAttributeRefRef -> _void) #:c-id LLVMAddCallSiteAttribute)
(define-llvm llvm-add-case (_fun _LLVMValueRef _LLVMValueRef _LLVMBasicBlockRef -> _void) #:c-id LLVMAddCase)
(define-llvm llvm-add-clause (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMAddClause)
(define-llvm llvm-add-destination (_fun _LLVMValueRef _LLVMBasicBlockRef -> _void) #:c-id LLVMAddDestination)
(define-llvm llvm-add-function (_fun _LLVMModuleRef _string _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMAddFunction)
(define-llvm llvm-add-global (_fun _LLVMModuleRef _LLVMTypeRef _string -> _LLVMValueRef) #:c-id LLVMAddGlobal)
(define-llvm llvm-add-global-i-func (_fun _LLVMModuleRef _string _ulong _LLVMTypeRef _uint _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMAddGlobalIFunc)
(define-llvm llvm-add-global-in-address-space (_fun _LLVMModuleRef _LLVMTypeRef _string _uint -> _LLVMValueRef) #:c-id LLVMAddGlobalInAddressSpace)
(define-llvm llvm-add-global-mapping (_fun _LLVMExecutionEngineRef _LLVMValueRef _pointer -> _void) #:c-id LLVMAddGlobalMapping)
(define-llvm llvm-add-handler (_fun _LLVMValueRef _LLVMBasicBlockRef -> _void) #:c-id LLVMAddHandler)
(define-llvm llvm-add-incoming (_fun (phi-node incoming-values incoming-blocks) ::
                                  (phi-node : _LLVMValueRef)
                                  (incoming-values : (_list i _LLVMValueRef))
                                  (incoming-blocks : (_list i _LLVMBasicBlockRef))
                                  (_uint = (length incoming-values))
                                  -> _void)
  #:c-id LLVMAddIncoming)
(define-llvm llvm-add-metadata-to-inst (_fun _LLVMBuilderRef _LLVMValueRef -> _void) #:c-id LLVMAddMetadataToInst)
(define-llvm llvm-add-module (_fun _LLVMExecutionEngineRef _LLVMModuleRef -> _void) #:c-id LLVMAddModule)
(define-llvm llvm-add-module-flag (_fun _LLVMModuleRef _uint _string _ulong _LLVMMetadataRef -> _void) #:c-id LLVMAddModuleFlag)
(define-llvm llvm-add-named-metadata-operand (_fun _LLVMModuleRef _string _LLVMValueRef -> _void) #:c-id LLVMAddNamedMetadataOperand)
(define-llvm llvm-add-symbol (_fun _string _pointer -> _void) #:c-id LLVMAddSymbol)
(define-llvm llvm-add-target-dependent-function-attr (_fun _LLVMValueRef _string _string -> _void) #:c-id LLVMAddTargetDependentFunctionAttr)
(define-llvm llvm-add-target-library-info (_fun _LLVMTargetLibraryInfotDataRef _LLVMPassManagerRef -> _void) #:c-id LLVMAddTargetLibraryInfo)
(define-llvm llvm-alias-get-aliasee (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMAliasGetAliasee)
(define-llvm llvm-alias-set-aliasee (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMAliasSetAliasee)
(define-llvm llvm-align-of (_fun _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMAlignOf)
(define-llvm llvm-append-basic-block (_fun  (func [name ""]) ::
                                        (func : _LLVMValueRef)
                                        (name : _string)
                                        -> _LLVMBasicBlockRef)
  #:c-id LLVMAppendBasicBlock)
(define-llvm llvm-append-basic-block-in-context (_fun (ctx fn [name ""]) ::
                                  (ctx : _LLVMContextRef)
                                  (fn : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMBasicBlockRef)
  #:c-id LLVMAppendBasicBlockInContext)
(define-llvm llvm-append-existing-basic-block (_fun _LLVMValueRef _LLVMBasicBlockRef -> _void) #:c-id LLVMAppendExistingBasicBlock)
(define-llvm llvm-append-module-inline-asm (_fun _LLVMModuleRef _string _ulong -> _void) #:c-id LLVMAppendModuleInlineAsm)
(define-llvm llvm-array-type (_fun _LLVMTypeRef _uint -> _LLVMTypeRef) #:c-id LLVMArrayType)
(define-llvm llvm-array-type2 (_fun _LLVMTypeRef _uint64 -> _LLVMTypeRef) #:c-id LLVMArrayType2)
(define-llvm llvmb-float-type (_fun -> _LLVMTypeRef) #:c-id LLVMBFloatType)
(define-llvm llvmb-float-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMBFloatTypeInContext)
(define-llvm llvm-basic-block-as-value (_fun _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMBasicBlockAsValue)
(define-llvm llvm-binary-copy-memory-buffer (_fun _LLVMBinaryRef -> _LLVMMemoryBufferRef) #:c-id LLVMBinaryCopyMemoryBuffer)
(define-llvm llvm-binary-get-type (_fun _LLVMBinaryRef -> _uint) #:c-id LLVMBinaryGetType)
(define-llvm llvm-block-address (_fun _LLVMValueRef _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMBlockAddress)
(define-llvm llvm-build-ashr (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildAShr)
(define-llvm llvm-build-add (_fun  (builder lhs rhs [name ""]) ::
                                     (builder : _LLVMBuilderRef)
                                     (lhs : _LLVMValueRef)
                                     (rhs : _LLVMValueRef)
                                     (name : _string)
                                     -> _LLVMValueRef)
  #:c-id LLVMBuildAdd)
(define-llvm llvm-build-addrspace-cast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildAddrSpaceCast)
(define-llvm llvm-build-aggregate-ret (_fun (builder ret-vals) ::
                                  (builder : _LLVMBuilderRef)
                                  (ret-vals : (_list i _LLVMValueRef))
                                  (_uint = (length ret-vals))
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildAggregateRet)
(define-llvm llvm-build-alloca (_fun (builder ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildAlloca)
(define-llvm llvm-build-and (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildAnd)
(define-llvm llvm-build-array-alloca (_fun (builder ty val [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (val : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildArrayAlloca)
(define-llvm llvm-build-array-malloc (_fun (builder ty val [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (val : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildArrayMalloc)
(define-llvm llvm-build-atomic-cmp-xchg (_fun _LLVMBuilderRef _LLVMValueRef _LLVMValueRef _LLVMValueRef _uint _uint _bool -> _LLVMValueRef) #:c-id LLVMBuildAtomicCmpXchg)
(define-llvm llvm-build-atomic-cmp-xchg-sync-scope (_fun _LLVMBuilderRef _LLVMValueRef _LLVMValueRef _LLVMValueRef _uint _uint _uint -> _LLVMValueRef) #:c-id LLVMBuildAtomicCmpXchgSyncScope)
(define-llvm llvm-build-atomic-rmw (_fun _LLVMBuilderRef _uint _LLVMValueRef _LLVMValueRef _uint _bool -> _LLVMValueRef) #:c-id LLVMBuildAtomicRMW)
(define-llvm llvm-build-atomic-rmw-sync-scope (_fun _LLVMBuilderRef _uint _LLVMValueRef _LLVMValueRef _uint _uint -> _LLVMValueRef) #:c-id LLVMBuildAtomicRMWSyncScope)
(define-llvm llvm-build-bin-op (_fun (builder opcode lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (opcode : _uint)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildBinOp)
(define-llvm llvm-build-bitcast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildBitCast)
(define-llvm llvm-build-br (_fun _LLVMBuilderRef _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMBuildBr)
(define-llvm llvm-build-call2 (_fun  (builder fn-ty fn args [name ""]) ::
                                     (builder : _LLVMBuilderRef)
                                     (fn-ty : _LLVMTypeRef)
                                     (fn : _LLVMValueRef)
                                     (args : (_list i _LLVMValueRef))
                                     (_int = (length args))
                                     (name : _string)
                                     -> _LLVMValueRef)
  #:c-id LLVMBuildCall2)
(define-llvm llvm-build-call-br (_fun (builder fn-ty fn default-dest indirect-dests args bundles [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (fn-ty : _LLVMTypeRef)
                                  (fn : _LLVMValueRef)
                                  (default-dest : _LLVMBasicBlockRef)
                                  (indirect-dests : (_list i _LLVMBasicBlockRef))
                                  (_uint = (length indirect-dests))
                                  (args : (_list i _LLVMValueRef))
                                  (_uint = (length args))
                                  (bundles : (_list i _LLVMOperandBundleRef))
                                  (_uint = (length bundles))
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildCallBr)
(define-llvm llvm-build-call-with-operand-bundles (_fun (builder fn-ty fn args bundles [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (fn-ty : _LLVMTypeRef)
                                  (fn : _LLVMValueRef)
                                  (args : (_list i _LLVMValueRef))
                                  (_uint = (length args))
                                  (bundles : (_list i _LLVMOperandBundleRef))
                                  (_uint = (length bundles))
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildCallWithOperandBundles)
(define-llvm llvm-build-cast (_fun (builder op val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (op : _uint)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildCast)
(define-llvm llvm-build-catch-pad (_fun (builder parent-pad args [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (parent-pad : _LLVMValueRef)
                                  (args : (_list i _LLVMValueRef))
                                  (_uint = (length args))
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildCatchPad)
(define-llvm llvm-build-catch-ret (_fun _LLVMBuilderRef _LLVMValueRef _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMBuildCatchRet)
(define-llvm llvm-build-catch-switch (_fun (builder parent-pad unwind-bb num-handlers [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (parent-pad : _LLVMValueRef)
                                  (unwind-bb : _LLVMBasicBlockRef)
                                  (num-handlers : _uint)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildCatchSwitch)
(define-llvm llvm-build-cleanup-pad (_fun (builder parent-pad args [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (parent-pad : _LLVMValueRef)
                                  (args : (_list i _LLVMValueRef))
                                  (_uint = (length args))
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildCleanupPad)
(define-llvm llvm-build-cleanup-ret (_fun _LLVMBuilderRef _LLVMValueRef _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMBuildCleanupRet)
(define-llvm llvm-build-cond-br (_fun _LLVMBuilderRef _LLVMValueRef _LLVMBasicBlockRef _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMBuildCondBr)
(define-llvm llvm-build-exact-sdiv (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildExactSDiv)
(define-llvm llvm-build-exact-udiv (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildExactUDiv)
(define-llvm llvm-build-extract-element (_fun (builder vec-val index [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (vec-val : _LLVMValueRef)
                                  (index : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildExtractElement)
(define-llvm llvm-build-extract-value (_fun (builder agg-val index [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (agg-val : _LLVMValueRef)
                                  (index : _uint)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildExtractValue)
(define-llvm llvm-build-fadd (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFAdd)
(define-llvm llvm-build-fcmp (_fun  (builder predicate lhs rhs [name ""]) ::
                                        (builder : _LLVMBuilderRef)
                                        (predicate : _llvm-real-predicate)
                                        (lhs : _LLVMValueRef)
                                        (rhs : _LLVMValueRef)
                                        (name : _string)
                                        -> _LLVMValueRef)
  #:c-id LLVMBuildFCmp)
(define-llvm llvm-build-fdiv (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFDiv)
(define-llvm llvm-build-fmul (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFMul)
(define-llvm llvm-build-fneg (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFNeg)
(define-llvm llvm-build-fp-cast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFPCast)
(define-llvm llvm-build-fp-ext (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFPExt)
(define-llvm llvm-build-fp->si (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFPToSI)
(define-llvm llvm-build-fp->ui (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFPToUI)
(define-llvm llvm-build-fp-trunc (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFPTrunc)
(define-llvm llvm-build-frem (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFRem)
(define-llvm llvm-build-fsub (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFSub)
(define-llvm llvm-build-fence (_fun (builder ordering single-thread [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ordering : _uint)
                                  (single-thread : _bool)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFence)
(define-llvm llvm-build-fence-sync-scope (_fun (builder ordering ssid [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ordering : _uint)
                                  (ssid : _uint)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFenceSyncScope)
(define-llvm llvm-build-free (_fun _LLVMBuilderRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMBuildFree)
(define-llvm llvm-build-freeze (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildFreeze)
(define-llvm llvm-build-gep2 (_fun (builder ty pointer indices [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (pointer : _LLVMValueRef)
                                  (indices : (_list i _LLVMValueRef))
                                  (_uint = (length indices))
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildGEP2)
(define-llvm llvm-build-gep-with-no-wrap-flags (_fun (builder ty pointer indices [name ""] [no-wrap-flags 0]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (pointer : _LLVMValueRef)
                                  (indices : (_list i _LLVMValueRef))
                                  (_uint = (length indices))
                                  (name : _string)
                                  (no-wrap-flags : _uint)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildGEPWithNoWrapFlags)
(define-llvm llvm-build-global-string (_fun (builder str [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (str : _string)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildGlobalString)
(define-llvm llvm-build-global-string-ptr (_fun  (builder val [name ""]) ::
                                        (builder : _LLVMBuilderRef)
                                        (val : _string)
                                        (name : _string)
                                        -> _LLVMValueRef)
  #:c-id LLVMBuildGlobalStringPtr)
(define-llvm llvm-build-icmp (_fun  (builder predicate lhs rhs [name ""]) ::
                                        (builder : _LLVMBuilderRef)
                                        (predicate : _llvm-int-predicate)
                                        (lhs : _LLVMValueRef)
                                        (rhs : _LLVMValueRef)
                                        (name : _string)
                                        -> _LLVMValueRef)
  #:c-id LLVMBuildICmp)
(define-llvm llvm-build-in-bounds-gep2 (_fun (builder ty pointer indices [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (pointer : _LLVMValueRef)
                                  (indices : (_list i _LLVMValueRef))
                                  (_uint = (length indices))
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildInBoundsGEP2)
(define-llvm llvm-build-indirect-br (_fun _LLVMBuilderRef _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMBuildIndirectBr)
(define-llvm llvm-build-insert-element (_fun (builder vec-val elt-val index [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (vec-val : _LLVMValueRef)
                                  (elt-val : _LLVMValueRef)
                                  (index : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildInsertElement)
(define-llvm llvm-build-insert-value (_fun (builder agg-val elt-val index [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (agg-val : _LLVMValueRef)
                                  (elt-val : _LLVMValueRef)
                                  (index : _uint)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildInsertValue)
(define-llvm llvm-build-int-cast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildIntCast)
(define-llvm llvm-build-int-cast2 (_fun (builder val dest-ty is-signed [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (is-signed : _bool)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildIntCast2)
(define-llvm llvm-build-int->ptr (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildIntToPtr)
(define-llvm llvm-build-invoke2 (_fun (builder fn-ty fn args then catch [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (fn-ty : _LLVMTypeRef)
                                  (fn : _LLVMValueRef)
                                  (args : (_list i _LLVMValueRef))
                                  (_uint = (length args))
                                  (then : _LLVMBasicBlockRef)
                                  (catch : _LLVMBasicBlockRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildInvoke2)
(define-llvm llvm-build-invoke-with-operand-bundles (_fun (builder fn-ty fn args then catch bundles [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (fn-ty : _LLVMTypeRef)
                                  (fn : _LLVMValueRef)
                                  (args : (_list i _LLVMValueRef))
                                  (_uint = (length args))
                                  (then : _LLVMBasicBlockRef)
                                  (catch : _LLVMBasicBlockRef)
                                  (bundles : (_list i _LLVMOperandBundleRef))
                                  (_uint = (length bundles))
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildInvokeWithOperandBundles)
(define-llvm llvm-build-is-not-null (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildIsNotNull)
(define-llvm llvm-build-is-null (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildIsNull)
(define-llvm llvm-build-lshr (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildLShr)
(define-llvm llvm-build-landing-pad (_fun (builder ty pers-fn num-clauses [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (pers-fn : _LLVMValueRef)
                                  (num-clauses : _uint)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildLandingPad)
(define-llvm llvm-build-load2 (_fun (builder ty pointer-val [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (pointer-val : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildLoad2)
(define-llvm llvm-build-malloc (_fun (builder ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildMalloc)
(define-llvm llvm-build-mem-cpy (_fun _LLVMBuilderRef _LLVMValueRef _uint _LLVMValueRef _uint _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMBuildMemCpy)
(define-llvm llvm-build-mem-move (_fun _LLVMBuilderRef _LLVMValueRef _uint _LLVMValueRef _uint _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMBuildMemMove)
(define-llvm llvm-build-mem-set (_fun _LLVMBuilderRef _LLVMValueRef _LLVMValueRef _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMBuildMemSet)
(define-llvm llvm-build-mul (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildMul)
(define-llvm llvm-build-nswadd (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNSWAdd)
(define-llvm llvm-build-nswmul (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNSWMul)
(define-llvm llvm-build-nswneg (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNSWNeg)
(define-llvm llvm-build-nswsub (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNSWSub)
(define-llvm llvm-build-nuwadd (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNUWAdd)
(define-llvm llvm-build-nuwmul (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNUWMul)
(define-llvm llvm-build-nuwneg (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNUWNeg)
(define-llvm llvm-build-nuwsub (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNUWSub)
(define-llvm llvm-build-neg (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNeg)
(define-llvm llvm-build-not (_fun (builder v [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildNot)
(define-llvm llvm-build-or (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildOr)
(define-llvm llvm-build-phi (_fun (builder ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildPhi)
(define-llvm llvm-build-pointer-cast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildPointerCast)
(define-llvm llvm-build-ptr-diff2 (_fun (builder ty lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildPtrDiff2)
(define-llvm llvm-build-ptr->int (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildPtrToInt)
(define-llvm llvm-build-resume (_fun _LLVMBuilderRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMBuildResume)
(define-llvm llvm-build-ret (_fun  (builder val) ::
                                     (builder : _LLVMBuilderRef)
                                     (val : _LLVMValueRef)
                                     -> _LLVMValueRef)
  #:c-id LLVMBuildRet)
(define-llvm llvm-build-ret-void (_fun _LLVMBuilderRef -> _LLVMValueRef) #:c-id LLVMBuildRetVoid)
(define-llvm llvm-build-sdiv (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSDiv)
(define-llvm llvm-build-sext (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSExt)
(define-llvm llvm-build-sext-or-bitcast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSExtOrBitCast)
(define-llvm llvm-build-si->fp (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSIToFP)
(define-llvm llvm-build-srem (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSRem)
(define-llvm llvm-build-select (_fun (builder if then else [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (if : _LLVMValueRef)
                                  (then : _LLVMValueRef)
                                  (else : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSelect)
(define-llvm llvm-build-shl (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildShl)
(define-llvm llvm-build-shuffle-vector (_fun (builder v1 v2 mask [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (v1 : _LLVMValueRef)
                                  (v2 : _LLVMValueRef)
                                  (mask : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildShuffleVector)
(define-llvm llvm-build-store (_fun _LLVMBuilderRef _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMBuildStore)
(define-llvm llvm-build-struct-gep2 (_fun (builder ty pointer idx [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (ty : _LLVMTypeRef)
                                  (pointer : _LLVMValueRef)
                                  (idx : _uint)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildStructGEP2)
(define-llvm llvm-build-sub (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildSub)
(define-llvm llvm-build-switch (_fun _LLVMBuilderRef _LLVMValueRef _LLVMBasicBlockRef _uint -> _LLVMValueRef) #:c-id LLVMBuildSwitch)
(define-llvm llvm-build-trunc (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildTrunc)
(define-llvm llvm-build-trunc-or-bitcast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildTruncOrBitCast)
(define-llvm llvm-build-udiv (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildUDiv)
(define-llvm llvm-build-ui->fp (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildUIToFP)
(define-llvm llvm-build-urem (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildURem)
(define-llvm llvm-build-unreachable (_fun _LLVMBuilderRef -> _LLVMValueRef) #:c-id LLVMBuildUnreachable)
(define-llvm llvm-build-va-arg (_fun (builder list ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (list : _LLVMValueRef)
                                  (ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildVAArg)
(define-llvm llvm-build-xor (_fun (builder lhs rhs [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (lhs : _LLVMValueRef)
                                  (rhs : _LLVMValueRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildXor)
(define-llvm llvm-build-zext (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildZExt)
(define-llvm llvm-build-zext-or-bitcast (_fun (builder val dest-ty [name ""]) ::
                                  (builder : _LLVMBuilderRef)
                                  (val : _LLVMValueRef)
                                  (dest-ty : _LLVMTypeRef)
                                  (name : _string)
                                  -> _LLVMValueRef)
  #:c-id LLVMBuildZExtOrBitCast)
(define-llvm llvm-builder-get-default-fp-math-tag (_fun _LLVMBuilderRef -> _LLVMMetadataRef) #:c-id LLVMBuilderGetDefaultFPMathTag)
(define-llvm llvm-builder-set-default-fp-math-tag (_fun _LLVMBuilderRef _LLVMMetadataRef -> _void) #:c-id LLVMBuilderSetDefaultFPMathTag)
(define-llvm llvm-byte-order (_fun _LLVMTargetDataRef -> _uint) #:c-id LLVMByteOrder)
(define-llvm llvm-call-frame-alignment-of-type (_fun _LLVMTargetDataRef _LLVMTypeRef -> _uint) #:c-id LLVMCallFrameAlignmentOfType)
(define-llvm llvm-can-value-use-fast-math-flags (_fun _LLVMValueRef -> _int) #:c-id LLVMCanValueUseFastMathFlags)
(define-llvm llvm-cant-fail (_fun _LLVMErrorRef -> _void) #:c-id LLVMCantFail)
(define-llvm llvm-clear-insertion-position (_fun _LLVMBuilderRef -> _void) #:c-id LLVMClearInsertionPosition)
(define-llvm llvm-clone-module (_fun _LLVMModuleRef -> _LLVMModuleRef) #:c-id LLVMCloneModule)
(define-llvm llvm-const-add (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstAdd)
(define-llvm llvm-const-addr-space-cast (_fun _LLVMValueRef _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstAddrSpaceCast)
(define-llvm llvm-const-all-ones (_fun _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstAllOnes)
(define-llvm llvm-const-array (_fun (element-ty constant-vals) ::
                                  (element-ty : _LLVMTypeRef)
                                  (constant-vals : (_list i _LLVMValueRef))
                                  (_uint = (length constant-vals))
                                  -> _LLVMValueRef)
  #:c-id LLVMConstArray)
(define-llvm llvm-const-array2 (_fun (element-ty constant-vals) ::
                                  (element-ty : _LLVMTypeRef)
                                  (constant-vals : (_list i _LLVMValueRef))
                                  (_uint64 = (length constant-vals))
                                  -> _LLVMValueRef)
  #:c-id LLVMConstArray2)
(define-llvm llvm-const-bit-cast (_fun _LLVMValueRef _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstBitCast)
(define-llvm llvm-const-extract-element (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstExtractElement)
(define-llvm llvm-const-gep2 (_fun (ty constant-val constant-indices) ::
                                  (ty : _LLVMTypeRef)
                                  (constant-val : _LLVMValueRef)
                                  (constant-indices : (_list i _LLVMValueRef))
                                  (_uint = (length constant-indices))
                                  -> _LLVMValueRef)
  #:c-id LLVMConstGEP2)
(define-llvm llvm-const-gep-with-no-wrap-flags (_fun _LLVMTypeRef _LLVMValueRef _pointer _uint _uint -> _LLVMValueRef) #:c-id LLVMConstGEPWithNoWrapFlags)
(define-llvm llvm-const-in-bounds-gep2 (_fun (ty constant-val constant-indices) ::
                                  (ty : _LLVMTypeRef)
                                  (constant-val : _LLVMValueRef)
                                  (constant-indices : (_list i _LLVMValueRef))
                                  (_uint = (length constant-indices))
                                  -> _LLVMValueRef)
  #:c-id LLVMConstInBoundsGEP2)
(define-llvm llvm-const-inline-asm (_fun _LLVMTypeRef _string _string _bool _bool -> _LLVMValueRef) #:c-id LLVMConstInlineAsm)
(define-llvm llvm-const-insert-element (_fun _LLVMValueRef _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstInsertElement)
(define-llvm llvm-const-int (_fun  (type val [sign-extend #f]) ::
                                     (type : _LLVMTypeRef)
                                     (val : _ullong)
                                     (sign-extend : _bool)
                                     -> _LLVMValueRef)
  #:c-id LLVMConstInt)
(define-llvm llvm-const-int-get-s-ext-value (_fun _LLVMValueRef -> _llong) #:c-id LLVMConstIntGetSExtValue)
(define-llvm llvm-const-int-get-z-ext-value (_fun _LLVMValueRef -> _ullong) #:c-id LLVMConstIntGetZExtValue)
(define-llvm llvm-const-int-of-arbitrary-precision (_fun _LLVMTypeRef _uint _pointer -> _LLVMValueRef) #:c-id LLVMConstIntOfArbitraryPrecision)
(define-llvm llvm-const-int-of-string (_fun _LLVMTypeRef _string _uint8 -> _LLVMValueRef) #:c-id LLVMConstIntOfString)
(define-llvm llvm-const-int-of-string-and-size (_fun _LLVMTypeRef _string _uint _uint8 -> _LLVMValueRef) #:c-id LLVMConstIntOfStringAndSize)
(define-llvm llvm-const-int-to-ptr (_fun _LLVMValueRef _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstIntToPtr)
(define-llvm llvm-const-mul (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstMul)
(define-llvm llvm-const-nsw-add (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNSWAdd)
(define-llvm llvm-const-nsw-mul (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNSWMul)
(define-llvm llvm-const-nsw-neg (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNSWNeg)
(define-llvm llvm-const-nsw-sub (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNSWSub)
(define-llvm llvm-const-nuw-add (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNUWAdd)
(define-llvm llvm-const-nuw-mul (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNUWMul)
(define-llvm llvm-const-nuw-neg (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNUWNeg)
(define-llvm llvm-const-nuw-sub (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNUWSub)
(define-llvm llvm-const-named-struct (_fun (struct-ty constant-vals) ::
                                  (struct-ty : _LLVMTypeRef)
                                  (constant-vals : (_list i _LLVMValueRef))
                                  (_uint = (length constant-vals))
                                  -> _LLVMValueRef)
  #:c-id LLVMConstNamedStruct)
(define-llvm llvm-const-neg (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNeg)
(define-llvm llvm-const-not (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstNot)
(define-llvm llvm-const-null (_fun _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstNull)
(define-llvm llvm-const-pointer-cast (_fun _LLVMValueRef _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstPointerCast)
(define-llvm llvm-const-pointer-null (_fun _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstPointerNull)
(define-llvm llvm-const-ptr-to-int (_fun _LLVMValueRef _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstPtrToInt)
(define-llvm llvm-const-real (_fun _LLVMTypeRef _double -> _LLVMValueRef) #:c-id LLVMConstReal)
(define-llvm llvm-const-real-get-double (_fun _LLVMValueRef _pointer -> _double) #:c-id LLVMConstRealGetDouble)
(define-llvm llvm-const-real-of-string (_fun _LLVMTypeRef _string -> _LLVMValueRef) #:c-id LLVMConstRealOfString)
(define-llvm llvm-const-real-of-string-and-size (_fun _LLVMTypeRef _string _uint -> _LLVMValueRef) #:c-id LLVMConstRealOfStringAndSize)
(define-llvm llvm-const-shuffle-vector (_fun _LLVMValueRef _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstShuffleVector)
(define-llvm llvm-const-string (_fun _string _uint _bool -> _LLVMValueRef) #:c-id LLVMConstString)
(define-llvm llvm-const-string-in-context (_fun _LLVMContextRef _string _uint _bool -> _LLVMValueRef) #:c-id LLVMConstStringInContext)
(define-llvm llvm-const-string-in-context2 (_fun _LLVMContextRef _string _ulong _bool -> _LLVMValueRef) #:c-id LLVMConstStringInContext2)
(define-llvm llvm-const-struct (_fun (constant-vals [packed? #f]) ::
                                  (constant-vals : (_list i _LLVMValueRef))
                                  (_uint = (length constant-vals))
                                  (packed? : _bool)
                                  -> _LLVMValueRef)
  #:c-id LLVMConstStruct)
(define-llvm llvm-const-struct-in-context (_fun (ctx constant-vals [packed? #f]) ::
                                  (ctx : _LLVMContextRef)
                                  (constant-vals : (_list i _LLVMValueRef))
                                  (_uint = (length constant-vals))
                                  (packed? : _bool)
                                  -> _LLVMValueRef)
  #:c-id LLVMConstStructInContext)
(define-llvm llvm-const-sub (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstSub)
(define-llvm llvm-const-trunc (_fun _LLVMValueRef _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstTrunc)
(define-llvm llvm-const-trunc-or-bit-cast (_fun _LLVMValueRef _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMConstTruncOrBitCast)
(define-llvm llvm-const-vector (_fun (scalar-constant-vals) ::
                                  (scalar-constant-vals : (_list i _LLVMValueRef))
                                  (_uint = (length scalar-constant-vals))
                                  -> _LLVMValueRef)
  #:c-id LLVMConstVector)
(define-llvm llvm-const-xor (_fun _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstXor)
(define-llvm llvm-constant-ptr-auth (_fun _LLVMValueRef _LLVMValueRef _LLVMValueRef _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMConstantPtrAuth)
(define-llvm llvm-consume-error (_fun _LLVMErrorRef -> _void) #:c-id LLVMConsumeError)
(define-llvm llvm-context-create (_fun -> _LLVMContextRef) #:c-id LLVMContextCreate)
(define-llvm llvm-context-dispose (_fun _LLVMContextRef -> _void) #:c-id LLVMContextDispose)
(define-llvm llvm-context-get-diagnostic-context (_fun _LLVMContextRef -> _pointer) #:c-id LLVMContextGetDiagnosticContext)
(define-llvm llvm-context-get-diagnostic-handler (_fun _LLVMContextRef -> _pointer) #:c-id LLVMContextGetDiagnosticHandler)
(define-llvm llvm-context-set-diagnostic-handler (_fun _LLVMContextRef _pointer _pointer -> _void) #:c-id LLVMContextSetDiagnosticHandler)
(define-llvm llvm-context-set-discard-value-names (_fun _LLVMContextRef _bool -> _void) #:c-id LLVMContextSetDiscardValueNames)
(define-llvm llvm-context-set-yield-callback (_fun _LLVMContextRef _pointer _pointer -> _void) #:c-id LLVMContextSetYieldCallback)
(define-llvm llvm-context-should-discard-value-names (_fun _LLVMContextRef -> _int) #:c-id LLVMContextShouldDiscardValueNames)
(define-llvm llvm-copy-module-flags-metadata (_fun _LLVMModuleRef _pointer -> _LLVMModuleFlagEntryRef) #:c-id LLVMCopyModuleFlagsMetadata)
(define-llvm llvm-copy-string-rep-of-target-data (_fun _LLVMTargetDataRef -> _string) #:c-id LLVMCopyStringRepOfTargetData)
(define-llvm llvm-count-basic-blocks (_fun _LLVMValueRef -> _uint) #:c-id LLVMCountBasicBlocks)
(define-llvm llvm-count-incoming (_fun _LLVMValueRef -> _uint) #:c-id LLVMCountIncoming)
(define-llvm llvm-count-param-types (_fun _LLVMTypeRef -> _uint) #:c-id LLVMCountParamTypes)
(define-llvm llvm-count-params (_fun _LLVMValueRef -> _uint) #:c-id LLVMCountParams)
(define-llvm llvm-count-struct-element-types (_fun _LLVMTypeRef -> _uint) #:c-id LLVMCountStructElementTypes)
(define-llvm llvm-create-basic-block-in-context (_fun _LLVMContextRef _string -> _LLVMBasicBlockRef) #:c-id LLVMCreateBasicBlockInContext)
(define-llvm llvm-create-binary (_fun _LLVMMemoryBufferRef _LLVMContextRef _pointer -> _LLVMBinaryRef) #:c-id LLVMCreateBinary)
(define-llvm llvm-create-builder (_fun -> _LLVMBuilderRef) #:c-id LLVMCreateBuilder)
(define-llvm llvm-create-builder-in-context (_fun _LLVMContextRef -> _LLVMBuilderRef) #:c-id LLVMCreateBuilderInContext)
(define-llvm llvm-create-constant-range-attribute (_fun _LLVMContextRef _uint _uint _pointer _pointer -> _LLVMAttributeRefRef) #:c-id LLVMCreateConstantRangeAttribute)
(define-llvm llvm-create-di-builder (_fun _LLVMModuleRef -> _LLVMDIBuilderRef) #:c-id LLVMCreateDIBuilder)
(define-llvm llvm-create-di-builder-disallow-unresolved (_fun _LLVMModuleRef -> _LLVMDIBuilderRef) #:c-id LLVMCreateDIBuilderDisallowUnresolved)
(define-llvm llvm-create-disasm (_fun _string _pointer _int _pointer _pointer -> _pointer) #:c-id LLVMCreateDisasm)
(define-llvm llvm-create-disasm-cpu (_fun _string _string _pointer _int _pointer _pointer -> _pointer) #:c-id LLVMCreateDisasmCPU)
(define-llvm llvm-create-disasm-cpu-features (_fun _string _string _string _pointer _int _pointer _pointer -> _pointer) #:c-id LLVMCreateDisasmCPUFeatures)
(define-llvm llvm-create-enum-attribute (_fun _LLVMContextRef _uint _uint64 -> _LLVMAttributeRefRef) #:c-id LLVMCreateEnumAttribute)
(define-llvm llvm-create-execution-engine-for-module
  (_fun (eng : (_ptr o _LLVMExecutionEngineRef))
        _LLVMModuleRef
        (err : (_ptr o _string))
        -> (result : _int)
        -> (cond
             [err (llvm-dispose-message err)]
             [(not (= 0 result)) (error "Failed to create execution engine")]
             [else eng]))
  #:c-id LLVMCreateExecutionEngineForModule)
(define-llvm llvm-create-function-pass-manager (_fun _LLVMModuleProviderRef -> _LLVMPassManagerRef) #:c-id LLVMCreateFunctionPassManager)
(define-llvm llvm-create-function-pass-manager-for-module (_fun _LLVMModuleRef -> _LLVMPassManagerRef) #:c-id LLVMCreateFunctionPassManagerForModule)
(define-llvm llvm-create-gdb-registration-listener (_fun -> _LLVMJITEventListenerRef) #:c-id LLVMCreateGDBRegistrationListener)
(define-llvm llvm-create-generic-value-of-float (_fun _LLVMTypeRef _double -> _LLVMGenericValueRef) #:c-id LLVMCreateGenericValueOfFloat)
(define-llvm llvm-create-generic-value-of-int (_fun  (type val [is-signed #f]) ::
                                           (type : _LLVMTypeRef)
                                           (val : _ullong)
                                           (is-signed : _bool)
                                           -> _LLVMGenericValueRef)
  #:c-id LLVMCreateGenericValueOfInt)
(define-llvm llvm-create-generic-value-of-pointer (_fun _pointer -> _LLVMGenericValueRef) #:c-id LLVMCreateGenericValueOfPointer)
(define-llvm llvm-create-intel-jit-event-listener (_fun -> _LLVMJITEventListenerRef) #:c-id LLVMCreateIntelJITEventListener)
(define-llvm llvm-create-interpreter-for-module (_fun (out-param-0 mod out-param-2) ::
                                              (out-param-0 : _pointer)
                                              (mod : _LLVMModuleRef)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "createinterpreterformodule failed")))
  #:c-id LLVMCreateInterpreterForModule)
(define-llvm llvm-create-jit-compiler-for-module (_fun (out-param-0 mod param-2 out-param-3) ::
                                              (out-param-0 : _pointer)
                                              (mod : _LLVMModuleRef)
                                              (param-2 : _uint)
                                              (out-param-3 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "createjitcompilerformodule failed")))
  #:c-id LLVMCreateJITCompilerForModule)
(define-llvm llvm-create-mcjit-compiler-for-module (_fun (out-param-0 mod mcjitcompileroptions param-3 out-param-4) ::
                                              (out-param-0 : _pointer)
                                              (mod : _LLVMModuleRef)
                                              (mcjitcompileroptions : _LLVMMCJITCompilerOptionsRef)
                                              (param-3 : _ulong)
                                              (out-param-4 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "createmcjitcompilerformodule failed")))
  #:c-id LLVMCreateMCJITCompilerForModule)
(define-llvm llvm-create-memory-buffer-with-contents-of-file (_fun (file-path out-param-1 out-param-2) ::
                                              (file-path : _string)
                                              (out-param-1 : _pointer)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "creatememorybufferwithcontentsoffile failed")))
  #:c-id LLVMCreateMemoryBufferWithContentsOfFile)
(define-llvm llvm-create-memory-buffer-with-memory-range (_fun _string _ulong _string _int -> _LLVMMemoryBufferRef) #:c-id LLVMCreateMemoryBufferWithMemoryRange)
(define-llvm llvm-create-memory-buffer-with-memory-range-copy (_fun _string _ulong _string -> _LLVMMemoryBufferRef) #:c-id LLVMCreateMemoryBufferWithMemoryRangeCopy)
(define-llvm llvm-create-memory-buffer-with-stdin (_fun (out-param-0 out-param-1) ::
                                              (out-param-0 : _pointer)
                                              (out-param-1 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "creatememorybufferwithstdin failed")))
  #:c-id LLVMCreateMemoryBufferWithSTDIN)
(define-llvm llvm-create-message (_fun _string -> _string) #:c-id LLVMCreateMessage)
(define-llvm llvm-create-module-provider-for-existing-module (_fun _LLVMModuleRef -> _LLVMModuleProviderRef) #:c-id LLVMCreateModuleProviderForExistingModule)
(define-llvm llvm-create-o-profile-jit-event-listener (_fun -> _LLVMJITEventListenerRef) #:c-id LLVMCreateOProfileJITEventListener)
(define-llvm llvm-create-object-file (_fun _LLVMMemoryBufferRef -> _LLVMObjectFileRef) #:c-id LLVMCreateObjectFile)
(define-llvm llvm-create-operand-bundle (_fun (tag args) ::
                                  (tag : _string)
                                  (_ulong = (string-length tag))
                                  (args : (_list i _LLVMValueRef))
                                  (_uint = (length args))
                                  -> _LLVMOperandBundleRef)
  #:c-id LLVMCreateOperandBundle)
(define-llvm llvm-create-pass-builder-options (_fun -> _LLVMPassBuilderOptionsRef) #:c-id LLVMCreatePassBuilderOptions)
(define-llvm llvm-create-pass-manager (_fun -> _LLVMPassManagerRef) #:c-id LLVMCreatePassManager)
(define-llvm llvm-create-perf-jit-event-listener (_fun -> _LLVMJITEventListenerRef) #:c-id LLVMCreatePerfJITEventListener)
(define-llvm llvm-create-simple-mcjit-memory-manager (_fun _pointer _pointer _pointer _pointer _pointer -> _LLVMMCJITMemoryManagerRef) #:c-id LLVMCreateSimpleMCJITMemoryManager)
(define-llvm llvm-create-string-attribute (_fun _LLVMContextRef _string _uint _string _uint -> _LLVMAttributeRefRef) #:c-id LLVMCreateStringAttribute)
(define-llvm llvm-create-string-error (_fun _string -> _LLVMErrorRef) #:c-id LLVMCreateStringError)
(define-llvm llvm-create-target-data (_fun _string -> _LLVMTargetDataRef) #:c-id LLVMCreateTargetData)
(define-llvm llvm-create-target-data-layout (_fun _LLVMTargetMachineRef -> _LLVMTargetDataRef) #:c-id LLVMCreateTargetDataLayout)
(define-llvm llvm-create-target-machine (_fun _LLVMTargetRef _string _string _string _uint _uint _uint -> _LLVMTargetMachineRef) #:c-id LLVMCreateTargetMachine)
(define-llvm llvm-create-target-machine-options (_fun -> _LLVMTargetMachineOptionsRef) #:c-id LLVMCreateTargetMachineOptions)
(define-llvm llvm-create-target-machine-with-options (_fun _LLVMTargetRef _string _LLVMTargetMachineOptionsRef -> _LLVMTargetMachineRef) #:c-id LLVMCreateTargetMachineWithOptions)
(define-llvm llvm-create-type-attribute (_fun _LLVMContextRef _uint _LLVMTypeRef -> _LLVMAttributeRefRef) #:c-id LLVMCreateTypeAttribute)
(define-llvm llvmdi-builder-create-array-type (_fun _LLVMDIBuilderRef _uint64 _uint32 _LLVMMetadataRef _pointer _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateArrayType)
(define-llvm llvmdi-builder-create-artificial-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateArtificialType)
(define-llvm llvmdi-builder-create-auto-variable (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _LLVMMetadataRef _int _uint _uint32 -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateAutoVariable)
(define-llvm llvmdi-builder-create-basic-type (_fun _LLVMDIBuilderRef _string _ulong _uint64 _uint _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateBasicType)
(define-llvm llvmdi-builder-create-bit-field-member-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _uint64 _uint64 _uint64 _uint _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateBitFieldMemberType)
(define-llvm llvmdi-builder-create-class-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _uint64 _uint32 _uint64 _uint _LLVMMetadataRef _pointer _uint _LLVMMetadataRef _LLVMMetadataRef _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateClassType)
(define-llvm llvmdi-builder-create-compile-unit (_fun _LLVMDIBuilderRef _uint _LLVMMetadataRef _string _ulong _int _string _ulong _uint _string _ulong _uint _uint _int _int _string _ulong _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateCompileUnit)
(define-llvm llvmdi-builder-create-constant-value-expression (_fun _LLVMDIBuilderRef _uint64 -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateConstantValueExpression)
(define-llvm llvmdi-builder-create-debug-location (_fun _LLVMContextRef _uint _uint _LLVMMetadataRef _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateDebugLocation)
(define-llvm llvmdi-builder-create-enumeration-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _uint64 _uint32 _pointer _uint _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateEnumerationType)
(define-llvm llvmdi-builder-create-enumerator (_fun _LLVMDIBuilderRef _string _ulong _int64 _int -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateEnumerator)
(define-llvm llvmdi-builder-create-expression (_fun _LLVMDIBuilderRef _pointer _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateExpression)
(define-llvm llvmdi-builder-create-file (_fun _LLVMDIBuilderRef _string _ulong _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateFile)
(define-llvm llvmdi-builder-create-forward-decl (_fun _LLVMDIBuilderRef _uint _string _ulong _LLVMMetadataRef _LLVMMetadataRef _uint _uint _uint64 _uint32 _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateForwardDecl)
(define-llvm llvmdi-builder-create-function (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _string _ulong _LLVMMetadataRef _uint _LLVMMetadataRef _int _int _uint _uint _int -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateFunction)
(define-llvm llvmdi-builder-create-global-variable-expression (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _string _ulong _LLVMMetadataRef _uint _LLVMMetadataRef _int _LLVMMetadataRef _LLVMMetadataRef _uint32 -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateGlobalVariableExpression)
(define-llvm llvmdi-builder-create-imported-declaration (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _uint _string _ulong _pointer _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateImportedDeclaration)
(define-llvm llvmdi-builder-create-imported-module-from-alias (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _uint _pointer _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateImportedModuleFromAlias)
(define-llvm llvmdi-builder-create-imported-module-from-module (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _uint _pointer _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateImportedModuleFromModule)
(define-llvm llvmdi-builder-create-imported-module-from-namespace (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateImportedModuleFromNamespace)
(define-llvm llvmdi-builder-create-inheritance (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _uint64 _uint32 _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateInheritance)
(define-llvm llvmdi-builder-create-label (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _int -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateLabel)
(define-llvm llvmdi-builder-create-lexical-block (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _uint _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateLexicalBlock)
(define-llvm llvmdi-builder-create-lexical-block-file (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateLexicalBlockFile)
(define-llvm llvmdi-builder-create-macro (_fun _LLVMDIBuilderRef _LLVMMetadataRef _uint _uint _string _ulong _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateMacro)
(define-llvm llvmdi-builder-create-member-pointer-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _uint64 _uint32 _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateMemberPointerType)
(define-llvm llvmdi-builder-create-member-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _uint64 _uint32 _uint64 _uint _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateMemberType)
(define-llvm llvmdi-builder-create-module (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _string _ulong _string _ulong _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateModule)
(define-llvm llvmdi-builder-create-name-space (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _int -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateNameSpace)
(define-llvm llvmdi-builder-create-null-ptr-type (_fun _LLVMDIBuilderRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateNullPtrType)
(define-llvm llvmdi-builder-create-obj-ci-var (_fun _LLVMDIBuilderRef _string _ulong _LLVMMetadataRef _uint _uint64 _uint32 _uint64 _uint _LLVMMetadataRef _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateObjCIVar)
(define-llvm llvmdi-builder-create-obj-c-property (_fun _LLVMDIBuilderRef _string _ulong _LLVMMetadataRef _uint _string _ulong _string _ulong _uint _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateObjCProperty)
(define-llvm llvmdi-builder-create-object-pointer-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _int -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateObjectPointerType)
(define-llvm llvmdi-builder-create-parameter-variable (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _uint _LLVMMetadataRef _uint _LLVMMetadataRef _int _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateParameterVariable)
(define-llvm llvmdi-builder-create-pointer-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _uint64 _uint32 _uint _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreatePointerType)
(define-llvm llvmdi-builder-create-qualified-type (_fun _LLVMDIBuilderRef _uint _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateQualifiedType)
(define-llvm llvmdi-builder-create-reference-type (_fun _LLVMDIBuilderRef _uint _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateReferenceType)
(define-llvm llvmdi-builder-create-replaceable-composite-type (_fun _LLVMDIBuilderRef _uint _string _ulong _LLVMMetadataRef _LLVMMetadataRef _uint _uint _uint64 _uint32 _uint _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateReplaceableCompositeType)
(define-llvm llvmdi-builder-create-static-member-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _LLVMMetadataRef _uint _LLVMValueRef _uint32 -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateStaticMemberType)
(define-llvm llvmdi-builder-create-struct-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _uint64 _uint32 _uint _LLVMMetadataRef _pointer _uint _uint _LLVMMetadataRef _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateStructType)
(define-llvm llvmdi-builder-create-subroutine-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _pointer _uint _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateSubroutineType)
(define-llvm llvmdi-builder-create-temp-global-variable-fwd-decl (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _string _ulong _LLVMMetadataRef _uint _LLVMMetadataRef _int _LLVMMetadataRef _uint32 -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateTempGlobalVariableFwdDecl)
(define-llvm llvmdi-builder-create-temp-macro-file (_fun _LLVMDIBuilderRef _LLVMMetadataRef _uint _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateTempMacroFile)
(define-llvm llvmdi-builder-create-typedef (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _LLVMMetadataRef _uint32 -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateTypedef)
(define-llvm llvmdi-builder-create-union-type (_fun _LLVMDIBuilderRef _LLVMMetadataRef _string _ulong _LLVMMetadataRef _uint _uint64 _uint32 _uint _pointer _uint _uint _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateUnionType)
(define-llvm llvmdi-builder-create-unspecified-type (_fun _LLVMDIBuilderRef _string _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateUnspecifiedType)
(define-llvm llvmdi-builder-create-vector-type (_fun _LLVMDIBuilderRef _uint64 _uint32 _LLVMMetadataRef _pointer _uint -> _LLVMMetadataRef) #:c-id LLVMDIBuilderCreateVectorType)
(define-llvm llvmdi-builder-finalize (_fun _LLVMDIBuilderRef -> _void) #:c-id LLVMDIBuilderFinalize)
(define-llvm llvmdi-builder-finalize-subprogram (_fun _LLVMDIBuilderRef _LLVMMetadataRef -> _void) #:c-id LLVMDIBuilderFinalizeSubprogram)
(define-llvm llvmdi-builder-get-or-create-array (_fun _LLVMDIBuilderRef _pointer _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderGetOrCreateArray)
(define-llvm llvmdi-builder-get-or-create-subrange (_fun _LLVMDIBuilderRef _int64 _int64 -> _LLVMMetadataRef) #:c-id LLVMDIBuilderGetOrCreateSubrange)
(define-llvm llvmdi-builder-get-or-create-type-array (_fun _LLVMDIBuilderRef _pointer _ulong -> _LLVMMetadataRef) #:c-id LLVMDIBuilderGetOrCreateTypeArray)
(define-llvm llvmdi-builder-insert-dbg-value-record-at-end (_fun _LLVMDIBuilderRef _LLVMValueRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _LLVMBasicBlockRef -> _LLVMDbgRecordRef) #:c-id LLVMDIBuilderInsertDbgValueRecordAtEnd)
(define-llvm llvmdi-builder-insert-dbg-value-record-before (_fun _LLVMDIBuilderRef _LLVMValueRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _LLVMValueRef -> _LLVMDbgRecordRef) #:c-id LLVMDIBuilderInsertDbgValueRecordBefore)
(define-llvm llvmdi-builder-insert-declare-record-at-end (_fun _LLVMDIBuilderRef _LLVMValueRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _LLVMBasicBlockRef -> _LLVMDbgRecordRef) #:c-id LLVMDIBuilderInsertDeclareRecordAtEnd)
(define-llvm llvmdi-builder-insert-declare-record-before (_fun _LLVMDIBuilderRef _LLVMValueRef _LLVMMetadataRef _LLVMMetadataRef _LLVMMetadataRef _LLVMValueRef -> _LLVMDbgRecordRef) #:c-id LLVMDIBuilderInsertDeclareRecordBefore)
(define-llvm llvmdi-builder-insert-label-at-end (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _LLVMBasicBlockRef -> _LLVMDbgRecordRef) #:c-id LLVMDIBuilderInsertLabelAtEnd)
(define-llvm llvmdi-builder-insert-label-before (_fun _LLVMDIBuilderRef _LLVMMetadataRef _LLVMMetadataRef _LLVMValueRef -> _LLVMDbgRecordRef) #:c-id LLVMDIBuilderInsertLabelBefore)
(define-llvm llvmdi-file-get-directory (_fun _LLVMMetadataRef _pointer -> _string) #:c-id LLVMDIFileGetDirectory)
(define-llvm llvmdi-file-get-filename (_fun _LLVMMetadataRef _pointer -> _string) #:c-id LLVMDIFileGetFilename)
(define-llvm llvmdi-file-get-source (_fun _LLVMMetadataRef _pointer -> _string) #:c-id LLVMDIFileGetSource)
(define-llvm llvmdi-global-variable-expression-get-expression (_fun _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIGlobalVariableExpressionGetExpression)
(define-llvm llvmdi-global-variable-expression-get-variable (_fun _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIGlobalVariableExpressionGetVariable)
(define-llvm llvmdi-location-get-column (_fun _LLVMMetadataRef -> _uint) #:c-id LLVMDILocationGetColumn)
(define-llvm llvmdi-location-get-inlined-at (_fun _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDILocationGetInlinedAt)
(define-llvm llvmdi-location-get-line (_fun _LLVMMetadataRef -> _uint) #:c-id LLVMDILocationGetLine)
(define-llvm llvmdi-location-get-scope (_fun _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDILocationGetScope)
(define-llvm llvmdi-scope-get-file (_fun _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIScopeGetFile)
(define-llvm llvmdi-subprogram-get-line (_fun _LLVMMetadataRef -> _uint) #:c-id LLVMDISubprogramGetLine)
(define-llvm llvmdi-type-get-align-in-bits (_fun _LLVMMetadataRef -> _uint32) #:c-id LLVMDITypeGetAlignInBits)
(define-llvm llvmdi-type-get-flags (_fun _LLVMMetadataRef -> _uint) #:c-id LLVMDITypeGetFlags)
(define-llvm llvmdi-type-get-line (_fun _LLVMMetadataRef -> _uint) #:c-id LLVMDITypeGetLine)
(define-llvm llvmdi-type-get-name (_fun _LLVMMetadataRef _pointer -> _string) #:c-id LLVMDITypeGetName)
(define-llvm llvmdi-type-get-offset-in-bits (_fun _LLVMMetadataRef -> _uint64) #:c-id LLVMDITypeGetOffsetInBits)
(define-llvm llvmdi-type-get-size-in-bits (_fun _LLVMMetadataRef -> _uint64) #:c-id LLVMDITypeGetSizeInBits)
(define-llvm llvmdi-variable-get-file (_fun _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIVariableGetFile)
(define-llvm llvmdi-variable-get-line (_fun _LLVMMetadataRef -> _uint) #:c-id LLVMDIVariableGetLine)
(define-llvm llvmdi-variable-get-scope (_fun _LLVMMetadataRef -> _LLVMMetadataRef) #:c-id LLVMDIVariableGetScope)
(define-llvm llvm-debug-metadata-version (_fun -> _uint) #:c-id LLVMDebugMetadataVersion)
(define-llvm llvm-delete-basic-block (_fun _LLVMBasicBlockRef -> _void) #:c-id LLVMDeleteBasicBlock)
(define-llvm llvm-delete-function (_fun _LLVMValueRef -> _void) #:c-id LLVMDeleteFunction)
(define-llvm llvm-delete-global (_fun _LLVMValueRef -> _void) #:c-id LLVMDeleteGlobal)
(define-llvm llvm-delete-instruction (_fun _LLVMValueRef -> _void) #:c-id LLVMDeleteInstruction)
(define-llvm llvm-disasm-dispose (_fun _pointer -> _void) #:c-id LLVMDisasmDispose)
(define-llvm llvm-disasm-instruction (_fun _pointer _pointer _uint64 _uint64 _string _ulong -> _ulong) #:c-id LLVMDisasmInstruction)
(define-llvm llvm-dispose-binary (_fun _LLVMBinaryRef -> _void) #:c-id LLVMDisposeBinary)
(define-llvm llvm-dispose-builder (_fun _LLVMBuilderRef -> _void) #:c-id LLVMDisposeBuilder)
(define-llvm llvm-dispose-di-builder (_fun _LLVMDIBuilderRef -> _void) #:c-id LLVMDisposeDIBuilder)
(define-llvm llvm-dispose-error-message (_fun _string -> _void) #:c-id LLVMDisposeErrorMessage)
(define-llvm llvm-dispose-execution-engine (_fun _LLVMExecutionEngineRef -> _void) #:c-id LLVMDisposeExecutionEngine)
(define-llvm llvm-dispose-generic-value (_fun _LLVMGenericValueRef -> _void) #:c-id LLVMDisposeGenericValue)
(define-llvm llvm-dispose-mcjit-memory-manager (_fun _LLVMMCJITMemoryManagerRef -> _void) #:c-id LLVMDisposeMCJITMemoryManager)
(define-llvm llvm-dispose-memory-buffer (_fun _LLVMMemoryBufferRef -> _void) #:c-id LLVMDisposeMemoryBuffer)
(define-llvm llvm-dispose-message (_fun _string -> _void) #:c-id LLVMDisposeMessage)
(define-llvm llvm-dispose-module (_fun _LLVMModuleRef -> _void) #:c-id LLVMDisposeModule)
(define-llvm llvm-dispose-module-flags-metadata (_fun _LLVMModuleFlagEntryRef -> _void) #:c-id LLVMDisposeModuleFlagsMetadata)
(define-llvm llvm-dispose-module-provider (_fun _LLVMModuleProviderRef -> _void) #:c-id LLVMDisposeModuleProvider)
(define-llvm llvm-dispose-object-file (_fun _LLVMObjectFileRef -> _void) #:c-id LLVMDisposeObjectFile)
(define-llvm llvm-dispose-operand-bundle (_fun _LLVMOperandBundleRef -> _void) #:c-id LLVMDisposeOperandBundle)
(define-llvm llvm-dispose-pass-builder-options (_fun _LLVMPassBuilderOptionsRef -> _void) #:c-id LLVMDisposePassBuilderOptions)
(define-llvm llvm-dispose-pass-manager (_fun _LLVMPassManagerRef -> _void) #:c-id LLVMDisposePassManager)
(define-llvm llvm-dispose-relocation-iterator (_fun _LLVMRelocationIteratorRef -> _void) #:c-id LLVMDisposeRelocationIterator)
(define-llvm llvm-dispose-section-iterator (_fun _LLVMSectionIteratorRef -> _void) #:c-id LLVMDisposeSectionIterator)
(define-llvm llvm-dispose-symbol-iterator (_fun _LLVMSymbolIteratorRef -> _void) #:c-id LLVMDisposeSymbolIterator)
(define-llvm llvm-dispose-target-data (_fun _LLVMTargetDataRef -> _void) #:c-id LLVMDisposeTargetData)
(define-llvm llvm-dispose-target-machine (_fun _LLVMTargetMachineRef -> _void) #:c-id LLVMDisposeTargetMachine)
(define-llvm llvm-dispose-target-machine-options (_fun _LLVMTargetMachineOptionsRef -> _void) #:c-id LLVMDisposeTargetMachineOptions)
(define-llvm llvm-dispose-temporary-md-node (_fun _LLVMMetadataRef -> _void) #:c-id LLVMDisposeTemporaryMDNode)
(define-llvm llvm-dispose-value-metadata-entries (_fun _LLVMValueMetadataEntryRef -> _void) #:c-id LLVMDisposeValueMetadataEntries)
(define-llvm llvm-double-type (_fun -> _LLVMTypeRef) #:c-id LLVMDoubleType)
(define-llvm llvm-double-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMDoubleTypeInContext)
(define-llvm llvm-dump-module (_fun _LLVMModuleRef -> _void) #:c-id LLVMDumpModule)
(define-llvm llvm-dump-type (_fun _LLVMTypeRef -> _void) #:c-id LLVMDumpType)
(define-llvm llvm-dump-value (_fun _LLVMValueRef -> _void) #:c-id LLVMDumpValue)
(define-llvm llvm-element-at-offset (_fun _LLVMTargetDataRef _LLVMTypeRef _ullong -> _uint) #:c-id LLVMElementAtOffset)
(define-llvm llvm-enable-pretty-stack-trace (_fun -> _void) #:c-id LLVMEnablePrettyStackTrace)
(define-llvm llvm-erase-global-i-func (_fun _LLVMValueRef -> _void) #:c-id LLVMEraseGlobalIFunc)
(define-llvm llvm-execution-engine-get-err-msg (_fun _LLVMExecutionEngineRef _pointer -> _int) #:c-id LLVMExecutionEngineGetErrMsg)
(define-llvm llvmfp128-type (_fun -> _LLVMTypeRef) #:c-id LLVMFP128Type)
(define-llvm llvmfp128-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMFP128TypeInContext)
(define-llvm llvm-finalize-function-pass-manager (_fun _LLVMPassManagerRef -> _int) #:c-id LLVMFinalizeFunctionPassManager)
(define-llvm llvm-find-function (_fun _LLVMExecutionEngineRef _string _pointer -> _int) #:c-id LLVMFindFunction)
(define-llvm llvm-float-type (_fun -> _LLVMTypeRef) #:c-id LLVMFloatType)
(define-llvm llvm-float-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMFloatTypeInContext)
(define-llvm llvm-free-machine-code-for-function (_fun _LLVMExecutionEngineRef _LLVMValueRef -> _void) #:c-id LLVMFreeMachineCodeForFunction)
(define-llvm llvm-function-type (_fun  (return-type [param-types (list)] [variadic? #f]) ::
                                       (return-type : _LLVMTypeRef)
                                       (param-types : (_list i _LLVMTypeRef))
                                       (_uint = (length param-types)) ; num params
                                       (variadic? : _bool)
                                       -> _LLVMTypeRef)
  #:c-id LLVMFunctionType)
(define-llvm llvmgep-get-no-wrap-flags (_fun _LLVMValueRef -> _uint) #:c-id LLVMGEPGetNoWrapFlags)
(define-llvm llvmgep-set-no-wrap-flags (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMGEPSetNoWrapFlags)
(define-llvm llvm-generic-value-int-width (_fun _LLVMGenericValueRef -> _uint) #:c-id LLVMGenericValueIntWidth)
(define-llvm llvm-generic-value-to-float (_fun _LLVMTypeRef _LLVMGenericValueRef -> _double) #:c-id LLVMGenericValueToFloat)
(define-llvm llvm-generic-value-to-int (_fun  (val [is-signed #f]) ::
                                         (val : _LLVMGenericValueRef)
                                         (is-signed : _bool)
                                         -> _ullong)
  #:c-id LLVMGenericValueToInt)
(define-llvm llvm-generic-value-to-pointer (_fun _LLVMGenericValueRef -> _pointer) #:c-id LLVMGenericValueToPointer)
(define-llvm llvm-get-aggregate-element (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetAggregateElement)
(define-llvm llvm-get-alignment (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetAlignment)
(define-llvm llvm-get-allocated-type (_fun _LLVMValueRef -> _LLVMTypeRef) #:c-id LLVMGetAllocatedType)
(define-llvm llvm-get-arg-operand (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetArgOperand)
(define-llvm llvm-get-array-length (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetArrayLength)
(define-llvm llvm-get-array-length2 (_fun _LLVMTypeRef -> _uint64) #:c-id LLVMGetArrayLength2)
(define-llvm llvm-get-as-string (_fun _LLVMValueRef _pointer -> _string) #:c-id LLVMGetAsString)
(define-llvm llvm-get-atomic-rmw-bin-op (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetAtomicRMWBinOp)
(define-llvm llvm-get-atomic-sync-scope-id (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetAtomicSyncScopeID)
(define-llvm llvm-get-attribute-count-at-index (_fun _LLVMValueRef _uint -> _uint) #:c-id LLVMGetAttributeCountAtIndex)
(define-llvm llvm-get-attributes-at-index (_fun _LLVMValueRef _uint _pointer -> _void) #:c-id LLVMGetAttributesAtIndex)
(define-llvm llvm-get-basic-block-name (_fun _LLVMBasicBlockRef -> _string) #:c-id LLVMGetBasicBlockName)
(define-llvm llvm-get-basic-block-parent (_fun _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMGetBasicBlockParent)
(define-llvm llvm-get-basic-block-terminator (_fun _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMGetBasicBlockTerminator)
(define-llvm llvm-get-basic-blocks (_fun _LLVMValueRef _pointer -> _void) #:c-id LLVMGetBasicBlocks)
(define-llvm llvm-get-bitcode-module (_fun (memorybuffer out-param-1 out-param-2) ::
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-1 : _pointer)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "getbitcodemodule failed")))
  #:c-id LLVMGetBitcodeModule)
(define-llvm llvm-get-bitcode-module2 (_fun (memorybuffer out-param-1) ::
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-1 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "getbitcodemodule2 failed")))
  #:c-id LLVMGetBitcodeModule2)
(define-llvm llvm-get-bitcode-module-in-context (_fun (context memorybuffer out-param-2 out-param-3) ::
                                              (context : _LLVMContextRef)
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-2 : _pointer)
                                              (out-param-3 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "getbitcodemoduleincontext failed")))
  #:c-id LLVMGetBitcodeModuleInContext)
(define-llvm llvm-get-bitcode-module-in-context2 (_fun (context memorybuffer out-param-2) ::
                                              (context : _LLVMContextRef)
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "getbitcodemoduleincontext2 failed")))
  #:c-id LLVMGetBitcodeModuleInContext2)
(define-llvm llvm-get-block-address-basic-block (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetBlockAddressBasicBlock)
(define-llvm llvm-get-block-address-function (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetBlockAddressFunction)
(define-llvm llvm-get-buffer-size (_fun _LLVMMemoryBufferRef -> _ulong) #:c-id LLVMGetBufferSize)
(define-llvm llvm-get-buffer-start (_fun _LLVMMemoryBufferRef -> _string) #:c-id LLVMGetBufferStart)
(define-llvm llvm-get-builder-context (_fun _LLVMBuilderRef -> _LLVMContextRef) #:c-id LLVMGetBuilderContext)
(define-llvm llvm-get-call-br-default-dest (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetCallBrDefaultDest)
(define-llvm llvm-get-call-br-indirect-dest (_fun _LLVMValueRef _uint -> _LLVMBasicBlockRef) #:c-id LLVMGetCallBrIndirectDest)
(define-llvm llvm-get-call-br-num-indirect-dests (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetCallBrNumIndirectDests)
(define-llvm llvm-get-call-site-attribute-count (_fun _LLVMValueRef _uint -> _uint) #:c-id LLVMGetCallSiteAttributeCount)
(define-llvm llvm-get-call-site-attributes (_fun _LLVMValueRef _uint _pointer -> _void) #:c-id LLVMGetCallSiteAttributes)
(define-llvm llvm-get-call-site-enum-attribute (_fun _LLVMValueRef _uint _uint -> _LLVMAttributeRefRef) #:c-id LLVMGetCallSiteEnumAttribute)
(define-llvm llvm-get-call-site-string-attribute (_fun _LLVMValueRef _uint _string _uint -> _LLVMAttributeRefRef) #:c-id LLVMGetCallSiteStringAttribute)
(define-llvm llvm-get-called-function-type (_fun _LLVMValueRef -> _LLVMTypeRef) #:c-id LLVMGetCalledFunctionType)
(define-llvm llvm-get-called-value (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetCalledValue)
(define-llvm llvm-get-cast-opcode (_fun _LLVMValueRef _int _LLVMTypeRef _int -> _uint) #:c-id LLVMGetCastOpcode)
(define-llvm llvm-get-clause (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetClause)
(define-llvm llvm-get-cmp-xchg-failure-ordering (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetCmpXchgFailureOrdering)
(define-llvm llvm-get-cmp-xchg-success-ordering (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetCmpXchgSuccessOrdering)
(define-llvm llvm-get-comdat (_fun _LLVMValueRef -> _LLVMComdatRef) #:c-id LLVMGetComdat)
(define-llvm llvm-get-comdat-selection-kind (_fun _LLVMComdatRef -> _uint) #:c-id LLVMGetComdatSelectionKind)
(define-llvm llvm-get-condition (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetCondition)
(define-llvm llvm-get-const-opcode (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetConstOpcode)
(define-llvm llvm-get-constant-ptr-auth-addr-discriminator (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetConstantPtrAuthAddrDiscriminator)
(define-llvm llvm-get-constant-ptr-auth-discriminator (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetConstantPtrAuthDiscriminator)
(define-llvm llvm-get-constant-ptr-auth-key (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetConstantPtrAuthKey)
(define-llvm llvm-get-constant-ptr-auth-pointer (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetConstantPtrAuthPointer)
(define-llvm llvm-get-current-debug-location (_fun _LLVMBuilderRef -> _LLVMValueRef) #:c-id LLVMGetCurrentDebugLocation)
(define-llvm llvm-get-current-debug-location2 (_fun _LLVMBuilderRef -> _LLVMMetadataRef) #:c-id LLVMGetCurrentDebugLocation2)
(define-llvm llvm-get-di-node-tag (_fun _LLVMMetadataRef -> _uint16) #:c-id LLVMGetDINodeTag)
(define-llvm llvm-get-dll-storage-class (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetDLLStorageClass)
(define-llvm llvm-get-data-layout (_fun _LLVMModuleRef -> _string) #:c-id LLVMGetDataLayout)
(define-llvm llvm-get-data-layout-str (_fun _LLVMModuleRef -> _string) #:c-id LLVMGetDataLayoutStr)
(define-llvm llvm-get-debug-loc-column (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetDebugLocColumn)
(define-llvm llvm-get-debug-loc-directory (_fun _LLVMValueRef _pointer -> _string) #:c-id LLVMGetDebugLocDirectory)
(define-llvm llvm-get-debug-loc-filename (_fun _LLVMValueRef _pointer -> _string) #:c-id LLVMGetDebugLocFilename)
(define-llvm llvm-get-debug-loc-line (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetDebugLocLine)
(define-llvm llvm-get-default-target-triple (_fun -> _string) #:c-id LLVMGetDefaultTargetTriple)
(define-llvm llvm-get-diag-info-description (_fun _LLVMDiagnosticInfoRef -> _string) #:c-id LLVMGetDiagInfoDescription)
(define-llvm llvm-get-diag-info-severity (_fun _LLVMDiagnosticInfoRef -> _uint) #:c-id LLVMGetDiagInfoSeverity)
(define-llvm llvm-get-element-as-constant (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetElementAsConstant)
(define-llvm llvm-get-element-type (_fun _LLVMTypeRef -> _LLVMTypeRef) #:c-id LLVMGetElementType)
(define-llvm llvm-get-entry-basic-block (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetEntryBasicBlock)
(define-llvm llvm-get-enum-attribute-at-index (_fun _LLVMValueRef _uint _uint -> _LLVMAttributeRefRef) #:c-id LLVMGetEnumAttributeAtIndex)
(define-llvm llvm-get-enum-attribute-kind (_fun _LLVMAttributeRefRef -> _uint) #:c-id LLVMGetEnumAttributeKind)
(define-llvm llvm-get-enum-attribute-kind-for-name (_fun _string _ulong -> _uint) #:c-id LLVMGetEnumAttributeKindForName)
(define-llvm llvm-get-enum-attribute-value (_fun _LLVMAttributeRefRef -> _uint64) #:c-id LLVMGetEnumAttributeValue)
(define-llvm llvm-get-error-message (_fun _LLVMErrorRef -> _string) #:c-id LLVMGetErrorMessage)
(define-llvm llvm-get-error-type-id (_fun _LLVMErrorRef -> _pointer) #:c-id LLVMGetErrorTypeId)
(define-llvm llvm-get-exact (_fun _LLVMValueRef -> _int) #:c-id LLVMGetExact)
(define-llvm llvm-get-execution-engine-target-data (_fun _LLVMExecutionEngineRef -> _LLVMTargetDataRef) #:c-id LLVMGetExecutionEngineTargetData)
(define-llvm llvm-get-execution-engine-target-machine (_fun _LLVMExecutionEngineRef -> _LLVMTargetMachineRef) #:c-id LLVMGetExecutionEngineTargetMachine)
(define-llvm llvm-get-f-cmp-predicate (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetFCmpPredicate)
(define-llvm llvm-get-fast-math-flags (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetFastMathFlags)
(define-llvm llvm-get-first-basic-block (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetFirstBasicBlock)
(define-llvm llvm-get-first-dbg-record (_fun _LLVMValueRef -> _LLVMDbgRecordRef) #:c-id LLVMGetFirstDbgRecord)
(define-llvm llvm-get-first-function (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetFirstFunction)
(define-llvm llvm-get-first-global (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetFirstGlobal)
(define-llvm llvm-get-first-global-alias (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetFirstGlobalAlias)
(define-llvm llvm-get-first-global-i-func (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetFirstGlobalIFunc)
(define-llvm llvm-get-first-instruction (_fun _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMGetFirstInstruction)
(define-llvm llvm-get-first-named-metadata (_fun _LLVMModuleRef -> _LLVMNamedMDNodeRef) #:c-id LLVMGetFirstNamedMetadata)
(define-llvm llvm-get-first-param (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetFirstParam)
(define-llvm llvm-get-first-target (_fun -> _LLVMTargetRef) #:c-id LLVMGetFirstTarget)
(define-llvm llvm-get-first-use (_fun _LLVMValueRef -> _LLVMUseRef) #:c-id LLVMGetFirstUse)
(define-llvm llvm-get-function-address (_fun _LLVMExecutionEngineRef _string -> _uint64) #:c-id LLVMGetFunctionAddress)
(define-llvm llvm-get-function-call-conv (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetFunctionCallConv)
(define-llvm llvm-get-gc (_fun _LLVMValueRef -> _string) #:c-id LLVMGetGC)
(define-llvm llvm-get-gep-source-element-type (_fun _LLVMValueRef -> _LLVMTypeRef) #:c-id LLVMGetGEPSourceElementType)
(define-llvm llvm-get-global-context (_fun -> _LLVMContextRef) #:c-id LLVMGetGlobalContext)
(define-llvm llvm-get-global-i-func-resolver (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetGlobalIFuncResolver)
(define-llvm llvm-get-global-parent (_fun _LLVMValueRef -> _LLVMModuleRef) #:c-id LLVMGetGlobalParent)
(define-llvm llvm-get-global-value-address (_fun _LLVMExecutionEngineRef _string -> _uint64) #:c-id LLVMGetGlobalValueAddress)
(define-llvm llvm-get-handlers (_fun _LLVMValueRef _pointer -> _void) #:c-id LLVMGetHandlers)
(define-llvm llvm-get-host-cpu-features (_fun -> _string) #:c-id LLVMGetHostCPUFeatures)
(define-llvm llvm-get-host-cpu-name (_fun -> _string) #:c-id LLVMGetHostCPUName)
(define-llvm llvm-get-i-cmp-predicate (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetICmpPredicate)
(define-llvm llvm-get-incoming-block (_fun _LLVMValueRef _uint -> _LLVMBasicBlockRef) #:c-id LLVMGetIncomingBlock)
(define-llvm llvm-get-incoming-value (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetIncomingValue)
(define-llvm llvm-get-indices (_fun _LLVMValueRef -> _pointer) #:c-id LLVMGetIndices)
(define-llvm llvm-get-initializer (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetInitializer)
(define-llvm llvm-get-inline-asm (_fun _LLVMTypeRef _string _ulong _string _ulong _bool _bool _uint _bool -> _LLVMValueRef) #:c-id LLVMGetInlineAsm)
(define-llvm llvm-get-inline-asm-asm-string (_fun _LLVMValueRef _pointer -> _string) #:c-id LLVMGetInlineAsmAsmString)
(define-llvm llvm-get-inline-asm-can-unwind (_fun _LLVMValueRef -> _int) #:c-id LLVMGetInlineAsmCanUnwind)
(define-llvm llvm-get-inline-asm-constraint-string (_fun _LLVMValueRef _pointer -> _string) #:c-id LLVMGetInlineAsmConstraintString)
(define-llvm llvm-get-inline-asm-dialect (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetInlineAsmDialect)
(define-llvm llvm-get-inline-asm-function-type (_fun _LLVMValueRef -> _LLVMTypeRef) #:c-id LLVMGetInlineAsmFunctionType)
(define-llvm llvm-get-inline-asm-has-side-effects (_fun _LLVMValueRef -> _int) #:c-id LLVMGetInlineAsmHasSideEffects)
(define-llvm llvm-get-inline-asm-needs-aligned-stack (_fun _LLVMValueRef -> _int) #:c-id LLVMGetInlineAsmNeedsAlignedStack)
(define-llvm llvm-get-insert-block (_fun _LLVMBuilderRef -> _LLVMBasicBlockRef) #:c-id LLVMGetInsertBlock)
(define-llvm llvm-get-instruction-call-conv (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetInstructionCallConv)
(define-llvm llvm-get-instruction-opcode (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetInstructionOpcode)
(define-llvm llvm-get-instruction-parent (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetInstructionParent)
(define-llvm llvm-get-int-type-width (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetIntTypeWidth)
(define-llvm llvm-get-intrinsic-declaration (_fun _LLVMModuleRef _uint _pointer _ulong -> _LLVMValueRef) #:c-id LLVMGetIntrinsicDeclaration)
(define-llvm llvm-get-intrinsic-id (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetIntrinsicID)
(define-llvm llvm-get-is-disjoint (_fun _LLVMValueRef -> _int) #:c-id LLVMGetIsDisjoint)
(define-llvm llvm-get-last-basic-block (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetLastBasicBlock)
(define-llvm llvm-get-last-dbg-record (_fun _LLVMValueRef -> _LLVMDbgRecordRef) #:c-id LLVMGetLastDbgRecord)
(define-llvm llvm-get-last-enum-attribute-kind (_fun -> _uint) #:c-id LLVMGetLastEnumAttributeKind)
(define-llvm llvm-get-last-function (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetLastFunction)
(define-llvm llvm-get-last-global (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetLastGlobal)
(define-llvm llvm-get-last-global-alias (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetLastGlobalAlias)
(define-llvm llvm-get-last-global-i-func (_fun _LLVMModuleRef -> _LLVMValueRef) #:c-id LLVMGetLastGlobalIFunc)
(define-llvm llvm-get-last-instruction (_fun _LLVMBasicBlockRef -> _LLVMValueRef) #:c-id LLVMGetLastInstruction)
(define-llvm llvm-get-last-named-metadata (_fun _LLVMModuleRef -> _LLVMNamedMDNodeRef) #:c-id LLVMGetLastNamedMetadata)
(define-llvm llvm-get-last-param (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetLastParam)
(define-llvm llvm-get-linkage (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetLinkage)
(define-llvm llvm-get-md-kind-id (_fun _string _uint -> _uint) #:c-id LLVMGetMDKindID)
(define-llvm llvm-get-md-kind-id-in-context (_fun _LLVMContextRef _string _uint -> _uint) #:c-id LLVMGetMDKindIDInContext)
(define-llvm llvm-get-md-node-num-operands (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetMDNodeNumOperands)
(define-llvm llvm-get-md-node-operands (_fun _LLVMValueRef _pointer -> _void) #:c-id LLVMGetMDNodeOperands)
(define-llvm llvm-get-md-string (_fun _LLVMValueRef _pointer -> _string) #:c-id LLVMGetMDString)
(define-llvm llvm-get-mask-value (_fun _LLVMValueRef _uint -> _int) #:c-id LLVMGetMaskValue)
(define-llvm llvm-get-metadata (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetMetadata)
(define-llvm llvm-get-metadata-kind (_fun _LLVMMetadataRef -> _uint) #:c-id LLVMGetMetadataKind)
(define-llvm llvm-get-module-context (_fun _LLVMModuleRef -> _LLVMContextRef) #:c-id LLVMGetModuleContext)
(define-llvm llvm-get-module-data-layout (_fun _LLVMModuleRef -> _LLVMTargetDataRef) #:c-id LLVMGetModuleDataLayout)
(define-llvm llvm-get-module-debug-metadata-version (_fun _LLVMModuleRef -> _uint) #:c-id LLVMGetModuleDebugMetadataVersion)
(define-llvm llvm-get-module-flag (_fun _LLVMModuleRef _string _ulong -> _LLVMMetadataRef) #:c-id LLVMGetModuleFlag)
(define-llvm llvm-get-module-identifier (_fun _LLVMModuleRef _pointer -> _string) #:c-id LLVMGetModuleIdentifier)
(define-llvm llvm-get-module-inline-asm (_fun _LLVMModuleRef _pointer -> _string) #:c-id LLVMGetModuleInlineAsm)
(define-llvm llvm-get-n-neg (_fun _LLVMValueRef -> _int) #:c-id LLVMGetNNeg)
(define-llvm llvm-get-nsw (_fun _LLVMValueRef -> _int) #:c-id LLVMGetNSW)
(define-llvm llvm-get-nuw (_fun _LLVMValueRef -> _int) #:c-id LLVMGetNUW)
(define-llvm llvm-get-named-function (_fun _LLVMModuleRef _string -> _LLVMValueRef) #:c-id LLVMGetNamedFunction)
(define-llvm llvm-get-named-function-with-length (_fun _LLVMModuleRef _string _ulong -> _LLVMValueRef) #:c-id LLVMGetNamedFunctionWithLength)
(define-llvm llvm-get-named-global (_fun _LLVMModuleRef _string -> _LLVMValueRef) #:c-id LLVMGetNamedGlobal)
(define-llvm llvm-get-named-global-alias (_fun _LLVMModuleRef _string _ulong -> _LLVMValueRef) #:c-id LLVMGetNamedGlobalAlias)
(define-llvm llvm-get-named-global-i-func (_fun _LLVMModuleRef _string _ulong -> _LLVMValueRef) #:c-id LLVMGetNamedGlobalIFunc)
(define-llvm llvm-get-named-global-with-length (_fun _LLVMModuleRef _string _ulong -> _LLVMValueRef) #:c-id LLVMGetNamedGlobalWithLength)
(define-llvm llvm-get-named-metadata (_fun _LLVMModuleRef _string _ulong -> _LLVMNamedMDNodeRef) #:c-id LLVMGetNamedMetadata)
(define-llvm llvm-get-named-metadata-name (_fun _LLVMNamedMDNodeRef _pointer -> _string) #:c-id LLVMGetNamedMetadataName)
(define-llvm llvm-get-named-metadata-num-operands (_fun _LLVMModuleRef _string -> _uint) #:c-id LLVMGetNamedMetadataNumOperands)
(define-llvm llvm-get-named-metadata-operands (_fun _LLVMModuleRef _string _pointer -> _void) #:c-id LLVMGetNamedMetadataOperands)
(define-llvm llvm-get-next-basic-block (_fun _LLVMBasicBlockRef -> _LLVMBasicBlockRef) #:c-id LLVMGetNextBasicBlock)
(define-llvm llvm-get-next-dbg-record (_fun _LLVMDbgRecordRef -> _LLVMDbgRecordRef) #:c-id LLVMGetNextDbgRecord)
(define-llvm llvm-get-next-function (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetNextFunction)
(define-llvm llvm-get-next-global (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetNextGlobal)
(define-llvm llvm-get-next-global-alias (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetNextGlobalAlias)
(define-llvm llvm-get-next-global-i-func (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetNextGlobalIFunc)
(define-llvm llvm-get-next-instruction (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetNextInstruction)
(define-llvm llvm-get-next-named-metadata (_fun _LLVMNamedMDNodeRef -> _LLVMNamedMDNodeRef) #:c-id LLVMGetNextNamedMetadata)
(define-llvm llvm-get-next-param (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetNextParam)
(define-llvm llvm-get-next-target (_fun _LLVMTargetRef -> _LLVMTargetRef) #:c-id LLVMGetNextTarget)
(define-llvm llvm-get-next-use (_fun _LLVMUseRef -> _LLVMUseRef) #:c-id LLVMGetNextUse)
(define-llvm llvm-get-normal-dest (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetNormalDest)
(define-llvm llvm-get-num-arg-operands (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetNumArgOperands)
(define-llvm llvm-get-num-clauses (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetNumClauses)
(define-llvm llvm-get-num-contained-types (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetNumContainedTypes)
(define-llvm llvm-get-num-handlers (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetNumHandlers)
(define-llvm llvm-get-num-indices (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetNumIndices)
(define-llvm llvm-get-num-mask-elements (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetNumMaskElements)
(define-llvm llvm-get-num-operand-bundle-args (_fun _LLVMOperandBundleRef -> _uint) #:c-id LLVMGetNumOperandBundleArgs)
(define-llvm llvm-get-num-operand-bundles (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetNumOperandBundles)
(define-llvm llvm-get-num-operands (_fun _LLVMValueRef -> _int) #:c-id LLVMGetNumOperands)
(define-llvm llvm-get-num-successors (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetNumSuccessors)
(define-llvm llvm-get-operand (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetOperand)
(define-llvm llvm-get-operand-bundle-arg-at-index (_fun _LLVMOperandBundleRef _uint -> _LLVMValueRef) #:c-id LLVMGetOperandBundleArgAtIndex)
(define-llvm llvm-get-operand-bundle-at-index (_fun _LLVMValueRef _uint -> _LLVMOperandBundleRef) #:c-id LLVMGetOperandBundleAtIndex)
(define-llvm llvm-get-operand-bundle-tag (_fun _LLVMOperandBundleRef _pointer -> _string) #:c-id LLVMGetOperandBundleTag)
(define-llvm llvm-get-operand-use (_fun _LLVMValueRef _uint -> _LLVMUseRef) #:c-id LLVMGetOperandUse)
(define-llvm llvm-get-or-insert-comdat (_fun _LLVMModuleRef _string -> _LLVMComdatRef) #:c-id LLVMGetOrInsertComdat)
(define-llvm llvm-get-or-insert-named-metadata (_fun _LLVMModuleRef _string _ulong -> _LLVMNamedMDNodeRef) #:c-id LLVMGetOrInsertNamedMetadata)
(define-llvm llvm-get-ordering (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetOrdering)
(define-llvm llvm-get-param (_fun _LLVMValueRef _uint -> _LLVMValueRef) #:c-id LLVMGetParam)
(define-llvm llvm-get-param-parent (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetParamParent)
(define-llvm llvm-get-param-types (_fun _LLVMTypeRef _pointer -> _void) #:c-id LLVMGetParamTypes)
(define-llvm llvm-get-params (_fun _LLVMValueRef _pointer -> _void) #:c-id LLVMGetParams)
(define-llvm llvm-get-parent-catch-switch (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetParentCatchSwitch)
(define-llvm llvm-get-personality-fn (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPersonalityFn)
(define-llvm llvm-get-pointer-address-space (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetPointerAddressSpace)
(define-llvm llvm-get-pointer-to-global (_fun _LLVMExecutionEngineRef _LLVMValueRef -> _pointer) #:c-id LLVMGetPointerToGlobal)
(define-llvm llvm-get-poison (_fun _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMGetPoison)
(define-llvm llvm-get-prefix-data (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPrefixData)
(define-llvm llvm-get-previous-basic-block (_fun _LLVMBasicBlockRef -> _LLVMBasicBlockRef) #:c-id LLVMGetPreviousBasicBlock)
(define-llvm llvm-get-previous-dbg-record (_fun _LLVMDbgRecordRef -> _LLVMDbgRecordRef) #:c-id LLVMGetPreviousDbgRecord)
(define-llvm llvm-get-previous-function (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPreviousFunction)
(define-llvm llvm-get-previous-global (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPreviousGlobal)
(define-llvm llvm-get-previous-global-alias (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPreviousGlobalAlias)
(define-llvm llvm-get-previous-global-i-func (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPreviousGlobalIFunc)
(define-llvm llvm-get-previous-instruction (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPreviousInstruction)
(define-llvm llvm-get-previous-named-metadata (_fun _LLVMNamedMDNodeRef -> _LLVMNamedMDNodeRef) #:c-id LLVMGetPreviousNamedMetadata)
(define-llvm llvm-get-previous-param (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPreviousParam)
(define-llvm llvm-get-prologue-data (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMGetPrologueData)
(define-llvm llvm-get-relocation-offset (_fun _LLVMRelocationIteratorRef -> _uint64) #:c-id LLVMGetRelocationOffset)
(define-llvm llvm-get-relocation-symbol (_fun _LLVMRelocationIteratorRef -> _LLVMSymbolIteratorRef) #:c-id LLVMGetRelocationSymbol)
(define-llvm llvm-get-relocation-type (_fun _LLVMRelocationIteratorRef -> _uint64) #:c-id LLVMGetRelocationType)
(define-llvm llvm-get-relocation-type-name (_fun _LLVMRelocationIteratorRef -> _string) #:c-id LLVMGetRelocationTypeName)
(define-llvm llvm-get-relocation-value-string (_fun _LLVMRelocationIteratorRef -> _string) #:c-id LLVMGetRelocationValueString)
(define-llvm llvm-get-relocations (_fun _LLVMSectionIteratorRef -> _LLVMRelocationIteratorRef) #:c-id LLVMGetRelocations)
(define-llvm llvm-get-return-type (_fun _LLVMTypeRef -> _LLVMTypeRef) #:c-id LLVMGetReturnType)
(define-llvm llvm-get-section (_fun _LLVMValueRef -> _string) #:c-id LLVMGetSection)
(define-llvm llvm-get-section-address (_fun _LLVMSectionIteratorRef -> _uint64) #:c-id LLVMGetSectionAddress)
(define-llvm llvm-get-section-contains-symbol (_fun _LLVMSectionIteratorRef _LLVMSymbolIteratorRef -> _int) #:c-id LLVMGetSectionContainsSymbol)
(define-llvm llvm-get-section-contents (_fun _LLVMSectionIteratorRef -> _string) #:c-id LLVMGetSectionContents)
(define-llvm llvm-get-section-name (_fun _LLVMSectionIteratorRef -> _string) #:c-id LLVMGetSectionName)
(define-llvm llvm-get-section-size (_fun _LLVMSectionIteratorRef -> _uint64) #:c-id LLVMGetSectionSize)
(define-llvm llvm-get-sections (_fun _LLVMObjectFileRef -> _LLVMSectionIteratorRef) #:c-id LLVMGetSections)
(define-llvm llvm-get-source-file-name (_fun _LLVMModuleRef _pointer -> _string) #:c-id LLVMGetSourceFileName)
(define-llvm llvm-get-string-attribute-at-index (_fun _LLVMValueRef _uint _string _uint -> _LLVMAttributeRefRef) #:c-id LLVMGetStringAttributeAtIndex)
(define-llvm llvm-get-string-attribute-kind (_fun _LLVMAttributeRefRef _pointer -> _string) #:c-id LLVMGetStringAttributeKind)
(define-llvm llvm-get-string-attribute-value (_fun _LLVMAttributeRefRef _pointer -> _string) #:c-id LLVMGetStringAttributeValue)
(define-llvm llvm-get-string-error-type-id (_fun -> _pointer) #:c-id LLVMGetStringErrorTypeId)
(define-llvm llvm-get-struct-element-types (_fun _LLVMTypeRef _pointer -> _void) #:c-id LLVMGetStructElementTypes)
(define-llvm llvm-get-struct-name (_fun _LLVMTypeRef -> _string) #:c-id LLVMGetStructName)
(define-llvm llvm-get-subprogram (_fun _LLVMValueRef -> _LLVMMetadataRef) #:c-id LLVMGetSubprogram)
(define-llvm llvm-get-subtypes (_fun _LLVMTypeRef _pointer -> _void) #:c-id LLVMGetSubtypes)
(define-llvm llvm-get-successor (_fun _LLVMValueRef _uint -> _LLVMBasicBlockRef) #:c-id LLVMGetSuccessor)
(define-llvm llvm-get-switch-default-dest (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetSwitchDefaultDest)
(define-llvm llvm-get-symbol-address (_fun _LLVMSymbolIteratorRef -> _uint64) #:c-id LLVMGetSymbolAddress)
(define-llvm llvm-get-symbol-name (_fun _LLVMSymbolIteratorRef -> _string) #:c-id LLVMGetSymbolName)
(define-llvm llvm-get-symbol-size (_fun _LLVMSymbolIteratorRef -> _uint64) #:c-id LLVMGetSymbolSize)
(define-llvm llvm-get-symbols (_fun _LLVMObjectFileRef -> _LLVMSymbolIteratorRef) #:c-id LLVMGetSymbols)
(define-llvm llvm-get-sync-scope-id (_fun _LLVMContextRef _string _ulong -> _uint) #:c-id LLVMGetSyncScopeID)
(define-llvm llvm-get-tail-call-kind (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetTailCallKind)
(define-llvm llvm-get-target (_fun _LLVMModuleRef -> _string) #:c-id LLVMGetTarget)
(define-llvm llvm-get-target-description (_fun _LLVMTargetRef -> _string) #:c-id LLVMGetTargetDescription)
(define-llvm llvm-get-target-ext-type-int-param (_fun _LLVMTypeRef _uint -> _uint) #:c-id LLVMGetTargetExtTypeIntParam)
(define-llvm llvm-get-target-ext-type-name (_fun _LLVMTypeRef -> _string) #:c-id LLVMGetTargetExtTypeName)
(define-llvm llvm-get-target-ext-type-num-int-params (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetTargetExtTypeNumIntParams)
(define-llvm llvm-get-target-ext-type-num-type-params (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetTargetExtTypeNumTypeParams)
(define-llvm llvm-get-target-ext-type-type-param (_fun _LLVMTypeRef _uint -> _LLVMTypeRef) #:c-id LLVMGetTargetExtTypeTypeParam)
(define-llvm llvm-get-target-from-name (_fun _string -> _LLVMTargetRef) #:c-id LLVMGetTargetFromName)
(define-llvm llvm-get-target-from-triple (_fun (path out-param-1 out-param-2) ::
                                              (path : _string)
                                              (out-param-1 : _pointer)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "gettargetfromtriple failed")))
  #:c-id LLVMGetTargetFromTriple)
(define-llvm llvm-get-target-machine-cpu (_fun _LLVMTargetMachineRef -> _string) #:c-id LLVMGetTargetMachineCPU)
(define-llvm llvm-get-target-machine-feature-string (_fun _LLVMTargetMachineRef -> _string) #:c-id LLVMGetTargetMachineFeatureString)
(define-llvm llvm-get-target-machine-target (_fun _LLVMTargetMachineRef -> _LLVMTargetRef) #:c-id LLVMGetTargetMachineTarget)
(define-llvm llvm-get-target-machine-triple (_fun _LLVMTargetMachineRef -> _string) #:c-id LLVMGetTargetMachineTriple)
(define-llvm llvm-get-target-name (_fun _LLVMTargetRef -> _string) #:c-id LLVMGetTargetName)
(define-llvm llvm-get-thread-local-mode (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetThreadLocalMode)
(define-llvm llvm-get-type-attribute-value (_fun _LLVMAttributeRefRef -> _LLVMTypeRef) #:c-id LLVMGetTypeAttributeValue)
(define-llvm llvm-get-type-by-name (_fun _LLVMModuleRef _string -> _LLVMTypeRef) #:c-id LLVMGetTypeByName)
(define-llvm llvm-get-type-by-name2 (_fun _LLVMContextRef _string -> _LLVMTypeRef) #:c-id LLVMGetTypeByName2)
(define-llvm llvm-get-type-context (_fun _LLVMTypeRef -> _LLVMContextRef) #:c-id LLVMGetTypeContext)
(define-llvm llvm-get-type-kind (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetTypeKind)
(define-llvm llvm-get-undef (_fun _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMGetUndef)
(define-llvm llvm-get-undef-mask-elem (_fun -> _int) #:c-id LLVMGetUndefMaskElem)
(define-llvm llvm-get-unnamed-address (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetUnnamedAddress)
(define-llvm llvm-get-unwind-dest (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMGetUnwindDest)
(define-llvm llvm-get-used-value (_fun _LLVMUseRef -> _LLVMValueRef) #:c-id LLVMGetUsedValue)
(define-llvm llvm-get-user (_fun _LLVMUseRef -> _LLVMValueRef) #:c-id LLVMGetUser)
(define-llvm llvm-get-value-context (_fun _LLVMValueRef -> _LLVMContextRef) #:c-id LLVMGetValueContext)
(define-llvm llvm-get-value-kind (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetValueKind)
(define-llvm llvm-get-value-name (_fun _LLVMValueRef -> _string) #:c-id LLVMGetValueName)
(define-llvm llvm-get-value-name2 (_fun _LLVMValueRef _pointer -> _string) #:c-id LLVMGetValueName2)
(define-llvm llvm-get-vector-size (_fun _LLVMTypeRef -> _uint) #:c-id LLVMGetVectorSize)
(define-llvm llvm-get-version (_fun _pointer _pointer _pointer -> _void) #:c-id LLVMGetVersion)
(define-llvm llvm-get-visibility (_fun _LLVMValueRef -> _uint) #:c-id LLVMGetVisibility)
(define-llvm llvm-get-volatile (_fun _LLVMValueRef -> _int) #:c-id LLVMGetVolatile)
(define-llvm llvm-get-weak (_fun _LLVMValueRef -> _int) #:c-id LLVMGetWeak)
(define-llvm llvm-global-clear-metadata (_fun _LLVMValueRef -> _void) #:c-id LLVMGlobalClearMetadata)
(define-llvm llvm-global-copy-all-metadata (_fun _LLVMValueRef _pointer -> _LLVMValueMetadataEntryRef) #:c-id LLVMGlobalCopyAllMetadata)
(define-llvm llvm-global-erase-metadata (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMGlobalEraseMetadata)
(define-llvm llvm-global-get-value-type (_fun _LLVMValueRef -> _LLVMTypeRef) #:c-id LLVMGlobalGetValueType)
(define-llvm llvm-global-set-metadata (_fun _LLVMValueRef _uint _LLVMMetadataRef -> _void) #:c-id LLVMGlobalSetMetadata)
(define-llvm llvm-half-type (_fun -> _LLVMTypeRef) #:c-id LLVMHalfType)
(define-llvm llvm-half-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMHalfTypeInContext)
(define-llvm llvm-has-metadata (_fun _LLVMValueRef -> _int) #:c-id LLVMHasMetadata)
(define-llvm llvm-has-personality-fn (_fun _LLVMValueRef -> _int) #:c-id LLVMHasPersonalityFn)
(define-llvm llvm-has-prefix-data (_fun _LLVMValueRef -> _int) #:c-id LLVMHasPrefixData)
(define-llvm llvm-has-prologue-data (_fun _LLVMValueRef -> _int) #:c-id LLVMHasPrologueData)
(define-llvm llvm-has-unnamed-addr (_fun _LLVMValueRef -> _int) #:c-id LLVMHasUnnamedAddr)
(define-llvm llvm-initialize-function-pass-manager (_fun _LLVMPassManagerRef -> _int) #:c-id LLVMInitializeFunctionPassManager)
(define-llvm llvm-initialize-mcjit-compiler-options (_fun _LLVMMCJITCompilerOptionsRef _ulong -> _void) #:c-id LLVMInitializeMCJITCompilerOptions)
(define-llvm llvm-insert-basic-block (_fun _LLVMBasicBlockRef _string -> _LLVMBasicBlockRef) #:c-id LLVMInsertBasicBlock)
(define-llvm llvm-insert-basic-block-in-context (_fun _LLVMContextRef _LLVMBasicBlockRef _string -> _LLVMBasicBlockRef) #:c-id LLVMInsertBasicBlockInContext)
(define-llvm llvm-insert-existing-basic-block-after-insert-block (_fun _LLVMBuilderRef _LLVMBasicBlockRef -> _void) #:c-id LLVMInsertExistingBasicBlockAfterInsertBlock)
(define-llvm llvm-insert-into-builder (_fun _LLVMBuilderRef _LLVMValueRef -> _void) #:c-id LLVMInsertIntoBuilder)
(define-llvm llvm-insert-into-builder-with-name (_fun _LLVMBuilderRef _LLVMValueRef _string -> _void) #:c-id LLVMInsertIntoBuilderWithName)
(define-llvm llvm-install-fatal-error-handler (_fun _pointer -> _void) #:c-id LLVMInstallFatalErrorHandler)
(define-llvm llvm-instruction-clone (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMInstructionClone)
(define-llvm llvm-instruction-erase-from-parent (_fun _LLVMValueRef -> _void) #:c-id LLVMInstructionEraseFromParent)
(define-llvm llvm-instruction-get-all-metadata-other-than-debug-loc (_fun _LLVMValueRef _pointer -> _LLVMValueMetadataEntryRef) #:c-id LLVMInstructionGetAllMetadataOtherThanDebugLoc)
(define-llvm llvm-instruction-get-debug-loc (_fun _LLVMValueRef -> _LLVMMetadataRef) #:c-id LLVMInstructionGetDebugLoc)
(define-llvm llvm-instruction-remove-from-parent (_fun _LLVMValueRef -> _void) #:c-id LLVMInstructionRemoveFromParent)
(define-llvm llvm-instruction-set-debug-loc (_fun _LLVMValueRef _LLVMMetadataRef -> _void) #:c-id LLVMInstructionSetDebugLoc)
(define-llvm llvm-int128-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt128Type)
(define-llvm llvm-int128-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMInt128TypeInContext)
(define-llvm llvm-int16-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt16Type)
(define-llvm llvm-int16-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMInt16TypeInContext)
(define-llvm llvm-int1-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt1Type)
(define-llvm llvm-int1-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMInt1TypeInContext)
(define-llvm llvm-int32-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt32Type)
(define-llvm llvm-int32-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMInt32TypeInContext)
(define-llvm llvm-int64-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt64Type)
(define-llvm llvm-int64-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMInt64TypeInContext)
(define-llvm llvm-int8-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt8Type)
(define-llvm llvm-int8-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMInt8TypeInContext)
(define-llvm llvm-int-ptr-type (_fun _LLVMTargetDataRef -> _LLVMTypeRef) #:c-id LLVMIntPtrType)
(define-llvm llvm-int-ptr-type-for-as (_fun _LLVMTargetDataRef _uint -> _LLVMTypeRef) #:c-id LLVMIntPtrTypeForAS)
(define-llvm llvm-int-ptr-type-for-as-in-context (_fun _LLVMContextRef _LLVMTargetDataRef _uint -> _LLVMTypeRef) #:c-id LLVMIntPtrTypeForASInContext)
(define-llvm llvm-int-ptr-type-in-context (_fun _LLVMContextRef _LLVMTargetDataRef -> _LLVMTypeRef) #:c-id LLVMIntPtrTypeInContext)
(define-llvm llvm-int-type (_fun _uint -> _LLVMTypeRef) #:c-id LLVMIntType)
(define-llvm llvm-int-type-in-context (_fun _LLVMContextRef _uint -> _LLVMTypeRef) #:c-id LLVMIntTypeInContext)
(define-llvm llvm-intrinsic-copy-overloaded-name (_fun _uint _pointer _ulong _pointer -> _string) #:c-id LLVMIntrinsicCopyOverloadedName)
(define-llvm llvm-intrinsic-copy-overloaded-name2 (_fun _LLVMModuleRef _uint _pointer _ulong _pointer -> _string) #:c-id LLVMIntrinsicCopyOverloadedName2)
(define-llvm llvm-intrinsic-get-name (_fun _uint _pointer -> _string) #:c-id LLVMIntrinsicGetName)
(define-llvm llvm-intrinsic-get-type (_fun _LLVMContextRef _uint _pointer _ulong -> _LLVMTypeRef) #:c-id LLVMIntrinsicGetType)
(define-llvm llvm-intrinsic-is-overloaded (_fun _uint -> _int) #:c-id LLVMIntrinsicIsOverloaded)
(define-llvm llvm-is-amd-node (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMIsAMDNode)
(define-llvm llvm-is-amd-string (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMIsAMDString)
(define-llvm llvm-is-a-terminator-inst (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMIsATerminatorInst)
(define-llvm llvm-is-a-value-as-metadata (_fun _LLVMValueRef -> _LLVMValueRef) #:c-id LLVMIsAValueAsMetadata)
(define-llvm llvm-is-atomic (_fun _LLVMValueRef -> _int) #:c-id LLVMIsAtomic)
(define-llvm llvm-is-atomic-single-thread (_fun _LLVMValueRef -> _int) #:c-id LLVMIsAtomicSingleThread)
(define-llvm llvm-is-cleanup (_fun _LLVMValueRef -> _int) #:c-id LLVMIsCleanup)
(define-llvm llvm-is-conditional (_fun _LLVMValueRef -> _int) #:c-id LLVMIsConditional)
(define-llvm llvm-constant? (_fun _LLVMValueRef -> _bool) #:c-id LLVMIsConstant)
(define-llvm llvm-constant-string? (_fun _LLVMValueRef -> _bool) #:c-id LLVMIsConstantString)
(define-llvm llvm-is-declaration (_fun _LLVMValueRef -> _int) #:c-id LLVMIsDeclaration)
(define-llvm llvm-is-enum-attribute (_fun _LLVMAttributeRefRef -> _int) #:c-id LLVMIsEnumAttribute)
(define-llvm llvm-is-externally-initialized (_fun _LLVMValueRef -> _int) #:c-id LLVMIsExternallyInitialized)
(define-llvm llvm-is-function-var-arg (_fun _LLVMTypeRef -> _bool) #:c-id LLVMIsFunctionVarArg)
(define-llvm llvm-is-global-constant (_fun _LLVMValueRef -> _int) #:c-id LLVMIsGlobalConstant)
(define-llvm llvm-is-in-bounds (_fun _LLVMValueRef -> _int) #:c-id LLVMIsInBounds)
(define-llvm llvm-is-literal-struct (_fun _LLVMTypeRef -> _int) #:c-id LLVMIsLiteralStruct)
(define-llvm llvm-is-multithreaded (_fun -> _int) #:c-id LLVMIsMultithreaded)
(define-llvm llvm-is-new-dbg-info-format (_fun _LLVMModuleRef -> _int) #:c-id LLVMIsNewDbgInfoFormat)
(define-llvm llvm-is-null (_fun _LLVMValueRef -> _int) #:c-id LLVMIsNull)
(define-llvm llvm-is-opaque-struct (_fun _LLVMTypeRef -> _int) #:c-id LLVMIsOpaqueStruct)
(define-llvm llvm-is-packed-struct (_fun _LLVMTypeRef -> _bool) #:c-id LLVMIsPackedStruct)
(define-llvm llvm-poison? (_fun _LLVMValueRef -> _bool) #:c-id LLVMIsPoison)
(define-llvm llvm-is-relocation-iterator-at-end (_fun _LLVMSectionIteratorRef _LLVMRelocationIteratorRef -> _int) #:c-id LLVMIsRelocationIteratorAtEnd)
(define-llvm llvm-is-section-iterator-at-end (_fun _LLVMObjectFileRef _LLVMSectionIteratorRef -> _int) #:c-id LLVMIsSectionIteratorAtEnd)
(define-llvm llvm-is-string-attribute (_fun _LLVMAttributeRefRef -> _int) #:c-id LLVMIsStringAttribute)
(define-llvm llvm-is-symbol-iterator-at-end (_fun _LLVMObjectFileRef _LLVMSymbolIteratorRef -> _int) #:c-id LLVMIsSymbolIteratorAtEnd)
(define-llvm llvm-is-tail-call (_fun _LLVMValueRef -> _int) #:c-id LLVMIsTailCall)
(define-llvm llvm-is-thread-local (_fun _LLVMValueRef -> _int) #:c-id LLVMIsThreadLocal)
(define-llvm llvm-is-type-attribute (_fun _LLVMAttributeRefRef -> _int) #:c-id LLVMIsTypeAttribute)
(define-llvm llvm-undef? (_fun _LLVMValueRef -> _bool) #:c-id LLVMIsUndef)
(define-llvm llvm-label-type (_fun -> _LLVMTypeRef) #:c-id LLVMLabelType)
(define-llvm llvm-label-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMLabelTypeInContext)
(define-llvm llvm-link-in-interpreter (_fun -> _void) #:c-id LLVMLinkInInterpreter)
(define-llvm llvm-link-in-mcjit (_fun -> _void) #:c-id LLVMLinkInMCJIT)
(define-llvm llvm-link-modules2 (_fun (mod mod-1) ::
                                              (mod : _LLVMModuleRef)
                                              (mod-1 : _LLVMModuleRef)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "linkmodules2 failed")))
  #:c-id LLVMLinkModules2)
(define-llvm llvm-load-library-permanently (_fun (path) ::
                                              (path : _string)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "loadlibrarypermanently failed")))
  #:c-id LLVMLoadLibraryPermanently)
(define-llvm llvm-lookup-intrinsic-id (_fun _string _ulong -> _uint) #:c-id LLVMLookupIntrinsicID)
(define-llvm llvmmd-node (_fun (vals) ::
                                  (vals : (_list i _LLVMValueRef))
                                  (_uint = (length vals))
                                  -> _LLVMValueRef)
  #:c-id LLVMMDNode)
(define-llvm llvmmd-node-in-context (_fun (ctx vals) ::
                                  (ctx : _LLVMContextRef)
                                  (vals : (_list i _LLVMValueRef))
                                  (_uint = (length vals))
                                  -> _LLVMValueRef)
  #:c-id LLVMMDNodeInContext)
(define-llvm llvmmd-node-in-context2 (_fun (ctx vals) ::
                                  (ctx : _LLVMContextRef)
                                  (vals : (_list i _LLVMMetadataRef))
                                  (_ulong = (length vals))
                                  -> _LLVMMetadataRef)
  #:c-id LLVMMDNodeInContext2)
(define-llvm llvmmd-string (_fun _string _uint -> _LLVMValueRef) #:c-id LLVMMDString)
(define-llvm llvmmd-string-in-context (_fun _LLVMContextRef _string _uint -> _LLVMValueRef) #:c-id LLVMMDStringInContext)
(define-llvm llvmmd-string-in-context2 (_fun _LLVMContextRef _string _ulong -> _LLVMMetadataRef) #:c-id LLVMMDStringInContext2)
(define-llvm llvm-mach-o-universal-binary-copy-object-for-arch (_fun _LLVMBinaryRef _string _ulong _pointer -> _LLVMBinaryRef) #:c-id LLVMMachOUniversalBinaryCopyObjectForArch)
(define-llvm llvm-metadata-as-value (_fun _LLVMContextRef _LLVMMetadataRef -> _LLVMValueRef) #:c-id LLVMMetadataAsValue)
(define-llvm llvm-metadata-replace-all-uses-with (_fun _LLVMMetadataRef _LLVMMetadataRef -> _void) #:c-id LLVMMetadataReplaceAllUsesWith)
(define-llvm llvm-metadata-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMMetadataTypeInContext)
(define-llvm llvm-module-create-with-name (_fun _string -> _LLVMModuleRef) #:c-id LLVMModuleCreateWithName)
(define-llvm llvm-module-create-with-name-in-context (_fun _string _LLVMContextRef -> _LLVMModuleRef) #:c-id LLVMModuleCreateWithNameInContext)
(define-llvm llvm-module-flag-entries-get-flag-behavior (_fun _LLVMModuleFlagEntryRef _uint -> _uint) #:c-id LLVMModuleFlagEntriesGetFlagBehavior)
(define-llvm llvm-module-flag-entries-get-key (_fun _LLVMModuleFlagEntryRef _uint _pointer -> _string) #:c-id LLVMModuleFlagEntriesGetKey)
(define-llvm llvm-module-flag-entries-get-metadata (_fun _LLVMModuleFlagEntryRef _uint -> _LLVMMetadataRef) #:c-id LLVMModuleFlagEntriesGetMetadata)
(define-llvm llvm-move-basic-block-after (_fun _LLVMBasicBlockRef _LLVMBasicBlockRef -> _void) #:c-id LLVMMoveBasicBlockAfter)
(define-llvm llvm-move-basic-block-before (_fun _LLVMBasicBlockRef _LLVMBasicBlockRef -> _void) #:c-id LLVMMoveBasicBlockBefore)
(define-llvm llvm-move-to-containing-section (_fun _LLVMSectionIteratorRef _LLVMSymbolIteratorRef -> _void) #:c-id LLVMMoveToContainingSection)
(define-llvm llvm-move-to-next-relocation (_fun _LLVMRelocationIteratorRef -> _void) #:c-id LLVMMoveToNextRelocation)
(define-llvm llvm-move-to-next-section (_fun _LLVMSectionIteratorRef -> _void) #:c-id LLVMMoveToNextSection)
(define-llvm llvm-move-to-next-symbol (_fun _LLVMSymbolIteratorRef -> _void) #:c-id LLVMMoveToNextSymbol)
(define-llvm llvm-normalize-target-triple (_fun _string -> _string) #:c-id LLVMNormalizeTargetTriple)
(define-llvm llvm-object-file-copy-section-iterator (_fun _LLVMBinaryRef -> _LLVMSectionIteratorRef) #:c-id LLVMObjectFileCopySectionIterator)
(define-llvm llvm-object-file-copy-symbol-iterator (_fun _LLVMBinaryRef -> _LLVMSymbolIteratorRef) #:c-id LLVMObjectFileCopySymbolIterator)
(define-llvm llvm-object-file-is-section-iterator-at-end (_fun _LLVMBinaryRef _LLVMSectionIteratorRef -> _int) #:c-id LLVMObjectFileIsSectionIteratorAtEnd)
(define-llvm llvm-object-file-is-symbol-iterator-at-end (_fun _LLVMBinaryRef _LLVMSymbolIteratorRef -> _int) #:c-id LLVMObjectFileIsSymbolIteratorAtEnd)
(define-llvm llvm-offset-of-element (_fun _LLVMTargetDataRef _LLVMTypeRef _uint -> _ullong) #:c-id LLVMOffsetOfElement)
(define-llvm llvm-orc-absolute-symbols (_fun _LLVMOrcCSymbolMapPairRef _ulong -> _LLVMOrcOpaqueMaterializationUnitRef) #:c-id LLVMOrcAbsoluteSymbols)
(define-llvm llvm-orc-create-custom-capi-definition-generator (_fun _pointer _pointer _pointer -> _LLVMOrcOpaqueDefinitionGeneratorRef) #:c-id LLVMOrcCreateCustomCAPIDefinitionGenerator)
(define-llvm llvm-orc-create-custom-materialization-unit (_fun _string _pointer _LLVMOrcCSymbolFlagsMapPairRef _ulong _LLVMOrcOpaqueSymbolStringPoolEntryRef _pointer _pointer _pointer -> _LLVMOrcOpaqueMaterializationUnitRef) #:c-id LLVMOrcCreateCustomMaterializationUnit)
(define-llvm llvm-orc-create-dump-objects (_fun _string _string -> _LLVMOrcOpaqueDumpObjectsRef) #:c-id LLVMOrcCreateDumpObjects)
(define-llvm llvm-orc-create-dynamic-library-search-generator-for-path (_fun _pointer _string _byte _pointer _pointer -> _LLVMErrorRef) #:c-id LLVMOrcCreateDynamicLibrarySearchGeneratorForPath)
(define-llvm llvm-orc-create-dynamic-library-search-generator-for-process (_fun _pointer _byte _pointer _pointer -> _LLVMErrorRef) #:c-id LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess)
(define-llvm llvm-orc-create-lljit (_fun _pointer _LLVMOrcOpaqueLLJITBuilderRef -> _LLVMErrorRef) #:c-id LLVMOrcCreateLLJIT)
(define-llvm llvm-orc-create-lljit-builder (_fun -> _LLVMOrcOpaqueLLJITBuilderRef) #:c-id LLVMOrcCreateLLJITBuilder)
(define-llvm llvm-orc-create-local-indirect-stubs-manager (_fun _string -> _LLVMOrcOpaqueIndirectStubsManagerRef) #:c-id LLVMOrcCreateLocalIndirectStubsManager)
(define-llvm llvm-orc-create-local-lazy-call-through-manager (_fun _string _LLVMOrcOpaqueExecutionSessionRef _uint64 _pointer -> _LLVMErrorRef) #:c-id LLVMOrcCreateLocalLazyCallThroughManager)
(define-llvm llvm-orc-create-new-thread-safe-context (_fun -> _LLVMOrcOpaqueThreadSafeContextRef) #:c-id LLVMOrcCreateNewThreadSafeContext)
(define-llvm llvm-orc-create-new-thread-safe-module (_fun _LLVMModuleRef _LLVMOrcOpaqueThreadSafeContextRef -> _LLVMOrcOpaqueThreadSafeModuleRef) #:c-id LLVMOrcCreateNewThreadSafeModule)
(define-llvm llvm-orc-create-rt-dyld-object-linking-layer-with-mcjit-memory-manager-like-callbacks (_fun _LLVMOrcOpaqueExecutionSessionRef _pointer _pointer _pointer _pointer _pointer _pointer _pointer -> _LLVMOrcOpaqueObjectLayerRef) #:c-id LLVMOrcCreateRTDyldObjectLinkingLayerWithMCJITMemoryManagerLikeCallbacks)
(define-llvm llvm-orc-create-rt-dyld-object-linking-layer-with-section-memory-manager (_fun _LLVMOrcOpaqueExecutionSessionRef -> _LLVMOrcOpaqueObjectLayerRef) #:c-id LLVMOrcCreateRTDyldObjectLinkingLayerWithSectionMemoryManager)
(define-llvm llvm-orc-dispose-c-symbol-flags-map (_fun _LLVMOrcCSymbolFlagsMapPairRef -> _void) #:c-id LLVMOrcDisposeCSymbolFlagsMap)
(define-llvm llvm-orc-dispose-definition-generator (_fun _LLVMOrcOpaqueDefinitionGeneratorRef -> _void) #:c-id LLVMOrcDisposeDefinitionGenerator)
(define-llvm llvm-orc-dispose-dump-objects (_fun _LLVMOrcOpaqueDumpObjectsRef -> _void) #:c-id LLVMOrcDisposeDumpObjects)
(define-llvm llvm-orc-dispose-indirect-stubs-manager (_fun _LLVMOrcOpaqueIndirectStubsManagerRef -> _void) #:c-id LLVMOrcDisposeIndirectStubsManager)
(define-llvm llvm-orc-dispose-jit-target-machine-builder (_fun _LLVMOrcOpaqueJITTargetMachineBuilderRef -> _void) #:c-id LLVMOrcDisposeJITTargetMachineBuilder)
(define-llvm llvm-orc-dispose-lljit (_fun _LLVMOrcOpaqueLLJITRef -> _LLVMErrorRef) #:c-id LLVMOrcDisposeLLJIT)
(define-llvm llvm-orc-dispose-lljit-builder (_fun _LLVMOrcOpaqueLLJITBuilderRef -> _void) #:c-id LLVMOrcDisposeLLJITBuilder)
(define-llvm llvm-orc-dispose-lazy-call-through-manager (_fun _LLVMOrcOpaqueLazyCallThroughManagerRef -> _void) #:c-id LLVMOrcDisposeLazyCallThroughManager)
(define-llvm llvm-orc-dispose-materialization-responsibility (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef -> _void) #:c-id LLVMOrcDisposeMaterializationResponsibility)
(define-llvm llvm-orc-dispose-materialization-unit (_fun _LLVMOrcOpaqueMaterializationUnitRef -> _void) #:c-id LLVMOrcDisposeMaterializationUnit)
(define-llvm llvm-orc-dispose-object-layer (_fun _LLVMOrcOpaqueObjectLayerRef -> _void) #:c-id LLVMOrcDisposeObjectLayer)
(define-llvm llvm-orc-dispose-symbols (_fun _pointer -> _void) #:c-id LLVMOrcDisposeSymbols)
(define-llvm llvm-orc-dispose-thread-safe-context (_fun _LLVMOrcOpaqueThreadSafeContextRef -> _void) #:c-id LLVMOrcDisposeThreadSafeContext)
(define-llvm llvm-orc-dispose-thread-safe-module (_fun _LLVMOrcOpaqueThreadSafeModuleRef -> _void) #:c-id LLVMOrcDisposeThreadSafeModule)
(define-llvm llvm-orc-dump-objects--call-operator (_fun _LLVMOrcOpaqueDumpObjectsRef _pointer -> _LLVMErrorRef) #:c-id LLVMOrcDumpObjects_CallOperator)
(define-llvm llvm-orc-execution-session-create-bare-jit-dylib (_fun _LLVMOrcOpaqueExecutionSessionRef _string -> _LLVMOrcOpaqueJITDylibRef) #:c-id LLVMOrcExecutionSessionCreateBareJITDylib)
(define-llvm llvm-orc-execution-session-create-jit-dylib (_fun _LLVMOrcOpaqueExecutionSessionRef _pointer _string -> _LLVMErrorRef) #:c-id LLVMOrcExecutionSessionCreateJITDylib)
(define-llvm llvm-orc-execution-session-get-jit-dylib-by-name (_fun _LLVMOrcOpaqueExecutionSessionRef _string -> _LLVMOrcOpaqueJITDylibRef) #:c-id LLVMOrcExecutionSessionGetJITDylibByName)
(define-llvm llvm-orc-execution-session-get-symbol-string-pool (_fun _LLVMOrcOpaqueExecutionSessionRef -> _LLVMOrcOpaqueSymbolStringPoolRef) #:c-id LLVMOrcExecutionSessionGetSymbolStringPool)
(define-llvm llvm-orc-execution-session-intern (_fun _LLVMOrcOpaqueExecutionSessionRef _string -> _LLVMOrcOpaqueSymbolStringPoolEntryRef) #:c-id LLVMOrcExecutionSessionIntern)
(define-llvm llvm-orc-execution-session-lookup (_fun _LLVMOrcOpaqueExecutionSessionRef _uint _LLVMOrcCJITDylibSearchOrderElementRef _ulong _LLVMOrcCLookupSetElementRef _ulong _pointer _pointer -> _void) #:c-id LLVMOrcExecutionSessionLookup)
(define-llvm llvm-orc-execution-session-set-error-reporter (_fun _LLVMOrcOpaqueExecutionSessionRef _pointer _pointer -> _void) #:c-id LLVMOrcExecutionSessionSetErrorReporter)
(define-llvm llvm-orc-ir-transform-layer-emit (_fun _LLVMOrcOpaqueIRTransformLayerRef _LLVMOrcOpaqueMaterializationResponsibilityRef _LLVMOrcOpaqueThreadSafeModuleRef -> _void) #:c-id LLVMOrcIRTransformLayerEmit)
(define-llvm llvm-orc-ir-transform-layer-set-transform (_fun _LLVMOrcOpaqueIRTransformLayerRef _pointer _pointer -> _void) #:c-id LLVMOrcIRTransformLayerSetTransform)
(define-llvm llvm-orc-jit-dylib-add-generator (_fun _LLVMOrcOpaqueJITDylibRef _LLVMOrcOpaqueDefinitionGeneratorRef -> _void) #:c-id LLVMOrcJITDylibAddGenerator)
(define-llvm llvm-orc-jit-dylib-clear (_fun _LLVMOrcOpaqueJITDylibRef -> _LLVMErrorRef) #:c-id LLVMOrcJITDylibClear)
(define-llvm llvm-orc-jit-dylib-create-resource-tracker (_fun _LLVMOrcOpaqueJITDylibRef -> _LLVMOrcOpaqueResourceTrackerRef) #:c-id LLVMOrcJITDylibCreateResourceTracker)
(define-llvm llvm-orc-jit-dylib-define (_fun _LLVMOrcOpaqueJITDylibRef _LLVMOrcOpaqueMaterializationUnitRef -> _LLVMErrorRef) #:c-id LLVMOrcJITDylibDefine)
(define-llvm llvm-orc-jit-dylib-get-default-resource-tracker (_fun _LLVMOrcOpaqueJITDylibRef -> _LLVMOrcOpaqueResourceTrackerRef) #:c-id LLVMOrcJITDylibGetDefaultResourceTracker)
(define-llvm llvm-orc-jit-target-machine-builder-create-from-target-machine (_fun _LLVMTargetMachineRef -> _LLVMOrcOpaqueJITTargetMachineBuilderRef) #:c-id LLVMOrcJITTargetMachineBuilderCreateFromTargetMachine)
(define-llvm llvm-orc-jit-target-machine-builder-detect-host (_fun _pointer -> _LLVMErrorRef) #:c-id LLVMOrcJITTargetMachineBuilderDetectHost)
(define-llvm llvm-orc-jit-target-machine-builder-get-target-triple (_fun _LLVMOrcOpaqueJITTargetMachineBuilderRef -> _string) #:c-id LLVMOrcJITTargetMachineBuilderGetTargetTriple)
(define-llvm llvm-orc-jit-target-machine-builder-set-target-triple (_fun _LLVMOrcOpaqueJITTargetMachineBuilderRef _string -> _void) #:c-id LLVMOrcJITTargetMachineBuilderSetTargetTriple)
(define-llvm llvm-orc-lljit-add-llvmir-module (_fun _LLVMOrcOpaqueLLJITRef _LLVMOrcOpaqueJITDylibRef _LLVMOrcOpaqueThreadSafeModuleRef -> _LLVMErrorRef) #:c-id LLVMOrcLLJITAddLLVMIRModule)
(define-llvm llvm-orc-lljit-add-llvmir-module-with-rt (_fun _LLVMOrcOpaqueLLJITRef _LLVMOrcOpaqueResourceTrackerRef _LLVMOrcOpaqueThreadSafeModuleRef -> _LLVMErrorRef) #:c-id LLVMOrcLLJITAddLLVMIRModuleWithRT)
(define-llvm llvm-orc-lljit-add-object-file (_fun _LLVMOrcOpaqueLLJITRef _LLVMOrcOpaqueJITDylibRef _LLVMMemoryBufferRef -> _LLVMErrorRef) #:c-id LLVMOrcLLJITAddObjectFile)
(define-llvm llvm-orc-lljit-add-object-file-with-rt (_fun _LLVMOrcOpaqueLLJITRef _LLVMOrcOpaqueResourceTrackerRef _LLVMMemoryBufferRef -> _LLVMErrorRef) #:c-id LLVMOrcLLJITAddObjectFileWithRT)
(define-llvm llvm-orc-lljit-builder-set-jit-target-machine-builder (_fun _LLVMOrcOpaqueLLJITBuilderRef _LLVMOrcOpaqueJITTargetMachineBuilderRef -> _void) #:c-id LLVMOrcLLJITBuilderSetJITTargetMachineBuilder)
(define-llvm llvm-orc-lljit-builder-set-object-linking-layer-creator (_fun _LLVMOrcOpaqueLLJITBuilderRef _pointer _pointer -> _void) #:c-id LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator)
(define-llvm llvm-orc-lljit-enable-debug-support (_fun _LLVMOrcOpaqueLLJITRef -> _LLVMErrorRef) #:c-id LLVMOrcLLJITEnableDebugSupport)
(define-llvm llvm-orc-lljit-get-data-layout-str (_fun _LLVMOrcOpaqueLLJITRef -> _string) #:c-id LLVMOrcLLJITGetDataLayoutStr)
(define-llvm llvm-orc-lljit-get-execution-session (_fun _LLVMOrcOpaqueLLJITRef -> _LLVMOrcOpaqueExecutionSessionRef) #:c-id LLVMOrcLLJITGetExecutionSession)
(define-llvm llvm-orc-lljit-get-global-prefix (_fun _LLVMOrcOpaqueLLJITRef -> _byte) #:c-id LLVMOrcLLJITGetGlobalPrefix)
(define-llvm llvm-orc-lljit-get-ir-transform-layer (_fun _LLVMOrcOpaqueLLJITRef -> _LLVMOrcOpaqueIRTransformLayerRef) #:c-id LLVMOrcLLJITGetIRTransformLayer)
(define-llvm llvm-orc-lljit-get-main-jit-dylib (_fun _LLVMOrcOpaqueLLJITRef -> _LLVMOrcOpaqueJITDylibRef) #:c-id LLVMOrcLLJITGetMainJITDylib)
(define-llvm llvm-orc-lljit-get-obj-linking-layer (_fun _LLVMOrcOpaqueLLJITRef -> _LLVMOrcOpaqueObjectLayerRef) #:c-id LLVMOrcLLJITGetObjLinkingLayer)
(define-llvm llvm-orc-lljit-get-obj-transform-layer (_fun _LLVMOrcOpaqueLLJITRef -> _LLVMOrcOpaqueObjectTransformLayerRef) #:c-id LLVMOrcLLJITGetObjTransformLayer)
(define-llvm llvm-orc-lljit-get-triple-string (_fun _LLVMOrcOpaqueLLJITRef -> _string) #:c-id LLVMOrcLLJITGetTripleString)
(define-llvm llvm-orc-lljit-lookup (_fun _LLVMOrcOpaqueLLJITRef _pointer _string -> _LLVMErrorRef) #:c-id LLVMOrcLLJITLookup)
(define-llvm llvm-orc-lljit-mangle-and-intern (_fun _LLVMOrcOpaqueLLJITRef _string -> _LLVMOrcOpaqueSymbolStringPoolEntryRef) #:c-id LLVMOrcLLJITMangleAndIntern)
(define-llvm llvm-orc-lazy-reexports (_fun _LLVMOrcOpaqueLazyCallThroughManagerRef _LLVMOrcOpaqueIndirectStubsManagerRef _LLVMOrcOpaqueJITDylibRef _LLVMOrcCSymbolAliasMapPairRef _ulong -> _LLVMOrcOpaqueMaterializationUnitRef) #:c-id LLVMOrcLazyReexports)
(define-llvm llvm-orc-lookup-state-continue-lookup (_fun _LLVMOrcOpaqueLookupStateRef _LLVMErrorRef -> _void) #:c-id LLVMOrcLookupStateContinueLookup)
(define-llvm llvm-orc-materialization-responsibility-define-materializing (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef _LLVMOrcCSymbolFlagsMapPairRef _ulong -> _LLVMErrorRef) #:c-id LLVMOrcMaterializationResponsibilityDefineMaterializing)
(define-llvm llvm-orc-materialization-responsibility-delegate (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef _pointer _ulong _pointer -> _LLVMErrorRef) #:c-id LLVMOrcMaterializationResponsibilityDelegate)
(define-llvm llvm-orc-materialization-responsibility-fail-materialization (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef -> _void) #:c-id LLVMOrcMaterializationResponsibilityFailMaterialization)
(define-llvm llvm-orc-materialization-responsibility-get-execution-session (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef -> _LLVMOrcOpaqueExecutionSessionRef) #:c-id LLVMOrcMaterializationResponsibilityGetExecutionSession)
(define-llvm llvm-orc-materialization-responsibility-get-initializer-symbol (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef -> _LLVMOrcOpaqueSymbolStringPoolEntryRef) #:c-id LLVMOrcMaterializationResponsibilityGetInitializerSymbol)
(define-llvm llvm-orc-materialization-responsibility-get-requested-symbols (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef _pointer -> _pointer) #:c-id LLVMOrcMaterializationResponsibilityGetRequestedSymbols)
(define-llvm llvm-orc-materialization-responsibility-get-symbols (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef _pointer -> _LLVMOrcCSymbolFlagsMapPairRef) #:c-id LLVMOrcMaterializationResponsibilityGetSymbols)
(define-llvm llvm-orc-materialization-responsibility-get-target-dylib (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef -> _LLVMOrcOpaqueJITDylibRef) #:c-id LLVMOrcMaterializationResponsibilityGetTargetDylib)
(define-llvm llvm-orc-materialization-responsibility-notify-emitted (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef _LLVMOrcCSymbolDependenceGroupRef _ulong -> _LLVMErrorRef) #:c-id LLVMOrcMaterializationResponsibilityNotifyEmitted)
(define-llvm llvm-orc-materialization-responsibility-notify-resolved (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef _LLVMOrcCSymbolMapPairRef _ulong -> _LLVMErrorRef) #:c-id LLVMOrcMaterializationResponsibilityNotifyResolved)
(define-llvm llvm-orc-materialization-responsibility-replace (_fun _LLVMOrcOpaqueMaterializationResponsibilityRef _LLVMOrcOpaqueMaterializationUnitRef -> _LLVMErrorRef) #:c-id LLVMOrcMaterializationResponsibilityReplace)
(define-llvm llvm-orc-object-layer-add-object-file (_fun _LLVMOrcOpaqueObjectLayerRef _LLVMOrcOpaqueJITDylibRef _LLVMMemoryBufferRef -> _LLVMErrorRef) #:c-id LLVMOrcObjectLayerAddObjectFile)
(define-llvm llvm-orc-object-layer-add-object-file-with-rt (_fun _LLVMOrcOpaqueObjectLayerRef _LLVMOrcOpaqueResourceTrackerRef _LLVMMemoryBufferRef -> _LLVMErrorRef) #:c-id LLVMOrcObjectLayerAddObjectFileWithRT)
(define-llvm llvm-orc-object-layer-emit (_fun _LLVMOrcOpaqueObjectLayerRef _LLVMOrcOpaqueMaterializationResponsibilityRef _LLVMMemoryBufferRef -> _void) #:c-id LLVMOrcObjectLayerEmit)
(define-llvm llvm-orc-object-transform-layer-set-transform (_fun _LLVMOrcOpaqueObjectTransformLayerRef _pointer _pointer -> _void) #:c-id LLVMOrcObjectTransformLayerSetTransform)
(define-llvm llvm-orc-rt-dyld-object-linking-layer-register-jit-event-listener (_fun _LLVMOrcOpaqueObjectLayerRef _LLVMJITEventListenerRef -> _void) #:c-id LLVMOrcRTDyldObjectLinkingLayerRegisterJITEventListener)
(define-llvm llvm-orc-release-resource-tracker (_fun _LLVMOrcOpaqueResourceTrackerRef -> _void) #:c-id LLVMOrcReleaseResourceTracker)
(define-llvm llvm-orc-release-symbol-string-pool-entry (_fun _LLVMOrcOpaqueSymbolStringPoolEntryRef -> _void) #:c-id LLVMOrcReleaseSymbolStringPoolEntry)
(define-llvm llvm-orc-resource-tracker-remove (_fun _LLVMOrcOpaqueResourceTrackerRef -> _LLVMErrorRef) #:c-id LLVMOrcResourceTrackerRemove)
(define-llvm llvm-orc-resource-tracker-transfer-to (_fun _LLVMOrcOpaqueResourceTrackerRef _LLVMOrcOpaqueResourceTrackerRef -> _void) #:c-id LLVMOrcResourceTrackerTransferTo)
(define-llvm llvm-orc-retain-symbol-string-pool-entry (_fun _LLVMOrcOpaqueSymbolStringPoolEntryRef -> _void) #:c-id LLVMOrcRetainSymbolStringPoolEntry)
(define-llvm llvm-orc-symbol-string-pool-clear-dead-entries (_fun _LLVMOrcOpaqueSymbolStringPoolRef -> _void) #:c-id LLVMOrcSymbolStringPoolClearDeadEntries)
(define-llvm llvm-orc-symbol-string-pool-entry-str (_fun _LLVMOrcOpaqueSymbolStringPoolEntryRef -> _string) #:c-id LLVMOrcSymbolStringPoolEntryStr)
(define-llvm llvm-orc-thread-safe-context-get-context (_fun _LLVMOrcOpaqueThreadSafeContextRef -> _LLVMContextRef) #:c-id LLVMOrcThreadSafeContextGetContext)
(define-llvm llvm-orc-thread-safe-module-with-module-do (_fun _LLVMOrcOpaqueThreadSafeModuleRef _pointer _pointer -> _LLVMErrorRef) #:c-id LLVMOrcThreadSafeModuleWithModuleDo)
(define-llvm llvmppcfp128-type (_fun -> _LLVMTypeRef) #:c-id LLVMPPCFP128Type)
(define-llvm llvmppcfp128-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMPPCFP128TypeInContext)
(define-llvm llvm-parse-bitcode (_fun (memorybuffer out-param-1 out-param-2) ::
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-1 : _pointer)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "parsebitcode failed")))
  #:c-id LLVMParseBitcode)
(define-llvm llvm-parse-bitcode2 (_fun (memorybuffer out-param-1) ::
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-1 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "parsebitcode2 failed")))
  #:c-id LLVMParseBitcode2)
(define-llvm llvm-parse-bitcode-in-context (_fun (context memorybuffer out-param-2 out-param-3) ::
                                              (context : _LLVMContextRef)
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-2 : _pointer)
                                              (out-param-3 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "parsebitcodeincontext failed")))
  #:c-id LLVMParseBitcodeInContext)
(define-llvm llvm-parse-bitcode-in-context2 (_fun (context memorybuffer out-param-2) ::
                                              (context : _LLVMContextRef)
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "parsebitcodeincontext2 failed")))
  #:c-id LLVMParseBitcodeInContext2)
(define-llvm llvm-parse-command-line-options (_fun _int _pointer _string -> _void) #:c-id LLVMParseCommandLineOptions)
(define-llvm llvm-parse-ir-in-context (_fun (context memorybuffer out-param-2 out-param-3) ::
                                              (context : _LLVMContextRef)
                                              (memorybuffer : _LLVMMemoryBufferRef)
                                              (out-param-2 : _pointer)
                                              (out-param-3 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "parseirincontext failed")))
  #:c-id LLVMParseIRInContext)
(define-llvm llvm-pass-builder-options-set-aa-pipeline (_fun _LLVMPassBuilderOptionsRef _string -> _void) #:c-id LLVMPassBuilderOptionsSetAAPipeline)
(define-llvm llvm-pass-builder-options-set-call-graph-profile (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetCallGraphProfile)
(define-llvm llvm-pass-builder-options-set-debug-logging (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetDebugLogging)
(define-llvm llvm-pass-builder-options-set-forget-all-scev-in-loop-unroll (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll)
(define-llvm llvm-pass-builder-options-set-inliner-threshold (_fun _LLVMPassBuilderOptionsRef _int -> _void) #:c-id LLVMPassBuilderOptionsSetInlinerThreshold)
(define-llvm llvm-pass-builder-options-set-licm-mssa-no-acc-for-promotion-cap (_fun _LLVMPassBuilderOptionsRef _uint -> _void) #:c-id LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap)
(define-llvm llvm-pass-builder-options-set-licm-mssa-opt-cap (_fun _LLVMPassBuilderOptionsRef _uint -> _void) #:c-id LLVMPassBuilderOptionsSetLicmMssaOptCap)
(define-llvm llvm-pass-builder-options-set-loop-interleaving (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetLoopInterleaving)
(define-llvm llvm-pass-builder-options-set-loop-unrolling (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetLoopUnrolling)
(define-llvm llvm-pass-builder-options-set-loop-vectorization (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetLoopVectorization)
(define-llvm llvm-pass-builder-options-set-merge-functions (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetMergeFunctions)
(define-llvm llvm-pass-builder-options-set-slp-vectorization (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetSLPVectorization)
(define-llvm llvm-pass-builder-options-set-verify-each (_fun _LLVMPassBuilderOptionsRef _bool -> _void) #:c-id LLVMPassBuilderOptionsSetVerifyEach)
(define-llvm llvm-pointer-size (_fun _LLVMTargetDataRef -> _uint) #:c-id LLVMPointerSize)
(define-llvm llvm-pointer-size-for-as (_fun _LLVMTargetDataRef _uint -> _uint) #:c-id LLVMPointerSizeForAS)
(define-llvm llvm-pointer-type (_fun  (type [address-space 0]) ::
                                        (type : _LLVMTypeRef)
                                        (address-space : _uint)
                                        -> _LLVMTypeRef)
  #:c-id LLVMPointerType)
(define-llvm llvm-pointer-type-in-context (_fun _LLVMContextRef _uint -> _LLVMTypeRef) #:c-id LLVMPointerTypeInContext)
(define-llvm llvm-pointer-type-is-opaque (_fun _LLVMTypeRef -> _int) #:c-id LLVMPointerTypeIsOpaque)
(define-llvm llvm-position-builder (_fun _LLVMBuilderRef _LLVMBasicBlockRef _LLVMValueRef -> _void) #:c-id LLVMPositionBuilder)
(define-llvm llvm-position-builder-at-end (_fun _LLVMBuilderRef _LLVMBasicBlockRef -> _void) #:c-id LLVMPositionBuilderAtEnd)
(define-llvm llvm-position-builder-before (_fun _LLVMBuilderRef _LLVMValueRef -> _void) #:c-id LLVMPositionBuilderBefore)
(define-llvm llvm-position-builder-before-dbg-records (_fun _LLVMBuilderRef _LLVMBasicBlockRef _LLVMValueRef -> _void) #:c-id LLVMPositionBuilderBeforeDbgRecords)
(define-llvm llvm-position-builder-before-instr-and-dbg-records (_fun _LLVMBuilderRef _LLVMValueRef -> _void) #:c-id LLVMPositionBuilderBeforeInstrAndDbgRecords)
(define-llvm llvm-preferred-alignment-of-global (_fun _LLVMTargetDataRef _LLVMValueRef -> _uint) #:c-id LLVMPreferredAlignmentOfGlobal)
(define-llvm llvm-preferred-alignment-of-type (_fun _LLVMTargetDataRef _LLVMTypeRef -> _uint) #:c-id LLVMPreferredAlignmentOfType)
(define-llvm llvm-print-dbg-record-to-string (_fun _LLVMDbgRecordRef -> _string) #:c-id LLVMPrintDbgRecordToString)
(define-llvm llvm-print-module-to-file (_fun (mod file-path out-param-2) ::
                                              (mod : _LLVMModuleRef)
                                              (file-path : _string)
                                              (out-param-2 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "printmoduletofile failed")))
  #:c-id LLVMPrintModuleToFile)
(define-llvm llvm-print-module-to-string (_fun _LLVMModuleRef -> _string) #:c-id LLVMPrintModuleToString)
(define-llvm llvm-print-type-to-string (_fun _LLVMTypeRef -> _string) #:c-id LLVMPrintTypeToString)
(define-llvm llvm-print-value-to-string (_fun _LLVMValueRef -> _string) #:c-id LLVMPrintValueToString)
(define-llvm llvm-recompile-and-relink-function (_fun _LLVMExecutionEngineRef _LLVMValueRef -> _pointer) #:c-id LLVMRecompileAndRelinkFunction)
(define-llvm llvm-remark-arg-get-debug-loc (_fun _LLVMRemarkOpaqueArgRef -> _LLVMRemarkOpaqueDebugLocRef) #:c-id LLVMRemarkArgGetDebugLoc)
(define-llvm llvm-remark-arg-get-key (_fun _LLVMRemarkOpaqueArgRef -> _LLVMRemarkOpaqueStringRef) #:c-id LLVMRemarkArgGetKey)
(define-llvm llvm-remark-arg-get-value (_fun _LLVMRemarkOpaqueArgRef -> _LLVMRemarkOpaqueStringRef) #:c-id LLVMRemarkArgGetValue)
(define-llvm llvm-remark-debug-loc-get-source-column (_fun _LLVMRemarkOpaqueDebugLocRef -> _uint32) #:c-id LLVMRemarkDebugLocGetSourceColumn)
(define-llvm llvm-remark-debug-loc-get-source-file-path (_fun _LLVMRemarkOpaqueDebugLocRef -> _LLVMRemarkOpaqueStringRef) #:c-id LLVMRemarkDebugLocGetSourceFilePath)
(define-llvm llvm-remark-debug-loc-get-source-line (_fun _LLVMRemarkOpaqueDebugLocRef -> _uint32) #:c-id LLVMRemarkDebugLocGetSourceLine)
(define-llvm llvm-remark-entry-dispose (_fun _LLVMRemarkOpaqueEntryRef -> _void) #:c-id LLVMRemarkEntryDispose)
(define-llvm llvm-remark-entry-get-debug-loc (_fun _LLVMRemarkOpaqueEntryRef -> _LLVMRemarkOpaqueDebugLocRef) #:c-id LLVMRemarkEntryGetDebugLoc)
(define-llvm llvm-remark-entry-get-first-arg (_fun _LLVMRemarkOpaqueEntryRef -> _LLVMRemarkOpaqueArgRef) #:c-id LLVMRemarkEntryGetFirstArg)
(define-llvm llvm-remark-entry-get-function-name (_fun _LLVMRemarkOpaqueEntryRef -> _LLVMRemarkOpaqueStringRef) #:c-id LLVMRemarkEntryGetFunctionName)
(define-llvm llvm-remark-entry-get-hotness (_fun _LLVMRemarkOpaqueEntryRef -> _uint64) #:c-id LLVMRemarkEntryGetHotness)
(define-llvm llvm-remark-entry-get-next-arg (_fun _LLVMRemarkOpaqueArgRef _LLVMRemarkOpaqueEntryRef -> _LLVMRemarkOpaqueArgRef) #:c-id LLVMRemarkEntryGetNextArg)
(define-llvm llvm-remark-entry-get-num-args (_fun _LLVMRemarkOpaqueEntryRef -> _uint32) #:c-id LLVMRemarkEntryGetNumArgs)
(define-llvm llvm-remark-entry-get-pass-name (_fun _LLVMRemarkOpaqueEntryRef -> _LLVMRemarkOpaqueStringRef) #:c-id LLVMRemarkEntryGetPassName)
(define-llvm llvm-remark-entry-get-remark-name (_fun _LLVMRemarkOpaqueEntryRef -> _LLVMRemarkOpaqueStringRef) #:c-id LLVMRemarkEntryGetRemarkName)
(define-llvm llvm-remark-entry-get-type (_fun _LLVMRemarkOpaqueEntryRef -> _uint) #:c-id LLVMRemarkEntryGetType)
(define-llvm llvm-remark-parser-create-bitstream (_fun _pointer _uint64 -> _LLVMRemarkOpaqueParserRef) #:c-id LLVMRemarkParserCreateBitstream)
(define-llvm llvm-remark-parser-create-yaml (_fun _pointer _uint64 -> _LLVMRemarkOpaqueParserRef) #:c-id LLVMRemarkParserCreateYAML)
(define-llvm llvm-remark-parser-dispose (_fun _LLVMRemarkOpaqueParserRef -> _void) #:c-id LLVMRemarkParserDispose)
(define-llvm llvm-remark-parser-get-error-message (_fun _LLVMRemarkOpaqueParserRef -> _string) #:c-id LLVMRemarkParserGetErrorMessage)
(define-llvm llvm-remark-parser-get-next (_fun _LLVMRemarkOpaqueParserRef -> _LLVMRemarkOpaqueEntryRef) #:c-id LLVMRemarkParserGetNext)
(define-llvm llvm-remark-parser-has-error (_fun _LLVMRemarkOpaqueParserRef -> _int) #:c-id LLVMRemarkParserHasError)
(define-llvm llvm-remark-string-get-data (_fun _LLVMRemarkOpaqueStringRef -> _string) #:c-id LLVMRemarkStringGetData)
(define-llvm llvm-remark-string-get-len (_fun _LLVMRemarkOpaqueStringRef -> _uint32) #:c-id LLVMRemarkStringGetLen)
(define-llvm llvm-remove-basic-block-from-parent (_fun _LLVMBasicBlockRef -> _void) #:c-id LLVMRemoveBasicBlockFromParent)
(define-llvm llvm-remove-call-site-enum-attribute (_fun _LLVMValueRef _uint _uint -> _void) #:c-id LLVMRemoveCallSiteEnumAttribute)
(define-llvm llvm-remove-call-site-string-attribute (_fun _LLVMValueRef _uint _string _uint -> _void) #:c-id LLVMRemoveCallSiteStringAttribute)
(define-llvm llvm-remove-enum-attribute-at-index (_fun _LLVMValueRef _uint _uint -> _void) #:c-id LLVMRemoveEnumAttributeAtIndex)
(define-llvm llvm-remove-global-i-func (_fun _LLVMValueRef -> _void) #:c-id LLVMRemoveGlobalIFunc)
(define-llvm llvm-remove-module (_fun (executionengine mod out-param-2 out-param-3) ::
                                              (executionengine : _LLVMExecutionEngineRef)
                                              (mod : _LLVMModuleRef)
                                              (out-param-2 : _pointer)
                                              (out-param-3 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "removemodule failed")))
  #:c-id LLVMRemoveModule)
(define-llvm llvm-remove-string-attribute-at-index (_fun _LLVMValueRef _uint _string _uint -> _void) #:c-id LLVMRemoveStringAttributeAtIndex)
(define-llvm llvm-replace-all-uses-with (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMReplaceAllUsesWith)
(define-llvm llvm-replace-md-node-operand-with (_fun _LLVMValueRef _uint _LLVMMetadataRef -> _void) #:c-id LLVMReplaceMDNodeOperandWith)
(define-llvm llvm-reset-fatal-error-handler (_fun -> _void) #:c-id LLVMResetFatalErrorHandler)
(define-llvm llvm-run-function (_fun  (engine func args) ::
                                     (engine : _LLVMExecutionEngineRef)
                                     (func : _LLVMValueRef)
                                     (_uint = (length args))
                                     (args : (_list i _LLVMGenericValueRef))
                                     -> _LLVMGenericValueRef)
  #:c-id LLVMRunFunction)
(define-llvm llvm-run-function-as-main (_fun (executionengine value param-2 out-param-3 out-param-4) ::
                                              (executionengine : _LLVMExecutionEngineRef)
                                              (value : _LLVMValueRef)
                                              (param-2 : _uint)
                                              (out-param-3 : _pointer)
                                              (out-param-4 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "runfunctionasmain failed")))
  #:c-id LLVMRunFunctionAsMain)
(define-llvm llvm-run-function-pass-manager (_fun (passmanager value) ::
                                              (passmanager : _LLVMPassManagerRef)
                                              (value : _LLVMValueRef)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "runfunctionpassmanager failed")))
  #:c-id LLVMRunFunctionPassManager)
(define-llvm llvm-run-pass-manager (_fun (passmanager mod) ::
                                              (passmanager : _LLVMPassManagerRef)
                                              (mod : _LLVMModuleRef)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "runpassmanager failed")))
  #:c-id LLVMRunPassManager)
(define-llvm llvm-run-passes (_fun _LLVMModuleRef _string _LLVMTargetMachineRef _LLVMPassBuilderOptionsRef -> _pointer) #:c-id LLVMRunPasses)
(define-llvm llvm-run-passes-on-function (_fun _LLVMValueRef _string _LLVMTargetMachineRef _LLVMPassBuilderOptionsRef -> _pointer) #:c-id LLVMRunPassesOnFunction)
(define-llvm llvm-run-static-constructors (_fun _LLVMExecutionEngineRef -> _void) #:c-id LLVMRunStaticConstructors)
(define-llvm llvm-run-static-destructors (_fun _LLVMExecutionEngineRef -> _void) #:c-id LLVMRunStaticDestructors)
(define-llvm llvm-scalable-vector-type (_fun _LLVMTypeRef _uint -> _LLVMTypeRef) #:c-id LLVMScalableVectorType)
(define-llvm llvm-search-for-address-of-symbol (_fun _string -> _pointer) #:c-id LLVMSearchForAddressOfSymbol)
(define-llvm llvm-set-alignment (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetAlignment)
(define-llvm llvm-set-arg-operand (_fun _LLVMValueRef _uint _LLVMValueRef -> _void) #:c-id LLVMSetArgOperand)
(define-llvm llvm-set-atomic-rmw-bin-op (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetAtomicRMWBinOp)
(define-llvm llvm-set-atomic-single-thread (_fun _LLVMValueRef _int -> _void) #:c-id LLVMSetAtomicSingleThread)
(define-llvm llvm-set-atomic-sync-scope-id (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetAtomicSyncScopeID)
(define-llvm llvm-set-cleanup (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetCleanup)
(define-llvm llvm-set-cmp-xchg-failure-ordering (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetCmpXchgFailureOrdering)
(define-llvm llvm-set-cmp-xchg-success-ordering (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetCmpXchgSuccessOrdering)
(define-llvm llvm-set-comdat (_fun _LLVMValueRef _LLVMComdatRef -> _void) #:c-id LLVMSetComdat)
(define-llvm llvm-set-comdat-selection-kind (_fun _LLVMComdatRef _uint -> _void) #:c-id LLVMSetComdatSelectionKind)
(define-llvm llvm-set-condition (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMSetCondition)
(define-llvm llvm-set-current-debug-location (_fun _LLVMBuilderRef _LLVMValueRef -> _void) #:c-id LLVMSetCurrentDebugLocation)
(define-llvm llvm-set-current-debug-location2 (_fun _LLVMBuilderRef _LLVMMetadataRef -> _void) #:c-id LLVMSetCurrentDebugLocation2)
(define-llvm llvm-set-dll-storage-class (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetDLLStorageClass)
(define-llvm llvm-set-data-layout (_fun _LLVMModuleRef _string -> _void) #:c-id LLVMSetDataLayout)
(define-llvm llvm-set-disasm-options (_fun _pointer _uint64 -> _int) #:c-id LLVMSetDisasmOptions)
(define-llvm llvm-set-exact (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetExact)
(define-llvm llvm-set-externally-initialized (_fun _LLVMValueRef _int -> _void) #:c-id LLVMSetExternallyInitialized)
(define-llvm llvm-set-fast-math-flags (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetFastMathFlags)
(define-llvm llvm-set-function-call-conv (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetFunctionCallConv)
(define-llvm llvm-set-gc (_fun _LLVMValueRef _string -> _void) #:c-id LLVMSetGC)
(define-llvm llvm-set-global-constant (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetGlobalConstant)
(define-llvm llvm-set-global-i-func-resolver (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMSetGlobalIFuncResolver)
(define-llvm llvm-set-initializer (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMSetInitializer)
(define-llvm llvm-set-inst-debug-location (_fun _LLVMBuilderRef _LLVMValueRef -> _void) #:c-id LLVMSetInstDebugLocation)
(define-llvm llvm-set-instr-param-alignment (_fun _LLVMValueRef _uint _uint -> _void) #:c-id LLVMSetInstrParamAlignment)
(define-llvm llvm-set-instruction-call-conv (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetInstructionCallConv)
(define-llvm llvm-set-is-disjoint (_fun _LLVMValueRef _int -> _void) #:c-id LLVMSetIsDisjoint)
(define-llvm llvm-set-is-in-bounds (_fun _LLVMValueRef _int -> _void) #:c-id LLVMSetIsInBounds)
(define-llvm llvm-set-is-new-dbg-info-format (_fun _LLVMModuleRef _int -> _void) #:c-id LLVMSetIsNewDbgInfoFormat)
(define-llvm llvm-set-linkage (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetLinkage)
(define-llvm llvm-set-metadata (_fun _LLVMValueRef _uint _LLVMValueRef -> _void) #:c-id LLVMSetMetadata)
(define-llvm llvm-set-module-data-layout (_fun _LLVMModuleRef _LLVMTargetDataRef -> _void) #:c-id LLVMSetModuleDataLayout)
(define-llvm llvm-set-module-identifier (_fun _LLVMModuleRef _string _ulong -> _void) #:c-id LLVMSetModuleIdentifier)
(define-llvm llvm-set-module-inline-asm (_fun _LLVMModuleRef _string -> _void) #:c-id LLVMSetModuleInlineAsm)
(define-llvm llvm-set-module-inline-asm2 (_fun _LLVMModuleRef _string _ulong -> _void) #:c-id LLVMSetModuleInlineAsm2)
(define-llvm llvm-set-n-neg (_fun _LLVMValueRef _int -> _void) #:c-id LLVMSetNNeg)
(define-llvm llvm-set-nsw (_fun _LLVMValueRef _int -> _void) #:c-id LLVMSetNSW)
(define-llvm llvm-set-nuw (_fun _LLVMValueRef _int -> _void) #:c-id LLVMSetNUW)
(define-llvm llvm-set-normal-dest (_fun _LLVMValueRef _LLVMBasicBlockRef -> _void) #:c-id LLVMSetNormalDest)
(define-llvm llvm-set-operand (_fun _LLVMValueRef _uint _LLVMValueRef -> _void) #:c-id LLVMSetOperand)
(define-llvm llvm-set-ordering (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetOrdering)
(define-llvm llvm-set-param-alignment (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetParamAlignment)
(define-llvm llvm-set-parent-catch-switch (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMSetParentCatchSwitch)
(define-llvm llvm-set-personality-fn (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMSetPersonalityFn)
(define-llvm llvm-set-prefix-data (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMSetPrefixData)
(define-llvm llvm-set-prologue-data (_fun _LLVMValueRef _LLVMValueRef -> _void) #:c-id LLVMSetPrologueData)
(define-llvm llvm-set-section (_fun _LLVMValueRef _string -> _void) #:c-id LLVMSetSection)
(define-llvm llvm-set-source-file-name (_fun _LLVMModuleRef _string _ulong -> _void) #:c-id LLVMSetSourceFileName)
(define-llvm llvm-set-subprogram (_fun _LLVMValueRef _LLVMMetadataRef -> _void) #:c-id LLVMSetSubprogram)
(define-llvm llvm-set-successor (_fun _LLVMValueRef _uint _LLVMBasicBlockRef -> _void) #:c-id LLVMSetSuccessor)
(define-llvm llvm-set-tail-call (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetTailCall)
(define-llvm llvm-set-tail-call-kind (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetTailCallKind)
(define-llvm llvm-set-target (_fun _LLVMModuleRef _string -> _void) #:c-id LLVMSetTarget)
(define-llvm llvm-set-target-machine-asm-verbosity (_fun _LLVMTargetMachineRef _int -> _void) #:c-id LLVMSetTargetMachineAsmVerbosity)
(define-llvm llvm-set-target-machine-fast-i-sel (_fun _LLVMTargetMachineRef _int -> _void) #:c-id LLVMSetTargetMachineFastISel)
(define-llvm llvm-set-target-machine-global-i-sel (_fun _LLVMTargetMachineRef _int -> _void) #:c-id LLVMSetTargetMachineGlobalISel)
(define-llvm llvm-set-target-machine-global-i-sel-abort (_fun _LLVMTargetMachineRef _uint -> _void) #:c-id LLVMSetTargetMachineGlobalISelAbort)
(define-llvm llvm-set-target-machine-machine-outliner (_fun _LLVMTargetMachineRef _int -> _void) #:c-id LLVMSetTargetMachineMachineOutliner)
(define-llvm llvm-set-thread-local (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetThreadLocal)
(define-llvm llvm-set-thread-local-mode (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetThreadLocalMode)
(define-llvm llvm-set-unnamed-addr (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetUnnamedAddr)
(define-llvm llvm-set-unnamed-address (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetUnnamedAddress)
(define-llvm llvm-set-unwind-dest (_fun _LLVMValueRef _LLVMBasicBlockRef -> _void) #:c-id LLVMSetUnwindDest)
(define-llvm llvm-set-value-name (_fun _LLVMValueRef _string -> _void) #:c-id LLVMSetValueName)
(define-llvm llvm-set-value-name2 (_fun _LLVMValueRef _string _ulong -> _void) #:c-id LLVMSetValueName2)
(define-llvm llvm-set-visibility (_fun _LLVMValueRef _uint -> _void) #:c-id LLVMSetVisibility)
(define-llvm llvm-set-volatile (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetVolatile)
(define-llvm llvm-set-weak (_fun _LLVMValueRef _bool -> _void) #:c-id LLVMSetWeak)
(define-llvm llvm-shutdown (_fun -> _void) #:c-id LLVMShutdown)
(define-llvm llvm-size-of (_fun _LLVMTypeRef -> _LLVMValueRef) #:c-id LLVMSizeOf)
(define-llvm llvm-size-of-type-in-bits (_fun _LLVMTargetDataRef _LLVMTypeRef -> _ullong) #:c-id LLVMSizeOfTypeInBits)
(define-llvm llvm-start-multithreaded (_fun -> _int) #:c-id LLVMStartMultithreaded)
(define-llvm llvm-stop-multithreaded (_fun -> _void) #:c-id LLVMStopMultithreaded)
(define-llvm llvm-store-size-of-type (_fun _LLVMTargetDataRef _LLVMTypeRef -> _ullong) #:c-id LLVMStoreSizeOfType)
(define-llvm llvm-strip-module-debug-info (_fun (mod) ::
                                              (mod : _LLVMModuleRef)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "stripmoduledebuginfo failed")))
  #:c-id LLVMStripModuleDebugInfo)
(define-llvm llvm-struct-create-named (_fun _LLVMContextRef _string -> _LLVMTypeRef) #:c-id LLVMStructCreateNamed)
(define-llvm llvm-struct-get-type-at-index (_fun _LLVMTypeRef _uint -> _LLVMTypeRef) #:c-id LLVMStructGetTypeAtIndex)
(define-llvm llvm-struct-set-body (_fun (struct-ty [element-types (list)] [pack? #f]) ::
                                  (struct-ty : _LLVMTypeRef)
                                  (element-types : (_list i _LLVMTypeRef))
                                  (_uint = (length element-types))
                                  (pack? : _bool)
                                  -> _void)
  #:c-id LLVMStructSetBody)
(define-llvm llvm-struct-type (_fun (element-types [packed? #f]) ::
                                  (element-types : (_list i _LLVMTypeRef))
                                  (_uint = (length element-types))
                                  (packed? : _bool)
                                  -> _LLVMTypeRef)
  #:c-id LLVMStructType)
(define-llvm llvm-struct-type-in-context (_fun (ctx element-types [packed? #f]) ::
                                  (ctx : _LLVMContextRef)
                                  (element-types : (_list i _LLVMTypeRef))
                                  (_uint = (length element-types))
                                  (packed? : _bool)
                                  -> _LLVMTypeRef)
  #:c-id LLVMStructTypeInContext)
(define-llvm llvm-target-ext-type-in-context (_fun _LLVMContextRef _string _pointer _uint _pointer _uint -> _LLVMTypeRef) #:c-id LLVMTargetExtTypeInContext)
(define-llvm llvm-target-has-asm-backend (_fun _LLVMTargetRef -> _int) #:c-id LLVMTargetHasAsmBackend)
(define-llvm llvm-target-has-jit (_fun _LLVMTargetRef -> _int) #:c-id LLVMTargetHasJIT)
(define-llvm llvm-target-has-target-machine (_fun _LLVMTargetRef -> _int) #:c-id LLVMTargetHasTargetMachine)
(define-llvm llvm-target-machine-emit-to-file (_fun (targetmachine mod file-path param-3 out-param-4) ::
                                              (targetmachine : _LLVMTargetMachineRef)
                                              (mod : _LLVMModuleRef)
                                              (file-path : _string)
                                              (param-3 : _uint)
                                              (out-param-4 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "targetmachineemittofile failed")))
  #:c-id LLVMTargetMachineEmitToFile)
(define-llvm llvm-target-machine-emit-to-memory-buffer (_fun (targetmachine mod param-2 out-param-3 out-param-4) ::
                                              (targetmachine : _LLVMTargetMachineRef)
                                              (mod : _LLVMModuleRef)
                                              (param-2 : _uint)
                                              (out-param-3 : _pointer)
                                              (out-param-4 : _pointer)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "targetmachineemittomemorybuffer failed")))
  #:c-id LLVMTargetMachineEmitToMemoryBuffer)
(define-llvm llvm-target-machine-options-set-abi (_fun _LLVMTargetMachineOptionsRef _string -> _void) #:c-id LLVMTargetMachineOptionsSetABI)
(define-llvm llvm-target-machine-options-set-cpu (_fun _LLVMTargetMachineOptionsRef _string -> _void) #:c-id LLVMTargetMachineOptionsSetCPU)
(define-llvm llvm-target-machine-options-set-code-gen-opt-level (_fun _LLVMTargetMachineOptionsRef _uint -> _void) #:c-id LLVMTargetMachineOptionsSetCodeGenOptLevel)
(define-llvm llvm-target-machine-options-set-code-model (_fun _LLVMTargetMachineOptionsRef _uint -> _void) #:c-id LLVMTargetMachineOptionsSetCodeModel)
(define-llvm llvm-target-machine-options-set-features (_fun _LLVMTargetMachineOptionsRef _string -> _void) #:c-id LLVMTargetMachineOptionsSetFeatures)
(define-llvm llvm-target-machine-options-set-reloc-mode (_fun _LLVMTargetMachineOptionsRef _uint -> _void) #:c-id LLVMTargetMachineOptionsSetRelocMode)
(define-llvm llvm-temporary-md-node (_fun (ctx vals) ::
                                  (ctx : _LLVMContextRef)
                                  (vals : (_list i _LLVMMetadataRef))
                                  (_ulong = (length vals))
                                  -> _LLVMMetadataRef)
  #:c-id LLVMTemporaryMDNode)
(define-llvm llvm-token-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMTokenTypeInContext)
(define-llvm llvm-type-is-sized (_fun _LLVMTypeRef -> _int) #:c-id LLVMTypeIsSized)
(define-llvm llvm-typeof (_fun _LLVMValueRef -> _LLVMTypeRef) #:c-id LLVMTypeOf)
(define-llvm llvm-value-as-basic-block (_fun _LLVMValueRef -> _LLVMBasicBlockRef) #:c-id LLVMValueAsBasicBlock)
(define-llvm llvm-value-as-metadata (_fun _LLVMValueRef -> _LLVMMetadataRef) #:c-id LLVMValueAsMetadata)
(define-llvm llvm-value-is-basic-block (_fun _LLVMValueRef -> _int) #:c-id LLVMValueIsBasicBlock)
(define-llvm llvm-value-metadata-entries-get-kind (_fun _LLVMValueMetadataEntryRef _uint -> _uint) #:c-id LLVMValueMetadataEntriesGetKind)
(define-llvm llvm-value-metadata-entries-get-metadata (_fun _LLVMValueMetadataEntryRef _uint -> _LLVMMetadataRef) #:c-id LLVMValueMetadataEntriesGetMetadata)
(define-llvm llvm-vector-type (_fun _LLVMTypeRef _uint -> _LLVMTypeRef) #:c-id LLVMVectorType)
(define-llvm llvm-verify-function (_fun _LLVMValueRef
                                        (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                        (err : (_ptr o _string))
                                        -> (failure : _bool)
                                        -> (when failure (llvm-dispose-message err)))
  #:c-id LLVMVerifyFunction)
(define-llvm llvm-verify-module (_fun _LLVMModuleRef
                                      (_LLVMVerifierFailureAction = 'llvm-return-status-action)
                                      (err : (_ptr o _string))
                                      -> (failure : _bool)
                                      -> (when failure (llvm-dispose-message err)))
  #:c-id LLVMVerifyModule)
(define-llvm llvm-view-function-cfg (_fun _LLVMValueRef -> _void) #:c-id LLVMViewFunctionCFG)
(define-llvm llvm-view-function-cfg-only (_fun _LLVMValueRef -> _void) #:c-id LLVMViewFunctionCFGOnly)
(define-llvm llvm-void-type (_fun -> _LLVMTypeRef) #:c-id LLVMVoidType)
(define-llvm llvm-void-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMVoidTypeInContext)
(define-llvm llvm-write-bitcode-to-fd (_fun (mod param-1 param-2 param-3) ::
                                              (mod : _LLVMModuleRef)
                                              (param-1 : _int)
                                              (param-2 : _int)
                                              (param-3 : _int)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "writebitcodetofd failed")))
  #:c-id LLVMWriteBitcodeToFD)
(define-llvm llvm-write-bitcode-to-file (_fun (mod file-path) ::
                                              (mod : _LLVMModuleRef)
                                              (file-path : _string)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "writebitcodetofile failed")))
  #:c-id LLVMWriteBitcodeToFile)
(define-llvm llvm-write-bitcode-to-file-handle (_fun (mod param-1) ::
                                              (mod : _LLVMModuleRef)
                                              (param-1 : _int)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "writebitcodetofilehandle failed")))
  #:c-id LLVMWriteBitcodeToFileHandle)
(define-llvm llvm-write-bitcode-to-memory-buffer (_fun _LLVMModuleRef -> _LLVMMemoryBufferRef) #:c-id LLVMWriteBitcodeToMemoryBuffer)
(define-llvm llvmx86amx-type (_fun -> _LLVMTypeRef) #:c-id LLVMX86AMXType)
(define-llvm llvmx86amx-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMX86AMXTypeInContext)
(define-llvm llvmx86fp80-type (_fun -> _LLVMTypeRef) #:c-id LLVMX86FP80Type)
(define-llvm llvmx86fp80-type-in-context (_fun _LLVMContextRef -> _LLVMTypeRef) #:c-id LLVMX86FP80TypeInContext)
; AMDGPUCSCallConv = 90
; AMDGPUESCallConv = 96
; AMDGPUGSCallConv = 88
; AMDGPUHSCallConv = 93
; AMDGPUKERNELCallConv = 91
; AMDGPULSCallConv = 95
; AMDGPUPSCallConv = 89
; AMDGPUVSCallConv = 87
; ARMAAPCSCallConv = 67
; ARMAAPCSVFPCallConv = 68
; ARMAPCSCallConv = 66
; AShr = 22
; AVRBUILTINCallConv = 86
; AVRINTRCallConv = 84
; AVRSIGNALCallConv = 85
; AbortProcessAction = 0
; Add = 8
; AddrSpaceCast = 60
; Alloca = 26
; And = 23
; AnyComdatSelectionKind = 0
; AnyRegCallConv = 13
; AppendingLinkage = 7
; ArgumentValueKind = 0
; ArrayTypeKind = 11
; AssemblyFile = 0
; AtomicCmpXchg = 56
; AtomicOrderingAcquire = 4
; AtomicOrderingAcquireRelease = 6
; AtomicOrderingMonotonic = 2
; AtomicOrderingNotAtomic = 0
; AtomicOrderingRelease = 5
; AtomicOrderingSequentiallyConsistent = 7
; AtomicOrderingUnordered = 1
; AtomicRMW = 57
; AtomicRMWBinOpAdd = 1
; AtomicRMWBinOpAnd = 3
; AtomicRMWBinOpFAdd = 11
; AtomicRMWBinOpFMax = 13
; AtomicRMWBinOpFMin = 14
; AtomicRMWBinOpFSub = 12
; AtomicRMWBinOpMax = 7
; AtomicRMWBinOpMin = 8
; AtomicRMWBinOpNand = 4
; AtomicRMWBinOpOr = 5
; AtomicRMWBinOpSub = 2
; AtomicRMWBinOpUDecWrap = 16
; AtomicRMWBinOpUIncWrap = 15
; AtomicRMWBinOpUMax = 9
; AtomicRMWBinOpUMin = 10
; AtomicRMWBinOpUSubCond = 17
; AtomicRMWBinOpUSubSat = 18
; AtomicRMWBinOpXchg = 0
; AtomicRMWBinOpXor = 6
; AttributeFunctionIndex = -1
; AttributeReturnIndex = 0
; AvailableExternallyLinkage = 1
; BFloatTypeKind = 18
; BasicBlockValueKind = 1
; BigEndian = 0
; BinaryTypeArchive = 0
; BinaryTypeCOFF = 5
; BinaryTypeCOFFImportFile = 2
; BinaryTypeELF32B = 7
; BinaryTypeELF32L = 6
; BinaryTypeELF64B = 9
; BinaryTypeELF64L = 8
; BinaryTypeIR = 3
; BinaryTypeMachO32B = 11
; BinaryTypeMachO32L = 10
; BinaryTypeMachO64B = 13
; BinaryTypeMachO64L = 12
; BinaryTypeMachOUniversalBinary = 1
; BinaryTypeOffload = 15
; BinaryTypeWasm = 14
; BinaryTypeWinRes = 4
; BitCast = 41
; BlockAddressValueKind = 9
; Br = 2
; CCallConv = 0
; CXXFASTTLSCallConv = 17
; Call = 45
; CallBr = 67
; CatchPad = 63
; CatchRet = 62
; CatchSwitch = 65
; CleanupPad = 64
; CleanupRet = 61
; CodeGenLevelAggressive = 3
; CodeGenLevelDefault = 2
; CodeGenLevelLess = 1
; CodeGenLevelNone = 0
; CodeModelDefault = 0
; CodeModelJITDefault = 1
; CodeModelKernel = 4
; CodeModelLarge = 6
; CodeModelMedium = 5
; CodeModelSmall = 3
; CodeModelTiny = 2
; ColdCallConv = 9
; CommonLinkage = 14
; ConstantAggregateZeroValueKind = 15
; ConstantArrayValueKind = 11
; ConstantAsMetadataMetadataKind = 1
; ConstantDataArrayValueKind = 16
; ConstantDataVectorValueKind = 17
; ConstantExprValueKind = 10
; ConstantFPValueKind = 19
; ConstantIntValueKind = 18
; ConstantPointerNullValueKind = 20
; ConstantPtrAuthValueKind = 27
; ConstantStructValueKind = 12
; ConstantTargetNoneValueKind = 26
; ConstantTokenNoneValueKind = 21
; ConstantVectorValueKind = 13
; DIArgListMetadataKind = 34
; DIAssignIDMetadataKind = 35
; DIBasicTypeMetadataKind = 11
; DICommonBlockMetadataKind = 31
; DICompileUnitMetadataKind = 16
; DICompositeTypeMetadataKind = 13
; DIDerivedTypeMetadataKind = 12
; DIEnumeratorMetadataKind = 10
; DIExpressionMetadataKind = 6
; DIFileMetadataKind = 15
; DIFlagAccessibility = 3
; DIFlagAppleBlock = 8
; DIFlagArtificial = 64
; DIFlagBigEndian = 134217728
; DIFlagBitField = 524288
; DIFlagEnumClass = 16777216
; DIFlagExplicit = 128
; DIFlagFixedEnum = 16777216
; DIFlagFwdDecl = 4
; DIFlagIndirectVirtualBase = 36
; DIFlagIntroducedVirtual = 262144
; DIFlagLValueReference = 8192
; DIFlagLittleEndian = 268435456
; DIFlagMultipleInheritance = 131072
; DIFlagNoReturn = 1048576
; DIFlagNonTrivial = 67108864
; DIFlagObjcClassComplete = 512
; DIFlagObjectPointer = 1024
; DIFlagPrivate = 1
; DIFlagProtected = 2
; DIFlagPrototyped = 256
; DIFlagPtrToMemberRep = 196608
; DIFlagPublic = 3
; DIFlagRValueReference = 16384
; DIFlagReserved = 32768
; DIFlagReservedBit4 = 16
; DIFlagSingleInheritance = 65536
; DIFlagStaticMember = 4096
; DIFlagThunk = 33554432
; DIFlagTypePassByReference = 8388608
; DIFlagTypePassByValue = 4194304
; DIFlagVector = 2048
; DIFlagVirtual = 32
; DIFlagVirtualInheritance = 196608
; DIFlagZero = 0
; DIGenericSubrangeMetadataKind = 33
; DIGlobalVariableExpressionMetadataKind = 7
; DIGlobalVariableMetadataKind = 24
; DIImportedEntityMetadataKind = 28
; DILabelMetadataKind = 26
; DILexicalBlockFileMetadataKind = 19
; DILexicalBlockMetadataKind = 18
; DILocalVariableMetadataKind = 25
; DILocationMetadataKind = 5
; DIMacroFileMetadataKind = 30
; DIMacroMetadataKind = 29
; DIModuleMetadataKind = 21
; DINamespaceMetadataKind = 20
; DIObjCPropertyMetadataKind = 27
; DIStringTypeMetadataKind = 32
; DISubprogramMetadataKind = 17
; DISubrangeMetadataKind = 9
; DISubroutineTypeMetadataKind = 14
; DITemplateTypeParameterMetadataKind = 22
; DITemplateValueParameterMetadataKind = 23
; DLLExportLinkage = 11
; DLLExportStorageClass = 2
; DLLImportLinkage = 10
; DLLImportStorageClass = 1
; DSError = 0
; DSNote = 3
; DSRemark = 2
; DSWarning = 1
; DWARFEmissionFull = 1
; DWARFEmissionLineTablesOnly = 2
; DWARFEmissionNone = 0
; DWARFMacinfoRecordTypeDefine = 1
; DWARFMacinfoRecordTypeEndFile = 4
; DWARFMacinfoRecordTypeMacro = 2
; DWARFMacinfoRecordTypeStartFile = 3
; DWARFMacinfoRecordTypeVendorExt = 255
; DWARFSourceLanguageAda2005 = 44
; DWARFSourceLanguageAda2012 = 45
; DWARFSourceLanguageAda83 = 2
; DWARFSourceLanguageAda95 = 12
; DWARFSourceLanguageAssembly = 47
; DWARFSourceLanguageBLISS = 36
; DWARFSourceLanguageBORLAND_Delphi = 62
; DWARFSourceLanguageC = 1
; DWARFSourceLanguageC11 = 28
; DWARFSourceLanguageC17 = 42
; DWARFSourceLanguageC89 = 0
; DWARFSourceLanguageC99 = 11
; DWARFSourceLanguageCPP_for_OpenCL = 54
; DWARFSourceLanguageC_plus_plus = 3
; DWARFSourceLanguageC_plus_plus_03 = 24
; DWARFSourceLanguageC_plus_plus_11 = 25
; DWARFSourceLanguageC_plus_plus_14 = 32
; DWARFSourceLanguageC_plus_plus_17 = 40
; DWARFSourceLanguageC_plus_plus_20 = 41
; DWARFSourceLanguageC_sharp = 48
; DWARFSourceLanguageCobol74 = 4
; DWARFSourceLanguageCobol85 = 5
; DWARFSourceLanguageCrystal = 39
; DWARFSourceLanguageD = 18
; DWARFSourceLanguageDylan = 31
; DWARFSourceLanguageFortran03 = 33
; DWARFSourceLanguageFortran08 = 34
; DWARFSourceLanguageFortran18 = 43
; DWARFSourceLanguageFortran77 = 6
; DWARFSourceLanguageFortran90 = 7
; DWARFSourceLanguageFortran95 = 13
; DWARFSourceLanguageGLSL = 50
; DWARFSourceLanguageGLSL_ES = 51
; DWARFSourceLanguageGOOGLE_RenderScript = 61
; DWARFSourceLanguageGo = 21
; DWARFSourceLanguageHIP = 46
; DWARFSourceLanguageHLSL = 52
; DWARFSourceLanguageHaskell = 23
; DWARFSourceLanguageHylo = 58
; DWARFSourceLanguageJava = 10
; DWARFSourceLanguageJulia = 30
; DWARFSourceLanguageKotlin = 37
; DWARFSourceLanguageMetal = 59
; DWARFSourceLanguageMips_Assembler = 60
; DWARFSourceLanguageModula2 = 9
; DWARFSourceLanguageModula3 = 22
; DWARFSourceLanguageMojo = 49
; DWARFSourceLanguageMove = 57
; DWARFSourceLanguageOCaml = 26
; DWARFSourceLanguageObjC = 15
; DWARFSourceLanguageObjC_plus_plus = 16
; DWARFSourceLanguageOpenCL = 20
; DWARFSourceLanguageOpenCL_CPP = 53
; DWARFSourceLanguagePLI = 14
; DWARFSourceLanguagePascal83 = 8
; DWARFSourceLanguagePython = 19
; DWARFSourceLanguageRenderScript = 35
; DWARFSourceLanguageRuby = 56
; DWARFSourceLanguageRust = 27
; DWARFSourceLanguageSYCL = 55
; DWARFSourceLanguageSwift = 29
; DWARFSourceLanguageUPC = 17
; DWARFSourceLanguageZig = 38
; DefaultStorageClass = 0
; DefaultVisibility = 0
; DistinctMDOperandPlaceholderMetadataKind = 3
; DoubleTypeKind = 3
; ExactMatchComdatSelectionKind = 1
; ExternalLinkage = 0
; ExternalWeakLinkage = 12
; ExtractElement = 50
; ExtractValue = 53
; FAdd = 9
; FCmp = 43
; FDiv = 16
; FMul = 13
; FNeg = 66
; FP128TypeKind = 5
; FPExt = 38
; FPToSI = 34
; FPToUI = 33
; FPTrunc = 37
; FRem = 19
; FSub = 11
; FastCallConv = 8
; FastMathAll = 127
; FastMathAllowContract = 32
; FastMathAllowReassoc = 1
; FastMathAllowReciprocal = 16
; FastMathApproxFunc = 64
; FastMathNoInfs = 4
; FastMathNoNaNs = 2
; FastMathNoSignedZeros = 8
; FastMathNone = 0
; Fence = 55
; FloatTypeKind = 2
; Freeze = 68
; FunctionTypeKind = 9
; FunctionValueKind = 5
; GEPFlagInBounds = 1
; GEPFlagNUSW = 2
; GEPFlagNUW = 4
; GHCCallConv = 10
; GeneralDynamicTLSModel = 1
; GenericDINodeMetadataKind = 8
; GetElementPtr = 29
; GhostLinkage = 13
; GlobalAliasValueKind = 6
; GlobalIFuncValueKind = 7
; GlobalISelAbortDisable = 1
; GlobalISelAbortDisableWithDiag = 2
; GlobalISelAbortEnable = 0
; GlobalUnnamedAddr = 2
; GlobalVariableValueKind = 8
; HHVMCCallConv = 82
; HHVMCallConv = 81
; HalfTypeKind = 1
; HiPECallConv = 11
; HiddenVisibility = 1
; ICmp = 42
; IndirectBr = 4
; InitialExecTLSModel = 3
; InlineAsmDialectATT = 0
; InlineAsmDialectIntel = 1
; InlineAsmValueKind = 23
; InsertElement = 51
; InsertValue = 54
; InstructionValueKind = 24
; IntEQ = 32
; IntNE = 33
; IntSGE = 39
; IntSGT = 38
; IntSLE = 41
; IntSLT = 40
; IntToPtr = 40
; IntUGE = 35
; IntUGT = 34
; IntULE = 37
; IntULT = 36
; IntegerTypeKind = 8
; IntelOCLBICallConv = 77
; InternalLinkage = 8
; Invoke = 5
; JITSymbolGenericFlagsCallable = 4
; JITSymbolGenericFlagsExported = 1
; JITSymbolGenericFlagsMaterializationSideEffectsOnly = 8
; JITSymbolGenericFlagsNone = 0
; JITSymbolGenericFlagsWeak = 2
; LShr = 21
; LabelTypeKind = 7
; LandingPad = 59
; LandingPadCatch = 0
; LandingPadFilter = 1
; LargestComdatSelectionKind = 2
; LinkOnceAnyLinkage = 2
; LinkOnceODRAutoHideLinkage = 4
; LinkOnceODRLinkage = 3
; LinkerDestroySource = 0
; LinkerPreserveSource_Removed = 1
; LinkerPrivateLinkage = 15
; LinkerPrivateWeakLinkage = 16
; LittleEndian = 1
; Load = 27
; LocalAsMetadataMetadataKind = 2
; LocalDynamicTLSModel = 2
; LocalExecTLSModel = 4
; LocalUnnamedAddr = 1
; MDStringMetadataKind = 0
; MDTupleMetadataKind = 4
; MSP430BUILTINCallConv = 94
; MSP430INTRCallConv = 69
; MemoryDefValueKind = 3
; MemoryPhiValueKind = 4
; MemoryUseValueKind = 2
; MetadataAsValueValueKind = 22
; MetadataTypeKind = 14
; ModuleFlagBehaviorAppend = 4
; ModuleFlagBehaviorAppendUnique = 5
; ModuleFlagBehaviorError = 0
; ModuleFlagBehaviorOverride = 3
; ModuleFlagBehaviorRequire = 2
; ModuleFlagBehaviorWarning = 1
; Mul = 12
; NoDeduplicateComdatSelectionKind = 3
; NoUnnamedAddr = 0
; NotThreadLocal = 0
; ObjectFile = 1
; Or = 24
; OrcJITDylibLookupFlagsMatchAllSymbols = 1
; OrcJITDylibLookupFlagsMatchExportedSymbolsOnly = 0
; OrcLookupKindDLSym = 1
; OrcLookupKindStatic = 0
; OrcSymbolLookupFlagsRequiredSymbol = 0
; OrcSymbolLookupFlagsWeaklyReferencedSymbol = 1
; PHI = 44
; PPC_FP128TypeKind = 6
; PTXDeviceCallConv = 72
; PTXKernelCallConv = 71
; PointerTypeKind = 12
; PoisonValueValueKind = 25
; PreserveAllCallConv = 15
; PreserveMostCallConv = 14
; PrintMessageAction = 1
; PrivateLinkage = 9
; ProtectedVisibility = 2
; PtrToInt = 39
; RealOEQ = 1
; RealOGE = 3
; RealOGT = 2
; RealOLE = 5
; RealOLT = 4
; RealONE = 6
; RealORD = 7
; RealPredicateFalse = 0
; RealPredicateTrue = 15
; RealUEQ = 9
; RealUGE = 11
; RealUGT = 10
; RealULE = 13
; RealULT = 12
; RealUNE = 14
; RealUNO = 8
; RelocDefault = 0
; RelocDynamicNoPic = 3
; RelocPIC = 2
; RelocROPI = 4
; RelocROPI_RWPI = 6
; RelocRWPI = 5
; RelocStatic = 1
; RemarkTypeAnalysis = 3
; RemarkTypeAnalysisAliasing = 5
; RemarkTypeAnalysisFPCommute = 4
; RemarkTypeFailure = 6
; RemarkTypeMissed = 2
; RemarkTypePassed = 1
; RemarkTypeUnknown = 0
; Resume = 58
; Ret = 1
; ReturnStatusAction = 2
; SDiv = 15
; SExt = 32
; SIToFP = 36
; SPIRFUNCCallConv = 75
; SPIRKERNELCallConv = 76
; SRem = 18
; SameSizeComdatSelectionKind = 4
; ScalableVectorTypeKind = 17
; Select = 46
; Shl = 20
; ShuffleVector = 52
; Store = 28
; StructTypeKind = 10
; Sub = 10
; SwiftCallConv = 16
; Switch = 3
; TailCallKindMustTail = 2
; TailCallKindNoTail = 3
; TailCallKindNone = 0
; TailCallKindTail = 1
; TargetExtTypeKind = 20
; TokenTypeKind = 16
; Trunc = 30
; UDiv = 14
; UIToFP = 35
; URem = 17
; UndefValueValueKind = 14
; Unreachable = 7
; UserOp1 = 47
; UserOp2 = 48
; VAArg = 49
; VectorTypeKind = 13
; VoidTypeKind = 0
; WeakAnyLinkage = 5
; WeakODRLinkage = 6
; Win64CallConv = 79
; X8664SysVCallConv = 78
; X86FastcallCallConv = 65
; X86INTRCallConv = 83
; X86RegCallCallConv = 92
; X86StdcallCallConv = 64
; X86ThisCallCallConv = 70
; X86VectorCallCallConv = 80
; X86_AMXTypeKind = 19
; X86_FP80TypeKind = 4
; Xor = 25
; ZExt = 31
; LTO_CODEGEN_PIC_MODEL_DEFAULT = 3
; LTO_CODEGEN_PIC_MODEL_DYNAMIC = 1
; LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC = 2
; LTO_CODEGEN_PIC_MODEL_STATIC = 0
; LTO_DEBUG_MODEL_DWARF = 1
; LTO_DEBUG_MODEL_NONE = 0
; LTO_DS_ERROR = 0
; LTO_DS_NOTE = 2
; LTO_DS_REMARK = 3
; LTO_DS_WARNING = 1
; LTO_SYMBOL_ALIAS = 32768
; LTO_SYMBOL_ALIGNMENT_MASK = 31
; LTO_SYMBOL_COMDAT = 16384
; LTO_SYMBOL_DEFINITION_MASK = 1792
; LTO_SYMBOL_DEFINITION_REGULAR = 256
; LTO_SYMBOL_DEFINITION_TENTATIVE = 512
; LTO_SYMBOL_DEFINITION_UNDEFINED = 1024
; LTO_SYMBOL_DEFINITION_WEAK = 768
; LTO_SYMBOL_DEFINITION_WEAKUNDEF = 1280
; LTO_SYMBOL_PERMISSIONS_CODE = 160
; LTO_SYMBOL_PERMISSIONS_DATA = 192
; LTO_SYMBOL_PERMISSIONS_MASK = 224
; LTO_SYMBOL_PERMISSIONS_RODATA = 128
; LTO_SYMBOL_SCOPE_DEFAULT = 6144
; LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN = 10240
; LTO_SYMBOL_SCOPE_HIDDEN = 4096
; LTO_SYMBOL_SCOPE_INTERNAL = 2048
; LTO_SYMBOL_SCOPE_MASK = 14336
; LTO_SYMBOL_SCOPE_PROTECTED = 8192
; AMDGPUCSCallConv = 90
; AMDGPUESCallConv = 96
; AMDGPUGSCallConv = 88
; AMDGPUHSCallConv = 93
; AMDGPUKERNELCallConv = 91
; AMDGPULSCallConv = 95
; AMDGPUPSCallConv = 89
; AMDGPUVSCallConv = 87
; ARMAAPCSCallConv = 67
; ARMAAPCSVFPCallConv = 68
; ARMAPCSCallConv = 66
; AShr = 22
; AVRBUILTINCallConv = 86
; AVRINTRCallConv = 84
; AVRSIGNALCallConv = 85
; AbortProcessAction = 0
; Add = 8
; AddrSpaceCast = 60
; Alloca = 26
; And = 23
; AnyComdatSelectionKind = 0
; AnyRegCallConv = 13
; AppendingLinkage = 7
; ArgumentValueKind = 0
; ArrayTypeKind = 11
; AssemblyFile = 0
; AtomicCmpXchg = 56
; AtomicOrderingAcquire = 4
; AtomicOrderingAcquireRelease = 6
; AtomicOrderingMonotonic = 2
; AtomicOrderingNotAtomic = 0
; AtomicOrderingRelease = 5
; AtomicOrderingSequentiallyConsistent = 7
; AtomicOrderingUnordered = 1
; AtomicRMW = 57
; AtomicRMWBinOpAdd = 1
; AtomicRMWBinOpAnd = 3
; AtomicRMWBinOpFAdd = 11
; AtomicRMWBinOpFMax = 13
; AtomicRMWBinOpFMin = 14
; AtomicRMWBinOpFSub = 12
; AtomicRMWBinOpMax = 7
; AtomicRMWBinOpMin = 8
; AtomicRMWBinOpNand = 4
; AtomicRMWBinOpOr = 5
; AtomicRMWBinOpSub = 2
; AtomicRMWBinOpUDecWrap = 16
; AtomicRMWBinOpUIncWrap = 15
; AtomicRMWBinOpUMax = 9
; AtomicRMWBinOpUMin = 10
; AtomicRMWBinOpUSubCond = 17
; AtomicRMWBinOpUSubSat = 18
; AtomicRMWBinOpXchg = 0
; AtomicRMWBinOpXor = 6
; AttributeFunctionIndex = -1
; AttributeReturnIndex = 0
; AvailableExternallyLinkage = 1
; BFloatTypeKind = 18
; BasicBlockValueKind = 1
; BigEndian = 0
; BinaryTypeArchive = 0
; BinaryTypeCOFF = 5
; BinaryTypeCOFFImportFile = 2
; BinaryTypeELF32B = 7
; BinaryTypeELF32L = 6
; BinaryTypeELF64B = 9
; BinaryTypeELF64L = 8
; BinaryTypeIR = 3
; BinaryTypeMachO32B = 11
; BinaryTypeMachO32L = 10
; BinaryTypeMachO64B = 13
; BinaryTypeMachO64L = 12
; BinaryTypeMachOUniversalBinary = 1
; BinaryTypeOffload = 15
; BinaryTypeWasm = 14
; BinaryTypeWinRes = 4
; BitCast = 41
; BlockAddressValueKind = 9
; Br = 2
; CCallConv = 0
; CXXFASTTLSCallConv = 17
; Call = 45
; CallBr = 67
; CatchPad = 63
; CatchRet = 62
; CatchSwitch = 65
; CleanupPad = 64
; CleanupRet = 61
; CodeGenLevelAggressive = 3
; CodeGenLevelDefault = 2
; CodeGenLevelLess = 1
; CodeGenLevelNone = 0
; CodeModelDefault = 0
; CodeModelJITDefault = 1
; CodeModelKernel = 4
; CodeModelLarge = 6
; CodeModelMedium = 5
; CodeModelSmall = 3
; CodeModelTiny = 2
; ColdCallConv = 9
; CommonLinkage = 14
; ConstantAggregateZeroValueKind = 15
; ConstantArrayValueKind = 11
; ConstantAsMetadataMetadataKind = 1
; ConstantDataArrayValueKind = 16
; ConstantDataVectorValueKind = 17
; ConstantExprValueKind = 10
; ConstantFPValueKind = 19
; ConstantIntValueKind = 18
; ConstantPointerNullValueKind = 20
; ConstantPtrAuthValueKind = 27
; ConstantStructValueKind = 12
; ConstantTargetNoneValueKind = 26
; ConstantTokenNoneValueKind = 21
; ConstantVectorValueKind = 13
; DIArgListMetadataKind = 34
; DIAssignIDMetadataKind = 35
; DIBasicTypeMetadataKind = 11
; DICommonBlockMetadataKind = 31
; DICompileUnitMetadataKind = 16
; DICompositeTypeMetadataKind = 13
; DIDerivedTypeMetadataKind = 12
; DIEnumeratorMetadataKind = 10
; DIExpressionMetadataKind = 6
; DIFileMetadataKind = 15
; DIFlagAccessibility = 3
; DIFlagAppleBlock = 8
; DIFlagArtificial = 64
; DIFlagBigEndian = 134217728
; DIFlagBitField = 524288
; DIFlagEnumClass = 16777216
; DIFlagExplicit = 128
; DIFlagFixedEnum = 16777216
; DIFlagFwdDecl = 4
; DIFlagIndirectVirtualBase = 36
; DIFlagIntroducedVirtual = 262144
; DIFlagLValueReference = 8192
; DIFlagLittleEndian = 268435456
; DIFlagMultipleInheritance = 131072
; DIFlagNoReturn = 1048576
; DIFlagNonTrivial = 67108864
; DIFlagObjcClassComplete = 512
; DIFlagObjectPointer = 1024
; DIFlagPrivate = 1
; DIFlagProtected = 2
; DIFlagPrototyped = 256
; DIFlagPtrToMemberRep = 196608
; DIFlagPublic = 3
; DIFlagRValueReference = 16384
; DIFlagReserved = 32768
; DIFlagReservedBit4 = 16
; DIFlagSingleInheritance = 65536
; DIFlagStaticMember = 4096
; DIFlagThunk = 33554432
; DIFlagTypePassByReference = 8388608
; DIFlagTypePassByValue = 4194304
; DIFlagVector = 2048
; DIFlagVirtual = 32
; DIFlagVirtualInheritance = 196608
; DIFlagZero = 0
; DIGenericSubrangeMetadataKind = 33
; DIGlobalVariableExpressionMetadataKind = 7
; DIGlobalVariableMetadataKind = 24
; DIImportedEntityMetadataKind = 28
; DILabelMetadataKind = 26
; DILexicalBlockFileMetadataKind = 19
; DILexicalBlockMetadataKind = 18
; DILocalVariableMetadataKind = 25
; DILocationMetadataKind = 5
; DIMacroFileMetadataKind = 30
; DIMacroMetadataKind = 29
; DIModuleMetadataKind = 21
; DINamespaceMetadataKind = 20
; DIObjCPropertyMetadataKind = 27
; DIStringTypeMetadataKind = 32
; DISubprogramMetadataKind = 17
; DISubrangeMetadataKind = 9
; DISubroutineTypeMetadataKind = 14
; DITemplateTypeParameterMetadataKind = 22
; DITemplateValueParameterMetadataKind = 23
; DLLExportLinkage = 11
; DLLExportStorageClass = 2
; DLLImportLinkage = 10
; DLLImportStorageClass = 1
; DSError = 0
; DSNote = 3
; DSRemark = 2
; DSWarning = 1
; DWARFEmissionFull = 1
; DWARFEmissionLineTablesOnly = 2
; DWARFEmissionNone = 0
; DWARFMacinfoRecordTypeDefine = 1
; DWARFMacinfoRecordTypeEndFile = 4
; DWARFMacinfoRecordTypeMacro = 2
; DWARFMacinfoRecordTypeStartFile = 3
; DWARFMacinfoRecordTypeVendorExt = 255
; DWARFSourceLanguageAda2005 = 44
; DWARFSourceLanguageAda2012 = 45
; DWARFSourceLanguageAda83 = 2
; DWARFSourceLanguageAda95 = 12
; DWARFSourceLanguageAssembly = 47
; DWARFSourceLanguageBLISS = 36
; DWARFSourceLanguageBORLAND_Delphi = 62
; DWARFSourceLanguageC = 1
; DWARFSourceLanguageC11 = 28
; DWARFSourceLanguageC17 = 42
; DWARFSourceLanguageC89 = 0
; DWARFSourceLanguageC99 = 11
; DWARFSourceLanguageCPP_for_OpenCL = 54
; DWARFSourceLanguageC_plus_plus = 3
; DWARFSourceLanguageC_plus_plus_03 = 24
; DWARFSourceLanguageC_plus_plus_11 = 25
; DWARFSourceLanguageC_plus_plus_14 = 32
; DWARFSourceLanguageC_plus_plus_17 = 40
; DWARFSourceLanguageC_plus_plus_20 = 41
; DWARFSourceLanguageC_sharp = 48
; DWARFSourceLanguageCobol74 = 4
; DWARFSourceLanguageCobol85 = 5
; DWARFSourceLanguageCrystal = 39
; DWARFSourceLanguageD = 18
; DWARFSourceLanguageDylan = 31
; DWARFSourceLanguageFortran03 = 33
; DWARFSourceLanguageFortran08 = 34
; DWARFSourceLanguageFortran18 = 43
; DWARFSourceLanguageFortran77 = 6
; DWARFSourceLanguageFortran90 = 7
; DWARFSourceLanguageFortran95 = 13
; DWARFSourceLanguageGLSL = 50
; DWARFSourceLanguageGLSL_ES = 51
; DWARFSourceLanguageGOOGLE_RenderScript = 61
; DWARFSourceLanguageGo = 21
; DWARFSourceLanguageHIP = 46
; DWARFSourceLanguageHLSL = 52
; DWARFSourceLanguageHaskell = 23
; DWARFSourceLanguageHylo = 58
; DWARFSourceLanguageJava = 10
; DWARFSourceLanguageJulia = 30
; DWARFSourceLanguageKotlin = 37
; DWARFSourceLanguageMetal = 59
; DWARFSourceLanguageMips_Assembler = 60
; DWARFSourceLanguageModula2 = 9
; DWARFSourceLanguageModula3 = 22
; DWARFSourceLanguageMojo = 49
; DWARFSourceLanguageMove = 57
; DWARFSourceLanguageOCaml = 26
; DWARFSourceLanguageObjC = 15
; DWARFSourceLanguageObjC_plus_plus = 16
; DWARFSourceLanguageOpenCL = 20
; DWARFSourceLanguageOpenCL_CPP = 53
; DWARFSourceLanguagePLI = 14
; DWARFSourceLanguagePascal83 = 8
; DWARFSourceLanguagePython = 19
; DWARFSourceLanguageRenderScript = 35
; DWARFSourceLanguageRuby = 56
; DWARFSourceLanguageRust = 27
; DWARFSourceLanguageSYCL = 55
; DWARFSourceLanguageSwift = 29
; DWARFSourceLanguageUPC = 17
; DWARFSourceLanguageZig = 38
; DefaultStorageClass = 0
; DefaultVisibility = 0
; DistinctMDOperandPlaceholderMetadataKind = 3
; DoubleTypeKind = 3
; ExactMatchComdatSelectionKind = 1
; ExternalLinkage = 0
; ExternalWeakLinkage = 12
; ExtractElement = 50
; ExtractValue = 53
; FAdd = 9
; FCmp = 43
; FDiv = 16
; FMul = 13
; FNeg = 66
; FP128TypeKind = 5
; FPExt = 38
; FPToSI = 34
; FPToUI = 33
; FPTrunc = 37
; FRem = 19
; FSub = 11
; FastCallConv = 8
; FastMathAll = 127
; FastMathAllowContract = 32
; FastMathAllowReassoc = 1
; FastMathAllowReciprocal = 16
; FastMathApproxFunc = 64
; FastMathNoInfs = 4
; FastMathNoNaNs = 2
; FastMathNoSignedZeros = 8
; FastMathNone = 0
; Fence = 55
; FloatTypeKind = 2
; Freeze = 68
; FunctionTypeKind = 9
; FunctionValueKind = 5
; GEPFlagInBounds = 1
; GEPFlagNUSW = 2
; GEPFlagNUW = 4
; GHCCallConv = 10
; GeneralDynamicTLSModel = 1
; GenericDINodeMetadataKind = 8
; GetElementPtr = 29
; GhostLinkage = 13
; GlobalAliasValueKind = 6
; GlobalIFuncValueKind = 7
; GlobalISelAbortDisable = 1
; GlobalISelAbortDisableWithDiag = 2
; GlobalISelAbortEnable = 0
; GlobalUnnamedAddr = 2
; GlobalVariableValueKind = 8
; HHVMCCallConv = 82
; HHVMCallConv = 81
; HalfTypeKind = 1
; HiPECallConv = 11
; HiddenVisibility = 1
; ICmp = 42
; IndirectBr = 4
; InitialExecTLSModel = 3
; InlineAsmDialectATT = 0
; InlineAsmDialectIntel = 1
; InlineAsmValueKind = 23
; InsertElement = 51
; InsertValue = 54
; InstructionValueKind = 24
; IntEQ = 32
; IntNE = 33
; IntSGE = 39
; IntSGT = 38
; IntSLE = 41
; IntSLT = 40
; IntToPtr = 40
; IntUGE = 35
; IntUGT = 34
; IntULE = 37
; IntULT = 36
; IntegerTypeKind = 8
; IntelOCLBICallConv = 77
; InternalLinkage = 8
; Invoke = 5
; JITSymbolGenericFlagsCallable = 4
; JITSymbolGenericFlagsExported = 1
; JITSymbolGenericFlagsMaterializationSideEffectsOnly = 8
; JITSymbolGenericFlagsNone = 0
; JITSymbolGenericFlagsWeak = 2
; LShr = 21
; LabelTypeKind = 7
; LandingPad = 59
; LandingPadCatch = 0
; LandingPadFilter = 1
; LargestComdatSelectionKind = 2
; LinkOnceAnyLinkage = 2
; LinkOnceODRAutoHideLinkage = 4
; LinkOnceODRLinkage = 3
; LinkerDestroySource = 0
; LinkerPreserveSource_Removed = 1
; LinkerPrivateLinkage = 15
; LinkerPrivateWeakLinkage = 16
; LittleEndian = 1
; Load = 27
; LocalAsMetadataMetadataKind = 2
; LocalDynamicTLSModel = 2
; LocalExecTLSModel = 4
; LocalUnnamedAddr = 1
; MDStringMetadataKind = 0
; MDTupleMetadataKind = 4
; MSP430BUILTINCallConv = 94
; MSP430INTRCallConv = 69
; MemoryDefValueKind = 3
; MemoryPhiValueKind = 4
; MemoryUseValueKind = 2
; MetadataAsValueValueKind = 22
; MetadataTypeKind = 14
; ModuleFlagBehaviorAppend = 4
; ModuleFlagBehaviorAppendUnique = 5
; ModuleFlagBehaviorError = 0
; ModuleFlagBehaviorOverride = 3
; ModuleFlagBehaviorRequire = 2
; ModuleFlagBehaviorWarning = 1
; Mul = 12
; NoDeduplicateComdatSelectionKind = 3
; NoUnnamedAddr = 0
; NotThreadLocal = 0
; ObjectFile = 1
; Or = 24
; OrcJITDylibLookupFlagsMatchAllSymbols = 1
; OrcJITDylibLookupFlagsMatchExportedSymbolsOnly = 0
; OrcLookupKindDLSym = 1
; OrcLookupKindStatic = 0
; OrcSymbolLookupFlagsRequiredSymbol = 0
; OrcSymbolLookupFlagsWeaklyReferencedSymbol = 1
; PHI = 44
; PPC_FP128TypeKind = 6
; PTXDeviceCallConv = 72
; PTXKernelCallConv = 71
; PointerTypeKind = 12
; PoisonValueValueKind = 25
; PreserveAllCallConv = 15
; PreserveMostCallConv = 14
; PrintMessageAction = 1
; PrivateLinkage = 9
; ProtectedVisibility = 2
; PtrToInt = 39
; RealOEQ = 1
; RealOGE = 3
; RealOGT = 2
; RealOLE = 5
; RealOLT = 4
; RealONE = 6
; RealORD = 7
; RealPredicateFalse = 0
; RealPredicateTrue = 15
; RealUEQ = 9
; RealUGE = 11
; RealUGT = 10
; RealULE = 13
; RealULT = 12
; RealUNE = 14
; RealUNO = 8
; RelocDefault = 0
; RelocDynamicNoPic = 3
; RelocPIC = 2
; RelocROPI = 4
; RelocROPI_RWPI = 6
; RelocRWPI = 5
; RelocStatic = 1
; RemarkTypeAnalysis = 3
; RemarkTypeAnalysisAliasing = 5
; RemarkTypeAnalysisFPCommute = 4
; RemarkTypeFailure = 6
; RemarkTypeMissed = 2
; RemarkTypePassed = 1
; RemarkTypeUnknown = 0
; Resume = 58
; Ret = 1
; ReturnStatusAction = 2
; SDiv = 15
; SExt = 32
; SIToFP = 36
; SPIRFUNCCallConv = 75
; SPIRKERNELCallConv = 76
; SRem = 18
; SameSizeComdatSelectionKind = 4
; ScalableVectorTypeKind = 17
; Select = 46
; Shl = 20
; ShuffleVector = 52
; Store = 28
; StructTypeKind = 10
; Sub = 10
; SwiftCallConv = 16
; Switch = 3
; TailCallKindMustTail = 2
; TailCallKindNoTail = 3
; TailCallKindNone = 0
; TailCallKindTail = 1
; TargetExtTypeKind = 20
; TokenTypeKind = 16
; Trunc = 30
; UDiv = 14
; UIToFP = 35
; URem = 17
; UndefValueValueKind = 14
; Unreachable = 7
; UserOp1 = 47
; UserOp2 = 48
; VAArg = 49
; VectorTypeKind = 13
; VoidTypeKind = 0
; WeakAnyLinkage = 5
; WeakODRLinkage = 6
; Win64CallConv = 79
; X8664SysVCallConv = 78
; X86FastcallCallConv = 65
; X86INTRCallConv = 83
; X86RegCallCallConv = 92
; X86StdcallCallConv = 64
; X86ThisCallCallConv = 70
; X86VectorCallCallConv = 80
; X86_AMXTypeKind = 19
; X86_FP80TypeKind = 4
; Xor = 25
; ZExt = 31
; LTO_CODEGEN_PIC_MODEL_DEFAULT = 3
; LTO_CODEGEN_PIC_MODEL_DYNAMIC = 1
; LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC = 2
; LTO_CODEGEN_PIC_MODEL_STATIC = 0
; LTO_DEBUG_MODEL_DWARF = 1
; LTO_DEBUG_MODEL_NONE = 0
; LTO_DS_ERROR = 0
; LTO_DS_NOTE = 2
; LTO_DS_REMARK = 3
; LTO_DS_WARNING = 1
; LTO_SYMBOL_ALIAS = 32768
; LTO_SYMBOL_ALIGNMENT_MASK = 31
; LTO_SYMBOL_COMDAT = 16384
; LTO_SYMBOL_DEFINITION_MASK = 1792
; LTO_SYMBOL_DEFINITION_REGULAR = 256
; LTO_SYMBOL_DEFINITION_TENTATIVE = 512
; LTO_SYMBOL_DEFINITION_UNDEFINED = 1024
; LTO_SYMBOL_DEFINITION_WEAK = 768
; LTO_SYMBOL_DEFINITION_WEAKUNDEF = 1280
; LTO_SYMBOL_PERMISSIONS_CODE = 160
; LTO_SYMBOL_PERMISSIONS_DATA = 192
; LTO_SYMBOL_PERMISSIONS_MASK = 224
; LTO_SYMBOL_PERMISSIONS_RODATA = 128
; LTO_SYMBOL_SCOPE_DEFAULT = 6144
; LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN = 10240
; LTO_SYMBOL_SCOPE_HIDDEN = 4096
; LTO_SYMBOL_SCOPE_INTERNAL = 2048
; LTO_SYMBOL_SCOPE_MASK = 14336
; LTO_SYMBOL_SCOPE_PROTECTED = 8192
; AMDGPUCSCallConv = 90
; AMDGPUESCallConv = 96
; AMDGPUGSCallConv = 88
; AMDGPUHSCallConv = 93
; AMDGPUKERNELCallConv = 91
; AMDGPULSCallConv = 95
; AMDGPUPSCallConv = 89
; AMDGPUVSCallConv = 87
; ARMAAPCSCallConv = 67
; ARMAAPCSVFPCallConv = 68
; ARMAPCSCallConv = 66
; AShr = 22
; AVRBUILTINCallConv = 86
; AVRINTRCallConv = 84
; AVRSIGNALCallConv = 85
; AbortProcessAction = 0
; Add = 8
; AddrSpaceCast = 60
; Alloca = 26
; And = 23
; AnyComdatSelectionKind = 0
; AnyRegCallConv = 13
; AppendingLinkage = 7
; ArgumentValueKind = 0
; ArrayTypeKind = 11
; AssemblyFile = 0
; AtomicCmpXchg = 56
; AtomicOrderingAcquire = 4
; AtomicOrderingAcquireRelease = 6
; AtomicOrderingMonotonic = 2
; AtomicOrderingNotAtomic = 0
; AtomicOrderingRelease = 5
; AtomicOrderingSequentiallyConsistent = 7
; AtomicOrderingUnordered = 1
; AtomicRMW = 57
; AtomicRMWBinOpAdd = 1
; AtomicRMWBinOpAnd = 3
; AtomicRMWBinOpFAdd = 11
; AtomicRMWBinOpFMax = 13
; AtomicRMWBinOpFMin = 14
; AtomicRMWBinOpFSub = 12
; AtomicRMWBinOpMax = 7
; AtomicRMWBinOpMin = 8
; AtomicRMWBinOpNand = 4
; AtomicRMWBinOpOr = 5
; AtomicRMWBinOpSub = 2
; AtomicRMWBinOpUDecWrap = 16
; AtomicRMWBinOpUIncWrap = 15
; AtomicRMWBinOpUMax = 9
; AtomicRMWBinOpUMin = 10
; AtomicRMWBinOpUSubCond = 17
; AtomicRMWBinOpUSubSat = 18
; AtomicRMWBinOpXchg = 0
; AtomicRMWBinOpXor = 6
; AttributeFunctionIndex = -1
; AttributeReturnIndex = 0
; AvailableExternallyLinkage = 1
; BFloatTypeKind = 18
; BasicBlockValueKind = 1
; BigEndian = 0
; BinaryTypeArchive = 0
; BinaryTypeCOFF = 5
; BinaryTypeCOFFImportFile = 2
; BinaryTypeELF32B = 7
; BinaryTypeELF32L = 6
; BinaryTypeELF64B = 9
; BinaryTypeELF64L = 8
; BinaryTypeIR = 3
; BinaryTypeMachO32B = 11
; BinaryTypeMachO32L = 10
; BinaryTypeMachO64B = 13
; BinaryTypeMachO64L = 12
; BinaryTypeMachOUniversalBinary = 1
; BinaryTypeOffload = 15
; BinaryTypeWasm = 14
; BinaryTypeWinRes = 4
; BitCast = 41
; BlockAddressValueKind = 9
; Br = 2
; CCallConv = 0
; CXXFASTTLSCallConv = 17
; Call = 45
; CallBr = 67
; CatchPad = 63
; CatchRet = 62
; CatchSwitch = 65
; CleanupPad = 64
; CleanupRet = 61
; CodeGenLevelAggressive = 3
; CodeGenLevelDefault = 2
; CodeGenLevelLess = 1
; CodeGenLevelNone = 0
; CodeModelDefault = 0
; CodeModelJITDefault = 1
; CodeModelKernel = 4
; CodeModelLarge = 6
; CodeModelMedium = 5
; CodeModelSmall = 3
; CodeModelTiny = 2
; ColdCallConv = 9
; CommonLinkage = 14
; ConstantAggregateZeroValueKind = 15
; ConstantArrayValueKind = 11
; ConstantAsMetadataMetadataKind = 1
; ConstantDataArrayValueKind = 16
; ConstantDataVectorValueKind = 17
; ConstantExprValueKind = 10
; ConstantFPValueKind = 19
; ConstantIntValueKind = 18
; ConstantPointerNullValueKind = 20
; ConstantPtrAuthValueKind = 27
; ConstantStructValueKind = 12
; ConstantTargetNoneValueKind = 26
; ConstantTokenNoneValueKind = 21
; ConstantVectorValueKind = 13
; DIArgListMetadataKind = 34
; DIAssignIDMetadataKind = 35
; DIBasicTypeMetadataKind = 11
; DICommonBlockMetadataKind = 31
; DICompileUnitMetadataKind = 16
; DICompositeTypeMetadataKind = 13
; DIDerivedTypeMetadataKind = 12
; DIEnumeratorMetadataKind = 10
; DIExpressionMetadataKind = 6
; DIFileMetadataKind = 15
; DIFlagAccessibility = 3
; DIFlagAppleBlock = 8
; DIFlagArtificial = 64
; DIFlagBigEndian = 134217728
; DIFlagBitField = 524288
; DIFlagEnumClass = 16777216
; DIFlagExplicit = 128
; DIFlagFixedEnum = 16777216
; DIFlagFwdDecl = 4
; DIFlagIndirectVirtualBase = 36
; DIFlagIntroducedVirtual = 262144
; DIFlagLValueReference = 8192
; DIFlagLittleEndian = 268435456
; DIFlagMultipleInheritance = 131072
; DIFlagNoReturn = 1048576
; DIFlagNonTrivial = 67108864
; DIFlagObjcClassComplete = 512
; DIFlagObjectPointer = 1024
; DIFlagPrivate = 1
; DIFlagProtected = 2
; DIFlagPrototyped = 256
; DIFlagPtrToMemberRep = 196608
; DIFlagPublic = 3
; DIFlagRValueReference = 16384
; DIFlagReserved = 32768
; DIFlagReservedBit4 = 16
; DIFlagSingleInheritance = 65536
; DIFlagStaticMember = 4096
; DIFlagThunk = 33554432
; DIFlagTypePassByReference = 8388608
; DIFlagTypePassByValue = 4194304
; DIFlagVector = 2048
; DIFlagVirtual = 32
; DIFlagVirtualInheritance = 196608
; DIFlagZero = 0
; DIGenericSubrangeMetadataKind = 33
; DIGlobalVariableExpressionMetadataKind = 7
; DIGlobalVariableMetadataKind = 24
; DIImportedEntityMetadataKind = 28
; DILabelMetadataKind = 26
; DILexicalBlockFileMetadataKind = 19
; DILexicalBlockMetadataKind = 18
; DILocalVariableMetadataKind = 25
; DILocationMetadataKind = 5
; DIMacroFileMetadataKind = 30
; DIMacroMetadataKind = 29
; DIModuleMetadataKind = 21
; DINamespaceMetadataKind = 20
; DIObjCPropertyMetadataKind = 27
; DIStringTypeMetadataKind = 32
; DISubprogramMetadataKind = 17
; DISubrangeMetadataKind = 9
; DISubroutineTypeMetadataKind = 14
; DITemplateTypeParameterMetadataKind = 22
; DITemplateValueParameterMetadataKind = 23
; DLLExportLinkage = 11
; DLLExportStorageClass = 2
; DLLImportLinkage = 10
; DLLImportStorageClass = 1
; DSError = 0
; DSNote = 3
; DSRemark = 2
; DSWarning = 1
; DWARFEmissionFull = 1
; DWARFEmissionLineTablesOnly = 2
; DWARFEmissionNone = 0
; DWARFMacinfoRecordTypeDefine = 1
; DWARFMacinfoRecordTypeEndFile = 4
; DWARFMacinfoRecordTypeMacro = 2
; DWARFMacinfoRecordTypeStartFile = 3
; DWARFMacinfoRecordTypeVendorExt = 255
; DWARFSourceLanguageAda2005 = 44
; DWARFSourceLanguageAda2012 = 45
; DWARFSourceLanguageAda83 = 2
; DWARFSourceLanguageAda95 = 12
; DWARFSourceLanguageAssembly = 47
; DWARFSourceLanguageBLISS = 36
; DWARFSourceLanguageBORLAND_Delphi = 62
; DWARFSourceLanguageC = 1
; DWARFSourceLanguageC11 = 28
; DWARFSourceLanguageC17 = 42
; DWARFSourceLanguageC89 = 0
; DWARFSourceLanguageC99 = 11
; DWARFSourceLanguageCPP_for_OpenCL = 54
; DWARFSourceLanguageC_plus_plus = 3
; DWARFSourceLanguageC_plus_plus_03 = 24
; DWARFSourceLanguageC_plus_plus_11 = 25
; DWARFSourceLanguageC_plus_plus_14 = 32
; DWARFSourceLanguageC_plus_plus_17 = 40
; DWARFSourceLanguageC_plus_plus_20 = 41
; DWARFSourceLanguageC_sharp = 48
; DWARFSourceLanguageCobol74 = 4
; DWARFSourceLanguageCobol85 = 5
; DWARFSourceLanguageCrystal = 39
; DWARFSourceLanguageD = 18
; DWARFSourceLanguageDylan = 31
; DWARFSourceLanguageFortran03 = 33
; DWARFSourceLanguageFortran08 = 34
; DWARFSourceLanguageFortran18 = 43
; DWARFSourceLanguageFortran77 = 6
; DWARFSourceLanguageFortran90 = 7
; DWARFSourceLanguageFortran95 = 13
; DWARFSourceLanguageGLSL = 50
; DWARFSourceLanguageGLSL_ES = 51
; DWARFSourceLanguageGOOGLE_RenderScript = 61
; DWARFSourceLanguageGo = 21
; DWARFSourceLanguageHIP = 46
; DWARFSourceLanguageHLSL = 52
; DWARFSourceLanguageHaskell = 23
; DWARFSourceLanguageHylo = 58
; DWARFSourceLanguageJava = 10
; DWARFSourceLanguageJulia = 30
; DWARFSourceLanguageKotlin = 37
; DWARFSourceLanguageMetal = 59
; DWARFSourceLanguageMips_Assembler = 60
; DWARFSourceLanguageModula2 = 9
; DWARFSourceLanguageModula3 = 22
; DWARFSourceLanguageMojo = 49
; DWARFSourceLanguageMove = 57
; DWARFSourceLanguageOCaml = 26
; DWARFSourceLanguageObjC = 15
; DWARFSourceLanguageObjC_plus_plus = 16
; DWARFSourceLanguageOpenCL = 20
; DWARFSourceLanguageOpenCL_CPP = 53
; DWARFSourceLanguagePLI = 14
; DWARFSourceLanguagePascal83 = 8
; DWARFSourceLanguagePython = 19
; DWARFSourceLanguageRenderScript = 35
; DWARFSourceLanguageRuby = 56
; DWARFSourceLanguageRust = 27
; DWARFSourceLanguageSYCL = 55
; DWARFSourceLanguageSwift = 29
; DWARFSourceLanguageUPC = 17
; DWARFSourceLanguageZig = 38
; DefaultStorageClass = 0
; DefaultVisibility = 0
; DistinctMDOperandPlaceholderMetadataKind = 3
; DoubleTypeKind = 3
; ExactMatchComdatSelectionKind = 1
; ExternalLinkage = 0
; ExternalWeakLinkage = 12
; ExtractElement = 50
; ExtractValue = 53
; FAdd = 9
; FCmp = 43
; FDiv = 16
; FMul = 13
; FNeg = 66
; FP128TypeKind = 5
; FPExt = 38
; FPToSI = 34
; FPToUI = 33
; FPTrunc = 37
; FRem = 19
; FSub = 11
; FastCallConv = 8
; FastMathAll = 127
; FastMathAllowContract = 32
; FastMathAllowReassoc = 1
; FastMathAllowReciprocal = 16
; FastMathApproxFunc = 64
; FastMathNoInfs = 4
; FastMathNoNaNs = 2
; FastMathNoSignedZeros = 8
; FastMathNone = 0
; Fence = 55
; FloatTypeKind = 2
; Freeze = 68
; FunctionTypeKind = 9
; FunctionValueKind = 5
; GEPFlagInBounds = 1
; GEPFlagNUSW = 2
; GEPFlagNUW = 4
; GHCCallConv = 10
; GeneralDynamicTLSModel = 1
; GenericDINodeMetadataKind = 8
; GetElementPtr = 29
; GhostLinkage = 13
; GlobalAliasValueKind = 6
; GlobalIFuncValueKind = 7
; GlobalISelAbortDisable = 1
; GlobalISelAbortDisableWithDiag = 2
; GlobalISelAbortEnable = 0
; GlobalUnnamedAddr = 2
; GlobalVariableValueKind = 8
; HHVMCCallConv = 82
; HHVMCallConv = 81
; HalfTypeKind = 1
; HiPECallConv = 11
; HiddenVisibility = 1
; ICmp = 42
; IndirectBr = 4
; InitialExecTLSModel = 3
; InlineAsmDialectATT = 0
; InlineAsmDialectIntel = 1
; InlineAsmValueKind = 23
; InsertElement = 51
; InsertValue = 54
; InstructionValueKind = 24
; IntEQ = 32
; IntNE = 33
; IntSGE = 39
; IntSGT = 38
; IntSLE = 41
; IntSLT = 40
; IntToPtr = 40
; IntUGE = 35
; IntUGT = 34
; IntULE = 37
; IntULT = 36
; IntegerTypeKind = 8
; IntelOCLBICallConv = 77
; InternalLinkage = 8
; Invoke = 5
; JITSymbolGenericFlagsCallable = 4
; JITSymbolGenericFlagsExported = 1
; JITSymbolGenericFlagsMaterializationSideEffectsOnly = 8
; JITSymbolGenericFlagsNone = 0
; JITSymbolGenericFlagsWeak = 2
; LShr = 21
; LabelTypeKind = 7
; LandingPad = 59
; LandingPadCatch = 0
; LandingPadFilter = 1
; LargestComdatSelectionKind = 2
; LinkOnceAnyLinkage = 2
; LinkOnceODRAutoHideLinkage = 4
; LinkOnceODRLinkage = 3
; LinkerDestroySource = 0
; LinkerPreserveSource_Removed = 1
; LinkerPrivateLinkage = 15
; LinkerPrivateWeakLinkage = 16
; LittleEndian = 1
; Load = 27
; LocalAsMetadataMetadataKind = 2
; LocalDynamicTLSModel = 2
; LocalExecTLSModel = 4
; LocalUnnamedAddr = 1
; MDStringMetadataKind = 0
; MDTupleMetadataKind = 4
; MSP430BUILTINCallConv = 94
; MSP430INTRCallConv = 69
; MemoryDefValueKind = 3
; MemoryPhiValueKind = 4
; MemoryUseValueKind = 2
; MetadataAsValueValueKind = 22
; MetadataTypeKind = 14
; ModuleFlagBehaviorAppend = 4
; ModuleFlagBehaviorAppendUnique = 5
; ModuleFlagBehaviorError = 0
; ModuleFlagBehaviorOverride = 3
; ModuleFlagBehaviorRequire = 2
; ModuleFlagBehaviorWarning = 1
; Mul = 12
; NoDeduplicateComdatSelectionKind = 3
; NoUnnamedAddr = 0
; NotThreadLocal = 0
; ObjectFile = 1
; Or = 24
; OrcJITDylibLookupFlagsMatchAllSymbols = 1
; OrcJITDylibLookupFlagsMatchExportedSymbolsOnly = 0
; OrcLookupKindDLSym = 1
; OrcLookupKindStatic = 0
; OrcSymbolLookupFlagsRequiredSymbol = 0
; OrcSymbolLookupFlagsWeaklyReferencedSymbol = 1
; PHI = 44
; PPC_FP128TypeKind = 6
; PTXDeviceCallConv = 72
; PTXKernelCallConv = 71
; PointerTypeKind = 12
; PoisonValueValueKind = 25
; PreserveAllCallConv = 15
; PreserveMostCallConv = 14
; PrintMessageAction = 1
; PrivateLinkage = 9
; ProtectedVisibility = 2
; PtrToInt = 39
; RealOEQ = 1
; RealOGE = 3
; RealOGT = 2
; RealOLE = 5
; RealOLT = 4
; RealONE = 6
; RealORD = 7
; RealPredicateFalse = 0
; RealPredicateTrue = 15
; RealUEQ = 9
; RealUGE = 11
; RealUGT = 10
; RealULE = 13
; RealULT = 12
; RealUNE = 14
; RealUNO = 8
; RelocDefault = 0
; RelocDynamicNoPic = 3
; RelocPIC = 2
; RelocROPI = 4
; RelocROPI_RWPI = 6
; RelocRWPI = 5
; RelocStatic = 1
; RemarkTypeAnalysis = 3
; RemarkTypeAnalysisAliasing = 5
; RemarkTypeAnalysisFPCommute = 4
; RemarkTypeFailure = 6
; RemarkTypeMissed = 2
; RemarkTypePassed = 1
; RemarkTypeUnknown = 0
; Resume = 58
; Ret = 1
; ReturnStatusAction = 2
; SDiv = 15
; SExt = 32
; SIToFP = 36
; SPIRFUNCCallConv = 75
; SPIRKERNELCallConv = 76
; SRem = 18
; SameSizeComdatSelectionKind = 4
; ScalableVectorTypeKind = 17
; Select = 46
; Shl = 20
; ShuffleVector = 52
; Store = 28
; StructTypeKind = 10
; Sub = 10
; SwiftCallConv = 16
; Switch = 3
; TailCallKindMustTail = 2
; TailCallKindNoTail = 3
; TailCallKindNone = 0
; TailCallKindTail = 1
; TargetExtTypeKind = 20
; TokenTypeKind = 16
; Trunc = 30
; UDiv = 14
; UIToFP = 35
; URem = 17
; UndefValueValueKind = 14
; Unreachable = 7
; UserOp1 = 47
; UserOp2 = 48
; VAArg = 49
; VectorTypeKind = 13
; VoidTypeKind = 0
; WeakAnyLinkage = 5
; WeakODRLinkage = 6
; Win64CallConv = 79
; X8664SysVCallConv = 78
; X86FastcallCallConv = 65
; X86INTRCallConv = 83
; X86RegCallCallConv = 92
; X86StdcallCallConv = 64
; X86ThisCallCallConv = 70
; X86VectorCallCallConv = 80
; X86_AMXTypeKind = 19
; X86_FP80TypeKind = 4
; Xor = 25
; ZExt = 31
; LTO_CODEGEN_PIC_MODEL_DEFAULT = 3
; LTO_CODEGEN_PIC_MODEL_DYNAMIC = 1
; LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC = 2
; LTO_CODEGEN_PIC_MODEL_STATIC = 0
; LTO_DEBUG_MODEL_DWARF = 1
; LTO_DEBUG_MODEL_NONE = 0
; LTO_DS_ERROR = 0
; LTO_DS_NOTE = 2
; LTO_DS_REMARK = 3
; LTO_DS_WARNING = 1
; LTO_SYMBOL_ALIAS = 32768
; LTO_SYMBOL_ALIGNMENT_MASK = 31
; LTO_SYMBOL_COMDAT = 16384
; LTO_SYMBOL_DEFINITION_MASK = 1792
; LTO_SYMBOL_DEFINITION_REGULAR = 256
; LTO_SYMBOL_DEFINITION_TENTATIVE = 512
; LTO_SYMBOL_DEFINITION_UNDEFINED = 1024
; LTO_SYMBOL_DEFINITION_WEAK = 768
; LTO_SYMBOL_DEFINITION_WEAKUNDEF = 1280
; LTO_SYMBOL_PERMISSIONS_CODE = 160
; LTO_SYMBOL_PERMISSIONS_DATA = 192
; LTO_SYMBOL_PERMISSIONS_MASK = 224
; LTO_SYMBOL_PERMISSIONS_RODATA = 128
; LTO_SYMBOL_SCOPE_DEFAULT = 6144
; LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN = 10240
; LTO_SYMBOL_SCOPE_HIDDEN = 4096
; LTO_SYMBOL_SCOPE_INTERNAL = 2048
; LTO_SYMBOL_SCOPE_MASK = 14336
; LTO_SYMBOL_SCOPE_PROTECTED = 8192
; High-level wrapper functions
(define llvm-module llvm-module-create-with-name)
(define llvm-builder-create llvm-create-builder)
(define llvm-builder-position-at-end llvm-position-builder-at-end)
(define llvm-generic-value->int llvm-generic-value-to-int)
(define llvm-build-int-cmp llvm-build-icmp)
(define llvm-build-string-ptr llvm-build-global-string-ptr)
(define llvm-module->string llvm-print-module-to-string)
(define llvm-pass-manager-create llvm-create-pass-manager)
(define llvm-pass-manager-run llvm-run-pass-manager)

; Simple module verification wrapper
(define llvm-generic-value->float llvm-generic-value-to-float)
(define llvm-build-float-cmp llvm-build-fcmp)
(define llvm-build-string llvm-build-global-string)

(define (llvm-module-verify mod)
  (llvm-verify-module mod))
(define (llvm-function-verify func)
  (llvm-verify-function func))

(define (llvm-add-struct-type mod element-types [pack? #f])
  (define ctx (llvm-get-module-context mod))
  (define struct-ty (llvm-struct-create-named ctx ""))
  (llvm-struct-set-body struct-ty element-types pack?)
  struct-ty)

; End of generated bindings

