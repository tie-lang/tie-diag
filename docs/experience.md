# 经验与常见问题总结 / Lessons & common pitfalls

> 这些是 tie 生态开发中反复出现的「经验与常见问题」，对应编译器里的警告标号
> （W0001..W0023）与若干语义错误。以下各条先给出触发写法，再说明坏处，最后给
> 出修复建议。 / Experience distilled into warnings and errors — why a pattern is
> bad and how to fix it.

## 1. 循环内字符串拼接累积 —— W0003（这样写的坏处）

```tie
var s: string = ""
while i < n {
    s = s + item(i)      // 每次拼接生成新字符串并复制全部旧内容
    i = i + 1
}
```

* **坏处**：tie 字符串不可变，`s = s + x` 每次分配新串并把**已有的全部内容**再复制
  一遍。循环 N 次总成本 O(N²)：160K 次字符级拼接实测可耗尽 32GB 内存（jcc-pack
  zstd 教训）。逐位 `bits = bits + "1"` 同理。
* **修复**：`string_builder` + `sb_append`/`sb_append_byte` + `sb_build`（O(N)）。

```tie
var sb = string_builder()
while i < n {
    sb_append(sb, item(i))
    i = i + 1
}
var s = sb_build(sb)
```

## 2. 逐字符 str_char 循环 —— O(n²) 变体

```tie
var out = ""
while i < n {
    out = out + str_char(s, i)   // str_char 本身 O(i)，再逐次拼接 → 双重 O(n²)
    i = i + 1
}
```

* **坏处**：`str_char` 是 O(索引) 的码点取用；循环内逐码点取再拼接会退化为 O(n²)。
* **修复**：整段用 `string_builder` + `str_byte`（O(1) 字节访问）批量构串；需要逐码点
  迭代用 `for c in s.chars()` 或 `utf.to_chars(s)`。

## 3. 表变量拷贝共享底层数组 —— W0004（这样写的坏处）

```tie
var a: table<i64> = table_new_i64()
var b = a          // b 与 a 共享同一个底层数组
table_push(b, 99)
// a 亦变为 [99] —— 此共享行为往往非预期
```

* **坏处**：`var b = a` 是引用共享（浅拷贝），不是深拷贝；对 `b` 的修改会反映到 `a`，
  跨函数传表同样共享。多数新手把表当「值」写，得到「引用」的行为 → 难查的共享态 bug。
* **修复**：需要独立副本用 `clone`（std/collection 或 `clone` 内置语义）；只想读不要改
  则保留共享即可。

## 4. 浮点相等比较 —— W0001（这样写的坏处）

```tie
var f: f64 = 0.1 + 0.2
if f == 0.3 { ... }   // 几乎总是不成立
```

* **坏处**：浮点是二进制表示，`0.1 + 0.2 != 0.3` 是经典误差；`==` 对浮点几乎永远为假，
  导致分支永远走不到。
* **修复**：误差范围比较 `|a - b| <= eps`（eps 按量级取，如 1e-9）。

## 5. 整数除法截断 —— W0002（这样写的坏处）

```tie
var avg: i64 = total / count   // 7 / 2 == 3，小数被截断
```

* **坏处**：整数除法向下取整，丢小数；统计/均值类代码拿到的不是期望值。
* **修复**：需要小数结果先转 f64（`bitcast` 是位重解释不是转换；数值转换用 `as_f64`）；
  需要「四舍五入」用 `(a + b/2) / b` 或先转 f64 再 round。

## 6. 表下标越界写是静默失败

```tie
var t: table<i64> = table_new_i64()
t[5] = 42            // 不报错、不追加，静默丢弃！
```

* **坏处**：`t[i] = v` 在 `i >= len(t)` 时**静默失败**——赋值不生效且无任何提示。
* **修复**：追加用 `table_push(t, v)`；确知长度再按下标写。

## 7. 不可变字符串 vs 二进制安全

* 字符串是**字节串**（二进制安全），`len(s)` 是字节数，`str_len(s)` 是码点数。
* 混用字节/码点下标（`str_byte` vs `str_char`）要小心：中文 1 字 = 3 字节 1 码点。

## 8. 编译器自身相关的经验（给 tiec 开发者）

* 同一文件连续并行多个编辑会互相覆盖丢内容 —— 串行单发并读回核对。
* 探针计数不能在成功路径当「检查序号」——`check` 返回 bool、失败才计数，否则假警报。
* `Start-Process` 的 `WaitForExit(ms)` 在本环境假超时——输出重定向到文件 + 心跳轮询 +
  超时 `taskkill /F`。
* 运行时结构布局变更必须同步编译期内联构造器（表句柄 48 字节五元组是现役事实）。
* 大 i64 字面量（`0x8000000000000000`）在 f64_bits 场景会解析失败——注意边界。
* 探针顺序纪律：断言前先做前置动作，否则序列错位假失败。
