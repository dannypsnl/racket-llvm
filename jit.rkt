#lang racket

(provide llvm-link-in-mcjit
         llvm-create-execution-engine-for-module
         llvm-run-function
         llvm-create-generic-value-of-int
         llvm-create-generic-value-of-float
         llvm-generic-value->int
         llvm-generic-value->float)

(require ffi/unsafe
         "definer.rkt"
         "error.rkt")

(define _LLVMExecutionEngineRef (_cpointer 'LLVMOpaqueExecutionEngine))

(define-llvm llvm-link-in-mcjit (_fun -> _void) #:c-id LLVMLinkInMCJIT)

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

(define-llvm llvm-run-function (_fun _LLVMExecutionEngineRef
                                     _LLVMValueRef
                                     (_int = (length args))
                                     (args : (_list i _LLVMGenericValueRef))
                                     -> _LLVMGenericValueRef)
  #:c-id LLVMRunFunction)

(define-llvm llvm-create-generic-value-of-int (_fun _LLVMTypeRef
                                                    _int ; value
                                                    _bool ; signed?
                                                    -> _LLVMGenericValueRef)
  #:c-id LLVMCreateGenericValueOfInt)

(define-llvm llvm-create-generic-value-of-float (_fun _LLVMTypeRef
                                                      _double ; value
                                                      -> _LLVMGenericValueRef)
  #:c-id LLVMCreateGenericValueOfFloat)

(define-llvm llvm-generic-value->int (_fun _LLVMGenericValueRef _bool -> _llong)
  #:c-id LLVMGenericValueToInt)

(define-llvm llvm-generic-value->float (_fun _LLVMTypeRef _LLVMGenericValueRef -> _double)
  #:c-id LLVMGenericValueToFloat)
