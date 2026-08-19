# 公共 API

所有稳定能力从 `lib.typ` 或 `@local/personal-typst-kit:0.2.3` 选择性导入。不要直接导入 `src/`。

## Profiles

- `paper(meta:, theme:, options:)[body]`
- `working-paper(meta:, theme:, options:)[body]`
- `book(meta:, theme:, options:)[body]`
- `manual(meta:, theme:, options:)[body]`
- `handout(meta:, theme:, options:)[body]`

`meta.title` 必填。公共 `meta` 可包含 `subtitle`、`author`、`date`、`organization`、`version`、`status`、`abstract`、`keywords`、`course`、`extra-lines`、`audience` 和 `short-title`。

`handout` 的 `options.title-style` 接受 `"panel" | "compact"`。默认 `"panel"` 使用带强调色底的标题卡片；`"compact"` 使用左对齐标题、可选副标题和分隔线，适合需要在标题后自行补充课程信息的讲义。

### Working Paper

`working-paper` 默认使用 `themes.academic`、A4、2.54cm 页边距、无页眉、正文从 1 开始和隐藏草稿水印。学术主题的正文与标题均使用 Noto Serif SC，标题通过较粗字重建立层级，并分别控制正文行距、段距、三级标题前后距、块级公式、figure、题注、列表和参考文献节奏。`options.front-matter` 接受：

- `cover-toc`：标题、署名、摘要置于封面，随后目录与正文；这是默认值。
- `title-page`：标题页后正文另起页，不生成目录。
- `inline`：标题、摘要与正文连续排在首页。

其他专用选项包括 `page-numbering-start: "body" | "document"` 和 `header: bool`。通用的 `paper`、`margin`、`toc-depth`、`numbering`、`draft-mode`、`bibliography` 仍可覆盖；`cover`、`toc` 不属于此 profile 的选项。

`options.front-matter-density` 接受 `compact | normal | relaxed`，只改变标题页和摘要区的垂直节奏，默认 `normal`。正文密度由主题决定，两者不会互相覆盖。`meta.course` 会显示为课程行；其他课程论文信息使用 `meta.extra-lines` 数组，例如 `([院系：计算机学院], [指导教师：某教师], [学号：20260001])`。

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
- `densities.compact`、`densities.normal`、`densities.relaxed`
- `theme-with(base, colors:, fonts:, type-scale:, spacing:, styles:)`
- `numbering-presets.cjk-paper`、`chapter`、`decimal`、`roman-outline`

内置主题的 `spacing` 除正文、标题、公式、figure、题注、列表、脚注和参考文献 token 外，还覆盖目录、front matter、代码块与论文表格间距。三档 `densities` 会同时调整正文行距、段距、主要块间距和目录条目间距；`styles` 提供 `link-underline`、`bibliography-justify` 和 `bibliography-link-underline`。学术主题默认让参考文献左对齐、使用弱链接色且不加下划线；旧自定义主题缺少新增键时使用兼容回退值。

正文密度示例：

```typst
#import "@local/personal-typst-kit:0.2.3": themes, densities, theme-with
#let normal-paper = theme-with(themes.academic, spacing: densities.normal)
```

## 核心组件

- `source-quote`、`callout`
- `figure-image`、`figure-grid`
- `code-block(title:, language:, breakable: auto | bool)[body]`、`steps`
- `cn-footnote`、`source-note`
- `special-section`

图片必须传 `path(...)`、bytes 或 content；裸字符串会报错。图片 `alt` 使用字符串。

## 扩展

- Manual：`prerequisites`、`revision-history`
- Handout：`learning-objectives`、`definition-box`、`worked-example`、`exercise`、`lesson-summary`、`response-area`
- Draft：`draft-note`、`todo`；由 profile 的 `options.draft-mode` 控制 `show | hide | error`。
- Working Paper：`theorem`、`lemma`、`proposition`、`definition`、`proof`、`remark`、`acknowledgements`、`paper-table`、`appendices`。

`response-area(rows:, label:, ruled:)` 提供讲义内的中性作答区。`rows` 必须为正整数；颜色、边框和间距由当前主题控制，不接受项目视觉 token。

定理、引理、命题和定义按一级节共享计数，并可在元素后添加 Typst label 后使用 `@label` 引用。`proof` 自动显示结束方块；`remark` 默认不编号。`paper-table(caption:, note:, align:, inset:, header-fill:, outlined:)[table(...)]` 提供轻量表头、边框、单元格 inset、表下注释和 caption 组合，但表格列与数据仍由调用者定义。

`acknowledgements` 生成进入目录的无编号节。`appendices(pagebreak:, numbering:, outlined:)[body]` 默认独立起页，将内部一级标题切换为“附录 A、B…”并进入目录。`working-paper` 还会把规范化作者、摘要和关键词同步写入 PDF/HTML 文档元数据。
