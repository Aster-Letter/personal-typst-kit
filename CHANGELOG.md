# Changelog

本项目遵循语义化版本。未发布变更记录在 `Unreleased`。

## 0.2.0 - 2026-08-15

- 新增正式 `working-paper` profile、`themes.academic` 与三种前置布局。
- 新增结构化作者、可选英文题名/摘要/关键词，以及定理、证明、注、致谢和附录扩展。
- 拆分主题的标题与链接颜色 token，同时保留旧主题回退行为。
- 修复 `paper` 正文页码缺失和中文标题累计编号，并收紧封面与摘要间距。
- 扩充 Windows/Linux 编译、非法配置、包导入和视觉审阅覆盖。

## 0.1.0 - 2026-07-13

- 建立单入口、多构造器的 Typst 0.15 包形结构。
- 提供 paper、book、manual、handout 四种文档配置。
- 提供 teal、ink、warm、blue 四套主题及文档级覆盖接口。
- 提供通用语义组件、manual/handout 专用扩展与 draft 三态工具。
- 加入中性示例、本地包安装脚本和 Windows/Linux CI。
