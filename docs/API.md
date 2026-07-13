# 公共 API

所有稳定能力从 `lib.typ` 或 `@local/personal-typst-kit:0.1.0` 选择性导入。不要直接导入 `src/`。

## Profiles

- `paper(meta:, theme:, options:)[body]`
- `book(meta:, theme:, options:)[body]`
- `manual(meta:, theme:, options:)[body]`
- `handout(meta:, theme:, options:)[body]`

`meta.title` 必填。公共 `meta` 可包含 `subtitle`、`author`、`date`、`organization`、`version`、`status`、`abstract`、`keywords`、`course` 和 `audience`。

## Themes 与编号

- `themes.teal`、`themes.ink`、`themes.warm`、`themes.blue`
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
- Handout：`learning-objectives`、`definition-box`、`worked-example`、`exercise`、`lesson-summary`
- Draft：`draft-note`、`todo`；由 profile 的 `options.draft-mode` 控制 `show | hide | error`。
