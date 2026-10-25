# Cross-Library Examples

[English](README.md) | [简体中文](README.zh-CN.md)

Each experiment has its own directory, `CMakeLists.txt`, and `main.cpp`. Register it in this directory's `CMakeLists.txt` with `add_subdirectory`.

```cmake
add_executable(my_experiment main.cpp)
target_link_libraries(my_experiment PRIVATE LCFUtilities::utilities LCFMath::math)
```

Add the required libraries at the workspace top level, or configure them explicitly:

```sh
cmake --preset clang -DLCF_LIBRARIES="utilities;math"
```

Initialize Git submodules before configuring. CMake does not download, commit, or update revisions during configuration.
