#import "../lib.typ": working-paper, themes

#let legacy-colors = themes.ink.colors
#legacy-colors.remove("heading")
#legacy-colors.remove("link")
#let legacy-theme = themes.ink + (colors: legacy-colors,)

#show: working-paper.with(
  meta: (
    title: [旧主题兼容测试],
    authors: (
      (name: [作者甲], affiliation: [第一机构]),
      (name: [作者乙], affiliation: [第二机构]),
    ),
  ),
  theme: legacy-theme,
  options: (front-matter: "inline"),
)

= 正文

缺少 `heading` 和 `link` token 的旧自定义主题应回退到 `accent`。
