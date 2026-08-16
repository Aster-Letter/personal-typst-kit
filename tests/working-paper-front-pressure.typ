#import "../lib.typ": working-paper, themes

#show: working-paper.with(
  meta: (
    title: [一个用于检查长中文题名、多作者、多单位和中英文摘要同时出现时首页容量的课程论文标题],
    subtitle: [Working Paper Front Matter Pressure Reproduction],
    authors: (
      (name: [第一作者], affiliation: [计算机学院 · 图形学课程 · 20260001]),
      (name: [第二作者], affiliation: [软件学院 · 数字媒体课程 · 20260002]),
      (name: [第三作者], affiliation: [人工智能学院 · 视觉计算课程 · 20260003]),
      (name: [第四作者], affiliation: [工程实践中心 · 联合培养项目 · 20260004]),
    ),
    organization: [某大学计算机科学与技术学院],
    course: [计算机图形学前沿],
    extra-lines: ([院系：计算机科学与技术学院], [指导教师：示例教师]),
    date: [2026 年 8 月 16 日],
    abstract: [
      这是一段有意写得较长的中文摘要，用来检查固定标题间距、四位作者网格、单位信息、日期、关键词和英文摘要同时出现时的首页容量。复现关注内容是否溢出到第二页、强制分页是否留下空白，以及摘要字号和行距能否随密度配置一起调整。这里重复加入若干正常课程论文会出现的信息，使测试覆盖接近真实的封面摘要页，而不依赖当前课程报告正文。
    ],
    keywords: ([课程论文], [模板回归], [首页容量], [中英文摘要]),
    english: (
      title: [A Long English Title for Reproducing Front Matter Pressure in a Working Paper Template],
      abstract: [
        This deliberately long abstract exercises the vertical gaps, the four-author grid, organization and date metadata, English keyword rendering, and the forced page break after the front matter. The reproduction reveals whether content naturally continues, whether a nearly empty page is introduced before the table of contents, and whether users can select a compact front-matter density without patching internal template files.
      ],
      keywords: ([course paper], [front matter], [layout regression], [typography]),
    ),
  ),
  theme: themes.academic,
  options: (
    front-matter: "cover-toc",
    front-matter-density: "compact",
    toc-depth: 2,
    header: true,
  ),
)

= 正文

若首页容量处理稳定，本标题应当出现在目录之后的正文页。
