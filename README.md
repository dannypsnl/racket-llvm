racket-llvm
=============

> **Warning**
> LLVM is a big project, that's quite normal to find some missing functions/definitions in this project. Thus, you can use `define-llvm` to get missing functions, and we will give you a big thanks if you would like to port them back to the project by pull requests! To get full definitions in LLVM, look at [LLVM C-API](https://llvm.org/doxygen/dir_db1e4f1ef1b4536ff54becd23c94e664.html) for reference.

A racket to LLVM C-API bindings.

### Installation

```shell
raco pkg install --auto racket-llvm
```

### Usage

Ensure you have `llvm-config` installed and can invoke it. You might need following command.

```shell
# export homebrew installed llvm binaries
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
```

##### Dependencies

Add `"racket-llvm"` into `info.rkt`

```racket
(define deps '("base" "racket-llvm"))
```

##### Example

The following one shows how to use **Execution Engine** to run a LLVM function and view the result.

```racket
; create module, the basic unit in LLVM IR
(define mod (llvm-module "test_mod"))
; create builder, all instructions will be created by this
(define builder (llvm-builder-create))

; add function into module
(define sum (llvm-add-function mod "sum" (llvm-function-type (llvm-int32-type) (list (llvm-int32-type) (llvm-int32-type)))))
; create basic block for function
(define entry (llvm-append-basic-block sum))
; shift builder insertion point to the end of the basic block
(llvm-builder-position-at-end builder entry)
; build `%3 = add i32 %0, %1`
; build `ret i32 %3`
(llvm-build-ret builder (llvm-build-add builder (llvm-get-param sum 0) (llvm-get-param sum 1)))

; verify the module
(llvm-module-verify mod)
; print and check the content of the module
(displayln (llvm-module->string mod))

; create execution engine based on module
(define eng (llvm-create-execution-engine-for-module mod))
; link to mcjit
(llvm-link-in-mcjit)

; ask two integers
(define (ask-integer)
  (printf "enter integer: ")
  (read))
(define-values (x y) (values (ask-integer) (ask-integer)))

; use engine to run the function(engine will search it in the module)
(define res (llvm-run-function eng sum
                               (list (llvm-create-generic-value-of-int (llvm-int32-type) x #f)
                                     (llvm-create-generic-value-of-int (llvm-int32-type) y #f))))
; show result
(printf "JIT result: ~a\n" (llvm-generic-value->int res #f))
```

### Develop

Here is an example to show how can one define a new llvm function binding via `define-llvm`.

```racket
;; our standard is converting from CamlCase to kebab-case identifier
(define-llvm llvm-build-struct-gep2
  ;; here is a complicated version of `_fun`, the first wrapped list are parameters
  (_fun (builder ty pointer index [name ""]) ::
        ;; the followings are type for parameters
        (builder : _LLVMBuilderRef)
        (ty : _LLVMTypeRef)
        (pointer : _LLVMValueRef)
        (index : _int)
        (name : _string)
        ;; final, the return type
        -> _LLVMValueRef)
  ;; `LLVMBuildStructGEP2` is the name of function in C side
  #:c-id LLVMBuildStructGEP2)
```

And you can get llvm functions list from [LLVM C-API](https://llvm.org/doxygen/dir_db1e4f1ef1b4536ff54becd23c94e664.html). To get more about the FFI in racket, reference to its [document](https://docs.racket-lang.org/foreign/index.html#%28tech._ffi%29).

### Reference

- [llvm doxygen](https://llvm.org/doxygen/)
- [How to get started with the LLVM C API](https://www.pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html)
