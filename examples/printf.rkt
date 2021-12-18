#lang racket/base

(require racket-llvm)

(define mod (llvm-module "printf example"))

(define builder (llvm-builder-create))

(define printf-ty (llvm-function-type (llvm-int32-type)
                                      (list (llvm-pointer-type (llvm-int8-type)))
                                      #t))
(define printf-func (llvm-add-function mod "printf" printf-ty))
(define main-func (llvm-add-function mod "main" (llvm-function-type (llvm-int32-type))))

(define entry (llvm-append-basic-block main-func))
(llvm-builder-position-at-end builder entry)
(define str (llvm-build-string-ptr builder "Hello, World!\n"))
(llvm-build-call2 builder printf-ty printf-func (list str))
(void (llvm-build-ret builder (llvm-const-int (llvm-int32-type) 0)))

(llvm-module-verify mod)
(displayln (llvm-module->string mod))

(define engine (llvm-create-execution-engine-for-module mod))
(void (llvm-run-function engine main-func '()))
