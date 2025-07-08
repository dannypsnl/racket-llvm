#lang racket
(provide llvm-pass-manager-builder-create
         llvm-pass-manager-builder-set-opt-level
         llvm-pass-manager-builder-populate-module-pass-manager
         llvm-pass-manager-builder-populate-function-pass-manager
         llvm-pass-manager-create
         llvm-pass-manager-run
         llvm-function-pass-manager-create)
(require ffi/unsafe
         "../definer.rkt"
         "ref.rkt")

#| Pass manager builder |#
(define-llvm llvm-pass-manager-builder-create (_fun -> _LLVMPassManagerBuilderRef)
  #:c-id LLVMPassManagerBuilderCreate)

(define-llvm llvm-pass-manager-builder-set-opt-level
  (_fun _LLVMPassManagerBuilderRef
        _uint
        -> _void)
  #:c-id LLVMPassManagerBuilderSetOptLevel)

(define-llvm llvm-pass-manager-builder-populate-module-pass-manager
  (_fun _LLVMPassManagerBuilderRef
        _LLVMPassManagerRef
        -> _void)
  #:c-id LLVMPassManagerBuilderPopulateModulePassManager)

(define-llvm llvm-pass-manager-builder-populate-function-pass-manager
  (_fun _LLVMPassManagerBuilderRef
        _LLVMPassManagerRef
        -> _void)
  #:c-id LLVMPassManagerBuilderPopulateFunctionPassManager)

#| Whole module pass manager |#
(define-llvm llvm-pass-manager-create (_fun -> _LLVMPassManagerRef)
  #:c-id LLVMCreatePassManager)

(define-llvm llvm-pass-manager-run (_fun _LLVMPassManagerRef
                                         _LLVMModuleRef
                                         -> _bool)
  #:c-id LLVMRunPassManager)

#| Function pass manager |#
(define-llvm llvm-function-pass-manager-create (_fun _LLVMModuleRef -> _LLVMPassManagerRef)
  #:c-id LLVMCreateFunctionPassManagerForModule)
