# Repository Guidelines

## 项目结构与学习目标

本仓库使用 Godot 4 和 GDScript 学习 2D 角色移动。修改前阅读 `MISSION.md` 与 `NOTES.md`；若目录中存在适用的 `CONTEXT.md`，一并阅读并沿用其术语。每课只引入一个可运行、可验证的小成果。

- `godot-learning/`：实际 Godot 项目。`player.gd` 与 `player.tscn` 实现角色；`world.gd` 与 `world.tscn` 组织世界。`icon.svg` 是游戏图像资源。
- `lessons/`：中文 HTML 课程，命名如 `0003-area-and-signals.html`。
- `assets/`：课程共用的 CSS 与测验 JavaScript；`reference/`：基础知识参考页面。
- `learning-records/`：编号学习记录；`RESOURCES.md`：参考资料索引。
- `addons/godot_mcp/`：仓库根目录中的 MCP 插件源码，位于实际 Godot 项目之外。

## 构建、运行与开发命令

以下命令在仓库根目录执行。先将 Godot 加入 PATH；macOS 本机也可用 `/Applications/Godot.app/Contents/MacOS/Godot` 替换 `godot`。

```sh
godot --path godot-learning --editor
godot --path godot-learning
godot --headless --path godot-learning --import
```

三条命令依次用于打开编辑器、运行主场景、导入资源并检查编辑器加载错误。引擎版本以 `project.godot` 为准，当前标记为 4.7。课程 HTML 可直接用浏览器打开。仓库尚未配置独立构建脚本或导出预设。

## 编码风格与命名

GDScript 使用 Tab 缩进、`snake_case` 文件名与函数名，节点使用 `PascalCase`，如 `Player`、`Wall`。优先显式类型或 `:=` 类型推断。移动逻辑放在 `_physics_process`，沿用 `move_left` 等输入动作名称。

JavaScript 沿用两空格缩进。文件使用 UTF-8；当前没有统一格式化或 lint 工具。场景与项目配置优先通过 Godot 编辑器修改，并检查生成差异。保留资源配套的 `.uid` 文件。

## 课程中的界面操作说明

按学习者不熟悉 Godot 编辑器编写课程。涉及按钮、添加节点或资源、修改属性、连接信号时，说明先打开哪个场景、选中哪个节点，再给出面板名称、控件名称和完整点击路径。属性需注明所属节点或资源、所在分组和目标值；需要展开分组或先创建资源时，写出步骤。首次出现的关键控件附中英文名称；难以定位的入口用带箭头或编号的截图标注，并保留文字路径。界面名称和位置应按课程使用的 Godot 版本核实，避免只写“添加碰撞体”或“修改属性”等省略操作位置的指令。

## 测试与验收

当前没有测试框架、测试命名约定或覆盖率门槛。修改游戏后实际运行场景，验证 WASD 八方向移动、斜向速度、墙壁阻挡与沿墙滑动。涉及触发区域时，验证进入触发、停留不重复、重新进入再次触发，并检查调试器错误。无界面导入不能替代交互验收。

修改课程后，在浏览器检查导航、样式与测验反馈。新增课程需写明操作步骤和可观察的验收结果；只有用户确认后才将学习状态记为完成。

## 提交与 Pull Request

历史提交混用英文描述与 Conventional Commits；新提交统一使用 `<type>(<scope>): <中文摘要>`，例如 `docs(lesson): 添加区域信号验收步骤`。每个提交只表达一个完整目的。

提交前检查 `git status`、`git diff` 和 `git diff --cached`，排除敏感文件、无关改动与 `.godot/` 缓存。PR 说明修改目的、影响的课程或场景、实际验证结果；有相关 issue 时附链接，视觉变更附截图。
