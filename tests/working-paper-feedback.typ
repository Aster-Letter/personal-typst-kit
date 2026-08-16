#import "../lib.typ": working-paper, themes, densities, theme-with, paper-table, code-block, appendices

#let report-theme = theme-with(
  themes.academic,
  spacing: densities.normal,
  styles: (
    bibliography-justify: false,
    bibliography-link-underline: false,
  ),
)

#show: working-paper.with(
  meta: (
    title: [课程工作论文反馈回归],
    authors: (
      (name: [作者甲], affiliation: [图形学研究组]),
      (name: [作者乙], affiliation: [视觉计算实验室]),
    ),
    course: [计算机图形学前沿],
    extra-lines: (
      [院系：计算机科学与技术学院],
      [指导教师：示例教师],
      [学号：20260001],
      [提交类型：课程报告],
      [归档状态：可复现],
    ),
    abstract: [本样例验证课程元数据、正文密度预设、表格包装、代码分页、附录策略和 PDF 元数据。],
    keywords: ([课程论文], [模板反馈], [回归测试]),
  ),
  theme: report-theme,
  options: (
    front-matter: "title-page",
    front-matter-density: "compact",
    bibliography: (
      sources: (path("working-paper-spacing.bib"),),
      full: true,
    ),
  ),
)

= 综合接口

正文使用 `densities.normal`，封面单独使用紧凑密度。两者互不覆盖，调用者无需修改模板内部文件。

#paper-table(
  caption: [统一的工作论文表格样式],
  note: [注：数值仅用于排版回归，不表达真实实验结论。],
  align: (left, right, right),
)[
  #table(
    columns: (1.4fr, 1fr, 1fr),
    table.header([指标], [方案甲], [方案乙]),
    [误差], [0.128], [0.104],
    [耗时], [18.4 ms], [21.7 ms],
  )
]

#code-block(title: [可分页代码], language: [Typst], breakable: auto)[
```typst
#show: working-paper.with(
  meta: (title: [示例]),
  theme: themes.academic,
)
```
]

#appendices(pagebreak: true, outlined: true)[
  = 附加检查

  附录默认独立起页，并继续进入目录。
]
