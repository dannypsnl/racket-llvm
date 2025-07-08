#lang racket
(provide (all-defined-out))
(require ffi/unsafe
         "../definer.rkt"
         "ref.rkt")

(define-llvm llvm-write-bitcode-to-file (_fun (mod file-path) ::
                                              (mod : _LLVMModuleRef)
                                              (file-path : _string)
                                              ; coercion the integer failure to bool
                                              ; 0 should be #f, otherwise is #t
                                              -> (failure : _bool)
                                              -> (when failure (raise "write bitcode failed")))
  #:c-id LLVMWriteBitcodeToFile)
