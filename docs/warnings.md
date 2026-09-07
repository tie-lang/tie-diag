# 警告标号大全 / Warning codes

> 每条警告列明**触发条件**、**潜在影响**与**处理建议**。当前编译器发射
> W00001..W00004、W00020..W00023；其余（W00005..W00019）为规划中的经验型检查，
> 文档先行。
> Each warning documents its trigger conditions, potential impact and a
> recommended remedy. W00001..W00004 and W00020..W00023 are emitted today;
> W00005..W00019 are planned checks (documented ahead of implementation).

## W00001 浮点相等比较 / Float equality comparison

* 触发条件 / Trigger：`==` / `!=` 作用于 f64/f32 操作数。
* 潜在影响 / Impact：浮点采用二进制表示，其加减运算存在表示误差（`0.1 + 0.2 !=
  0.3`），完全相等在绝大多数情况下不成立，相关分支不可达；测试断言亦因「精确相等」
  而呈现脆弱性。
* 处理建议 / Remedy：改用误差范围比较 `|a - b| <= eps`；或转换为字符串/定点表示后比较。

## W00002 整数除法截断 / Integer division truncation

* 触发条件 / Trigger：`/` 作用于两个整数操作数。
* 潜在影响 / Impact：结果向下取整（`7 / 2 == 3`），小数部分被舍弃；均值、比例等
  统计型计算产生系统性偏差，且无明显症状。
* 处理建议 / Remedy：需要小数结果时，先将操作数经 `as_f64` 转换再相除；需要舍入时，
  采用 `(a + b/2) / b` 或浮点 rounding。

## W00003 循环内字符串拼接累积 / O(n²) string accumulation in a loop

* 触发条件 / Trigger：循环体内 `x = x + y`（或 `x += y`），且 x 为字符串。
* 潜在影响 / Impact：字符串不可变，每次拼接均生成新对象并复制全部既有内容；循环 N 次
  的总成本为 O(N²)，长文本场景可导致内存与时间急剧膨胀（实测 160K 字符循环耗尽 32GB）。
* 处理建议 / Remedy：改用 `string_builder` + `sb_append` / `sb_append_byte` +
  `sb_build`（线性成本）。

## W00004 表变量拷贝共享 / Table variable copy shares storage

* 触发条件 / Trigger：`var b = a`，其中 a 为动态表变量。
* 潜在影响 / Impact：表赋值执行引用共享（浅拷贝）而非深拷贝；对 b 的修改会反映到 a，
  跨函数传表亦然——若以值语义预期，将产生难以排查的共享状态缺陷。
* 处理建议 / Remedy：需要独立副本时使用 `clone`；仅读共享时无需处理。

## W00020 角色配置解析失败 / roles config parse failure

* 触发条件 / Trigger：`roles.data.tie`（自定义角色注册表）存在语法错误。
* 潜在影响 / Impact：本次编译按内置默认角色处理，自定义角色全部未生效，行为与预期
  不符且无显式报错。
* 处理建议 / Remedy：检查 roles 段格式（kind/params/output 字段白名单）。

## W00021 依赖包角色定义解析失败 / dependency role parse failure

* 触发条件 / Trigger：`tie.pkg` 依赖包内的 `roles.data.tie` 解析失败。
* 潜在影响 / Impact：依赖包提供的角色未注册，按内置默认编译，包行为可能缺失。
* 处理建议 / Remedy：检查依赖包内 roles.data.tie 格式。

## W00022 角色重复注册 / duplicate role registration

* 触发条件 / Trigger：同名角色再次注册（内建或前置来源已存在）。
* 潜在影响 / Impact：先注册者生效、后注册者被忽略——更新后的定义实际未生效。
* 处理建议 / Remedy：保持角色名全局唯一，或删除重复定义。

## W00023 角色 output 非法值 / invalid role output

* 触发条件 / Trigger：roles 段 `output` 取值不属于 lib/check/exe/pass。
* 潜在影响 / Impact：按 lib 兜底处理，输出形态与声明不符。
* 处理建议 / Remedy：将 output 修正为 lib/check/exe/pass 之一。

## 规划中的经验型警告 / Planned warnings

| 标号 | 名称 | 潜在影响 | 处理建议 |
| --- | --- | --- | --- |
| W00005 | 未使用局部变量 | 代码具有误导性（看似使用实则未用），维护时难以判断可否删除 | 删除，或以 `_` 前缀表明有意不使用 |
| W00006 | 未使用函数/方法 | 死代码扩充 API 面并产生误导 | 删除 |
| W00007 | 未使用 import/using | 依赖面冗余，重命名时易造成误伤 | 删除未使用 import |
| W00008 | 变量遮蔽 | 内层同名变量遮蔽外层，阅读与引用时易误用 | 重命名内层变量 |
| W00009 | return 后不可达语句 | 语句恒不执行，多为分支错误 | 删除或移入正确分支 |
| W00010 | 空语句块 | 占位且无注释，意图不明 | 补充注释或删除 |
| W00011 | 函数参数未使用 | 参数表与实际行为不符 | 删除，或以 `_` 前缀声明 |
| W00012 | 魔法数字 | 字面量含义不明，局部修改易遗漏 | 使用命名常量 `const` |
| W00013 | for 遍历表时修改表 | 追加/删除元素使遍历结果不可预期 | 遍历副本，或按索引倒序删除 |
| W00014 | 布尔参数调用 | `foo(true)` 无法表达参数语义 | 使用命名常量或枚举参数 |
| W00015 | 可变绑定未修改 | 声明 `var` 却从未赋值，应使用 `const` | 改为 `const` |
| W00016 | 可变全局表共享状态 | 全局可变表被多处修改，状态难以追踪 | 收敛至模块内或改参数传递 |
| W00017 | 嵌套过深 | 可读性显著下降，重构成本高 | 提取函数或提前返回 |
| W00018 | 大整数字面量溢出风险 | 超出目标窄类型范围时静默回绕 | 使用显式后缀（`i32`/`u8`）或转换前检查 |
| W00019 | 表元素越界写静默失败 | `t[i] = v` 在 i ≥ len 时静默丢弃 | 使用 `table_push` 追加 |

EN: W00001 float equality (use eps-range comparison), W00002 integer division
truncation, W00003 O(n²) loop string concatenation (use string_builder),
W00004 table copy shares storage (use clone), W00020–W00023 role
configuration/registration issues; W00005–W00019 planned checks with impact
and remedy above.