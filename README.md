# LCF C++ Libraries

[English](README.md) | [简体中文](README.zh-CN.md)

Workspace for independent C++ libraries. Libraries generated here can be moved and maintained as standalone repositories.

## Create a library

Run from the workspace root:

```sh
cmake -DNAME=utilities -DHEADER_ONLY=ON -P cmake/new_lib_project.cmake
cmake -DNAME=image -DWITH_DEPS=ON -P cmake/new_lib_project.cmake
cmake -DNAME=math -DHEADER_ONLY=ON -DDEST=./.agent/math -P cmake/new_lib_project.cmake
```

Options:

| Option | Default | Purpose |
| --- | --- | --- |
| `NAME` | required | Lowercase library name, such as `shader_core` |
| `HEADER_ONLY` | `OFF` | Generate a header-only library when `ON` |
| `WITH_DEPS` | `OFF` | Include regular dependency tools when `ON` |
| `DEST` | `./NAME` | Destination directory |

The destination may already exist, including the current directory (`-DDEST=.`). Unrelated files and identical generated files are preserved. Conflicting files cause the generator to stop before writing any files. The generator does not initialize or commit Git repositories.

## Build and test

```sh
cmake -S image -B image/build/local -DBUILD_SHARED_LIBS=ON
cmake --build image/build/local --config Debug
cmake --build image/build/local --config Debug --target image_verify_run
ctest --test-dir image/build/local -C Debug --output-on-failure
```

Generated libraries include `msvc`, `clang`, and `gcc` presets. Header-only libraries without dependencies can be used by copying their `include/NAME` directory.

## Dependencies

With `WITH_DEPS=ON`, declare regular dependencies in `deps.json`. Existing targets and packages are reused first; test framework downloads are deferred until test targets are built.

## Submodules and examples

```sh
cmake -DACTION=add -DPATH=utilities -DURL=https://example.com/your/utilities.git -P cmake/git/submodule.cmake
cmake -DACTION=init -P cmake/git/submodule.cmake
cmake --preset clang
cmake --build build/clang --config Debug
```

Add libraries to `.gitmodules` or pass `-DLCF_LIBRARIES="utilities;math;image"`. Add experiments explicitly under `examples` and link namespaced targets such as `LCFUtilities::utilities`.
