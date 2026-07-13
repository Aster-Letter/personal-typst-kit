# personal-typst-kit Agent 指南

最后更新：2026-07-13 21:56 (Asia/Shanghai)

## 极简概要

本项目是一个中文优先、可换主题的 Typst 文档工具包，统一支持论文、书稿、技术指南和学习者讲义。

## 必读索引

- 当前方案：`docs-agent/CURRENT_PLAN.md`
- 仓库结构：`docs-agent/STRUCTURE.md`
- 稳定术语：`CONTEXT.md`
- 历史架构决策：`docs-agent/decisions/`
- 用户文档：`README.md` 与 `docs/`

## 工作原则

- 公共入口只通过 `lib.typ` 导出，示例使用选择性导入。
- 语义组件至少被两类文档真实复用后才进入核心；单用途能力留在扩展。
- 主题只控制视觉 token，profile 控制文档结构，二者不得互相吞并职责。
- 包内不得拼接调用项目的相对路径；项目资源必须由调用方以 `path(...)`、bytes 或 content 传入。
- 改动公共 API、目录职责或关键边界时，同步更新 API 文档、结构索引和必要 ADR。

## 技术与隐私边界

- 最低编译器版本为 Typst 0.15.0；PDF 是正式目标，HTML 是实验目标。
- 仓库当前为私有，但所有已跟踪内容必须按未来可公开标准处理。
- 不得加入课程论文、身份信息、未经授权图片、字体二进制或不明来源素材。

## 检查入口

- Windows：`powershell -ExecutionPolicy Bypass -File scripts/test.ps1`
- Linux：`bash scripts/test.sh`
- 视觉审阅：`powershell -ExecutionPolicy Bypass -File scripts/render-review.ps1`
