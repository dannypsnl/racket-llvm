#lang racket

(provide llvm-link-in-mcjit
         llvm-initialize-native-target
         llvm-create-execution-engine-for-module
         llvm-run-function)

(require ffi/unsafe
         "definer.rkt")

(define _LLVMExecutionEngineRef (_cpointer 'LLVMOpaqueExecutionEngine))

(define-llvm llvm-link-in-mcjit (_fun -> _void) #:c-id LLVMLinkInMCJIT)

;TODO: figure out a way of replacing X86 with the current arch
(define-llvm llvm-initialize-native-target (_fun -> (result : _bool)
                                                 -> (when result
                                                      (error "Failed to initialize native target")))
  #:c-id LLVMInitializeX86Target)

(define-llvm llvm-create-execution-engine-for-module
  (_fun (eng : (_ptr o _LLVMExecutionEngineRef))
        _LLVMModuleRef
        (err : (_ptr o _string))
        -> (result : _int)
        -> (cond
             [err (error err)] ;TODO: use `llvm-dispose-message`
             [(not (= 0 result)) (error "Failed to create execution engine")]
             [else eng]))
  #:c-id LLVMCreateExecutionEngineForModule)

(define-llvm llvm-run-function (_fun _LLVMExecutionEngineRef
                                     _LLVMValueRef
                                     (_int = (length args))
                                     (args : (_list i _LLVMGenericValueRef))
                                     -> _LLVMGenericValueRef)
  #:c-id LLVMRunFunction)
