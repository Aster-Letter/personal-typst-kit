#import "../../lib.typ": book, themes, source-quote, figure-grid, special-section

#show: book.with(
  meta: (
    title: [写作系统札记],
    subtitle: [从单篇文档到长期工具],
    author: [示例作者],
    organization: [个人出版实验],
    date: [2026-07],
  ),
  theme: themes.ink,
  options: (
    draft-mode: "hide",
    preface: [这是一份中性书稿示例，用于验证书名页、前言、目录、章节页和图片组。],
  ),
)

= 结构先于装饰

#source-quote(source: [编辑笔记])[当结构可以解释，风格变化才不会变成维护负担。]

书稿 profile 使用独立的前置页码和正文页码，同时沿用核心组件与主题 token。

== 同一基底上的变化

#figure-grid(
  (
    (source: path("../assets/grid-a.svg"), caption: [青绿构图], alt: "青绿色圆形和矩形"),
    (source: path("../assets/grid-b.svg"), caption: [蓝色构图], alt: "蓝色三角形和圆形"),
  ),
  caption: [共享轮廓语言的两种视觉变体],
)

#special-section(label: "CASE")[长文中的插入案例]

特殊章节进入目录并使用自己的视觉标记，但不会改变普通标题的编号计数。

= 可持续维护

稳定公共门面、清晰目录职责与回归示例共同构成长期维护基础。
