# 仓库结构索引

状态：当前结构索引
最后更新：2026-08-16 (Asia/Shanghai)

## 根目录与入口

- `lib.typ`：唯一公共门面。
- `typst.toml`：0.2.2 包元数据和最低编译器版本。
- `README.md`、`docs/`：中文用户文档、API 指南和模板演进流程。

## 源码

- `src/foundation/`：验证、主题/草稿上下文、编号、共享 shell。
- `src/themes/`：主题 schema、五套预设和覆盖函数。
- `src/components/`：跨 profile 的通用语义组件。
- `src/profiles/`：paper、working-paper、book、manual、handout 构造器。
- `src/extensions/`：working-paper、manual、handout 和 draft 专用能力。

## 验证与工具

- `examples/`：五种中性示例与主题画廊。
- `tests/`：公共入口、正文密度视觉回归、非法配置和本地包导入测试。
- `scripts/`：安装、字体检查、编译、视觉渲染和参数化消费者冒烟脚本。
- `.github/workflows/`：Windows/Linux 自动验证。

## Agent 文档与隐私

- `AGENTS.md` 是最小启动入口；稳定计划和结构索引提交到 `docs-agent/`。
- `docs-agent/logs/`、`sessions/`、构建输出和渲染产物由 `.gitignore` 排除。
