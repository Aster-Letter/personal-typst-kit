#import "../lib.typ": working-paper

#show: working-paper.with(
  meta: (
    title: [多作者与长摘要压力测试],
    short-title: [多作者压力测试],
    authors: (
      (name: [作者一], affiliation: [具有较长名称的第一开放研究机构], email: "one@example.org", corresponding: true),
      (name: [作者二], affiliation: [第二研究机构]),
      (name: [作者三], affiliation: [第三研究机构]),
      (name: [作者四], affiliation: [第四研究机构]),
      (name: [作者五], affiliation: [第五研究机构], note: [共同一作]),
      (name: [作者六], affiliation: [第六研究机构]),
    ),
    abstract: [这是一段用于验证多作者换行和较长摘要分页行为的中性文字。模板不得通过缩小字号或裁切内容强制把所有信息塞入单页。],
    english: (
      title: [Stress Test for Multiple Authors],
      abstract: [This paragraph checks wrapping, bilingual metadata, and stable title-page flow without clipping.],
    ),
  ),
  options: (front-matter: "cover-toc"),
)

= 正文

压力测试正文。
