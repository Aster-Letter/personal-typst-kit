#import "../lib.typ": working-paper, themes, densities, theme-with

#let normal-theme = theme-with(themes.academic, spacing: densities.normal)

#show: working-paper.with(
  meta: (
    title: [工作论文正文节奏回归样例],
    author: [匿名作者],
    abstract: [本样例集中检查长段落、分级标题、块级公式、图表、列表与参考文献的纵向节奏。],
    keywords: ([正文排版], [视觉回归], [Typst]),
  ),
  theme: normal-theme,
  options: (
    front-matter: "cover-toc",
    bibliography: (
      sources: (path("working-paper-spacing.bib"),),
      full: true,
    ),
  ),
)

= 正文密度与层级

正式论文的正文既要保持连续阅读的效率，也要让读者能够在章节、论证、公式和图表之间迅速切换。行距过窄时，汉字笔画、拉丁字母和行内数学符号会形成连续的灰色纹理；段距和标题间距不足时，不同论证单元也容易在视觉上粘连。#footnote[脚注保持较小字号，但需要有足够的行距以及与正文的分隔。]

排版节奏不应依靠空行临时修补，而应由主题提供稳定的视觉参数。这样，正文内容可以保持语义化，调用者也能在不重写 profile 的前提下调整密度。较长的中文段落用于观察两端对齐、首行缩进以及中英文混排后的基线关系，并确认页边距内没有过密或松散的局部区域。

== 公式与推导

令观测值由线性模型生成，其中 $x_(i,j)$ 表示第 $i$ 个样本的第 $j$ 个特征。块级公式应与前后正文保持清晰但不过分夸张的间隔：

$ y_i = beta_0 + sum_(j=1)^p beta_j x_(i,j) + epsilon_i. $

采用平方损失与二次正则项，可得到目标函数

$ cal(L)(beta) = 1/n sum_(i=1)^n (y_i - x_i^T beta)^2 + lambda norm(beta)_2^2. $

连续公式之间需要形成稳定的推导节奏，公式后的解释文字则应自然回到正文网格。这里继续加入一段说明，用于检查公式、段落和后续三级标题之间的距离是否均衡。

=== 局部说明

三级标题仍应比普通段落明显，但不应占用与一级标题相同的垂直空间。短标题后的正文需要保留足够呼吸，同时维持节内信息的紧凑关联。

== 图与表

图像、图题及相邻正文应形成一个完整单元。图题应靠近图像，而整个 figure 与上下文之间应有更明确的留白。

#figure(
  rect(
    width: 82%,
    height: 38mm,
    radius: 2pt,
    fill: rgb("#f6f7f9"),
    stroke: 0.6pt + rgb("#d0d5dd"),
    align(center + horizon)[#strong[结构化流程示意]],
  ),
  caption: [正文、模型与输出之间的结构化关系],
)

图后正文应在视觉上重新开始，而不是紧贴图题。表格同样通过 figure 包装，以获得统一编号、题注和上下间距。

#figure(
  table(
    columns: (1.4fr, 1fr, 1fr),
    align: (left, center, center),
    inset: (x: 0.7em, y: 0.55em),
    stroke: 0.45pt + rgb("#d0d5dd"),
    table.header([指标], [方案甲], [方案乙]),
    [平均误差], [0.128], [0.104],
    [稳定性], [良好], [优秀],
    [运行成本], [较低], [中等],
  ),
  kind: table,
  caption: [两种方案的中性比较],
)

表后段落用于检查大型块元素结束后的恢复距离。推荐以 figure 包装需要编号和题注的表格，这也与 Typst 的表格语义保持一致。

= 讨论与检查项

除正文、标题、公式和图表之外，列表、定理类环境、脚注与参考文献也需要保持一致的节奏。列表项之间应可区分，但不能像普通段落一样松散：

- 标题层级清晰；
- 公式前后距离稳定；
- 图、表及题注形成完整单元；
- 参考文献的条目与条目之间可辨识。

最后一段用于观察一级标题后的长文本，并为独立参考文献页提供连续正文环境。参考文献保持学术文本常见的悬挂缩进，同时提高条目内行距并增加条目间距，避免长英文题名和出版信息形成难以定位的文字墙。
