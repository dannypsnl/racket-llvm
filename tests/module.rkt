#lang racket
(module+ test
  (require rackunit
           "../main.rkt")

  ;; Test: declare printf with variadic function type
  (let ([mod (llvm-module "test_mod")])
    (define ft (llvm-function-type (llvm-int32-type)
                                   (list (llvm-pointer-type (llvm-int8-type)))
                                   #t))
    (define _printf-fun (llvm-add-function mod "printf" ft))
    (check-equal? (llvm-module->string mod)
                  "; ModuleID = 'test_mod'
source_filename = \"test_mod\"

declare i32 @printf(ptr, ...)
"))

  ;; Test: struct type and global variable
  (let ([mod (llvm-module "test_mod")])
    (define struct-ty (llvm-add-struct-type mod (list (llvm-int8-type) (llvm-double-type))))
    (llvm-add-global mod struct-ty "hello")
    (check-equal? (llvm-module->string mod)
                  "; ModuleID = 'test_mod'
source_filename = \"test_mod\"

%0 = type { i8, double }

@hello = external global %0
"))
  )
