# 库项目模板

[English](README.md) | [简体中文](README.zh-CN.md)

供 `../cmake/new_lib_project.cmake` 使用的输入目录，不能直接作为库构建。

- `common/`：CMake 配置、预设、测试和可选模块支持。
- `header-only/`：纯头文件库的公共头文件。
- `compiled/`：编译型库的公共头文件和源文件。
- `dependencies/`：可选的依赖清单和工具，仅在 `WITH_DEPS=ON` 时复制。

`.tpl` 文件会在生成时处理。生成后的项目拥有自己的文件，不引用本模板或母工作区。
