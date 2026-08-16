#import "@local/personal-typst-kit:0.2.1": working-paper, themes, theorem
#show: working-paper.with(
  meta: (title: [本地包导入测试], authors: ((name: [示例作者]),)),
  theme: themes.academic,
  options: (front-matter: "inline"),
)
= Import
#theorem[本文件验证 0.2.1 的版本化导入与正式论文公共 API。]
