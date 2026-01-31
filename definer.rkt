#lang racket/base
(provide define-llvm
         llvm-initialize-native-target)
(require ffi/unsafe
         ffi/unsafe/define
         racket/string
         racket/port
         racket/system)

(define (get-llvm-lib-dir)
  (define path (find-executable-path "llvm-config"))
  (list (string-trim (with-output-to-string (λ () (system* path "--libdir"))))))

(define llvm-lib (ffi-lib "libLLVM" '("21" "20" "19" "18" "17" "16" "15" "14" "13" "12" "11" #f)
                          #:get-lib-dirs get-llvm-lib-dir))
(define-ffi-definer define-llvm llvm-lib
  #:default-make-fail make-not-available)

; Initialize native target
; LLVM's LLVMInitializeNative* are C macros that expand to arch-specific calls,
; so we look them up dynamically based on the host architecture.
(define (llvm-initialize-native-target)
  (define arch-prefixes
    (case (system-type 'arch)
      [(aarch64) '("AArch64")]
      [(x86_64 x86) '("X86")]
      [(arm) '("ARM")]
      [(ppc ppc64) '("PowerPC")]
      [(mips) '("Mips")]
      [(riscv64) '("RISCV")]
      [else '()]))
  (for* ([arch (in-list arch-prefixes)]
         [suffix '("TargetInfo" "Target" "TargetMC" "AsmPrinter" "AsmParser")])
    (define name (string-append "LLVMInitialize" arch suffix))
    (define init (get-ffi-obj name llvm-lib (_fun -> _void) (lambda () #f)))
    (when init
      (init))))
