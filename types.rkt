#lang racket

(provide llvm-int32-type
         llvm-int64-type
         llvm-float-type
         llvm-double-type
         llvm-function-type
         llvm-create-generic-value-of-int
         llvm-create-generic-value-of-float
         llvm-generic-value-to-int
         llvm-generic-value-to-float)

(require ffi/unsafe
         "definer.rkt")

(define-llvm llvm-int32-type (_fun -> _LLVMTypeRef)
  #:c-id LLVMInt32Type)

(define-llvm llvm-int64-type (_fun -> _LLVMTypeRef)
  #:c-id LLVMInt64Type)

(define-llvm llvm-float-type (_fun -> _LLVMTypeRef)
  #:c-id LLVMFloatType)

(define-llvm llvm-double-type (_fun -> _LLVMTypeRef)
  #:c-id LLVMDoubleType)

(define-llvm llvm-function-type (_fun  (return-type [param-types (list)] [variadic? #f]) ::
                                       (return-type : _LLVMTypeRef)
                                       (param-types : (_list i _LLVMTypeRef))
                                       (_int = (length param-types)) ; num params
                                       (variadic? : _bool)
                                       -> _LLVMTypeRef)
  #:c-id LLVMFunctionType)

(define-llvm llvm-create-generic-value-of-int (_fun _LLVMTypeRef
                                                    _int ; value
                                                    _bool ; signed?
                                                    -> _LLVMGenericValueRef)
  #:c-id LLVMCreateGenericValueOfInt)

(define-llvm llvm-create-generic-value-of-float (_fun _LLVMTypeRef
                                                      _double ; value
                                                      -> _LLVMGenericValueRef)
  #:c-id LLVMCreateGenericValueOfFloat)

(define-llvm llvm-generic-value-to-int (_fun _LLVMGenericValueRef _bool -> _llong)
  #:c-id LLVMGenericValueToInt)

(define-llvm llvm-generic-value-to-float (_fun _LLVMTypeRef _LLVMGenericValueRef -> _double)
  #:c-id LLVMGenericValueToFloat)
