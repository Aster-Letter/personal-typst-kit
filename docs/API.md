# 公共 API

所有稳定能力从 `lib.typ` 或 `@local/personal-typst-kit:0.2.0` 选择性导入。不要直接导入 `src/`。

## Profiles

- `paper(meta:, theme:, options:)[body]`
- `working-paper(meta:, theme:, options:)[body]`
- `book(meta:, theme:, options:)[body]`
- `manual(meta:, theme:, options:)[body]`
- `handout(meta:, theme:, options:)[body]`

`meta.title` 必填。公共 `meta` 可包含 `subtitle`、`author`、`date`、`organization`、`version`、`status`、`abstract`、`keywords`、`course`、`audience` 和 `short-title`。

### Working Paper

`working-paper` 默认使用 `themes.academic`、A4、2.54cm 页边距、无页眉、正文从 1 开始和隐藏草稿水印。学术主题的正文与标题均使用 Noto Serif SC，标题通过较粗字重建立层级，并采用舒展的行距、段距与块间距。`options.front-matter` 接受：

- `cover-toc`：标题、署名、摘要置于封面，随后目录与正文；这是默认值。
- `title-page`：标题页后正文另起页，不生成目录。
- `inline`：标题、摘要与正文连续排在首页。

其他专用选项包括 `page-numbering-start: "body" | "document"` 和 `header: bool`。通用的 `paper`、`margin`、`toc-depth`、`numbering`、`draft-mode`、`bibliography` 仍可覆盖；`cover`、`toc` 不属于此 profile 的选项。

多作者使用 `meta.authors` 数组：

```typst
authors: (
  (name: [作者甲], affiliation: [机构], email: "a@example.org", corresponding: true),
  (name: [作者乙], affiliation: [机构], note: [共同一作]),
)
```

条目只接受 `name`、`affiliation`、`email`、`corresponding`、`note`；`name` 必填。省略 `authors` 和 `author` 时生成匿名稿；只提供旧 `author` 时按单作者处理，同时提供两者会报错。

可选英文块写为 `english: (title:, abstract:, keywords:)`。一旦出现，英文题名和摘要必填，关键词可省略。

## Themes 与编号

- `themes.teal`、`themes.ink`、`themes.warm`、`themes.blue`、`themes.academic`
- `theme-with(base, colors:, fonts:, type-scale:, spacing:)`
- `numbering-presets.cjk-paper`、`chapter`、`decimal`、`roman-outline`

## 核心组件

- `source-quote`、`callout`
- `figure-image`、`figure-grid`
- `code-block`、`steps`
- `cn-footnote`、`source-note`
- `special-section`

图片必须传 `path(...)`、bytes 或 content；裸字符串会报错。图片 `alt` 使用字符串。

## 扩展

- Manual：`prerequisites`、`revision-history`
- Handout：`learning-objectives`、`definition-box`、`worked-example`、`exercise`、`lesson-summary`、`response-area`
- Draft：`draft-note`、`todo`；由 profile 的 `options.draft-mode` 控制 `show | hide | error`。
- Working Paper：`theorem`、`lemma`、`proposition`、`definition`、`proof`、`remark`、`acknowledgements`、`appendices`。

`response-area(rows:, label:, ruled:)` 提供讲义内的中性作答区。`rows` 必须为正整数；颜色、边框和间距由当前主题控制，不接受项目视觉 token。

定理、引理、命题和定义按一级节共享计数，并可在元素后添加 Typst label 后使用 `@label` 引用。`proof` 自动显示结束方块；`remark` 默认不编号。`acknowledgements` 生成进入目录的无编号节，`appendices` 将其内部一级标题切换为“附录 A、B…”。
