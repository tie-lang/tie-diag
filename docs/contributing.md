# 标号是怎么来的 / How codes are minted

## 生成链 / Pipeline

```
compiler/**/*.tie 源码（sm_err_msg / g_err / return "..." / 消息表 / panic）
        │  scripts/gen-diagcodes.tie（tie 生成器）（tie-main 仓库，tie 语言生成器）
        ▼
diagcode_cat.gen.tie（tiec 内置查表：exact + 最长前缀）
diagcodes.data.tie（td 表字面量清单：code/key/name/family/src/template；性能敏感读取用 zd 变体）
        │  docs/gen-docs.ps1（本仓库）
        ▼
docs/docs/error.md（按标号：成因 + 常见解决方案）
```

* 标号分配：`E` + 5 位纯序号（E00001 起全局连续）；家族（词法 / 语法 / 语义 / 运行时 /
  CLI配置 / 后端IR / REPL / LSP / 内部错误）仅记入 td 清单 family 字段，不编码进标号；警告同五位（`W#####`）。
* 归一化：消息的连续 ASCII（0x20..0x7E）折叠为 `%`，插值消息用「前 1~2 字面段」前缀
  规则兜底——动态尾（路径/宏名/错误文本）不参与精确匹配。
* 警告核心消息与编译器发射点**逐字一致**（warn_at 原始字节二分）。

## 新增/修订一条消息 / Adding or changing a message

1. 在 tie-main 改消息文本 → 重新生成目录：
   `powershell -File scripts/gen-diagcodes.tie（tie 生成器）`（tie-main 仓库，tie 语言生成器）。
2. 同步 `diagcodes.data.tie`（及性能敏感用的 `diagcodes.zd`）到本仓库 `docs/`。
3. 重建文档：`powershell -File docs/gen-docs.ps1`（本仓库）。
4. 若希望该标号有**专属**成因/方案，在 `docs/gen-docs.ps1` 的 `$nameMap`
   （按消息名前缀）里补一条；否则自动落到家族/前缀兜底说明。
5. 提交两仓库（tie-main：目录 + 生成器；本仓库：td 清单 + 文档）。

## 警告标号表 / Warning registry

警告编号 W00001.. 由人工维护（`compiler/frontend/diagcode.tie` 的 ensure_warns +
本仓库 `docs/warnings.md`）；新增警告时两处同步，并写明「潜在影响与处理建议」。

## E00000 兜底 / Fallback

`E00000` = 消息未登记（多为旧版/过时文本，或新增消息未重新生成目录）。
如遇 `E00000`，请按前述流程补充登记。
