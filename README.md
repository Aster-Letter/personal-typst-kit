# personal-typst-kit

一个中文优先、视觉基底一致且可换主题的 Typst 0.15+ 文档工具包，覆盖论文、书稿、技术指南和学习者讲义。

## 安装

克隆仓库后运行：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-local.ps1
```

Linux：

```bash
bash scripts/install-local.sh
```

安装后使用版本化本地包导入：

```typst
#import "@local/personal-typst-kit:0.1.0": paper, themes, source-quote

#show: paper.with(
  meta: (title: [文档标题], author: [作者]),
  theme: themes.teal,
  options: (draft-mode: "hide"),
)

= 引言

#source-quote(source: [示例来源])[一段带来源的引文。]
```

## 设计边界

- 组件表达语义，主题表达视觉，profile 表达文档结构。
- PDF 是完整支持目标；HTML 是实验目标。
- 项目图片和 Bib 由调用方构造 `path(...)` 后传入，包不会猜测项目路径。
- 默认不包含字体文件；字体清单和 fallback 见 `docs/FONTS.md`。

完整 API 见 `docs/API.md`，四类可编译入口见 `examples/`。

## 验证

```powershell
powershell -ExecutionPolicy Bypass -File scripts/test.ps1
powershell -ExecutionPolicy Bypass -File scripts/render-review.ps1
```

## License

模板源码采用 MIT License。字体、示例素材仍遵循各自来源和许可证。
