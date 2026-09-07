# tie 诊断标号（家族 语法 / Parser） / tie diagnostic codes — 语法 / Parser

tie 语法错误（解析阶段）：期望 X 实际 Y、标签只能用于循环、extern 只能顶层、
赋值目标非法等。多为漏分号、多/缺括号、关键字位置错误。 / Parser errors:
expected X but got Y, label misuse, extern placement, bad assignment target —
usually missing semicolons/brackets or keyword misplacement.

## E00001  ERR:? ?

- 消息模板 / template：`ERR: <...>   <...>  `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00002  ?:

- 消息模板 / template：`? <...> :
`
- 出处 / source：`/compiler/proto/parser.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00061  extern 声明只能出现在文件顶层

- 消息模板 / template：`extern 声明只能出现在文件顶层`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：extern 声明写进了函数体内
- 常见解决方案 / common fix：移到文件顶层

## E00224  不能在这里嵌套代码块

- 消息模板 / template：`不能在这里嵌套代码块`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：嵌套代码块出现在不允许的位置
- 常见解决方案 / common fix：调整块结构

## E00290  分号

- 消息模板 / template：`分号`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00312  变量 '?' 已移动（所有权已转移），不可再次使用（需要复制请用 clone）

- 消息模板 / template：`变量 ' <...> ' 已移动（所有权已转移），不可再次使用（需要复制请用 clone）`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

## E00328  块注释未闭合

- 消息模板 / template：`块注释未闭合`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：块注释 /* ... */ 没有闭合 */
- 常见解决方案 / common fix：补齐 */，或将误写的 /* 改为 /

## E00344  字符串

- 消息模板 / template：`字符串`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00346  字符串未闭合

- 消息模板 / template：`字符串未闭合`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：字符串字面量缺少结束引号（词法扫描）
- 常见解决方案 / common fix：补齐结束引号；检查多行字符串是否需拼接

## E00349  字符字面量只能包含一个字符

- 消息模板 / template：`字符字面量只能包含一个字符`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：字符字面量里放了多个字符/码元
- 常见解决方案 / common fix：只保留一个字符；转义序列用 \\u 或直接字符

## E00350  字符字面量未闭合

- 消息模板 / template：`字符字面量未闭合`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：字符字面量缺少结束引号
- 常见解决方案 / common fix：补齐结束引号

## E00387  整数

- 消息模板 / template：`整数 `
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00390  文件结束

- 消息模板 / template：`文件结束`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00399  无法从 ? 初始化

- 消息模板 / template：`无法从  <...>  初始化`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00400  无法在 ? 后开始表达式

- 消息模板 / template：`无法在  <...>  后开始表达式`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：该符号后不能开始表达式
- 常见解决方案 / common fix：检查运算符/括号顺序

## E00403  无法识别的字符 '?'

- 消息模板 / template：`无法识别的字符 ' <...> '`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：扫描到非法符号
- 常见解决方案 / common fix：删除或替换为合法符号

## E00406  期望 ?，实际是

- 消息模板 / template：`期望  <...> ，实际是 `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00407  期望标识符，实际是

- 消息模板 / template：`期望标识符，实际是 `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：该位置期望标识符（名字/关键字），实际是别的符号
- 常见解决方案 / common fix：检查拼写与关键字位置；确认未遗漏标识符名

## E00408  期望类型，实际是

- 消息模板 / template：`期望类型，实际是 `
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：该位置期望类型表达式
- 常见解决方案 / common fix：补齐类型标注，并检查类型名与泛型实参

## E00419  未知转义序列 \

- 消息模板 / template：`未知转义序列 \`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：\\ 后的转义符不是支持项
- 常见解决方案 / common fix：使用支持的转义（\\n \\t \\r \\" \\\\ 等）

## E00434  标签 '?' 只能用于 while 或 for

- 消息模板 / template：`标签 ' <...> ' 只能用于 while 或 for`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00435  标识符 '?'

- 消息模板 / template：`标识符 ' <...> '`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00448  浮点数

- 消息模板 / template：`浮点数 `
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00463  类型 '?'

- 消息模板 / template：`类型 ' <...> '`
- 出处 / source：`/compiler/frontend/putil.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

## E00501  赋值目标必须是变量或字段

- 消息模板 / template：`赋值目标必须是变量或字段`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：赋值左侧不是可写目标
- 常见解决方案 / common fix：改为变量/字段/下标 t[i]

## E00503  转义符后缺少字符

- 消息模板 / template：`转义符后缺少字符`
- 出处 / source：`/compiler/frontend/errors.tie`
- 成因（如何发生）/ cause：转义符 \\ 后没有字符（字符串尾）
- 常见解决方案 / common fix：补齐转义字符，或检查字符串是否提前终止

