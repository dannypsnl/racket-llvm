#lang racket
(require racket-llvm
         ffi/unsafe)

; LLVM Optimization Example
; Demonstrates using the PassBuilder API

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

; Initialize native target
(llvm-initialize-native-target)

; Get target from triple
(define triple (llvm-get-default-target-triple))
(define target-ptr (malloc _pointer))
(define error-ptr (malloc _pointer))
(llvm-get-target-from-triple triple target-ptr error-ptr)
(define target (ptr-ref target-ptr _pointer))

; Create target machine
(define cpu (llvm-get-host-cpu-name))
(define features (llvm-get-host-cpu-features))
(define target-machine
  (llvm-create-target-machine
   (cast target _pointer _LLVMTargetRef)
   triple
   cpu
   features
   0   ; LLVMCodeGenOptLevel default
   0   ; LLVMRelocMode default
   0)) ; LLVMCodeModel default

; Create PassBuilder options and run optimization passes
(define pass-options (llvm-create-pass-builder-options))

(define pass-error (llvm-run-passes mod "instcombine,simplifycfg" target-machine pass-options))

(when pass-error
  (llvm-consume-error (cast pass-error _pointer _LLVMErrorRef)))

(displayln "\n=== After Optimization ===")
(display (llvm-module->string mod))
