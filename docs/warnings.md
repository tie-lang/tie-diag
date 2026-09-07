# 警告标号大全 / Warning codes

> 每条警告都包含「这样写的坏处」与修复建议。当前编译器发射 W0001..W0004、W0020..W0023；
> 其余（W0005..W0019）为规划中的经验型检查，文档先行。
> Every warning carries why-the-pattern-is-bad plus a fix. W0001..W0004 and
> W0020..W0023 are emitted today; W0005..W0019 are planned checks (docs first).

## W0001 浮点相等比较 / Float equality comparison

* 触发：`==` / `!=` 用于 f64/f32 操作数。
* 这样写的坏处：浮点二进制表示有误差（`0.1 + 0.2 != 0.3`），完全相等几乎总是不成立，
  分支可能永远走不到；测试里还会给出脆弱的「精确相等」断言。
* 修复：误差范围比较 `|a - b| <= eps`；或转字符串/定点表示比较。

## W0002 整数除法截断 / Integer division truncation

* 触发：`/` 用于两个整数操作数。
* 这样写的坏处：结果向下取整（`7 / 2 == 3`），小数被丢；均值/比例计算会偏差，且不易察觉。
* 修复：需要小数先 `as_f64` 再除；需要舍入用 `(a + b/2) / b` 或浮点 round。

## W0003 循环内字符串拼接累积 / O(n²) string accumulation in a loop

* 触发：循环体内 `x = x + y`（或 `x += y`），x 为字符串。
* 这样写的坏处：字符串不可变，每次拼接生成新串并复制全部旧内容；循环 N 次总成本
  O(N²)，长文本可致内存/时间爆炸（实测 160K 字符循环耗尽 32GB）。
* 修复：`string_builder` + `sb_append` / `sb_append_byte` + `sb_build`（O(N)）。

## W0004 表变量拷贝共享 / Table variable copy shares storage

* 触发：`var b = a`，其中 a 是动态表变量。
* 这样写的坏处：表赋值是引用共享（浅拷贝）而非深拷贝；对 b 的修改会反映到 a，
  跨函数传表同理 —— 误当值语义会产出难查的共享态 bug。
* 修复：需要独立副本用 `clone`；只读共享则无需处理。

## W0020 角色配置解析失败 / roles config parse failure

* 触发：`roles.data.tie`（自定义角色注册表）语法错误。
* 这样写的坏处：本次按内置默认角色编译，自定义角色全部不生效，行为与预期不符且静默。
* 修复：检查 roles 段格式（kind/params/output 字段白名单）。

## W0021 依赖包角色定义解析失败 / dependency role parse failure

* 触发：`tie.pkg` 依赖包内 `roles.data.tie` 解析失败。
* 这样写的坏处：包提供的角色未注册，按内置默认编译，包行为可能缺失。
* 修复：检查依赖包内 roles.data.tie 格式。

## W0022 角色重复注册 / duplicate role registration

* 触发：同名角色再次注册（内建或前置来源已存在）。
* 这样写的坏处：先注册者生效、后注册者被忽略——新定义实际未生效。
* 修复：保持角色名全局唯一，或删除重复定义。

## W0023 角色 output 非法值 / invalid role output

* 触发：roles 段 `output` 不是 lib/check/exe/pass。
* 这样写的坏处：按 lib 兜底处理，输出形态与声明不符。
* 修复：把 output 改为 lib/check/exe/pass 之一。

## 规划中的经验型警告 / Planned warnings

| 标号 | 名称 | 这样写的坏处 | 修复 |
| --- | --- | --- | --- |
| W0005 | 未使用局部变量 | 代码误导（像在用其实没用），维护时不知道能否删 | 删除，或 `_` 前缀表明有意不用 |
| W0006 | 未使用函数/方法 | 死代码膨胀、误导 API 面 | 删除 |
| W0007 | 未使用 import/using | 依赖面虚胖，改名时误伤 | 删除未用 import |
| W0008 | 变量遮蔽 | 内层同名变量盖住外层，读代码时踩错 | 重命名内层变量 |
| W0009 | return 后不可达语句 | 必不执行，多半是写错分支 | 删除或移入正确分支 |
| W0010 | 空语句块 | 占位却无注释，无法判断意图 | 补注释或删除 |
| W0011 | 函数参数未使用 | 参数表与实际行为不符 | 删除或 `_` 前缀 |
| W0012 | 魔法数字 | 无名字的数字含义不明，改一处漏一处 | 命名常量 `const` |
| W0013 | for 遍历表时修改表 | 追加/删除元素使遍历结果不可预期 | 遍历副本或用索引倒序删 |
| W0014 | 布尔参数调用 | `foo(true)` 看不出含义 | 用命名常量/枚举参数 |
| W0015 | 可变绑定未修改 | 声明 `var` 却从未赋值，应用 `const` | 改 `const` |
| W0016 | 可变全局表共享状态 | 全局可变表在多处修改，状态难以追踪 | 收进模块/参数传递 |
| W0017 | 嵌套过深 | 可读性断崖，重构成本高 | 提取函数/早返回 |
| W0018 | 大整数字面量溢出风险 | 超过目标窄类型范围静默回绕 | 显式后缀（`i32`/`u8`）或 `as_*` 前检查 |
| W0019 | 表元素越界写静默失败 | `t[i] = v` 在 i ≥ len 时静默丢弃 | 用 `table_push` 追加 |

EN: W0001 float == (use eps-range), W0002 int division truncation, W0003 O(n²)
loop string concat (use string_builder), W0004 table var copy shares storage
(use clone), W0020-W0023 role config/registration issues; planned W0005-W0019
listed with downsides and fixes.
