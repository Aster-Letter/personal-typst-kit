#import "../../lib.typ": paper, themes, source-quote, figure-image, callout, source-note

#show: paper.with(
  meta: (
    title: [面向长期写作的文档结构],
    subtitle: [语义组件、主题与文档配置的协作方式],
    author: [示例作者],
    organization: [个人写作实验室],
    date: [2026-07],
    abstract: [本文使用中性内容验证论文封面、摘要、目录、标题编号、图片、脚注与参考文献。],
    keywords: ([Typst], [文档架构], [可复用模板]),
  ),
  theme: themes.teal,
  options: (
    draft-mode: "hide",
    bibliography: (
      sources: (path("refs.bib"),),
      full: true,
    ),
  ),
)

= 引言

#source-quote(source: [项目约定])[结构稳定以后，变化应通过主题和配置表达，而不是复制整套模板。]

一份可维护的模板需要明确资源边界、公共接口与验证入口。Typst 的官方文档提供了相关语言与包机制说明 @typst-docs。

== 结构原则

#callout(kind: "tip", title: [核心判断])[只有跨文档类型复用的稳定能力才进入核心组件。]

#figure-image(
  path("../assets/diagram.svg"),
  caption: [语义、主题与文档配置的协作关系],
  alt: "三个相连的圆形表示三个文档层次",
  width: 72%,
)

正文脚注示例#source-note[该脚注用于检查跨页脚注和来源说明的可读性。]。

= 结论

稳定的接口让内容可以在不同视觉和文档结构之间迁移，同时避免课程或项目特例污染核心。
