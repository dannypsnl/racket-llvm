#lang at-exp racket/base

(provide define-llvm
         (all-from-out scribble/srcdoc))
(require scribble/srcdoc
         (for-doc racket/base scribble/manual ffi/unsafe))

(require ffi/unsafe
         ffi/unsafe/define
         racket/string
         racket/port
         racket/system
         syntax/parse/define
         (for-syntax racket/base))

(define (get-llvm-lib-dir)
  (let ([path (find-executable-path "llvm-config")])
    (list (string-trim
           (with-output-to-string
             (λ () (system* path "--libdir")))))))

(define-ffi-definer internal-define-llvm (ffi-lib "libLLVM" '("13" "12" "11" #f)
                                                  #:get-lib-dirs get-llvm-lib-dir))

(provide
 (form-doc
  (define-llvm id function-type
    #:c-id c-function-id)
  @{@racket[define-llvm] takes an id as its produces function name, then is a C @racket[_fun] defined types for C function. Finally, takes the link name of C function. Using @racket[define-llvm] to extend any functions missing in this library will be important.}))
(define-syntax-parser define-llvm
  [(_ name:id c-function-type #:c-id c-funcname:id)
   #'(internal-define-llvm name c-function-type #:c-id c-funcname)]
  [(_ (name:id args ...) c-function-type
      #:contract contract
      #:doc doc
      #:c-id c-funcname:id)
   #'(begin
       (provide (proc-doc/names name contract (module-name) doc))
       (internal-define-llvm name c-function-type
                             #:c-id c-funcname))])
