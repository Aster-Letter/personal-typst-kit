#import "../../lib.typ": working-paper, themes, theorem, lemma, proposition, definition, proof, remark, acknowledgements, appendices

#show: working-paper.with(
  meta: (
    title: [面向可复现写作的结构化方法],
    subtitle: [一个通用工作论文示例],
    authors: (
      (name: [林川], affiliation: [开放写作研究组], email: "lin@example.org", corresponding: true),
      (name: [周宁], affiliation: [文档系统实验室], note: [共同完成方法设计]),
      (name: [顾言], affiliation: [开放写作研究组]),
      (name: [沈清], affiliation: [长期知识工程中心]),
    ),
    organization: [个人文档工具研究计划],
    version: [工作稿 1.0],
    date: [2026-08-15],
    abstract: [本文以中性内容验证正式论文的封面、作者信息、摘要、目录、标题编号、定理环境、致谢、附录与参考文献。],
    keywords: ([Typst], [工作论文], [可复现写作]),
    english: (
      title: [Structured Methods for Reproducible Writing],
      abstract: [This neutral example validates the formal working-paper layout and its reusable academic components.],
      keywords: ([Typst], [working paper], [reproducibility]),
    ),
  ),
  theme: themes.academic,
  options: (
    bibliography: (
      sources: (path("refs.bib"),),
      full: true,
    ),
  ),
)

= 引言

可复现写作要求内容、视觉和文档结构彼此独立。Typst 提供了适合构建此类工具的内容模型 @typst-docs。

#definition(title: [稳定接口])[调用者只依赖公共门面，而不直接引用内部实现路径。] <def:stable>

#theorem(title: [迁移原则])[若主题只改变视觉 token，则正文可以在不同 profile 之间迁移。] <thm:migration>

#proof[由主题、语义组件和 profile 的职责边界可直接得到。]

== 结构约束

#lemma[严格拒绝未知配置键可以尽早发现拼写错误。]

#remark[定理、定义与引理在同一节内共享计数；正文注释本身不编号。]

= 讨论

由 @def:stable 与 @thm:migration 可知，正式版式不要求复制已有模板。

#proposition[进入新的一级节后，共享计数从 2.1 重新开始。]

#acknowledgements[感谢所有公开字体、排版工具与中性测试素材的维护者。]

#appendices[
  = 补充验证

  附录继续使用同一正文样式，并以字母编号进入目录。
]
