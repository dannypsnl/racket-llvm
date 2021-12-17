#lang racket

(require racket-llvm13)

; let's create an if-else function

(define mod (llvm-module "optimizeMe"))

(define eng (llvm-create-execution-engine-for-module mod))

(llvm-link-in-mcjit)
(llvm-initialize-native-target)

(define builder (llvm-builder-create))

(define if-func (llvm-add-function mod
                                   "if"
                                   (llvm-function-type (llvm-int32-type))))

(llvm-builder-position-at-end builder (llvm-append-basic-block if-func "entry"))

(define cmp (llvm-build-int-cmp builder
                                'int-eq
                                (llvm-const-int (llvm-int32-type) 123)
                                (llvm-const-int (llvm-int32-type) 321)
                                "equal"))

(define then (llvm-append-basic-block if-func "then"))
(define els (llvm-append-basic-block if-func "else"))

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

(displayln "before:")
(display (llvm-module->string mod))

; let's do an optimization pass
(define pm (llvm-pass-manager-create))
(define pmb (llvm-pass-manager-builder-create))
(llvm-pass-manager-builder-set-opt-level pmb 3)
(llvm-pass-manager-builder-populate-module-pass-manager pmb pm)

(displayln "did the pass change anything?")
(llvm-pass-manager-run pm mod)

(displayln "after:")
(display (llvm-module->string mod))
