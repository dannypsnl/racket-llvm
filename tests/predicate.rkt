#lang racket
(module+ test
  (require rackunit
           "../main.rkt")

  (define mod (llvm-module "test"))
  (llvm-link-in-mcjit)
  (define eng (llvm-create-execution-engine-for-module mod))

  ;; Helper: build and run an icmp comparison, returns 0 or 1
  (define (run-icmp predicate a b)
    (define builder (llvm-builder-create))
    (define func-type (llvm-function-type (llvm-int32-type)
                                          (list (llvm-int32-type) (llvm-int32-type))))
    (define func (llvm-add-function mod "" func-type))
    (define entry (llvm-append-basic-block func))
    (llvm-builder-position-at-end builder entry)
    ;; icmp returns i1, zext to i32 for return
    (define cmp (llvm-build-icmp builder predicate
                                 (llvm-get-param func 0)
                                 (llvm-get-param func 1)))
    (define result (llvm-build-zext builder cmp (llvm-int32-type)))
    (llvm-build-ret builder result)
    (llvm-generic-value->int
     (llvm-run-function eng func
                        (list (llvm-create-generic-value-of-int (llvm-int32-type) a #t)
                              (llvm-create-generic-value-of-int (llvm-int32-type) b #t)))
     #f))

  ;; Helper: build and run an fcmp comparison, returns 0 or 1
  (define (run-fcmp predicate a b)
    (define builder (llvm-builder-create))
    (define func-type (llvm-function-type (llvm-int32-type)
                                          (list (llvm-float-type) (llvm-float-type))))
    (define func (llvm-add-function mod "" func-type))
    (define entry (llvm-append-basic-block func))
    (llvm-builder-position-at-end builder entry)
    ;; fcmp returns i1, zext to i32 for return
    (define cmp (llvm-build-fcmp builder predicate
                                 (llvm-get-param func 0)
                                 (llvm-get-param func 1)))
    (define result (llvm-build-zext builder cmp (llvm-int32-type)))
    (llvm-build-ret builder result)
    (llvm-generic-value->int
     (llvm-run-function eng func
                        (list (llvm-create-generic-value-of-float (llvm-float-type) a)
                              (llvm-create-generic-value-of-float (llvm-float-type) b)))
     #f))

  (test-case
   "integer predicates"
   (check-equal? (run-icmp 'int-eq 42 42) 1)
   (check-equal? (run-icmp 'int-eq 42 43) 0)
   ;; int-ne (= 33)
   (check-equal? (run-icmp 'int-ne 42 43) 1)
   (check-equal? (run-icmp 'int-ne 42 42) 0)
   ;; int-ugt (= 34) — unsigned greater than
   (check-equal? (run-icmp 'int-ugt 43 42) 1)
   (check-equal? (run-icmp 'int-ugt 42 42) 0)
   ;; int-uge (= 35) — unsigned greater or equal
   (check-equal? (run-icmp 'int-uge 42 42) 1)
   (check-equal? (run-icmp 'int-uge 41 42) 0)
   ;; int-ult (= 36) — unsigned less than
   (check-equal? (run-icmp 'int-ult 41 42) 1)
   (check-equal? (run-icmp 'int-ult 42 42) 0)
   ;; int-ule (= 37) — unsigned less or equal
   (check-equal? (run-icmp 'int-ule 42 42) 1)
   (check-equal? (run-icmp 'int-ule 43 42) 0)
   ;; int-sgt (= 38) — signed greater than
   ;; Use 0xFFFFFFFF which is -1 in signed 32-bit
   (check-equal? (run-icmp 'int-sgt 1 #xFFFFFFFF) 1)
   (check-equal? (run-icmp 'int-sgt #xFFFFFFFF 1) 0)
   ;; int-sge (= 39) — signed greater or equal
   (check-equal? (run-icmp 'int-sge 1 1) 1)
   (check-equal? (run-icmp 'int-sge #xFFFFFFFF 1) 0)
   ;; int-slt (= 40) — signed less than
   (check-equal? (run-icmp 'int-slt #xFFFFFFFF 1) 1)
   (check-equal? (run-icmp 'int-slt 1 #xFFFFFFFF) 0)
   ;; int-sle (= 41) — signed less or equal
   (check-equal? (run-icmp 'int-sle 1 1) 1)
   (check-equal? (run-icmp 'int-sle 1 #xFFFFFFFF) 0))

  (test-case
   "floating number predicates"
   (check-equal? (run-fcmp 'real-oeq 1.0 1.0) 1)
   (check-equal? (run-fcmp 'real-oeq 1.0 2.0) 0)
   ;; real-ogt (ordered and greater than)
   (check-equal? (run-fcmp 'real-ogt 2.0 1.0) 1)
   (check-equal? (run-fcmp 'real-ogt 1.0 2.0) 0)
   ;; real-oge (ordered and greater or equal)
   (check-equal? (run-fcmp 'real-oge 1.0 1.0) 1)
   (check-equal? (run-fcmp 'real-oge 0.5 1.0) 0)
   ;; real-olt (ordered and less than)
   (check-equal? (run-fcmp 'real-olt 1.0 2.0) 1)
   (check-equal? (run-fcmp 'real-olt 2.0 1.0) 0)
   ;; real-ole (ordered and less or equal)
   (check-equal? (run-fcmp 'real-ole 1.0 1.0) 1)
   (check-equal? (run-fcmp 'real-ole 2.0 1.0) 0)
   ;; real-one (ordered and not equal)
   (check-equal? (run-fcmp 'real-one 1.0 2.0) 1)
   (check-equal? (run-fcmp 'real-one 1.0 1.0) 0)
   ;; real-une (unordered or not equal)
   (check-equal? (run-fcmp 'real-une 1.0 2.0) 1)
   (check-equal? (run-fcmp 'real-une 1.0 1.0) 0)
   ;; real-ueq (unordered or equal)
   (check-equal? (run-fcmp 'real-ueq 1.0 1.0) 1)
   (check-equal? (run-fcmp 'real-ueq 1.0 2.0) 0))
  )
