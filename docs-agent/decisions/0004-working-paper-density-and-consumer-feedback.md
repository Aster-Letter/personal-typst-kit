# ADR 0004：工作论文密度与消费者反馈边界

状态：已接受
日期：2026-08-16

## 背景

真实课程报告暴露出 working-paper 正文、标题、公式、图表和参考文献节奏不一致的问题，也提出课程字段、长封面、代码分页、附录起页、PDF 元数据与论文表格预设需求。直接复制项目字段或在 profile 内继续硬编码间距，会破坏主题与文档结构的职责边界。

## 决策

- 由 `densities.compact | normal | relaxed` 提供正文 spacing overlay，调用者通过 `theme-with` 选择；working-paper 仅增加独立的 `front-matter-density`，用于标题页容量控制。
- 标题、目录、摘要、公式、figure、caption、列表、脚注、参考文献、代码块和论文表格间距均归入主题 token；旧主题缺失时使用兼容回退。
- working-paper 渲染既有 `meta.course`，其他课程信息通过 `meta.extra-lines` 传入；不在公共包中固化学号、院系或教师数据模型。
- bibliography 默认取消强制两端对齐，以弱链接色显示 DOI/URL，并允许主题通过 `styles` 恢复下划线或两端对齐。
- `paper-table` 只提供表头、线框、inset、表下注释和 caption 的视觉包装，不接管列结构、数据与业务语义。
- `code-block.breakable: auto` 映射到 Typst 可分页 block；显式 `false` 只用于调用者确认可整体容纳的短代码。
- `appendices` 默认独立起页，并公开起页、编号和目录策略参数。
- 规范化作者、摘要和关键词同步写入 document metadata；可见封面内容仍以原 content 渲染。

## 后果

- 同一工作论文可以独立选择正文与 front matter 密度，课程报告不再需要修改内部模板文件。
- 课程专用字段继续留在消费者适配层，公共 API 只提供中性的额外信息行。
- 参考文献和表格获得正式论文默认视觉，同时保留主题覆盖和原生 Typst 数据结构。
- 新增长封面、正文密度、bibliography、表格、代码、附录与旧主题兼容回归，作为 0.2.1 的发布门槛。
