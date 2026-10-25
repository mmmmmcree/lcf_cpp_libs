# 跨库实验

[English](README.md) | [简体中文](README.zh-CN.md)

每个实验使用独立目录、`CMakeLists.txt` 和 `main.cpp`，并在本目录的 `CMakeLists.txt` 中通过 `add_subdirectory` 登记。

```cmake
add_executable(my_experiment main.cpp)
target_link_libraries(my_experiment PRIVATE LCFUtilities::utilities LCFMath::math)
```

在工作区顶层加入所需库，也可以显式指定：

```sh
cmake --preset clang -DLCF_LIBRARIES="utilities;math"
```

配置前需要初始化 Git 子模块。CMake 配置不会下载、提交或更新版本。
