# Automated LLVM+Clang assertions builds

This repository automatically builds LLVM+Clang binary releases with assertions enabled (`-DLLVM_ENABLE_ASSERTIONS=ON`).
It is heavily inspired by https://github.com/clangd/clangd.

This repository does not contain the source of LLVM itself.
LLVM's source code is hosted at https://github.com/llvm/llvm-project.

## Quick Start

You can either use one of the releases available on GitHub, or clone the repository and build locally:

```bash
make debug      # debug build with assertions
make release    # release build with assertions
```

The artifacts of the build are available as `*.7z` files.

You can customise the LLVM version to build by setting `LLVM_VERSION`:

```bash
make debug LLVM_VERSION=master      # debug build
make release LLVM_VERSION=master    # release build
```

`LLVM_VERSION` can be anything that `git clone --branch` accepts, i.e. a branch, commit, tag, ...
