#lang racket/base
(provide define-llvm)
(require ffi/unsafe
         ffi/unsafe/define
         racket/string
         racket/port
         racket/system)

(define (get-llvm-lib-dir)
  (let ([path (find-executable-path "llvm-config")])
    (list (string-trim
           (with-output-to-string
             (λ () (system* path "--libdir")))))))

(define-ffi-definer define-llvm (ffi-lib "libLLVM" '("20" "19" "18" "17" "16" "15" "14" "13" "12" "11" #f)
                                         #:get-lib-dirs get-llvm-lib-dir))
