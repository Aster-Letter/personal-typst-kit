#import "../../lib.typ": handout, themes, learning-objectives, definition-box, worked-example, exercise, lesson-summary, response-area, callout

#show: handout.with(
  meta: (
    title: [信息层级与阅读路径],
    subtitle: [学习者讲义示例],
    author: [示例教师],
    course: [文档设计基础],
    audience: [初学者],
    date: [2026-07],
  ),
  theme: themes.warm,
  options: (draft-mode: "hide", title-style: "compact"),
)

#learning-objectives(
  [区分内容语义、视觉主题与文档结构。],
  [判断一个组件是否应该进入核心。],
  [用最小示例验证公共接口。],
)

= 三种层次

#definition-box([语义组件])[表达内容用途而非具体颜色和边框的可复用排版单元。]

#worked-example[一段带来源的引文同时出现在论文与书稿中，因此适合进入核心；修订历史只服务技术指南，因此留在扩展。]

== 自检

#exercise(points: 5)[为“课程作业封面”判断归属层次，并说明它为什么不应进入通用核心。]

#response-area(rows: 3, label: [作答区], ruled: true)

#callout(kind: "tip")[优先从真实复用场景抽象，不为尚未出现的需求提前制造接口。]

#lesson-summary(
  [组件表达“是什么”。],
  [主题表达“长什么样”。],
  [profile 表达“如何组织成一份文档”。],
)
