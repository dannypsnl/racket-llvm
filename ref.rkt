#lang at-exp racket/base

(require ffi/unsafe)
(require scribble/srcdoc
         (for-doc scribble/manual ffi/unsafe racket/base))

(provide
 (thing-doc _LLVMModuleRef ctype? @{pointer to LLVMOpaqueModule})
 (thing-doc _LLVMContextRef ctype? @{pointer to LLVMContextRef})
 (thing-doc _LLVMTypeRef ctype? @{pointer to LLVMOpaqueType})
 (thing-doc _LLVMValueRef ctype? @{pointer to LLVMOpaqueValue})
 (thing-doc _LLVMBasicBlockRef ctype? @{pointer to LLVMOpaqueBasicBlock})
 (thing-doc _LLVMBuilderRef ctype? @{pointer to LLVMOpaqueBuilder})
 (thing-doc _LLVMGenericValueRef ctype? @{pointer to LLVMOpaqueGenericValue})
 (thing-doc _LLVMPassManagerRef ctype? @{pointer to LLVMOpaquePassManager})
 (thing-doc _LLVMPassManagerBuilderRef ctype? @{pointer to LLVMOpaquePassManagerBuilder}))
(define _LLVMModuleRef (_cpointer 'LLVMOpaqueModule))
(define _LLVMContextRef (_cpointer 'LLVMContextRef))
(define _LLVMTypeRef (_cpointer 'LLVMOpaqueType))
(define _LLVMValueRef (_cpointer 'LLVMOpaqueValue))
(define _LLVMBasicBlockRef (_cpointer 'LLVMOpaqueBasicBlock))
(define _LLVMBuilderRef (_cpointer 'LLVMOpaqueBuilder))
(define _LLVMGenericValueRef (_cpointer 'LLVMOpaqueGenericValue))
(define _LLVMPassManagerRef (_cpointer 'LLVMOpaquePassManager))
(define _LLVMPassManagerBuilderRef (_cpointer 'LLVMOpaquePassManagerBuilder))
