#lang at-exp racket/base

(provide define-llvm)

(require ffi/unsafe
         ffi/unsafe/define
         racket/string
         racket/port
         racket/system)
(require scribble/srcdoc
         (for-doc scribble/manual ffi/unsafe racket/base))

(define (get-llvm-lib-dir)
  (let ([path (find-executable-path "llvm-config")])
    (list (string-trim
           (with-output-to-string
             (λ () (system* path "--libdir")))))))

(provide
 (form-doc
  (define-llvm id function-type #:c-id c-function-id)
  @{@racket[define-llvm] takes an id as its produces function name, then is a C @racket[_fun] defined types for C function. Finally, takes the link name of C function. Using @racket[define-llvm] to extend any functions missing in this library will be important.}))
(define-ffi-definer define-llvm (ffi-lib "libLLVM" '("13" "12" "11" #f)
                                         #:get-lib-dirs get-llvm-lib-dir))
