# 错误标号大全 / Error codes

> tie 诊断错误共分九大家族（词法/语法/语义/运行时/CLI 与配置/后端与 IR/REPL/内部错误），
> 以下按家族分节、族内按标号排序，每条含**消息模板**、**出处**、**成因（如何发生）**与**常见解决方案**。
> Errors are grouped by family below (lexer, parser, semantic, runtime, CLI & config, backend & IR, REPL, internal); each entry lists the message template, source, cause and a common fix.

## 家族 1 词法 / Lexer

_（暂无条目 / no entries）_

## 家族 2 语法 / Parser

tie 语法错误（解析阶段）：期望 X 实际 Y、标签只能用于循环、extern 只能顶层、
赋值目标非法等。多为漏分号、多/缺括号、关键字位置错误。 / Parser errors:
expected X but got Y, label misuse, extern placement, bad assignment target —
usually missing semicolons/brackets or keyword misplacement.

### E00001  ERR:? ?

- 消息模板 / template：`ERR:? ? `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00002  ?:

- 消息模板 / template：`?:
`
- 出处 / source：`/compiler/proto/parser.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00061  extern 声明只能出现在文件顶层

- 消息模板 / template：`extern 声明只能出现在文件顶层`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：extern 声明写进了函数体内
- 常见解决方案 / common fix：移到文件顶层

### E00224  不能在这里嵌套代码块

- 消息模板 / template：`不能在这里嵌套代码块`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：嵌套代码块出现在不允许的位置
- 常见解决方案 / common fix：调整块结构

### E00290  分号

- 消息模板 / template：`分号`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00312  变量 '?' 已移动（所有权已转移），不可再次使用（需要复制请用 clone）

- 消息模板 / template：`变量 '?' 已移动（所有权已转移），不可再次使用（需要复制请用 clone）`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00328  块注释未闭合

- 消息模板 / template：`块注释未闭合`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：块注释 /* ... */ 没有闭合 */
- 常见解决方案 / common fix：补齐 */，或将误写的 /* 改为 /

### E00344  字符串

- 消息模板 / template：`字符串`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00346  字符串未闭合

- 消息模板 / template：`字符串未闭合`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：字符串字面量缺少结束引号（词法扫描）
- 常见解决方案 / common fix：补齐结束引号；检查多行字符串是否需拼接

### E00349  字符字面量只能包含一个字符

- 消息模板 / template：`字符字面量只能包含一个字符`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：字符字面量里放了多个字符/码元
- 常见解决方案 / common fix：只保留一个字符；转义序列用 \\u 或直接字符

### E00350  字符字面量未闭合

- 消息模板 / template：`字符字面量未闭合`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：字符字面量缺少结束引号
- 常见解决方案 / common fix：补齐结束引号

### E00387  整数

- 消息模板 / template：`整数 `
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00390  文件结束

- 消息模板 / template：`文件结束`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00399  无法从 ? 初始化

- 消息模板 / template：`无法从 ? 初始化`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00400  无法在 ? 后开始表达式

- 消息模板 / template：`无法在 ? 后开始表达式`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：该符号后不能开始表达式
- 常见解决方案 / common fix：检查运算符/括号顺序

### E00403  无法识别的字符 '?'

- 消息模板 / template：`无法识别的字符 '?'`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：扫描到非法符号
- 常见解决方案 / common fix：删除或替换为合法符号

### E00406  期望 ?，实际是

- 消息模板 / template：`期望 ?，实际是 `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00407  期望标识符，实际是

- 消息模板 / template：`期望标识符，实际是 `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：该位置期望标识符（名字/关键字），实际是别的符号
- 常见解决方案 / common fix：检查拼写与关键字位置；确认未遗漏标识符名

### E00408  期望类型，实际是

- 消息模板 / template：`期望类型，实际是 `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：该位置期望类型表达式
- 常见解决方案 / common fix：补齐类型标注，并检查类型名与泛型实参

### E00419  未知转义序列 \

- 消息模板 / template：`未知转义序列 \`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：\\ 后的转义符不是支持项
- 常见解决方案 / common fix：使用支持的转义（\\n \\t \\r \\" \\\\ 等）

### E00434  标签 '?' 只能用于 while 或 for

- 消息模板 / template：`标签 '?' 只能用于 while 或 for`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00435  标识符 '?'

- 消息模板 / template：`标识符 '?'`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00448  浮点数

- 消息模板 / template：`浮点数 `
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00463  类型 '?'

- 消息模板 / template：`类型 '?'`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00501  赋值目标必须是变量或字段

- 消息模板 / template：`赋值目标必须是变量或字段`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：赋值左侧不是可写目标
- 常见解决方案 / common fix：改为变量/字段/下标 t[i]

### E00503  转义符后缺少字符

- 消息模板 / template：`转义符后缺少字符`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：转义符 \\ 后没有字符（字符串尾）
- 常见解决方案 / common fix：补齐转义字符，或检查字符串是否提前终止

## 家族 3 语义 / Semantic

tie 语义错误（类型/作用域/调用/移动/泛型/宏）：最丰富的一族。类型不匹配、
未定义符号、ref 实参规则、unsafe 门禁、移动语义、泛型实例化、宏展开都在此。
多数可按「名字 + 期望/实际」直接定位。 / Semantic errors: the largest family —
types, scopes, calls, ref args, unsafe gates, move semantics, generics, macro
expansion. Most resolve via the name plus expected/actual.

### E00003  table_at() 下标必须是整数，实际是

- 消息模板 / template：`table_at() 下标必须是整数，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：table_at 下标不是整数
- 常见解决方案 / common fix：用整数下标（i64）

### E00005  port '?' 不接受类型参数（第一版 port 不支持泛型）

- 消息模板 / template：`port '?' 不接受类型参数（第一版 port 不支持泛型）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00006  struct '?' 不接受类型参数（非泛型 struct）

- 消息模板 / template：`struct '?' 不接受类型参数（非泛型 struct）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00009  atomic<T> 不支持方法 '?'（支持: load/store/fetch_add/fetch_sub/fetch_and/fetch_or/fetch_xor/compare_exchange）

- 消息模板 / template：`atomic<T> 不支持方法 '?'（支持: load/store/fetch_add/fetch_sub/fetch_and/fetch_or/fetch_xor/compare_exchange）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00013  guard<?> 不能委派为 guard<?>（delegate 第1批仅同域派生）

- 消息模板 / template：`guard<?> 不能委派为 guard<?>（delegate 第1批仅同域派生）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00018  case 值 '?' 与 switch 对象枚举类型 ? 不匹配

- 消息模板 / template：`case 值 '?' 与 switch 对象枚举类型 ? 不匹配`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00019  case 值 '?' 与 switch 对象枚举类型 ? 不匹配（泛型 enum 实例）

- 消息模板 / template：`case 值 '?' 与 switch 对象枚举类型 ? 不匹配（泛型 enum 实例）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00021  case 值必须是字面量（整数/浮点/字符/布尔/字符串）

- 消息模板 / template：`case 值必须是字面量（整数/浮点/字符/布尔/字符串）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00022  case 值必须是枚举变体引用（如 ?.Variant / ?.Variant(v)）

- 消息模板 / template：`case 值必须是枚举变体引用（如 ?.Variant / ?.Variant(v)）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00025  case 值类型 ? 与 switch 对象类型 ? 不匹配

- 消息模板 / template：`case 值类型 ? 与 switch 对象类型 ? 不匹配`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00026  atomic.store() 值类型不匹配

- 消息模板 / template：`atomic.store() 值类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：atomic.store 的值与原子元素类型不一致
- 常见解决方案 / common fix：按 atomic<T> 的 T 传值

### E00027  table_push() 元素类型不匹配

- 消息模板 / template：`table_push() 元素类型不匹配：表 '?' 的元素是 ?，推入的是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00030  asm! 内联汇编必须在 unsafe 块或 unsafe 函数中使用（安全代码禁止触底）

- 消息模板 / template：`asm! 内联汇编必须在 unsafe 块或 unsafe 函数中使用（安全代码禁止触底）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：asm! 用在安全代码里
- 常见解决方案 / common fix：包进 unsafe { } 或标 unsafe fn

### E00031  extern 函数 '?' 与已有函数重复定义

- 消息模板 / template：`extern 函数 '?' 与已有函数重复定义`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00033  extern 函数 '?' 的参数 '?' 必须是标量/string/ptr/slice 类型，实际是

- 消息模板 / template：`extern 函数 '?' 的参数 '?' 必须是标量/string/ptr/slice 类型，实际是 `
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00034  extern 函数 '?' 的参数 '?' 必须是标量/string/ptr/slice 类型，或 repr(C) struct（按引用传指针）；'?' 不是 repr(C)，需显式标注 repr(C)

- 消息模板 / template：`extern 函数 '?' 的参数 '?' 必须是标量/string/ptr/slice 类型，或 repr(C) struct（按引用传指针）；'?' 不是 repr(C)，需显式标注 repr(C)`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00035  extern 函数 '?' 的返回类型必须是标量/string/ptr/slice 或 void，实际是

- 消息模板 / template：`extern 函数 '?' 的返回类型必须是标量/string/ptr/slice 或 void，实际是 `
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00037  case 区间两端必须是整数或字符字面量（浮点区间不支持）

- 消息模板 / template：`case 区间两端必须是整数或字符字面量（浮点区间不支持）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00038  case 区间必须 start < end（左闭右开）

- 消息模板 / template：`case 区间必须 start < end（左闭右开）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00039  case 区间类型与 switch 对象类型 ? 不匹配

- 消息模板 / template：`case 区间类型与 switch 对象类型 ? 不匹配`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00042  any_tag() 参数必须是 any，实际是

- 消息模板 / template：`any_tag() 参数必须是 any，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00044  slice_len() 参数必须是切片类型，实际是

- 消息模板 / template：`slice_len() 参数必须是切片类型，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00045  eval() 参数必须是字符串，实际是

- 消息模板 / template：`eval() 参数必须是字符串，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00050  slice_of() 只支持字符串或动态表，实际是

- 消息模板 / template：`slice_of() 只支持字符串或动态表，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00054  unsafe use 只能在 unsafe 上下文使用（unsafe 块或 unsafe 函数内）

- 消息模板 / template：`unsafe use 只能在 unsafe 上下文使用（unsafe 块或 unsafe 函数内）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00056  port 名 '?' 与 struct 名冲突

- 消息模板 / template：`port 名 '?' 与 struct 名冲突`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00057  struct 名 '?' 与函数名冲突

- 消息模板 / template：`struct 名 '?' 与函数名冲突`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00058  port 名 '?' 与枚举名冲突

- 消息模板 / template：`port 名 '?' 与枚举名冲突`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00059  port 名 '?' 与泛型模板名冲突

- 消息模板 / template：`port 名 '?' 与泛型模板名冲突`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00060  goto 向前跳过局部变量初始化（goto 与标签之间不得经过 var/const 声明，R3）

- 消息模板 / template：`goto 向前跳过局部变量初始化（goto 与标签之间不得经过 var/const 声明，R3）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00062  extern 声明必须标注 unsafe（`unsafe extern fn ?(...)`），安全代码禁止直接调用外部符号

- 消息模板 / template：`extern 声明必须标注 unsafe（`unsafe extern fn ?(...)`），安全代码禁止直接调用外部符号`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00069  code 字面量不能作为语句

- 消息模板 / template：`code 字面量不能作为语句`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00070  when 守卫必须是布尔表达式，实际是

- 消息模板 / template：`when 守卫必须是布尔表达式，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00071  struct 实例 '?' 的字段访问需要可寻址对象（变量/字段链），

- 消息模板 / template：`struct 实例 '?' 的字段访问需要可寻址对象（变量/字段链），`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00076  port '?' 对 struct '?' 的 impl 重复定义

- 消息模板 / template：`port '?' 对 struct '?' 的 impl 重复定义`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00077  switch 对象仅支持数字、布尔、字符、字符串、枚举或 any 类型，实际是

- 消息模板 / template：`switch 对象仅支持数字、布尔、字符、字符串、枚举或 any 类型，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00079  port 对象变量 '?' 必须初始化（如 unsafe { var ?: ? = 具体实例 }）

- 消息模板 / template：`port 对象变量 '?' 必须初始化（如 unsafe { var ?: ? = 具体实例 }）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00080  port 对象变量 '?' 的初始化必须是实现了该 port 的具体类型实例（提升）或同 port 对象，实际是

- 消息模板 / template：`port 对象变量 '?' 的初始化必须是实现了该 port 的具体类型实例（提升）或同 port 对象，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00081  port 对象变量 '?' 类型不匹配

- 消息模板 / template：`port 对象变量 '?' 类型不匹配：标注 ?，表达式推导为 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00084  impl 引用的 port '?' 未定义

- 消息模板 / template：`impl 引用的 port '?' 未定义`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00090  atomic.compare_exchange() 新值类型不匹配

- 消息模板 / template：`atomic.compare_exchange() 新值类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00091  impl 方法 '?' 参数个数与 port 签名不匹配

- 消息模板 / template：`impl 方法 '?' 参数个数与 port 签名不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00092  impl 方法 '?' 参数类型与 port 签名不匹配（port 方法参数必须类型一致）

- 消息模板 / template：`impl 方法 '?' 参数类型与 port 签名不匹配（port 方法参数必须类型一致）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00093  port 方法 '?' 必须有 self 接收者（第一参数）

- 消息模板 / template：`port 方法 '?' 必须有 self 接收者（第一参数）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00094  impl 方法 '?' 必须有函数体（impl 块 = 实现，不能只声明签名）

- 消息模板 / template：`impl 方法 '?' 必须有函数体（impl 块 = 实现，不能只声明签名）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00095  port 方法 '?' 必须标注 pub（`pub func ?`）

- 消息模板 / template：`port 方法 '?' 必须标注 pub（`pub func ?`）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00098  port 方法 '?' 的第一参数必须是 self

- 消息模板 / template：`port 方法 '?' 的第一参数必须是 self`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00100  impl 方法 '?' 返回类型与 port 签名不匹配

- 消息模板 / template：`impl 方法 '?' 返回类型与 port 签名不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00109  load_library()

- 消息模板 / template：`load_library() 期望 1 个参数（DLL 名），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00110  cstr_to_string()

- 消息模板 / template：`cstr_to_string() 期望 1 个参数（C 字符串地址），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00111  ch_select()

- 消息模板 / template：`ch_select() 期望 3 个参数（handles/actions/values 表），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00112  any_tag()

- 消息模板 / template：`any_tag() 期望 1 个参数（any），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00113  atomic.store()

- 消息模板 / template：`atomic.store() 期望 2 个参数（值, 内存序），实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00114  catch_panic()

- 消息模板 / template：`catch_panic() 期望 1 个参数（函数值），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00115  eval_call()

- 消息模板 / template：`eval_call() 期望 2 个参数（函数名, 参数），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00116  wg_add()

- 消息模板 / template：`wg_add() 期望 2 个参数（句柄, n），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00117  sb_build()

- 消息模板 / template：`sb_build() 期望 1 个参数（句柄），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00118  atomic.?()

- 消息模板 / template：`atomic.?() 期望 2 个参数（增量, 内存序），实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00119  str_sub_bytes()

- 消息模板 / template：`str_sub_bytes() 期望 3 个参数（字符串, 起, 止），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00120  alloc()

- 消息模板 / template：`alloc() 期望 1 个参数（字节数），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00121  byte_concat()

- 消息模板 / template：`byte_concat() 期望 2 个参数（字节表, 字节表），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00122  addr_of_field()

- 消息模板 / template：`addr_of_field() 期望 2 个参数（对象, 字段名），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00123  slice_of()

- 消息模板 / template：`slice_of() 期望 3 个参数（对象, 起点, 长度），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00124  deref_write()

- 消息模板 / template：`deref_write() 期望 2 个参数（指针, 值），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00125  free()

- 消息模板 / template：`free() 期望 1 个参数（指针），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00126  atomic.compare_exchange()

- 消息模板 / template：`atomic.compare_exchange() 期望 3 个参数（期望值, 新值, 内存序），实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00127  get_proc()

- 消息模板 / template：`get_proc() 期望 2 个参数（模块句柄, 函数名），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00128  table_at()

- 消息模板 / template：`table_at() 期望 2 个参数（表, 下标），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00129  table_push()

- 消息模板 / template：`table_push() 期望 2 个参数（表, 元素），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00130  ch_send()

- 消息模板 / template：`ch_send() 期望 2 个参数（通道, 值），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00131  ch_recv()

- 消息模板 / template：`ch_recv() 期望 1 个参数（通道），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00132  msg_t_lang()

- 消息模板 / template：`msg_t_lang() 期望 2 个参数（键, 语言），实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00133  ptr_to_int()

- 消息模板 / template：`ptr_to_int() 期望 1 个参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sbuiltin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00134  guard<cap>.delegate

- 消息模板 / template：`guard<cap>.delegate 期望 1 个能力名参数（share/mem/ext），实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00135  atomic.load()

- 消息模板 / template：`atomic.load() 期望 0 或 1 个参数（内存序），实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00136  atomic.compare_exchange() 期望值类型不匹配

- 消息模板 / template：`atomic.compare_exchange() 期望值类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00142  if 条件必须是 bool

- 消息模板 / template：`if 条件必须是 bool`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00143  goto 标签 '#?' 重复定义（同函数内标签名必须唯一）

- 消息模板 / template：`goto 标签 '#?' 重复定义（同函数内标签名必须唯一）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00145  port '?' 没有方法 '?'

- 消息模板 / template：`port '?' 没有方法 '?'`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00147  actor '?' 没有消息方法 '?'

- 消息模板 / template：`actor '?' 没有消息方法 '?'`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00150  panic 消息必须是 string，实际是

- 消息模板 / template：`panic 消息必须是 string，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00151  actor 消息方法 '?' 必须声明为 pub

- 消息模板 / template：`actor 消息方法 '?' 必须声明为 pub`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00152  async 消息方法 '?' 必须返回 void（异步投递无返回值）

- 消息模板 / template：`async 消息方法 '?' 必须返回 void（异步投递无返回值）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00154  run 的 '?' 不是已声明的 actor 类型

- 消息模板 / template：`run 的 '?' 不是已声明的 actor 类型`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00156  unsafe use 的 '?' 必须是 guard<cap> 凭据变量（来自 unsafe.get(share) 等）

- 消息模板 / template：`unsafe use 的 '?' 必须是 guard<cap> 凭据变量（来自 unsafe.get(share) 等）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00157  actor '?' 的字段 '?' 重复定义

- 消息模板 / template：`actor '?' 的字段 '?' 重复定义`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00158  impl '? for ?' 的方法 '?' 重复定义

- 消息模板 / template：`impl '? for ?' 的方法 '?' 重复定义`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00159  goto 的目标标签 '#?' 未定义（R1 同函数

- 消息模板 / template：`goto 的目标标签 '#?' 未定义（R1 同函数：同函数内必须有 #[tag.?] 标签）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00162  unsafe with 的能力域必须是 share/mem/ext，实际是 '?'

- 消息模板 / template：`unsafe with 的能力域必须是 share/mem/ext，实际是 '?'`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00164  goto 目标 '#?' 不在同块或外层块（禁止跳入更内层块/跨块跳转，R2）

- 消息模板 / template：`goto 目标 '#?' 不在同块或外层块（禁止跳入更内层块/跨块跳转，R2）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00165  goto 目标 '#?' 在外层块但位于 goto 之后（只能向后跳到已执行的外层块头，R2）

- 消息模板 / template：`goto 目标 '#?' 在外层块但位于 goto 之后（只能向后跳到已执行的外层块头，R2）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00166  map_contains() 第 1 个参数必须是 map，实际是

- 消息模板 / template：`map_contains() 第 1 个参数必须是 map，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00167  slice_index() 第 1 个参数必须是切片类型，实际是

- 消息模板 / template：`slice_index() 第 1 个参数必须是切片类型，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00168  volatile_load() 第 1 个参数必须是指针类型，实际是

- 消息模板 / template：`volatile_load() 第 1 个参数必须是指针类型，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00169  table_push() 第 1 个参数必须是表变量（不能是字面量/下标）

- 消息模板 / template：`table_push() 第 1 个参数必须是表变量（不能是字面量/下标）`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00172  return 类型不匹配

- 消息模板 / template：`return 类型不匹配：函数返回 ?，实际返回 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00173  code 类型值只能在宏函数体内使用（宏 = 编译期 AST→AST 函数；准引用/插值/宏参数都是编译期构造）

- 消息模板 / template：`code 类型值只能在宏函数体内使用（宏 = 编译期 AST→AST 函数；准引用/插值/宏参数都是编译期构造）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00175  case 类型匹配（?）不是可装箱类型（整数/浮点/bool/string/char）

- 消息模板 / template：`case 类型匹配（?）不是可装箱类型（整数/浮点/bool/string/char）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00176  case 类型匹配（?）仅支持 any 动态类型，当前 switch 对象是

- 消息模板 / template：`case 类型匹配（?）仅支持 any 动态类型，当前 switch 对象是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00177  struct 继承形成环（含 '?'）

- 消息模板 / template：`struct 继承形成环（含 '?'）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00178  impl '? for ?' 缺少方法 '?'（port 方法必须全部实现）

- 消息模板 / template：`impl '? for ?' 缺少方法 '?'（port 方法必须全部实现）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00179  guard<cap> 能力域必须是 share/mem/ext，实际是 '?'

- 消息模板 / template：`guard<cap> 能力域必须是 share/mem/ext，实际是 '?'`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00186  '?' 解包只能用于返回 Result/Option 的函数内（当前函数无返回类型）

- 消息模板 / template：`'?' 解包只能用于返回 Result/Option 的函数内（当前函数无返回类型）`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：? 用在非 Result/Option 返回函数里
- 常见解决方案 / common fix：让函数返回 Result/Option

### E00187  '?' 解包只能用于返回 Result/Option 的函数内，当前函数返回

- 消息模板 / template：`'?' 解包只能用于返回 Result/Option 的函数内，当前函数返回 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：? 用在非 Result/Option 返回函数里
- 常见解决方案 / common fix：让函数返回 Result/Option

### E00188  '?' 解包的操作数必须是 Result/Option 枚举，实际是

- 消息模板 / template：`'?' 解包的操作数必须是 Result/Option 枚举，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00189  '?' 解包要求枚举 '?' 具有 Ok/Some 与 Err/None 变体（Result/Option 形态）

- 消息模板 / template：`'?' 解包要求枚举 '?' 具有 Ok/Some 与 Err/None 变体（Result/Option 形态）`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00190  '?' 解包错误类型不匹配

- 消息模板 / template：`'?' 解包错误类型不匹配：函数返回 ?，操作数是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：? 解包的操作数不是 Result/Option，或其错误类型与函数返回不一致
- 常见解决方案 / common fix：核对操作数与返回类型

### E00191  case 解构要求变体 '?' 恰有 1 个 payload 字段，实际 ? 个

- 消息模板 / template：`case 解构要求变体 '?' 恰有 1 个 payload 字段，实际 ? 个`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00192  for 迭代对象仅支持范围（0..10）或表变量，实际是

- 消息模板 / template：`for 迭代对象仅支持范围（0..10）或表变量，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00194  struct '?' 重复定义

- 消息模板 / template：`struct '?' 重复定义`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00208  port 默认实现暂不支持（第一版

- 消息模板 / template：`port 默认实现暂不支持（第一版：port 方法只声明签名，请用 impl 块提供实现）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00209  struct '?'（含继承链）没有方法 '?'

- 消息模板 / template：`struct '?'（含继承链）没有方法 '?'`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00213  三目两分支类型不一致

- 消息模板 / template：`三目两分支类型不一致：? 与 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00214  三目条件必须是 bool

- 消息模板 / template：`三目条件必须是 bool`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00217  下标必须是整数，实际是

- 消息模板 / template：`下标必须是整数，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00220  下标访问的对象必须是表或字符串，实际是

- 消息模板 / template：`下标访问的对象必须是表或字符串，实际是 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00222  下标赋值的对象必须是表，实际是

- 消息模板 / template：`下标赋值的对象必须是表，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00223  下标赋值的目标必须是表元素访问（t[i]）

- 消息模板 / template：`下标赋值的目标必须是表元素访问（t[i]）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00225  不能对 const 变量 '?' 自增/自减

- 消息模板 / template：`不能对 const 变量 '?' 自增/自减`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00226  不能给 const 变量 '?' 赋值

- 消息模板 / template：`不能给 const 变量 '?' 赋值`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00227  二元运算两侧类型不一致

- 消息模板 / template：`二元运算两侧类型不一致：? 与 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00229  位运算只支持整数，不能用于

- 消息模板 / template：`位运算只支持整数，不能用于 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00234  元组字段名 '?' 重复

- 消息模板 / template：`元组字段名 '?' 重复`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00237  元组没有字段 '?'

- 消息模板 / template：`元组没有字段 '?'`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00238  全局 port 对象变量暂不支持（第一版请用局部变量提升

- 消息模板 / template：`全局 port 对象变量暂不支持（第一版请用局部变量提升：unsafe { var d: ? = 具体实例 }）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00239  全局变量 '?' 与函数名冲突

- 消息模板 / template：`全局变量 '?' 与函数名冲突`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00240  全局变量 '?' 初始化类型不匹配

- 消息模板 / template：`全局变量 '?' 初始化类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00241  全局变量 '?' 必须显式标注类型（如 var x: i64）

- 消息模板 / template：`全局变量 '?' 必须显式标注类型（如 var x: i64）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00242  全局变量 '?' 重复定义

- 消息模板 / template：`全局变量 '?' 重复定义`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00243  全局表 '?' 的初始化必须是空表 []（元素类型由标注决定）

- 消息模板 / template：`全局表 '?' 的初始化必须是空表 []（元素类型由标注决定）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00244  内存序必须是 Relaxed / Acquire / Release / AcqRel / SeqCst（标识符常量）

- 消息模板 / template：`内存序必须是 Relaxed / Acquire / Release / AcqRel / SeqCst（标识符常量）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00272  函数 '?' 在命名空间 '?' 中重复定义

- 消息模板 / template：`函数 '?' 在命名空间 '?' 中重复定义`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00273  函数 '?' 实参过多（泛型推断）

- 消息模板 / template：`函数 '?' 实参过多（泛型推断）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00276  函数 '?' 是命名空间 '?' 的私有函数（默认私有，`pub func` 显式导出），不可在命名空间之外调用

- 消息模板 / template：`函数 '?' 是命名空间 '?' 的私有函数（默认私有，`pub func` 显式导出），不可在命名空间之外调用`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00277  函数 '?'

- 消息模板 / template：`函数 '?' 期望 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00283  函数 '?' 重复定义

- 消息模板 / template：`函数 '?' 重复定义`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00284  函数值调用 '?' 参数类型不匹配

- 消息模板 / template：`函数值调用 '?' 参数类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00285  函数值调用 '?'

- 消息模板 / template：`函数值调用 '?' 期望 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00286  函数值调用 '?' 的 ref 参数需要可寻址的表变量实参（字面量/下标/调用结果不可取地址）

- 消息模板 / template：`函数值调用 '?' 的 ref 参数需要可寻址的表变量实参（字面量/下标/调用结果不可取地址）`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：ref 实参是字面量/下标/调用结果，不可取地址
- 常见解决方案 / common fix：先存成表变量再传

### E00287  函数值调用 '?' 的 ref 参数需要表变量实参（实际 ?）

- 消息模板 / template：`函数值调用 '?' 的 ref 参数需要表变量实参（实际 ?）`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00295  原子操作 '?()' 必须在 unsafe 块或 unsafe 函数中使用（安全代码禁止触底）

- 消息模板 / template：`原子操作 '?()' 必须在 unsafe 块或 unsafe 函数中使用（安全代码禁止触底）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00296  参数 '?' 的 ref 修饰仅支持表参数（table/table<T>），实际是

- 消息模板 / template：`参数 '?' 的 ref 修饰仅支持表参数（table/table<T>），实际是 `
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：函数参数声明问题：默认值、ref 修饰、变参、类型不匹配
- 常见解决方案 / common fix：默认值须为字面量且连续排在必选后；ref 仅表参数；变参须为最后一个且元素标量

### E00297  参数 '?' 的 ref 参数不能有默认值（必须在调用点传实参）

- 消息模板 / template：`参数 '?' 的 ref 参数不能有默认值（必须在调用点传实参）`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：函数参数声明问题：默认值、ref 修饰、变参、类型不匹配
- 常见解决方案 / common fix：默认值须为字面量且连续排在必选后；ref 仅表参数；变参须为最后一个且元素标量

### E00298  参数 '?' 的指针/切片/原子类型 '?' 只能在 unsafe 函数中使用

- 消息模板 / template：`参数 '?' 的指针/切片/原子类型 '?' 只能在 unsafe 函数中使用`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：函数参数声明问题：默认值、ref 修饰、变参、类型不匹配
- 常见解决方案 / common fix：默认值须为字面量且连续排在必选后；ref 仅表参数；变参须为最后一个且元素标量

### E00299  参数 '?' 的默认值必须是字面量（数/布尔/字符/字符串或空表 []）

- 消息模板 / template：`参数 '?' 的默认值必须是字面量（数/布尔/字符/字符串或空表 []）`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：函数参数声明问题：默认值、ref 修饰、变参、类型不匹配
- 常见解决方案 / common fix：默认值须为字面量且连续排在必选后；ref 仅表参数；变参须为最后一个且元素标量

### E00300  参数 '?' 缺少默认值

- 消息模板 / template：`参数 '?' 缺少默认值：可选参数（带默认值）必须连续排在必选参数之后`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：函数参数声明问题：默认值、ref 修饰、变参、类型不匹配
- 常见解决方案 / common fix：默认值须为字面量且连续排在必选后；ref 仅表参数；变参须为最后一个且元素标量

### E00301  参数 '?' 默认值类型不匹配

- 消息模板 / template：`参数 '?' 默认值类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：函数参数声明问题：默认值、ref 修饰、变参、类型不匹配
- 常见解决方案 / common fix：默认值须为字面量且连续排在必选后；ref 仅表参数；变参须为最后一个且元素标量

### E00303  取模运算只支持整数

- 消息模板 / template：`取模运算只支持整数`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：取模/取负/自增自减操作数类型错误
- 常见解决方案 / common fix：整数取模；数字取负；可写数字变量自增自减

### E00304  取负运算的操作数必须是数字

- 消息模板 / template：`取负运算的操作数必须是数字`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00305  变体 '?' 的 payload 暂不支持类型 '?'

- 消息模板 / template：`变体 '?' 的 payload 暂不支持类型 '?'`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00306  变体 '?' 重复定义

- 消息模板 / template：`变体 '?' 重复定义`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00307  变体 '?.?' 需要 payload 参数（不能裸引用，请用 ?.?(...) 构造）

- 消息模板 / template：`变体 '?.?' 需要 payload 参数（不能裸引用，请用 ?.?(...) 构造）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00308  变参参数 '?' 不能同时使用 ref 修饰

- 消息模板 / template：`变参参数 '?' 不能同时使用 ref 修饰`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00309  变参参数 '?' 不能有默认值

- 消息模板 / template：`变参参数 '?' 不能有默认值`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00310  变参参数 '?' 元素类型必须是标量（i8..u64/f32/f64/bool/char/string），实际是

- 消息模板 / template：`变参参数 '?' 元素类型必须是标量（i8..u64/f32/f64/bool/char/string），实际是 `
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00311  变参参数 '?' 必须是最后一个参数

- 消息模板 / template：`变参参数 '?' 必须是最后一个参数`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00313  变量 '?' 必须标注类型或初始化

- 消息模板 / template：`变量 '?' 必须标注类型或初始化`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00316  变量 '?' 的指针/切片/原子类型 '?' 只能在 unsafe 代码中使用

- 消息模板 / template：`变量 '?' 的指针/切片/原子类型 '?' 只能在 unsafe 代码中使用`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00317  变量 '?' 类型不匹配

- 消息模板 / template：`变量 '?' 类型不匹配：标注 ?，表达式推导为 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00319  变量节点缺少名字

- 消息模板 / template：`变量节点缺少名字`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00323  命名空间函数 '?'

- 消息模板 / template：`命名空间函数 '?' 期望 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00325  命名空间函数 '?' 未定义

- 消息模板 / template：`命名空间函数 '?' 未定义`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00327  命名空间路径 '?' 不能作为值使用（只能用于调用，如 'x::f()'）

- 消息模板 / template：`命名空间路径 '?' 不能作为值使用（只能用于调用，如 'x::f()'）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00332  复合赋值位运算只支持整数，目标类型是

- 消息模板 / template：`复合赋值位运算只支持整数，目标类型是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00333  复合赋值取模只支持整数，目标类型是

- 消息模板 / template：`复合赋值取模只支持整数，目标类型是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00334  复合赋值类型不匹配

- 消息模板 / template：`复合赋值类型不匹配：目标类型 ? 与表达式 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00336  复合赋值运算符不能用于

- 消息模板 / template：`复合赋值运算符不能用于 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00337  字段 '?.?' 与继承链中的字段重名（字段名必须跨继承链唯一）

- 消息模板 / template：`字段 '?.?' 与继承链中的字段重名（字段名必须跨继承链唯一）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00340  字段访问 '.' 的对象必须是元组或类实例，实际是

- 消息模板 / template：`字段访问 '.' 的对象必须是元组或类实例，实际是 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00341  字段赋值的对象必须是 struct 实例，实际是

- 消息模板 / template：`字段赋值的对象必须是 struct 实例，实际是 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00343  字段赋值类型不匹配

- 消息模板 / template：`字段赋值类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00345  字符串字面量缺少文本

- 消息模板 / template：`字符串字面量缺少文本`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00348  字符串迭代器 s.chars() 不接受实参（实际 ? 个）

- 消息模板 / template：`字符串迭代器 s.chars() 不接受实参（实际 ? 个）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00351  字符字面量缺少文本

- 消息模板 / template：`字符字面量缺少文本`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00352  宏 '?' 展开失败:

- 消息模板 / template：`宏 '?' 展开失败: `
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00354  宏 '?' 是私有宏，只能在定义文件内使用（pub macro 导出跨文件可见）

- 消息模板 / template：`宏 '?' 是私有宏，只能在定义文件内使用（pub macro 导出跨文件可见）`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00358  宏 '?' 注册失败:

- 消息模板 / template：`宏 '?' 注册失败: `
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00360  宏 '?' 的实参缺失

- 消息模板 / template：`宏 '?' 的实参缺失`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00361  宏定义 '?' 只能出现在主文件中（跨文件宏暂不支持，S3.3 第一版限制）

- 消息模板 / template：`宏定义 '?' 只能出现在主文件中（跨文件宏暂不支持，S3.3 第一版限制）`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00362  宏定义序列化失败:

- 消息模板 / template：`宏定义序列化失败: `
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00364  宏定义缺少名字

- 消息模板 / template：`宏定义缺少名字`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00365  宏实参序列化失败:

- 消息模板 / template：`宏实参序列化失败: `
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00367  宏展开结果加载失败（AST 协议解析错误）

- 消息模板 / template：`宏展开结果加载失败（AST 协议解析错误）`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00368  宏展开轮次超过 64 次上限（疑似展开结果无限产生宏调用）

- 消息模板 / template：`宏展开轮次超过 64 次上限（疑似展开结果无限产生宏调用）`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00369  宏展开返回语句块，但调用点在表达式位置（宏须返回表达式）

- 消息模板 / template：`宏展开返回语句块，但调用点在表达式位置（宏须返回表达式）`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00370  实例化 '?' 参数 '?' 的 ref 修饰仅支持表参数，实际是

- 消息模板 / template：`实例化 '?' 参数 '?' 的 ref 修饰仅支持表参数，实际是 `
- 出处 / source：`/compiler/frontend/sgen_inst.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00371  实例化 '?' 参数 '?' 类型解析失败

- 消息模板 / template：`实例化 '?' 参数 '?' 类型解析失败`
- 出处 / source：`/compiler/frontend/sgen_inst.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00372  实例化 '?' 参数 '?' 缺少默认值

- 消息模板 / template：`实例化 '?' 参数 '?' 缺少默认值：可选参数（带默认值）必须连续排在必选参数之后`
- 出处 / source：`/compiler/frontend/sgen_inst.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00373  实例化 '?' 字段 '?' 类型解析失败

- 消息模板 / template：`实例化 '?' 字段 '?' 类型解析失败`
- 出处 / source：`/compiler/frontend/sgen_inst.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00374  实例化 '?' 返回类型解析失败

- 消息模板 / template：`实例化 '?' 返回类型解析失败`
- 出处 / source：`/compiler/frontend/sgen_inst.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00375  导入文件 '?' 解析失败:

- 消息模板 / template：`导入文件 '?' 解析失败: `
- 出处 / source：`/compiler/frontend/semantic.tie`
- 成因（如何发生）/ cause：import 的文件不存在或解析/语义失败
- 常见解决方案 / common fix：检查路径与文件内容；补缺失文件

### E00378  提升 '?' 到 port '?' 必须在 unsafe 块或 unsafe 函数中（接口对象借用具体对象，指针操作归 unsafe）

- 消息模板 / template：`提升 '?' 到 port '?' 必须在 unsafe 块或 unsafe 函数中（接口对象借用具体对象，指针操作归 unsafe）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00391  方法 '?' 参数类型不匹配

- 消息模板 / template：`方法 '?' 参数类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

### E00393  方法 '?'

- 消息模板 / template：`方法 '?' 期望 ? 个参数（含接收者对象），实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

### E00394  方法 '?'

- 消息模板 / template：`方法 '?' 期望 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

### E00395  方法 '?' 首参类型不匹配

- 消息模板 / template：`方法 '?' 首参类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

### E00397  方法调用的对象必须是 struct 实例或 struct 名，实际是

- 消息模板 / template：`方法调用的对象必须是 struct 实例或 struct 名，实际是 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

### E00398  无 payload 变体 '?.?' 不接受参数，实际 ? 个

- 消息模板 / template：`无 payload 变体 '?.?' 不接受参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00401  无法推断类型参数 ?（调用点无足够信息，请显式指定类型实参，如 max<i64>(...)）

- 消息模板 / template：`无法推断类型参数 ?（调用点无足够信息，请显式指定类型实参，如 max<i64>(...)）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00402  无法推断表达式（节点 ?）

- 消息模板 / template：`无法推断表达式（节点 ?）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00404  无法读取导入文件 '?'

- 消息模板 / template：`无法读取导入文件 '?'`
- 出处 / source：`/compiler/frontend/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00405  无法读取导入文件 '?'（文件不存在）

- 消息模板 / template：`无法读取导入文件 '?'（文件不存在）`
- 出处 / source：`/compiler/frontend/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00409  期望类型，实际是未知节点

- 消息模板 / template：`期望类型，实际是未知节点`
- 出处 / source：`/compiler/frontend/stype.tie`
- 成因（如何发生）/ cause：该位置期望类型表达式
- 常见解决方案 / common fix：补齐类型标注，并检查类型名与泛型实参

### E00410  未声明的变量 '?'

- 消息模板 / template：`未声明的变量 '?'`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00411  未定义的函数 '?'

- 消息模板 / template：`未定义的函数 '?'`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00414  未知内存序 '?'（合法: Relaxed/Acquire/Release/AcqRel/SeqCst）

- 消息模板 / template：`未知内存序 '?'（合法: Relaxed/Acquire/Release/AcqRel/SeqCst）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00422  构造 '?' 参数类型不匹配：字段 '?'

- 消息模板 / template：`构造 '?' 参数类型不匹配：字段 '?' 期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：struct/enum 构造参数数量或类型不匹配
- 常见解决方案 / common fix：按字段声明顺序传参；缺省用默认值

### E00423  构造 '?.?' 参数类型不匹配

- 消息模板 / template：`构造 '?.?' 参数类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：struct/enum 构造参数数量或类型不匹配
- 常见解决方案 / common fix：按字段声明顺序传参；缺省用默认值

### E00424  构造 '?.?' 参数过多（payload 字段数 ?）

- 消息模板 / template：`构造 '?.?' 参数过多（payload 字段数 ?）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：struct/enum 构造参数数量或类型不匹配
- 常见解决方案 / common fix：按字段声明顺序传参；缺省用默认值

### E00425  构造 '?' 最多 ? 个参数（字段数），实际 ? 个

- 消息模板 / template：`构造 '?' 最多 ? 个参数（字段数），实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：struct/enum 构造参数数量或类型不匹配
- 常见解决方案 / common fix：按字段声明顺序传参；缺省用默认值

### E00426  构造 '?.?'

- 消息模板 / template：`构造 '?.?' 期望 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：struct/enum 构造参数数量或类型不匹配
- 常见解决方案 / common fix：按字段声明顺序传参；缺省用默认值

### E00427  枚举 '?' 不接受类型参数（非泛型 enum）

- 消息模板 / template：`枚举 '?' 不接受类型参数（非泛型 enum）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

### E00428  枚举 '?' 没有变体 '?'

- 消息模板 / template：`枚举 '?' 没有变体 '?'`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

### E00430  枚举 '?' 重复定义

- 消息模板 / template：`枚举 '?' 重复定义`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

### E00431  枚举名 '?' 与 struct 名冲突

- 消息模板 / template：`枚举名 '?' 与 struct 名冲突`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

### E00432  枚举名 '?' 与函数名冲突

- 消息模板 / template：`枚举名 '?' 与函数名冲突`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

### E00433  枚举暂不支持 == 比较

- 消息模板 / template：`枚举暂不支持 == 比较`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

### E00436  比较运算符不能用于

- 消息模板 / template：`比较运算符不能用于 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：比较运算符用于非数字/字符串/bool/trit 类型
- 常见解决方案 / common fix：元组/指针仅 ==/!=；枚举不支持比较

### E00437  泛型 struct '?' 必须显式指定类型参数（如 ?<i64>）

- 消息模板 / template：`泛型 struct '?' 必须显式指定类型参数（如 ?<i64>）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00438  泛型 enum '?' 需要 ? 个类型参数，实际 ? 个

- 消息模板 / template：`泛型 enum '?' 需要 ? 个类型参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00439  泛型实例化深度超限（超过 64 层），疑似无限递归实例化

- 消息模板 / template：`泛型实例化深度超限（超过 64 层），疑似无限递归实例化：'?'`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00440  泛型实例化规模超限（超过 2000 个实例化函数），疑似无限递归实例化

- 消息模板 / template：`泛型实例化规模超限（超过 2000 个实例化函数），疑似无限递归实例化`
- 出处 / source：`/compiler/frontend/semantic_gen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00441  泛型枚举 '?' 的无 payload 变体 '?' 无法推断类型参数（一期请用带 payload 变体构造或显式类型标注，如 '?<i64>.?' 后续支持）

- 消息模板 / template：`泛型枚举 '?' 的无 payload 变体 '?' 无法推断类型参数（一期请用带 payload 变体构造或显式类型标注，如 '?<i64>.?' 后续支持）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00442  泛型枚举变体 '?.?' 无法推断类型参数（裸引用无实参，请用带 payload 的构造调用，如 ?.Some(...)）

- 消息模板 / template：`泛型枚举变体 '?.?' 无法推断类型参数（裸引用无实参，请用带 payload 的构造调用，如 ?.Some(...)）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00443  泛型模板 '?' 重复定义

- 消息模板 / template：`泛型模板 '?' 重复定义`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00444  泛型模板类型参数 '?' 缺少实参

- 消息模板 / template：`泛型模板类型参数 '?' 缺少实参`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00445  泛型约束引用的 port '?' 未定义

- 消息模板 / template：`泛型约束引用的 port '?' 未定义`
- 出处 / source：`/compiler/frontend/sgen_inst.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00446  泛型约束必须是 port 类型（如 <T: Drawable>），实际是其他类型表达式

- 消息模板 / template：`泛型约束必须是 port 类型（如 <T: Drawable>），实际是其他类型表达式`
- 出处 / source：`/compiler/frontend/sstate.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00447  浮点字面量缺少文本

- 消息模板 / template：`浮点字面量缺少文本`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00454  空元组 () 不支持

- 消息模板 / template：`空元组 () 不支持`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00455  算术运算符不能用于

- 消息模板 / template：`算术运算符不能用于 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00456  箭头传参实参类型不匹配

- 消息模板 / template：`箭头传参实参类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00457  箭头传参要求目标函数恰 1 个参数，实际 ? 个（?）

- 消息模板 / template：`箭头传参要求目标函数恰 1 个参数，实际 ? 个（?）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00458  箭头目标必须是函数、调用或可赋值变量（函数 ?）

- 消息模板 / template：`箭头目标必须是函数、调用或可赋值变量（函数 ?）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00460  箭头赋值类型不匹配

- 消息模板 / template：`箭头赋值类型不匹配：? 与 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00462  类 '?' 没有字段 '?'

- 消息模板 / template：`类 '?' 没有字段 '?'`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00464  类型 '?' 必须显式指定元素类型（如 ?<i64>）

- 消息模板 / template：`类型 '?' 必须显式指定元素类型（如 ?<i64>）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00465  类型 '?' 未定义

- 消息模板 / template：`类型 '?' 未定义`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00466  类型 '?' 未实现 port '?'（泛型约束不满足）

- 消息模板 / template：`类型 '?' 未实现 port '?'（泛型约束不满足）`
- 出处 / source：`/compiler/frontend/sgen_inst.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00467  类型 '?' 未实现 port '?'，不能提升（请先写 impl ? for ?）

- 消息模板 / template：`类型 '?' 未实现 port '?'，不能提升（请先写 impl ? for ?）`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00468  类型 '?' 缺少元素类型实参

- 消息模板 / template：`类型 '?' 缺少元素类型实参`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00470  类型参数 ? 推断冲突: ? vs

- 消息模板 / template：`类型参数 ? 推断冲突: ? vs `
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00471  类型字面量只能用作 switch 的 case 类型匹配

- 消息模板 / template：`类型字面量只能用作 switch 的 case 类型匹配`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00472  类型实参不能是元组类型（泛型系统首轮不支持 tuple 实参）

- 消息模板 / template：`类型实参不能是元组类型（泛型系统首轮不支持 tuple 实参）`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00473  类型实参过多

- 消息模板 / template：`类型实参过多：enum 模板需要 ? 个类型参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00474  类型实参过多

- 消息模板 / template：`类型实参过多：模板需要 ? 个类型参数，实际 ? 个`
- 出处 / source：`/compiler/frontend/sgen.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00479  自增/自减的操作数必须是可写数字变量

- 消息模板 / template：`自增/自减的操作数必须是可写数字变量`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00481  范围两端必须是整数

- 消息模板 / template：`范围两端必须是整数`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：范围/区间端点类型错误
- 常见解决方案 / common fix：整数或字符端点；左闭右开

### E00487  语句只能出现在文件顶层

- 消息模板 / template：`语句只能出现在文件顶层`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00488  调用 unsafe 内置 '?' 必须在 unsafe 块或 unsafe 函数中（安全代码禁止触底）

- 消息模板 / template：`调用 unsafe 内置 '?' 必须在 unsafe 块或 unsafe 函数中（安全代码禁止触底）`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00489  调用 unsafe 函数 '?' 必须在 unsafe 块或 unsafe 函数中（安全代码禁止触底）

- 消息模板 / template：`调用 unsafe 函数 '?' 必须在 unsafe 块或 unsafe 函数中（安全代码禁止触底）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00490  调用 '?' 参数类型不匹配

- 消息模板 / template：`调用 '?' 参数类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00491  调用 unsafe 方法 '?' 必须在 unsafe 块或 unsafe 函数中（安全代码禁止触底）

- 消息模板 / template：`调用 unsafe 方法 '?' 必须在 unsafe 块或 unsafe 函数中（安全代码禁止触底）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00492  调用 '?' 的 ref 参数实参 '?' 必须是动态表（table_new_* 创建），'?' 是定长表

- 消息模板 / template：`调用 '?' 的 ref 参数实参 '?' 必须是动态表（table_new_* 创建），'?' 是定长表`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00493  调用 '?' 的 ref 参数需要可寻址的变量实参（不能是字面量/下标/调用结果等不可取地址）

- 消息模板 / template：`调用 '?' 的 ref 参数需要可寻址的变量实参（不能是字面量/下标/调用结果等不可取地址）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00494  调用 '?' 表参数元素类型不匹配

- 消息模板 / template：`调用 '?' 表参数元素类型不匹配：期望 table<?>，实际 table<?>`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00495  调用表达式

- 消息模板 / template：`调用表达式期望 ? 个参数，实际 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00496  调用表达式第 ? 个实参类型不匹配

- 消息模板 / template：`调用表达式第 ? 个实参类型不匹配：期望 ?，实际 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00498  调用表达式要求被调者为函数类型，实际是

- 消息模板 / template：`调用表达式要求被调者为函数类型，实际是 `
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00500  赋值目标 '?' 未声明

- 消息模板 / template：`赋值目标 '?' 未声明`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：赋值目标未声明/类型不匹配/const 赋值
- 常见解决方案 / common fix：先声明；类型一致；const 不可重新赋值

### E00502  赋值类型不匹配

- 消息模板 / template：`赋值类型不匹配：变量 '?' 类型为 ?，表达式为 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：赋值目标未声明/类型不匹配/const 赋值
- 常见解决方案 / common fix：先声明；类型一致；const 不可重新赋值

### E00504  过程宏 '?' 展开失败:

- 消息模板 / template：`过程宏 '?' 展开失败: `
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00509  过程宏 '?' 的实参缺失

- 消息模板 / template：`过程宏 '?' 的实参缺失`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00510  过程宏实参解引用不支持节点类型 tag

- 消息模板 / template：`过程宏实参解引用不支持节点类型 tag `
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00511  过程宏实参解引用失败:

- 消息模板 / template：`过程宏实参解引用失败: `
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00525  返回指针/切片/原子类型 '?' 的函数必须标注 unsafe（`unsafe fn`）

- 消息模板 / template：`返回指针/切片/原子类型 '?' 的函数必须标注 unsafe（`unsafe fn`）`
- 出处 / source：`/compiler/frontend/scollect.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00526  逻辑运算符两侧必须是 bool（或两侧同为 trit）

- 消息模板 / template：`逻辑运算符两侧必须是 bool（或两侧同为 trit）`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：逻辑运算操作数不是 bool/trit
- 常见解决方案 / common fix：把条件转成布尔表达式

### E00528  逻辑非的操作数必须是 bool

- 消息模板 / template：`逻辑非的操作数必须是 bool`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：逻辑运算操作数不是 bool/trit
- 常见解决方案 / common fix：把条件转成布尔表达式

### E00529  重复的 case 值

- 消息模板 / template：`重复的 case 值 `
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00534  闭包参数 '?' 的 ref 修饰仅支持表参数（table/table<T>），实际是

- 消息模板 / template：`闭包参数 '?' 的 ref 修饰仅支持表参数（table/table<T>），实际是 `
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00535  闭包变参参数必须是最后一个参数

- 消息模板 / template：`闭包变参参数必须是最后一个参数`
- 出处 / source：`/compiler/frontend/sinfer.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## 家族 4 运行时 / Runtime

tie 运行时/解释器错误（REPL 与内置函数）：内置函数参数错误（len/str_char/…）、
除零、下标越界、桥函数未 tie 化等。 / Runtime/interpreter errors: builtin
argument mistakes, divide-by-zero, index out of range, un-tie'd bridge fns.

### E00004  token_tag_at 下标越界

- 消息模板 / template：`token_tag_at 下标越界：索引 ? 超出长度 `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：token 流下标越界
- 常见解决方案 / common fix：先 len(token) 再取

### E00010  REPL 不支持调用 extern 函数 '?'（仅编译路径可用，请用 tie-llvm 编译运行）

- 消息模板 / template：`REPL 不支持调用 extern 函数 '?'（仅编译路径可用，请用 tie-llvm 编译运行）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00011  trit 不支持除/取模运算（三值无除法）

- 消息模板 / template：`trit 不支持除/取模运算（三值无除法）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00012  '?' 不是宏（未以 macro 声明）

- 消息模板 / template：`'?' 不是宏（未以 macro 声明）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00014  i64 与 trit 不支持该运算:

- 消息模板 / template：`i64 与 trit 不支持该运算: `
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00016  code 值 .call() 不接受参数（第一版）

- 消息模板 / template：`code 值 .call() 不接受参数（第一版）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00032  eval_call: 函数 '?' 必须恰好接收 1 个字符串参数（实际形参 ? 个）

- 消息模板 / template：`eval_call: 函数 '?' 必须恰好接收 1 个字符串参数（实际形参 ? 个）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00036  eval_call: 函数 '?' 缺少第 ? 个参数且无默认值

- 消息模板 / template：`eval_call: 函数 '?' 缺少第 ? 个参数且无默认值`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00040  case 区间起点必须是整数或字符

- 消息模板 / template：`case 区间起点必须是整数或字符`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00048  str_len 只支持字符串

- 消息模板 / template：`str_len 只支持字符串`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：str_len 参数不是字符串
- 常见解决方案 / common fix：传字符串

### E00049  len 只支持字符串、表或键值表

- 消息模板 / template：`len 只支持字符串、表或键值表`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00051  .call() 只能作用于 code 值（实际是 ?）

- 消息模板 / template：`.call() 只能作用于 code 值（实际是 ?）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00052  .chars() 只能作用于字符串（实际是 ?）

- 消息模板 / template：`.chars() 只能作用于字符串（实际是 ?）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00053  break?只能出现在循环体内

- 消息模板 / template：`break?只能出现在循环体内`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00063  tokenize 失败: 词法错误 @?:?:

- 消息模板 / template：`tokenize 失败: 词法错误 @?:?: `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00101  REPL v1 暂不支持 import

- 消息模板 / template：`REPL v1 暂不支持 import`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00102  REPL v1 暂不支持 struct 定义

- 消息模板 / template：`REPL v1 暂不支持 struct 定义`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00103  REPL v1 暂不支持 struct 方法调用

- 消息模板 / template：`REPL v1 暂不支持 struct 方法调用`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00104  REPL v1 暂不支持 goto 跳转（请用编译路径）

- 消息模板 / template：`REPL v1 暂不支持 goto 跳转（请用编译路径）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00105  REPL v1 暂不支持元组

- 消息模板 / template：`REPL v1 暂不支持元组`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00106  REPL v1 暂不支持字段访问（类/元组）

- 消息模板 / template：`REPL v1 暂不支持字段访问（类/元组）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00107  REPL v1 暂不支持字段赋值（类）

- 消息模板 / template：`REPL v1 暂不支持字段赋值（类）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00137  eval_call: 未定义的函数 '?'

- 消息模板 / template：`eval_call: 未定义的函数 '?'`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00148  token 流为空

- 消息模板 / template：`token 流为空`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00149  token 流格式错误（第 ? 行缺少空格分隔）

- 消息模板 / template：`token 流格式错误（第 ? 行缺少空格分隔）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00153  eval_code 源码语法错误:

- 消息模板 / template：`eval_code 源码语法错误: `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00160  table_push 的第 1 个参数必须是表

- 消息模板 / template：`table_push 的第 1 个参数必须是表`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00161  table_push 的第 1 个参数必须是表变量

- 消息模板 / template：`table_push 的第 1 个参数必须是表变量`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00163  for 的迭代对象必须是范围（0..10）、表或字符串迭代器

- 消息模板 / template：`for 的迭代对象必须是范围（0..10）、表或字符串迭代器`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00183  eval_expr 表达式为空

- 消息模板 / template：`eval_expr 表达式为空`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00193  break?逃出函数体（内部错误）

- 消息模板 / template：`break?逃出函数体（内部错误）`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00195  token_tag_at 需要 token 流与下标参数

- 消息模板 / template：`token_tag_at 需要 token 流与下标参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00196  trit_val 需要一个 trit 参数

- 消息模板 / template：`trit_val 需要一个 trit 参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00197  deparse 需要一个 token 流参数

- 消息模板 / template：`deparse 需要一个 token 流参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00198  len 需要一个参数

- 消息模板 / template：`len 需要一个参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00199  gensym 需要一个字符串前缀参数

- 消息模板 / template：`gensym 需要一个字符串前缀参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00200  eval_expr 需要一个字符串参数

- 消息模板 / template：`eval_expr 需要一个字符串参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00201  eval_code 需要一个字符串源码参数

- 消息模板 / template：`eval_code 需要一个字符串源码参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00202  to_string 需要一个数字参数

- 消息模板 / template：`to_string 需要一个数字参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：to_string 参数不是数字
- 常见解决方案 / common fix：传数字（i64/f64）

### E00203  to_trit 需要一个整数参数

- 消息模板 / template：`to_trit 需要一个整数参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00204  eval_call 需要两个字符串参数（函数名, 参数）

- 消息模板 / template：`eval_call 需要两个字符串参数（函数名, 参数）`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00205  str_char 需要字符串与整数参数

- 消息模板 / template：`str_char 需要字符串与整数参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00206  table_push 需要表与元素参数

- 消息模板 / template：`table_push 需要表与元素参数`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00207  table_at 需要表与整数下标参数

- 消息模板 / template：`table_at 需要表与整数下标参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00212  一元负号只能作用于数字

- 消息模板 / template：`一元负号只能作用于数字`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00216  下标必须是整数

- 消息模板 / template：`下标必须是整数`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00218  下标访问仅支持表

- 消息模板 / template：`下标访问仅支持表`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00219  下标访问仅支持表或键值表

- 消息模板 / template：`下标访问仅支持表或键值表`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00221  下标赋值暂只支持单层表变量（t[i]）；二维表元素暂不支持写

- 消息模板 / template：`下标赋值暂只支持单层表变量（t[i]）；二维表元素暂不支持写`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00228  位运算/移位只支持整数

- 消息模板 / template：`位运算/移位只支持整数`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00279  函数 '?' 的 ref 参数需要可寻址的表变量实参（字面量/下标/调用结果不可取地址）

- 消息模板 / template：`函数 '?' 的 ref 参数需要可寻址的表变量实参（字面量/下标/调用结果不可取地址）`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00280  函数 '?' 缺少第 ? 个参数且无默认值

- 消息模板 / template：`函数 '?' 缺少第 ? 个参数且无默认值`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00315  变量 '?' 未声明

- 消息模板 / template：`变量 '?' 未声明`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00318  变量 '?' 重复声明

- 消息模板 / template：`变量 '?' 重复声明`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00320  右移量必须在 0..64 范围内

- 消息模板 / template：`右移量必须在 0..64 范围内`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00326  命名空间路径 '?' 不能作为值使用（只能用于调用）

- 消息模板 / template：`命名空间路径 '?' 不能作为值使用（只能用于调用）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00347  字符串迭代器 s.chars() 不接受实参

- 消息模板 / template：`字符串迭代器 s.chars() 不接受实参`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00353  宏 '?' 必须返回 code 值（return 了一个 ?）

- 消息模板 / template：`宏 '?' 必须返回 code 值（return 了一个 ?）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00355  宏 '?'

- 消息模板 / template：`宏 '?' 期望 ? 个 code 参数，实际 ? 个`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00356  宏 '?' 未定义

- 消息模板 / template：`宏 '?' 未定义`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00357  宏 '?' 未返回 code 值（函数体缺少 return code 语句）

- 消息模板 / template：`宏 '?' 未返回 code 值（函数体缺少 return code 语句）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00359  宏 '?' 的实参必须是 code 值（准引用或插值），实际是

- 消息模板 / template：`宏 '?' 的实参必须是 code 值（准引用或插值），实际是 `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00363  宏定义注册失败: 协议根既不是声明节点也不是语句列表

- 消息模板 / template：`宏定义注册失败: 协议根既不是声明节点也不是语句列表`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00366  宏展开嵌套过深（超过 64 层，疑似无限递归）

- 消息模板 / template：`宏展开嵌套过深（超过 64 层，疑似无限递归）：`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

### E00376  左移量必须在 0..64 范围内

- 消息模板 / template：`左移量必须在 0..64 范围内`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00377  布尔只能做逻辑运算与相等比较

- 消息模板 / template：`布尔只能做逻辑运算与相等比较`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00380  插值 code 值缺少节点

- 消息模板 / template：`插值 code 值缺少节点`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00381  插值 $(表达式) 必须是 code 或字符串，实际是

- 消息模板 / template：`插值 $(表达式) 必须是 code 或字符串，实际是 `
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00382  插值变量 '?' 必须是 code 或字符串，实际是

- 消息模板 / template：`插值变量 '?' 必须是 code 或字符串，实际是 `
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00383  插值变量 '?' 未声明

- 消息模板 / template：`插值变量 '?' 未声明`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00384  插值名变量 '?' 必须是字符串或 code（实际 ?）

- 消息模板 / template：`插值名变量 '?' 必须是字符串或 code（实际 ?）`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00385  插值名变量 '?' 未声明

- 消息模板 / template：`插值名变量 '?' 未声明`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00386  插值赋值目标必须是变量（code 值根不是变量节点）

- 消息模板 / template：`插值赋值目标必须是变量（code 值根不是变量节点）`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00388  整数不能做逻辑运算（需布尔）

- 消息模板 / template：`整数不能做逻辑运算（需布尔）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00420  条件必须是布尔，实际是

- 消息模板 / template：`条件必须是布尔，实际是 `
- 出处 / source：`/compiler/interp/value.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00449  浮点数不能做逻辑运算（需布尔）

- 消息模板 / template：`浮点数不能做逻辑运算（需布尔）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00469  类型不匹配: ? ?

- 消息模板 / template：`类型不匹配: ? ? `
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

### E00476  编译错误:

- 消息模板 / template：`编译错误: `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00477  自增/自减只支持变量

- 消息模板 / template：`自增/自减只支持变量`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00478  自增/自减只能作用于数字

- 消息模板 / template：`自增/自减只能作用于数字`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00482  范围起点必须是整数

- 消息模板 / template：`范围起点必须是整数`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：范围/区间端点类型错误
- 常见解决方案 / common fix：整数或字符端点；左闭右开

### E00486  词法错误 @?:?:

- 消息模板 / template：`词法错误 @?:?: `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00505  过程宏 '?' 必须返回 code 值（return 了一个 ?）

- 消息模板 / template：`过程宏 '?' 必须返回 code 值（return 了一个 ?）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00506  过程宏 '?'

- 消息模板 / template：`过程宏 '?' 期望 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00507  过程宏 '?' 未定义

- 消息模板 / template：`过程宏 '?' 未定义`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00508  过程宏 '?' 未返回 code 值（函数体缺少 return code 语句）

- 消息模板 / template：`过程宏 '?' 未返回 code 值（函数体缺少 return code 语句）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00512  运行时错误: table_at 下标越界

- 消息模板 / template：`运行时错误: table_at 下标越界：索引 ? 超出长度 `
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00513  运行时错误: parse_int 参数 '?' 不是合法的整数

- 消息模板 / template：`运行时错误: parse_int 参数 '?' 不是合法的整数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00514  运行时错误: parse_float 参数 '?' 不是合法的浮点数

- 消息模板 / template：`运行时错误: parse_float 参数 '?' 不是合法的浮点数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00515  运行时错误: 未实现的 stdio 桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的 stdio 桥函数 '?'`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00516  运行时错误: 未实现的字节桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的字节桥函数 '?'`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00517  运行时错误: 未实现的数学桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的数学桥函数 '?'`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00518  运行时错误: 未实现的文件桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的文件桥函数 '?'`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00519  运行时错误: 未实现的标量桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的标量桥函数 '?'`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00520  运行时错误: 未实现的路径/目录桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的路径/目录桥函数 '?'`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00521  运行时错误: 未实现的进程桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的进程桥函数 '?'`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00522  运行时错误: 环境桥函数 'exit' 在解释器内受限（REPL 退出经 read_line EOF）

- 消息模板 / template：`运行时错误: 环境桥函数 'exit' 在解释器内受限（REPL 退出经 read_line EOF）`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00523  运行时错误: 环境桥函数 'byte_write' 尚未 tie 化（限制清单见 env.tie 头注释）

- 消息模板 / template：`运行时错误: 环境桥函数 'byte_write' 尚未 tie 化（限制清单见 env.tie 头注释）`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00524  运行时错误: map_get 键不存在

- 消息模板 / template：`运行时错误: map_get 键不存在：'?'`
- 出处 / source：`/compiler/interp/value.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

### E00527  逻辑非只能作用于布尔

- 消息模板 / template：`逻辑非只能作用于布尔`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：逻辑运算操作数不是 bool/trit
- 常见解决方案 / common fix：把条件转成布尔表达式

### E00530  键值表下标必须是字符串键

- 消息模板 / template：`键值表下标必须是字符串键`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00532  键值表元素必须全部带字符串键

- 消息模板 / template：`键值表元素必须全部带字符串键`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00537  除零错误

- 消息模板 / template：`除零错误`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00538  除零错误（取模）

- 消息模板 / template：`除零错误（取模）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00539  顶层全局变量必须有初始化

- 消息模板 / template：`顶层全局变量必须有初始化`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

### E00541  顶层只允许函数/类/import/using/命名空间/全局变量/extern 声明定义

- 消息模板 / template：`顶层只允许函数/类/import/using/命名空间/全局变量/extern 声明定义`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

## 家族 5 CLI 与配置 / CLI & Config

tie CLI 与配置错误：参数错误、角色声明、config 解析、compress-data、文件读写。
检查命令行参数、头部角色声明、config.data.tie 与 roles 段格式。 / CLI & config
errors: args, role headers, config parsing, compress-data, file IO.

### E00023  config 值意外字符（位置 ?）

- 消息模板 / template：`config 值意外字符（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 值位置出现非法字符
- 常见解决方案 / common fix：检查值语法（数字/字符串/表/数组）

### E00024  config 值意外结束

- 消息模板 / template：`config 值意外结束`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00055  config 合并要求顶层均为表（[ "key": value, ... ]）

- 消息模板 / template：`config 合并要求顶层均为表（[ "key": value, ... ]）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00066  config 字符串未闭合

- 消息模板 / template：`config 字符串未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00067  config 字符串转义不完整（位置 ?）

- 消息模板 / template：`config 字符串转义不完整（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00068  config 字面量不完整（位置 ?）

- 消息模板 / template：`config 字面量不完整（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00075  config 容器未闭合

- 消息模板 / template：`config 容器未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 表/数组缺结束括号
- 常见解决方案 / common fix：补 ]

### E00085  config 数字小数部分缺少数字（位置 ?）

- 消息模板 / template：`config 数字小数部分缺少数字（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00086  config 数字缺少整数部分（位置 ?）

- 消息模板 / template：`config 数字缺少整数部分（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 数字以 . 开头缺整数部分
- 常见解决方案 / common fix：补整数部分（如 0.5）

### E00087  config 数组

- 消息模板 / template：`config 数组期望 , 或 ]（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00088  config 数组未闭合

- 消息模板 / template：`config 数组未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00089  config 文件为空或读取失败:

- 消息模板 / template：`config 文件为空或读取失败: `
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00141  config 未知转义 \?（位置 ?）

- 消息模板 / template：`config 未知转义 \?（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00144  config 根值后有额外内容（位置 ?）

- 消息模板 / template：`config 根值后有额外内容（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00180  config 表

- 消息模板 / template：`config 表期望 , 或 ]（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00181  config 表

- 消息模板 / template：`config 表期望 :（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00182  config 表未闭合

- 消息模板 / template：`config 表未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00184  config 表键必须是字符串（位置 ?）

- 消息模板 / template：`config 表键必须是字符串（位置 ?）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00210  compress-data 失败

- 消息模板 / template：`compress-data 失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00230  修饰角色重复: '?'

- 消息模板 / template：`修饰角色重复: '?'`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00291  动态库模式错误

- 消息模板 / template：`动态库模式错误`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00302  参数错误

- 消息模板 / template：`参数错误。输入 tiec --help 查看用法。`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：CLI 参数错误
- 常见解决方案 / common fix：运行 tiec --help 查看用法

### E00329  基础角色重复: '?'

- 消息模板 / template：`基础角色重复: '?'`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00389  文件类型声明错误

- 消息模板 / template：`文件类型声明错误`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00415  未知基础角色 '?'

- 消息模板 / template：`未知基础角色 '?'`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00417  未知角色 '?'（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded）

- 消息模板 / template：`未知角色 '?'（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded）`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00421  构建配置加载失败

- 消息模板 / template：`构建配置加载失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：config.data.tie 加载/合并失败
- 常见解决方案 / common fix：检查语法与合并规则（顶层须为表）

### E00484  角色 '?' 不支持参数 '?'

- 消息模板 / template：`角色 '?' 不支持参数 '?'`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## 家族 6 后端与 IR / Backend & IR

tie 后端与 IR 错误：opt/clang/llvm-ar/lld 工具链失败、tieir 序列化、后端未接入。
多为环境问题（LLVM 工具缺失/版本）或编译器内部错误。 / Backend & IR errors:
toolchain (opt/clang/llvm-ar/lld) failures, tieir serialization, unimplemented
backend — often environment (missing LLVM tools) or compiler-internal.

### E00007  irgen 不支持 code 字面量作语句（tag=136，函数 ?）

- 消息模板 / template：`irgen 不支持 code 字面量作语句（tag=136，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00008  guard<cap> 不支持方法 '?'（函数 ?）

- 消息模板 / template：`guard<cap> 不支持方法 '?'（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00015  actor 与 import trm-lite 冲突

- 消息模板 / template：`actor 与 import trm-lite 冲突：actor 默认由 trm-lite 简单执行体承载，与 import 是替代运行时路径，不能混用（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00017  case 值 '?' 不是 struct（函数 ?）

- 消息模板 / template：`case 值 '?' 不是 struct（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00020  case 值不是枚举 '?' 的变体引用（函数 ?）

- 消息模板 / template：`case 值不是枚举 '?' 的变体引用（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00028  const 全局表暂不支持

- 消息模板 / template：`const 全局表暂不支持：'?'需要 main 入口运行时创建，无法静态初始化`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00029  spawn 内置与 import trm-lite 冲突

- 消息模板 / template：`spawn 内置与 import trm-lite 冲突：内置与 import 是替代运行时路径，不能混用（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00041  cb_ptr 参数 '?' 不是命名函数（函数 ?）

- 消息模板 / template：`cb_ptr 参数 '?' 不是命名函数（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00043  spawn 参数必须是函数值（fn() -> i64 / fn() -> void），函数

- 消息模板 / template：`spawn 参数必须是函数值（fn() -> i64 / fn() -> void），函数 `
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00046  cb_ptr 参数必须是无捕获闭包字面量或命名函数（函数 ?）

- 消息模板 / template：`cb_ptr 参数必须是无捕获闭包字面量或命名函数（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00047  cb_ptr 参数闭包含捕获变量（C 回调函数指针不携带环境），函数

- 消息模板 / template：`cb_ptr 参数闭包含捕获变量（C 回调函数指针不携带环境），函数 `
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00064  addr_of_field() 字段 '?' 不存在（函数 ?）

- 消息模板 / template：`addr_of_field() 字段 '?' 不存在（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00065  addr_of_field() 字段名必须是字符串字面量（函数 ?）

- 消息模板 / template：`addr_of_field() 字段名必须是字符串字面量（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00072  slice_index() 实参必须是切片类型（函数 ?）

- 消息模板 / template：`slice_index() 实参必须是切片类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00073  deref() 实参必须是指针类型（函数 ?）

- 消息模板 / template：`deref() 实参必须是指针类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00074  addr_of() 实参类型未知（函数 ?）

- 消息模板 / template：`addr_of() 实参类型未知（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00078  switch 对象仅支持数字、布尔、字符或字符串类型，实际是

- 消息模板 / template：`switch 对象仅支持数字、布尔、字符或字符串类型，实际是 `
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00082  addr_of_field() 对象类型未知（函数 ?）

- 消息模板 / template：`addr_of_field() 对象类型未知（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00083  asm! 平台 target(?) 与当前编译目标 ? 不匹配（无目标平台分支可编译）

- 消息模板 / template：`asm! 平台 target(?) 与当前编译目标 ? 不匹配（无目标平台分支可编译）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00096  actor 方法 '?' 未找到（函数 ?）

- 消息模板 / template：`actor 方法 '?' 未找到（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00097  atomic 方法 '?' 生成失败（函数 ?）

- 消息模板 / template：`atomic 方法 '?' 生成失败（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00099  actor 方法 ? 节点未找到

- 消息模板 / template：`actor 方法 ? 节点未找到`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00108  spawn 暂只支持返回 i64/void 的闭包（当前 ?），函数

- 消息模板 / template：`spawn 暂只支持返回 i64/void 的闭包（当前 ?），函数 `
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00138  struct '?' 未定义（函数 ?）

- 消息模板 / template：`struct '?' 未定义（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00139  irgen 未支持的表达式（tag=?，函数 ?）

- 消息模板 / template：`irgen 未支持的表达式（tag=?，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00140  irgen 未支持的语句（tag=?，函数 ?）

- 消息模板 / template：`irgen 未支持的语句（tag=?，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00146  port '?' 没有方法 '?'（函数 ?）

- 消息模板 / template：`port '?' 没有方法 '?'（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_vtable.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00155  run 的 '?' 不是已声明的 actor 类型（函数 ?）

- 消息模板 / template：`run 的 '?' 不是已声明的 actor 类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00170  deref_write() 第 1 实参必须是指针类型（函数 ?）

- 消息模板 / template：`deref_write() 第 1 实参必须是指针类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00171  slice_of() 第一版只支持字符串或动态表（函数 ?）

- 消息模板 / template：`slice_of() 第一版只支持字符串或动态表（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00174  case 类型匹配（?）不是可装箱类型（函数 ?）

- 消息模板 / template：`case 类型匹配（?）不是可装箱类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00185  any 装箱暂不支持类型 ?（函数 ?）

- 消息模板 / template：`any 装箱暂不支持类型 ?（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00211  tieir 读取失败

- 消息模板 / template：`tieir 读取失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00215  下标复合赋值运算失败（函数 ?）

- 消息模板 / template：`下标复合赋值运算失败（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

### E00232  元组仅支持 ==/!= 比较（函数 ?）

- 消息模板 / template：`元组仅支持 ==/!= 比较（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00233  元组字段为表类型，不支持 ==/!= 比较（字段类型 ?）

- 消息模板 / template：`元组字段为表类型，不支持 ==/!= 比较（字段类型 ?）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00235  元组字面量缺少语义类型（函数 ?）

- 消息模板 / template：`元组字面量缺少语义类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00236  元组比较目标不是元组（函数 ?）

- 消息模板 / template：`元组比较目标不是元组（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00245  内置调用 '?' 生成失败（函数 ?）

- 消息模板 / template：`内置调用 '?' 生成失败（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00271  函数 ? 参数类型解析失败

- 消息模板 / template：`函数 ? 参数类型解析失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00274  函数 '?' 无定义节点，无法补齐默认值参数（函数 ?）

- 消息模板 / template：`函数 '?' 无定义节点，无法补齐默认值参数（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00275  函数 '?' 无签名（函数 ?）

- 消息模板 / template：`函数 '?' 无签名（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00278  函数 '?'

- 消息模板 / template：`函数 '?' 期望 ? 到 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00281  函数 '?' 缺少第 ? 个参数且无默认值（函数 ?）

- 消息模板 / template：`函数 '?' 缺少第 ? 个参数且无默认值（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00282  函数 ? 返回类型解析失败

- 消息模板 / template：`函数 ? 返回类型解析失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00288  函数值调用

- 消息模板 / template：`函数值调用：变量 '?' 在实参求值后不可见（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00289  函数值调用

- 消息模板 / template：`函数值调用：变量 '?' 类型缺失（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

### E00292  动态库边界错误: 导出函数 ? 参数

- 消息模板 / template：`动态库边界错误: 导出函数 ? 参数`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00293  动态库边界错误: 导出函数 ? 返回

- 消息模板 / template：`动态库边界错误: 导出函数 ? 返回`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00294  原子变量 '?' 未入作用域（函数 ?）

- 消息模板 / template：`原子变量 '?' 未入作用域（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00314  变量 '?' 未入作用域（函数 ?）

- 消息模板 / template：`变量 '?' 未入作用域（函数 ?）`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

### E00321  命名函数提升

- 消息模板 / template：`命名函数提升：函数 '?' 无签名（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00322  命名空间 ? 的函数 ? 生成失败

- 消息模板 / template：`命名空间 ? 的函数 ? 生成失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00324  命名空间函数 '?'

- 消息模板 / template：`命名空间函数 '?' 期望 ? 到 ? 个参数，实际 ? 个`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00331  复合字段赋值运算失败（字段 ?，函数 ?）

- 消息模板 / template：`复合字段赋值运算失败（字段 ?，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00335  复合赋值运算失败（变量 ?，函数 ?）

- 消息模板 / template：`复合赋值运算失败（变量 ?，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00338  字段 '?' 解析失败（函数 ?）

- 消息模板 / template：`字段 '?' 解析失败（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00339  字段访问 '.' 的对象不是元组/struct（类型 ?，函数 ?）

- 消息模板 / template：`字段访问 '.' 的对象不是元组/struct（类型 ?，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00342  字段赋值的目标不是元组/struct（类型 ?，函数 ?）

- 消息模板 / template：`字段赋值的目标不是元组/struct（类型 ?，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00379  提升操作数类型缺失（函数 ?）

- 消息模板 / template：`提升操作数类型缺失（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_vtable.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00392  方法 '?'

- 消息模板 / template：`方法 '?' 期望 ? 个参数（不含接收者），实际 ? 个`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

### E00396  方法调用接收者不可解析（方法 ?，函数 ?）

- 消息模板 / template：`方法调用接收者不可解析（方法 ?，函数 ?）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

### E00412  未找到 opt，请确认 LLVM 已安装并在 PATH 中

- 消息模板 / template：`未找到 opt，请确认 LLVM 已安装并在 PATH 中`
- 出处 / source：`/compiler/backend/toolchain.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00413  未知 checked_* 函数 '?'（函数 ?）

- 消息模板 / template：`未知 checked_* 函数 '?'（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00429  枚举 '?' 没有变体 '?'（函数 ?）

- 消息模板 / template：`枚举 '?' 没有变体 '?'（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

### E00451  父 struct '?' 未定义

- 消息模板 / template：`父 struct '?' 未定义`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00452  程序使用了 tie-interp 桥内置，但未找到 tie-interp 静态库。? ? -lws2_32 -luserenv -lntdll -lbcrypt -ladvapi32 -lole32 -lshell32

- 消息模板 / template：`程序使用了 tie-interp 桥内置，但未找到 tie-interp 静态库。? ? -lws2_32 -luserenv -lntdll -lbcrypt -ladvapi32 -lole32 -lshell32`
- 出处 / source：`/compiler/backend/toolchain.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00453  程序使用了 trm-lite 运行时（spawn/yield/collect 或表容器 table<T>），但未找到 trm-lite 静态库。? ? -rtlib=compiler-rt

- 消息模板 / template：`程序使用了 trm-lite 运行时（spawn/yield/collect 或表容器 table<T>），但未找到 trm-lite 静态库。? ? -rtlib=compiler-rt`
- 出处 / source：`/compiler/backend/toolchain.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00459  箭头赋值目标 '?' 未入作用域（函数 ?）

- 消息模板 / template：`箭头赋值目标 '?' 未入作用域（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00461  类 '?' 未定义

- 消息模板 / template：`类 '?' 未定义`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00480  自增自减目标 '?' 未入作用域（函数 ?）

- 消息模板 / template：`自增自减目标 '?' 未入作用域（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00483  表元素类型不一致

- 消息模板 / template：`表元素类型不一致：? 与 `
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00497  调用表达式要求被调者为函数类型（函数 ?）

- 消息模板 / template：`调用表达式要求被调者为函数类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

### E00499  赋值目标 '?' 未入作用域（函数 ?）

- 消息模板 / template：`赋值目标 '?' 未入作用域（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：赋值目标未声明/类型不匹配/const 赋值
- 常见解决方案 / common fix：先声明；类型一致；const 不可重新赋值

### E00531  键值表值类型不匹配

- 消息模板 / template：`键值表值类型不匹配：map 值为 ? 与 `
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00533  键值表字面量元素缺少字符串键（函数 ?）

- 消息模板 / template：`键值表字面量元素缺少字符串键（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00536  闭包返回类型解析失败

- 消息模板 / template：`闭包返回类型解析失败`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00540  顶层函数 ? 生成失败

- 消息模板 / template：`顶层函数 ? 生成失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

### E00542  顶层命名空间生成失败

- 消息模板 / template：`顶层命名空间生成失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

## 家族 7 REPL

REPL v1 暂不支持项：struct/enum/import/using/元组/字段访问/goto 等解释器路径
限制——请改用编译路径（tiec 文件编译）。 / REPL v1 limitations: use the
compile path (tiec on a file) for these constructs.

### E00231  修饰角色重复

- 消息模板 / template：`修饰角色重复："?"`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00330  基础角色重复

- 消息模板 / template：`基础角色重复："?"（基础角色只能声明一个）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00416  未知基础角色 "?"（合法: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）

- 消息模板 / template：`未知基础角色 "?"（合法: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00418  未知角色 "?"（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）

- 消息模板 / template：`未知角色 "?"（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00485  角色 "?" 不支持参数 "?"（合法参数: ui:window/web/embedded、db:schema/seed/vector、data:config/asset）

- 消息模板 / template：`角色 "?" 不支持参数 "?"（合法参数: ui:window/web/embedded、db:schema/seed/vector、data:config/asset）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## 家族 9 内部错误 / Internal

内部错误（E9）：编译器自身断言/未实现分支。请提交 issue 并附最小复现与
	iec -O0 输出。 / Internal errors: compiler bugs — file an issue with a
minimal repro.

### E00246  内部错误: 准引用节点缺少子 AST

- 消息模板 / template：`内部错误: 准引用节点缺少子 AST`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00247  内部错误: 包装后的 main 未找到

- 消息模板 / template：`内部错误: 包装后的 main 未找到`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00248  内部错误: eval_expr 包装程序根不是语句列表 (tag=?)

- 消息模板 / template：`内部错误: eval_expr 包装程序根不是语句列表 (tag=?)`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00249  内部错误: eval_expr 包装程序缺少 return 语句

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少 return 语句`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00250  内部错误: eval_expr 包装程序缺少函数体

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少函数体`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00251  内部错误: eval_expr 包装程序缺少函数定义

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少函数定义`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00252  内部错误: eval_expr 包装程序缺少节点

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少节点`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00253  内部错误: AST 协议加载失败

- 消息模板 / template：`内部错误: AST 协议加载失败`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00254  内部错误: AST 协议加载失败（code 执行）

- 消息模板 / template：`内部错误: AST 协议加载失败（code 执行）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00255  内部错误: AST 协议加载失败（宏定义注册）

- 消息模板 / template：`内部错误: AST 协议加载失败（宏定义注册）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00256  内部错误: 协议文本拼接失败（空协议）

- 消息模板 / template：`内部错误: 协议文本拼接失败（空协议）`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00257  内部错误: 插值 code 值解析失败

- 消息模板 / template：`内部错误: 插值 code 值解析失败`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00258  内部错误: 插值节点协议 id 映射缺失

- 消息模板 / template：`内部错误: 插值节点协议 id 映射缺失`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00259  内部错误: 未实现的内置函数 '?'

- 消息模板 / template：`内部错误: 未实现的内置函数 '?'`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00260  内部错误: 未知二元运算符

- 消息模板 / template：`内部错误: 未知二元运算符 `
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00261  内部错误: 未知表达式节点 tag

- 消息模板 / template：`内部错误: 未知表达式节点 tag `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00262  内部错误: 未知语句节点 tag

- 消息模板 / template：`内部错误: 未知语句节点 tag `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00263  内部错误: 表达式语句节点找不到父节点

- 消息模板 / template：`内部错误: 表达式语句节点找不到父节点`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00264  内部错误

- 消息模板 / template：`内部错误：struct '?' 定义节点未找到`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00265  内部错误

- 消息模板 / template：`内部错误：impl 方法 '?' 无签名`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00266  内部错误

- 消息模板 / template：`内部错误：'?' 解包操作数缺少枚举类型（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00267  内部错误

- 消息模板 / template：`内部错误：'?' 解包枚举缺少 Err/None 变体（函数 ?）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00268  内部错误

- 消息模板 / template：`内部错误：'?' 解包的 Ok/Some 变体应恰有一个 payload 字段`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00269  内部错误

- 消息模板 / template：`内部错误：函数 '?' 无签名`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00270  内部错误

- 消息模板 / template：`内部错误：枚举 '?' 定义节点未找到`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

### E00450  消息

- 消息模板 / template：`消息`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

### E00475  编译器内部错误: ir.add_operand 操作数段交错 (fn=? inst=? op=? off=? cnt=? len_ops=? 最近指令:?)——调用方不得在 add_operand 序列中间向全局操作数段 push（常量生成请先存变量）

- 消息模板 / template：`编译器内部错误: ir.add_operand 操作数段交错 (fn=? inst=? op=? off=? cnt=? len_ops=? 最近指令:?)——调用方不得在 add_operand 序列中间向全局操作数段 push（常量生成请先存变量）`
- 出处 / source：`/compiler/middle/ir.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

