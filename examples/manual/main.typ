#import "../../lib.typ": manual, themes, theme-with, prerequisites, revision-history, steps, code-block, callout

#let history = revision-history((
  (version: [0.1.0], date: [2026-07-13], summary: [建立安装、配置与验证流程。]),
  (version: [0.1.1], date: [计划中], summary: [根据真实使用反馈调整接口。]),
))

#show: manual.with(
  meta: (
    title: [本地文档工具安装指南],
    subtitle: [安装、配置与故障排查],
    author: [维护者],
    organization: [示例技术团队],
    version: [0.1.0],
    status: [内部预览],
    date: [2026-07],
  ),
  theme: theme-with(themes.blue, spacing: (leading: 0.68em)),
  options: (
    draft-mode: "hide",
    revision-history: history,
  ),
)

= 开始之前

#prerequisites(
  [Typst 0.15 或更高版本],
  [可写的本地包目录],
  [能够运行 PowerShell 或 shell 脚本],
)

== 安装步骤

#steps(
  [克隆仓库并进入项目目录。],
  [运行对应平台的本地安装脚本。],
  [编译一个使用 `@local` 导入的最小文档。],
)

#code-block(title: [最小导入], language: [Typst])[
  #raw("#import \"@local/personal-typst-kit:0.1.0\": paper, themes", block: true, lang: "typ")
]

#callout(kind: "warning")[不要在包内拼接调用项目的图片路径；应由调用方先构造 `path(...)`。]

= 故障排查

如果出现缺字，先运行字体检查脚本，再通过 `TYPST_FONT_PATHS` 指向已下载的开源字体目录。
