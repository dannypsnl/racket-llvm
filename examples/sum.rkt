#lang racket

(require racket-llvm13)

#| C code taken from
   https://pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html
   This example reads in 2 ints from stdin
   and then prints the sum as well as the IR of the module |#

(define mod (llvm-module "testModule"))

#| LLVMTypeRef param_types[] = { LLVMInt32Type(), LLVMInt32Type() };
   LLVMTypeRef ret_type = LLVMFunctionType(LLVMInt32Type(), param_types, 2, 0);
   LLVMValueRef sum = LLVMAddFunction(mod, "sum", ret_type); |#

(define return-type (llvm-function-type (llvm-int32-type)
                                        (list (llvm-int32-type)
                                              (llvm-int32-type))))
(define sum (llvm-add-function mod "sum" return-type))

#| LLVMBasicBlockRef entry = LLVMAppendBasicBlock(sum, "entry"); |#

(define entry (llvm-append-basic-block sum "entry"))

#|  LLVMBuilderRef builder = LLVMCreateBuilder();
    LLVMPositionBuilderAtEnd(builder, entry); |#

(define builder (llvm-builder-create))

(llvm-builder-position-at-end builder entry)

#| LLVMValueRef tmp = LLVMBuildAdd(builder, LLVMGetParam(sum, 0), LLVMGetParam(sum, 1), "tmp");
   LLVMBuildRet(builder, tmp); |#

(define tmp (llvm-build-add builder (llvm-get-param sum 0) (llvm-get-param sum 1) "tmp"))
(llvm-build-ret builder tmp)

#| char *error = NULL;
   LLVMVerifyModule(mod, LLVMAbortProcessAction, &error);
   LLVMDisposeMessage(error); |#

(llvm-module-verify mod)

#| LLVMExecutionEngineRef engine;
   error = NULL;
   LLVMLinkInMCJIT();
   LLVMInitializeNativeTarget();
   if (LLVMCreateExecutionEngineForModule(&engine, mod, &error) != 0) {
     fprintf(stderr, "failed to create execution engine\n");
     abort();
   }
   if (error) {
     fprintf(stderr, "error: %s\n", error);
     LLVMDisposeMessage(error);
     exit(EXIT_FAILURE);
   }
|#

(define eng (llvm-create-execution-engine-for-module mod))

(llvm-link-in-mcjit)
(llvm-initialize-native-target)

#|  if (argc < 3) {
        fprintf(stderr, "usage: %s x y\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    long long x = strtoll(argv[1], NULL, 10);
    long long y = strtoll(argv[2], NULL, 10);
|#

(define-values (x y) (values (read) (read)))

#| LLVMGenericValueRef args[] = {
      LLVMCreateGenericValueOfInt(LLVMInt32Type(), x, 0),
      LLVMCreateGenericValueOfInt(LLVMInt32Type(), y, 0)
  };
|#

(define args (list (llvm-create-generic-value-of-int (llvm-int32-type) x #f)
                   (llvm-create-generic-value-of-int (llvm-int32-type) y #f)))

#|  LLVMGenericValueRef res = LLVMRunFunction(engine, sum, 2, args); |#

(define res (llvm-run-function eng sum args))

#| printf("%d\n", (int)LLVMGenericValueToInt(res, 0)); |#

(println (llvm-generic-value-to-int res #f))

(display (llvm-module-to-string mod))
