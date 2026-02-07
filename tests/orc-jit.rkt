#lang racket
(module+ test
  (require rackunit
           "../main.rkt")

  (test-case "Create LLJIT builder"
    (define builder (llvm-orc-create-lljit-builder))
    (check-not-false builder))

  (test-case "Create thread-safe context"
    (define ctx (llvm-orc-create-new-thread-safe-context))
    (check-not-false ctx))

  ;; Test Thread-Safe Module Creation
  (test-case "Create thread-safe module from LLVM module"
    (define mod (llvm-module "test-module"))
    (define ts-ctx (llvm-orc-create-new-thread-safe-context))
    (define ts-mod (llvm-orc-create-new-thread-safe-module mod ts-ctx))
    (check-not-false ts-mod))
  )
