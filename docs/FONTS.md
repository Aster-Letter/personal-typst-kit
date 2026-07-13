# 推荐字体与 fallback

本仓库不提交字体二进制。默认字体栈优先使用下列可公开核验的字体：

- 中文正文：Source Han Serif SC（思源宋体，SIL Open Font License 1.1）。
- 中文标题：Source Han Sans SC（思源黑体，SIL Open Font License 1.1）。
- 拉丁代码：JetBrains Mono（SIL Open Font License 1.1）。

官方来源：

- https://github.com/adobe-fonts/source-han-serif
- https://github.com/adobe-fonts/source-han-sans
- https://github.com/JetBrains/JetBrainsMono

系统 fallback：

- Windows：SimSun、Microsoft YaHei、Cascadia Mono、Times New Roman。
- macOS：Songti SC、PingFang SC、Menlo、Times New Roman。
- Linux：Noto Serif/Sans CJK SC、DejaVu Sans Mono、Liberation Serif。

运行 `scripts/check-fonts.ps1` 或 `scripts/check-fonts.sh` 查看当前 Typst 可发现的字体。只有能确认官方免费来源和许可证的字体才可进入默认清单；不稳定网盘链接不得成为构建依赖。
