# 当前方案

状态：v0.1.0 实施基线
最后更新：2026-07-13 21:56 (Asia/Shanghai)

## 项目定位

建立可安装的个人 Typst 文档工具包，以统一视觉基底覆盖论文、书稿、技术指南和学习者讲义，并保持对 AI 友好的稳定公共接口。

## 技术路线

- 最低 Typst 0.15.0，包形结构但暂不发布 Typst Universe。
- PDF 正式支持；HTML 使用 `target()` 提供实验降级。
- `lib.typ` 单入口；内部按 foundation、themes、components、profiles、extensions 分层。
- Windows/Linux CI 编译；本地精选页人工视觉审阅。

## v0.1.0 范围

- 四个 profile、四个主题、通用组件与三类扩展。
- Windows/Linux 本地包安装脚本和字体检查说明。
- 中性示例、主题画廊、合法/非法配置测试。
- MIT 许可证与私有 GitHub 仓库。

## 后置事项

- Typst Universe 发布、正式 HTML 版面、macOS 自动安装器、像素级视觉回归。
- 公开仓库前的隐私、字体和样例素材复核。
