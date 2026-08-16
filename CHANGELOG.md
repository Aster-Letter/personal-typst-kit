# Changelog

本项目遵循语义化版本。未发布变更记录在 `Unreleased`。

## Unreleased

## 0.2.2 - 2026-08-16

- 增大三档正文密度的段落间距，避免长篇中文段落在视觉上粘连。
- 将目录条目间距纳入正文密度预设，并放宽默认学术主题的目录节奏。
- 修复非 `inline` 工作论文正文的页眉和页脚因作用域错误而不显示的问题。

## 0.2.1 - 2026-08-16

- 放宽 `themes.academic` 的正文、标题、公式、图表、列表、脚注和参考文献节奏，三级标题提升至 12pt。
- 新增 `densities.compact | normal | relaxed` 与独立 `front-matter-density`，并将目录、摘要、代码块和表格间距纳入主题 token。
- 修复参考文献的强制两端对齐、醒目链接色与下划线，保留主题覆盖开关。
- 渲染 `meta.course` 和通用 `meta.extra-lines`，并同步作者、摘要和关键词到文档元数据。
- 新增 `paper-table`、`code-block.breakable` 以及可配置起页、编号和目录策略的 `appendices`。
- 新增长封面、正文密度、bibliography、表格、代码和旧主题兼容回归。

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
