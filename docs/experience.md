# 经验与常见问题总结 / Lessons & common pitfalls

> 以下条目汇总 tie 生态开发中反复出现的经验与常见问题，对应编译器警告标号
> （W00001..W00023）及若干语义错误。每条先给出有问题的写法，再说明其潜在影响，
> 最后给出处理建议。
> The following items summarize recurring lessons and common pitfalls in tie
> development, mapped to the warning codes (W00001..W00023) and related semantic
> errors. Each entry shows the problematic pattern, its impact, and a remedy.

## 1. 循环内字符串拼接累积 / Loop-local string accumulation —— W00003

```tie
var s: string = ""
while i < n {
    s = s + item(i)      // 每次拼接均生成新字符串并复制全部既有内容
    i = i + 1
}
```

* **潜在影响**：tie 字符串不可变，`s = s + x` 每次分配新对象并整体复制既有内容；
  循环 N 次的总成本为 O(N²)。实测 160K 次字符级拼接可耗尽 32GB 内存（jcc-pack
  zstd 一役）。逐位 `bits = bits + "1"` 同理。
* **处理建议**：改用 `string_builder` + `sb_append` / `sb_append_byte` +
  `sb_build`（线性成本）。

```tie
var sb = string_builder()
while i < n {
    sb_append(sb, item(i))
    i = i + 1
}
var s = sb_build(sb)
```

## 2. 逐字符 str_char 循环 / Per-character str_char loops —— O(n²) 变体

```tie
var out = ""
while i < n {
    out = out + str_char(s, i)   // str_char 本身 O(i)，再逐次拼接 → 双重 O(n²)
    i = i + 1
}
```

* **潜在影响**：`str_char` 的代价与索引成正比；循环内逐码点取值并拼接，总体退化为
  O(n²)。
* **处理建议**：整段使用 `string_builder` + `str_byte`（O(1) 字节访问）批量构串；
  需要逐码点迭代时使用 `for c in s.chars()` 或 `utf.to_chars(s)`。

## 3. 表变量拷贝共享底层数组 / Table copy shares backing array —— W00004

```tie
var a: table<i64> = table_new_i64()
var b = a          // b 与 a 共享同一底层数组
table_push(b, 99)
// a 亦变为 [99] —— 共享行为往往非预期
```

* **潜在影响**：`var b = a` 执行引用共享（浅拷贝）而非深拷贝；对 `b` 的修改会反映到
  `a`，跨函数传表亦然。以值语义预期时，将产生难以排查的共享状态缺陷。
* **处理建议**：需要独立副本时使用 `clone`（std/collection 或内置 clone 语义）；仅读
  共享则无需处理。

## 4. 浮点相等比较 / Float equality comparison —— W00001

```tie
var f: f64 = 0.1 + 0.2
if f == 0.3 { ... }   // 绝大多数情况下不成立
```

* **潜在影响**：浮点采用二进制表示，`0.1 + 0.2 != 0.3` 为典型表示误差；对浮点执行
  `==` 几乎恒为假，相关分支永不可达。
* **处理建议**：改用误差范围比较 `|a - b| <= eps`（eps 按数值量级选取，如 1e-9）。

## 5. 整数除法截断 / Integer division truncation —— W00002

```tie
var avg: i64 = total / count   // 7 / 2 == 3，小数部分被舍弃
```

* **潜在影响**：整数除法向下取整，小数部分被丢弃；统计、均值类计算所得结果与预期不符。
* **处理建议**：需要小数结果时先将操作数经 `as_f64` 转换（注意 `bitcast` 为位重解释
  而非数值转换）；需要舍入时使用 `(a + b/2) / b`，或转换后浮点 round。

## 6. 表下标越界写静默失败 / Out-of-range indexed write is silent

```tie
var t: table<i64> = table_new_i64()
t[5] = 42            // 不报错、不追加，静默丢弃
```

* **潜在影响**：`t[i] = v` 在 `i >= len(t)` 时静默失败——赋值不生效且无任何提示。
* **处理建议**：追加使用 `table_push(t, v)`；确认长度后再按下标写入。

## 7. 不可变字符串与二进制安全 / Immutable strings are byte-safe

* 字符串本质为字节串（二进制安全）；`len(s)` 返回字节数，`str_len(s)` 返回码点数。
* 混用字节/码点下标（`str_byte` 与 `str_char`）须谨慎：中文 1 字符对应 3 字节、1 码点。

## 8. 编译器开发相关的工程经验 / compiler development notes

* 同一文件并行多次编辑会相互覆盖——应串行单发并读回核对。
* 探针计数不得在成功路径充当「检查序号」——`check` 应返回 bool、仅失败时计数，否则
  产生假警报。
* `Start-Process` 的 `WaitForExit(ms)` 在本环境会假超时——应将输出重定向至文件并
  心跳轮询，超时后 `taskkill /F`。
* 运行时结构布局的变更必须同步编译期内联构造器（表句柄 48 字节五元组为现役事实）。
* 大整数字面量（如 `0x8000000000000000`）在 f64_bits 场景下会解析失败——须注意边界。
* 探针顺序纪律：断言前应先完成前置动作，否则序列错位导致假失败。