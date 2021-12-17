#lang racket

(provide (all-defined-out))

(require ffi/unsafe
         "definer.rkt")

(define-llvm llvm-typeof (_fun _LLVMValueRef -> _LLVMTypeRef) #:c-id LLVMTypeOf)

(define-llvm llvm-void-type (_fun -> _LLVMTypeRef) #:c-id LLVMVoidType)
(define-llvm llvm-label-type (_fun -> _LLVMTypeRef) #:c-id LLVMLabelType)
(define-llvm llvm-x86mmx-type (_fun -> _LLVMTypeRef) #:c-id LLVMX86MMXType)
(define-llvm llvm-x86amx-type (_fun -> _LLVMTypeRef) #:c-id LLVMX86AMXType)

(define-llvm llvm-int-type (_fun _int -> _LLVMTypeRef) #:c-id LLVMIntType)
(define-llvm llvm-int8-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt8Type)
(define-llvm llvm-int16-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt16Type)
(define-llvm llvm-int32-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt32Type)
(define-llvm llvm-int64-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt64Type)
(define-llvm llvm-int128-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt128Type)

(define-llvm llvm-half-type (_fun -> _LLVMTypeRef) #:c-id LLVMHalfType)
(define-llvm llvm-bfloat-type (_fun -> _LLVMTypeRef) #:c-id LLVMBFloatType)
(define-llvm llvm-float-type (_fun -> _LLVMTypeRef) #:c-id LLVMFloatType)
(define-llvm llvm-double-type (_fun -> _LLVMTypeRef) #:c-id LLVMDoubleType)
(define-llvm llvm-x86fp80-type (_fun -> _LLVMTypeRef) #:c-id LLVMX86FP80Type)
(define-llvm llvm-fp128-type (_fun -> _LLVMTypeRef) #:c-id LLVMFP128Type)
(define-llvm llvm-ppcfp128-type (_fun -> _LLVMTypeRef) #:c-id LLVMPPCFP128Type)

(define-llvm llvm-function-type (_fun  (return-type [param-types (list)] [variadic? #f]) ::
                                       (return-type : _LLVMTypeRef)
                                       (param-types : (_list i _LLVMTypeRef))
                                       (_int = (length param-types)) ; num params
                                       (variadic? : _bool)
                                       -> _LLVMTypeRef)
  #:c-id LLVMFunctionType)

(define-llvm llvm-struct-type (_fun ([element_types (list)] [pack? #f]) ::
                                    (element_types : (_list i _LLVMTypeRef))
                                    (_int = (length element_types))
                                    (pack? : _bool)
                                    -> _LLVMTypeRef)
  #:c-id LLVMStructType)

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
