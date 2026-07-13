# ADR 0001：单入口、多构造器与分层公共 API

状态：已接受
日期：2026-07-13

## 背景

原模板要求使用者同时理解聚合组件、底层 token 和多个文档外壳，且 paper/book 之间存在大量重复。

## 决策

根部 `lib.typ` 是唯一公共门面，导出四个 profile 构造器、主题、编号预设、核心组件和明确命名的扩展。内部采用 foundation、themes、components、profiles、extensions 分层。

## 后果

- 使用者和 AI 只需先读取一个入口与 API 文档。
- profile 可以共享主题与组件而不复制实现。
- `src/` 属于内部实现，版本升级不承诺其路径稳定。
