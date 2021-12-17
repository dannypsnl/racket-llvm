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
(define-llvm llvm-int1-type (_fun -> _LLVMTypeRef) #:c-id LLVMInt1Type)
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

(define-llvm llvm-vector-type (_fun _LLVMTypeRef _int -> _LLVMTypeRef) #:c-id LLVMVectorType)
(define-llvm llvm-scalable-vector-type (_fun _LLVMTypeRef _int -> _LLVMTypeRef) #:c-id LLVMScalableVectorType)

(define _LLVMAddressSpace
  (_enum '(addr-space-generic = 0
                              addr-space-global
                              addr-space-shared
                              addr-space-const
                              addr-space-local
                              addr-space-param = 101)))
(define-llvm llvm-pointer-type (_fun (element_type [addr-space 'addr-space-generic]) ::
                                     (element_type : _LLVMTypeRef)
                                     (addr-space : _LLVMAddressSpace)
                                     -> _LLVMTypeRef)
  #:c-id LLVMPointerType)
(define-llvm llvm-array-type (_fun (element_type element_count) ::
                                   (element_type : _LLVMTypeRef)
                                   (element_count : _int)
                                   -> _LLVMTypeRef)
  #:c-id LLVMArrayType)

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
(define-llvm llvm-struct-create-named (_fun _LLVMContextRef _string -> _LLVMTypeRef)
  #:c-id LLVMStructCreateNamed)
(define-llvm llvm-struct-set-body (_fun (struct-ty [element_types (list)] [pack? #f]) ::
                                        (struct-ty : _LLVMTypeRef)
                                        (element_types : (_list i _LLVMTypeRef))
                                        (_int = (length element_types))
                                        (pack? : _bool)
                                        -> _void)
  #:c-id LLVMStructSetBody)
