# Library Project Template

[English](README.md) | [简体中文](README.zh-CN.md)

Input for `../cmake/new_lib_project.cmake`; this directory is not a buildable library.

- `common/`: CMake configuration, presets, tests, and optional module support.
- `header-only/`: public headers for header-only libraries.
- `compiled/`: public headers and source files for compiled libraries.
- `dependencies/`: optional dependency manifest and tools, copied with `WITH_DEPS=ON`.

`.tpl` files are processed during generation. Generated projects own their files and do not reference this template or its parent workspace.
