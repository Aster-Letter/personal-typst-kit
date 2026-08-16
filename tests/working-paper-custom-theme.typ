#import "../lib.typ": working-paper, themes

#let legacy-colors = themes.ink.colors
#let _ = legacy-colors.remove("heading")
#let _ = legacy-colors.remove("link")
#let _ = legacy-colors.remove("bibliography-link")
#let legacy-spacing = themes.ink.spacing
#for key in (
  "heading-1-above", "heading-1-below",
  "heading-2-above", "heading-2-below",
  "heading-3-above", "heading-3-below",
  "display-math-gap", "figure-gap", "caption-gap",
  "bibliography-leading", "bibliography-gap",
  "list-gap", "list-block-gap",
  "footnote-leading", "footnote-clearance", "footnote-entry-gap",
  "outline-title-above", "outline-title-below", "outline-entry-gap",
  "front-top", "front-subtitle-gap", "front-authors-gap",
  "front-author-row-gap", "front-author-notes-gap", "front-organization-gap",
  "front-details-gap", "front-version-gap", "front-date-gap",
  "front-abstract-gap", "front-abstract-title-gap", "front-keywords-gap",
  "front-english-title-gap", "front-english-abstract-gap",
  "code-block-gap", "code-block-inset", "code-block-header-gap",
  "paper-table-inset-x", "paper-table-inset-y", "paper-table-note-gap",
) {
  let _ = legacy-spacing.remove(key)
}
#let legacy-theme = themes.ink + (colors: legacy-colors, spacing: legacy-spacing)
#let _ = legacy-theme.remove("styles")

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

缺少新增颜色和间距 token 的旧自定义主题应使用兼容回退值。
