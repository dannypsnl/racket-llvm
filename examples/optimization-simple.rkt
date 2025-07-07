#lang racket
(require racket-llvm)

; Simple optimization example using LLVM 20 PassBuilder API

(define mod (llvm-module "optimizeMe"))
(define builder (llvm-builder-create))

; Create a simple function with obvious optimizations
(define test-func (llvm-add-function mod "test" (llvm-function-type (llvm-int32-type))))
(define entry (llvm-append-basic-block test-func "entry"))
(llvm-builder-position-at-end builder entry)

; Create some simple arithmetic that can be optimized
(define const1 (llvm-const-int (llvm-int32-type) 10))
(define const2 (llvm-const-int (llvm-int32-type) 20))
(define add1 (llvm-build-add builder const1 const2 "add1"))
(define const3 (llvm-const-int (llvm-int32-type) 5))
(define add2 (llvm-build-add builder add1 const3 "add2"))

(llvm-build-ret builder add2)

(llvm-module-verify mod)

(displayln "=== Before Optimization ===")
(display (llvm-module->string mod))

; Try to use basic optimization that might not need target machine
(displayln "\n=== Attempting Basic Optimization ===")

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

; Cleanup
(llvm-dispose-pass-builder-options pass-options)
(llvm-dispose-builder builder)
(llvm-dispose-module mod)