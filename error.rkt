#lang racket/base
(provide llvm-dispose-message)
(require ffi/unsafe
         "definer.rkt")

(define-llvm llvm-dispose-message (_fun (_ptr i _string) -> _void)
  #:c-id LLVMDisposeMessage)
