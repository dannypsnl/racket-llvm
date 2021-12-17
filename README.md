racket-llvm13
=============
A racket to LLVM 13 C-API bindings.

### Usage

To use this package as your package's dependency, add `"git://github.com/failed-dragon-slayer/racket-llvm13"` into the list of `deps` in `info.rkt`. The following is an example.

```racket
(define deps '("base" "git://github.com/failed-dragon-slayer/racket-llvm13"))
```

### Develop

LLVM is a big project, that's quite normal to find some missing functions/definitions in this project. Thus, you can use `define-llvm` to get missing functions, and we will give you a big thanks if you would like to port them back to the project by pull requests! To get full definitions in LLVM, look at [LLVM C-API](https://llvm.org/doxygen/dir_db1e4f1ef1b4536ff54becd23c94e664.html) for reference.

### Reference

- [llvm doxygen](https://llvm.org/doxygen/)
- [How to get started with the LLVM C API](https://www.pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html)
