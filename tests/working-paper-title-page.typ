#import "../lib.typ": working-paper

#show: working-paper.with(
  meta: (
    title: [独立标题页测试],
    author: [单作者简写],
    abstract: [标题页之后正文另起一页。],
  ),
  options: (front-matter: "title-page", page-numbering-start: "document", header: true),
)

= 正文

本页验证全文连续编号，并确认 title-page 模式的正文 running header 生效。
