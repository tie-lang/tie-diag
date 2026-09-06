# 标号是怎么来的 / How codes are minted

## 生成链 / Pipeline

```
compiler/**/*.tie 源码（sm_err_msg / g_err / return "..." / 消息表 / panic）
        │  scripts/gen-diagcodes.ps1（tie-main 仓库）
        ▼
diagcode_cat.gen.tie（tiec 内置查表：exact + 最长前缀）
diagcodes.json（机器可读清单：code/key/name/family/src/template）
        │  docs/gen-docs.ps1（本仓库）
        ▼
docs/errors-eN.md（按标号：成因 + 常见解决方案）
```

* 标号分配：`E<家族><4 位序号>`，家族 E1 词法 / E2 语法 / E3 语义 / E4 运行时 /
  E5 CLI配置 / E6 后端IR / E7 REPL / E8 LSP / E9 内部错误；`W####` 警告独立编号。
* 归一化：消息的连续 ASCII（0x20..0x7E）折叠为 `%`，插值消息用「前 1~2 字面段」前缀
  规则兜底——动态尾（路径/宏名/错误文本）不参与精确匹配。
* 警告核心消息与编译器发射点**逐字一致**（warn_at 原始字节二分）。

## 新增/修订一条消息 / Adding or changing a message

1. 在 tie-main 改消息文本 → 重新生成目录：
   `powershell -File scripts/gen-diagcodes.ps1`（tie-main 仓库）。
2. 同步 `diagcodes.json` 到本仓库 `docs/diagcodes.json`。
3. 重建文档：`powershell -File docs/gen-docs.ps1`（本仓库）。
4. 若希望该标号有**专属**成因/方案，在 `docs/gen-docs.ps1` 的 `$nameMap`
   （按消息名前缀）里补一条；否则自动落到家族/前缀兜底说明。
5. 提交两仓库（tie-main：目录 + 生成器；本仓库：json + 文档）。

## 警告标号表 / Warning registry

警告编号 W0001.. 由人工维护（`compiler/frontend/diagcode.tie` 的 ensure_warns +
本仓库 `docs/warnings.md`）；新增警告时两处同步，并写明「这样写的坏处」。

## E0000 兜底 / Fallback

`E0000` = 消息未登记（多为旧版/过时文本或新加消息未重新生成目录）。
看到它请按上面流程补登记。
