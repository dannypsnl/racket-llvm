#lang racket
(require racket-llvm)

; LLVM 20 Optimization Example
; Demonstrates migration from deprecated PassManagerBuilder to new PassBuilder API

(define mod (llvm-module "optimizeMe"))
(llvm-link-in-mcjit)

(define builder (llvm-builder-create))

(define if-func (llvm-add-function mod
                                   "if"
                                   (llvm-function-type (llvm-int32-type))))

(llvm-builder-position-at-end builder (llvm-append-basic-block if-func))

(define cmp (llvm-build-int-cmp builder
                                'int-eq
                                (llvm-const-int (llvm-int32-type) 123)
                                (llvm-const-int (llvm-int32-type) 321)
                                "equal"))

(define then (llvm-append-basic-block if-func))
(define els (llvm-append-basic-block if-func))

(define cond-br (llvm-build-cond-br builder cmp then els))

(llvm-builder-position-at-end builder then)
(void (llvm-build-ret builder (llvm-const-int (llvm-int32-type) 111)))

(llvm-builder-position-at-end builder els)
(define sum (llvm-build-add builder
                            (llvm-const-int (llvm-int32-type) 222)
                            (llvm-const-int (llvm-int32-type) 93281)
                            "sum"))
(void (llvm-build-ret builder sum))

(llvm-module-verify mod)
(llvm-function-verify if-func)

(displayln "=== Before Optimization ===")
(display (llvm-module->string mod))

; Create PassBuilder options
(define pass-options (llvm-create-pass-builder-options))

; Try using null target machine for basic passes
(define pass-error #f)
(with-handlers ([exn:fail? (lambda (e) 
                            (displayln (format "Error: ~a" (exn-message e)))
                            (displayln "Target machine might be required for PassBuilder API"))])
  (set! pass-error (llvm-run-passes mod "instcombine" #f pass-options)))

(when pass-error
  (llvm-consume-error pass-error))

(displayln "\n=== After Optimization Attempt ===")
(display (llvm-module->string mod))
