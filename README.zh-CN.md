# LCF C++ Libraries

[English](README.md) | [简体中文](README.zh-CN.md)

独立 C++ 库的开发工作区。这里生成的库可以移动到其他位置，并作为独立仓库维护。

## 新建库

在工作区根目录执行：

```sh
cmake -DNAME=utilities -DHEADER_ONLY=ON -P cmake/new_lib_project.cmake
cmake -DNAME=image -DWITH_DEPS=ON -P cmake/new_lib_project.cmake
cmake -DNAME=math -DHEADER_ONLY=ON -DDEST=./.agent/math -P cmake/new_lib_project.cmake
```

参数：

| 参数 | 默认值 | 作用 |
| --- | --- | --- |
| `NAME` | 必填 | 小写库名，例如 `shader_core` |
| `HEADER_ONLY` | `OFF` | 为 `ON` 时生成纯头文件库 |
| `WITH_DEPS` | `OFF` | 为 `ON` 时包含常规依赖工具 |
| `DEST` | `./NAME` | 目标目录 |

目标目录可以已经存在，也可以是当前目录（`-DDEST=.`）。无关文件及内容相同的生成文件会保留；发现文件冲突时，在写入任何文件前停止。生成器不会初始化或提交 Git 仓库。

## 构建与测试

```sh
cmake -S image -B image/build/local -DBUILD_SHARED_LIBS=ON
cmake --build image/build/local --config Debug
cmake --build image/build/local --config Debug --target image_verify_run
ctest --test-dir image/build/local -C Debug --output-on-failure
```

生成的库带有 `msvc`、`clang` 和 `gcc` 预设。没有依赖的纯头文件库可以直接复制 `include/NAME` 使用。

## 依赖

使用 `WITH_DEPS=ON` 时，在 `deps.json` 中声明常规依赖。优先复用已有目标和安装包；测试框架会延迟到构建测试目标时获取。

## 子模块与实验

```sh
cmake -DACTION=add -DPATH=utilities -DURL=https://example.com/your/utilities.git -P cmake/git/submodule.cmake
cmake -DACTION=init -P cmake/git/submodule.cmake
cmake --preset clang
cmake --build build/clang --config Debug
```

将库登记到 `.gitmodules`，或传入 `-DLCF_LIBRARIES="utilities;math;image"`。在 `examples` 中显式添加实验，并链接 `LCFUtilities::utilities` 等命名目标。
