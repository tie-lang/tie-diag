# tie-diag —— tie 编译器诊断标号大全 / tie compiler diagnostic codes

> 每种标号的**成因（如何发生）**与**常见解决方案**，以及警告的**潜在影响与处理建议**。
> How each code happens and the common fixes — plus why each warning pattern is bad.

本仓库是 [tie-main](https://github.com/tie-lang/tie-main)（tiec 编译器）的配套文档：
tiec 的所有错误/警告都带 C# 式标号，按本文档逐条查询。

## 输出格式 / Output format

```
error[E#####] @行:列: 消息名；期望 x；实际 y；提示。
warning[W#####] @行:列: 消息名；潜在影响与处理建议。
```

* `error[E#####]` / `warning[W#####]`：稳定标号（编译报错/警告用），可搜索、可引用、
  可写进 CI 断言。
* `@行:列:`：源码位置（CLI 级错误无位置，省略该段）。
* `消息名；期望 x；实际 y；提示。`：短消息结构——`；` 分隔「期望 / 实际 / 提示」，
  无对应段时直连下一个 `；`。

## 标号规范 / Code scheme

* 错误标号为**五位纯序号**：`E` + 5 位数字（`E00001` 起全局连续，按消息登记序）。
  家族信息**不编码进标号**，仅作为文档/td 清单（`family` 字段）的归类维度。
* 警告标号同为五位：`W` + 5 位数字（`W00001` 起，见 [docs/warnings.md](docs/warnings.md)）。

## 家族归类 / Code families

| 家族 | 归类 | 说明 |
| --- | --- | --- |
| 1 | 词法 / Lexer | 字符串/字符/注释/转义等扫描错误 |
| 2 | 语法 / Parser | 期望 X 实际 Y、标签、extern 顶层等解析错误 |
| 3 | 语义 / Semantic | 类型、作用域、调用、移动语义、泛型、宏展开等 |
| 4 | 运行时 / Runtime | 解释器/REPL 桥、内置函数参数错误、除零等 |
| 5 | CLI 与配置 / CLI & Config | 参数、角色、config 解析、compress-data 等 |
| 6 | 后端与 IR / Backend & IR | 工具链（opt/clang/llvm-ar/lld）、tieir 等 |
| 7 | REPL 与解释 / REPL | REPL v1 暂不支持项 |
| 8 | LSP | 语言服务器诊断（规划） |
| 9 | 内部错误与未分类 / Internal | 编译器自身断言（应报告 bug） |

## 文档导航 / Contents

* [docs/errors-e1.md](docs/errors-e1.md) — 词法（自动目录 + 说明）
* [docs/errors-e2.md](docs/errors-e2.md) — 语法：成因与常见解决方案（详细）
* [docs/errors-e3.md](docs/errors-e3.md) — 语义：成因与常见解决方案（详细）
* [docs/errors-e4.md](docs/errors-e4.md) — 运行时（解释器/内置函数）
* [docs/errors-e5.md](docs/errors-e5.md) — CLI 与配置
* [docs/errors-e6.md](docs/errors-e6.md) — 后端与 IR
* [docs/errors-e9.md](docs/errors-e9.md) — 内部错误（报 bug 指引）
* [docs/warnings.md](docs/warnings.md) — 全部警告标号 + 潜在影响与处理建议（详细）
* [docs/experience.md](docs/experience.md) — 经验与常见问题总结
* [docs/diagcodes.data.tie](docs/diagcodes.data.tie) — 机器可读标号清单（td 表字面量；code/key/name/family/src/template）；性能敏感读取用 [docs/diagcodes.zd](docs/diagcodes.zd)（zd 变体）
* [docs/contributing.md](docs/contributing.md) — 标号是怎么来的（生成器 + 新增标号流程）

## 快速定位 / Quick lookup

1. 编译报错带着标号：`error[E30256] ...`。
2. 在本文档按 `E30256` 搜索，或在 [docs/diagcodes.data.tie](docs/diagcodes.data.tie) 里按
   `code` 精确查。
3. 未分类消息显示 `E00000`：说明该消息尚未登记（多为旧版/过时文本），请按
   [docs/contributing.md](docs/contributing.md) 补登记。

## License

* [LICENSE](LICENSE)（TIE-LANG Open Source License v1.1）
