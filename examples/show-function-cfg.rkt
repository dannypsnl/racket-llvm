#lang racket

(require racket-llvm)

; let's create an if-else function

(define mod (llvm-module "optimizeMe"))

(define eng (llvm-create-execution-engine-for-module mod))

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

(llvm-build-cond-br builder cmp then els)

(llvm-builder-position-at-end builder then)
(void (llvm-build-ret builder (llvm-const-int (llvm-int32-type) 111)))

(llvm-builder-position-at-end builder els)
(define sum (llvm-build-add builder
                            (llvm-const-int (llvm-int32-type) 222)
                            (llvm-const-int (llvm-int32-type) 93281)
                            "sum"))
(void (llvm-build-ret builder sum))

(llvm-module-verify mod)

(llvm-view-function-cfg if-func)
(llvm-view-function-cfg-only if-func)
