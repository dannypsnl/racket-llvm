665
((3) 0 () 1 ((q lib "racket-llvm/main.rkt")) () (h ! (equal) ((c def c (c (? . 0) q _LLVMModuleRef)) q (128 . 2)) ((c def c (c (? . 0) q _LLVMBuilderRef)) q (290 . 2)) ((c def c (c (? . 0) q _LLVMPassManagerBuilderRef)) q (398 . 2)) ((c def c (c (? . 0) q _LLVMContextRef)) q (160 . 2)) ((c def c (c (? . 0) q _LLVMTypeRef)) q (193 . 2)) ((c def c (c (? . 0) q _LLVMGenericValueRef)) q (323 . 2)) ((c form c (c (? . 0) q define-llvm)) q (0 . 2)) ((c form c (c (? . 0) q llvm-module)) q (63 . 4)) ((c def c (c (? . 0) q _LLVMPassManagerRef)) q (361 . 2)) ((c def c (c (? . 0) q _LLVMValueRef)) q (223 . 2)) ((c def c (c (? . 0) q _LLVMBasicBlockRef)) q (254 . 2))))
syntax
(define-llvm id function-type #:c-id c-function-id)
syntax
(llvm-module module-name)
 
  module-name : string?
value
_LLVMModuleRef : ctype?
value
_LLVMContextRef : ctype?
value
_LLVMTypeRef : ctype?
value
_LLVMValueRef : ctype?
value
_LLVMBasicBlockRef : ctype?
value
_LLVMBuilderRef : ctype?
value
_LLVMGenericValueRef : ctype?
value
_LLVMPassManagerRef : ctype?
value
_LLVMPassManagerBuilderRef : ctype?
