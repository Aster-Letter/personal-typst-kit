# personal-typst-kit

一个中文优先、视觉基底一致且可换主题的 Typst 0.15+ 文档工具包，覆盖工作论文、随和论文、书稿、技术指南和学习者讲义。

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
#import "@local/personal-typst-kit:0.2.1": working-paper, themes, theorem

#show: working-paper.with(
  meta: (
    title: [文档标题],
    authors: ((name: [作者], affiliation: [示例机构]),),
  ),
  theme: themes.academic,
  options: (front-matter: "inline"),
)

= 引言

#theorem[正式工作论文中的定理、定义、引理和命题按节共享计数。]
```

## 设计边界

- 组件表达语义，主题表达视觉，profile 表达文档结构。
- PDF 是完整支持目标；HTML 是实验目标。
- 项目图片和 Bib 由调用方构造 `path(...)` 后传入，包不会猜测项目路径。
- 默认不包含字体文件；字体清单和 fallback 见 `docs/FONTS.md`。

完整 API 见 `docs/API.md`，五类可编译入口见 `examples/`。`paper` 保留随和风格，`working-paper` 提供正式学术结构。真实消费者推动模板演进时，遵循 `docs/TEMPLATE_EVOLUTION.md`。

`working-paper` 默认采用舒展正文；可通过 `densities.compact | normal | relaxed` 覆盖正文密度，并用 `options.front-matter-density` 单独控制封面容量。课程信息使用 `meta.course` 与通用 `meta.extra-lines`，不在公共包中固化学号或院系模型。

## 验证

```powershell
powershell -ExecutionPolicy Bypass -File scripts/test.ps1
powershell -ExecutionPolicy Bypass -File scripts/render-review.ps1
```

## License

模板源码采用 MIT License。字体、示例素材仍遵循各自来源和许可证。
