# 仓库结构索引

状态：当前结构索引
最后更新：2026-07-13 21:56 (Asia/Shanghai)

## 根目录与入口

- `lib.typ`：唯一公共门面。
- `typst.toml`：0.1.0 包元数据和最低编译器版本。
- `README.md`、`docs/`：中文用户文档和 API 指南。

## 源码

- `src/foundation/`：验证、主题/草稿上下文、编号、共享 shell。
- `src/themes/`：主题 schema、四套预设和覆盖函数。
- `src/components/`：跨 profile 的通用语义组件。
- `src/profiles/`：paper、book、manual、handout 构造器。
- `src/extensions/`：manual、handout 和 draft 专用能力。

## 验证与工具

- `examples/`：四种中性示例与主题画廊。
- `tests/`：公共入口、非法配置和本地包导入测试。
- `scripts/`：安装、字体检查、编译和视觉渲染脚本。
- `.github/workflows/`：Windows/Linux 自动验证。

## Agent 文档与隐私

- `AGENTS.md` 是最小启动入口；稳定计划和结构索引提交到 `docs-agent/`。
- `docs-agent/logs/`、`sessions/`、构建输出和渲染产物由 `.gitignore` 排除。
