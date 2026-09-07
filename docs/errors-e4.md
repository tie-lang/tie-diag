# tie 诊断标号（家族 运行时 / Runtime） / tie diagnostic codes — 运行时 / Runtime

tie 运行时/解释器错误（REPL 与内置函数）：内置函数参数错误（len/str_char/…）、
除零、下标越界、桥函数未 tie 化等。 / Runtime/interpreter errors: builtin
argument mistakes, divide-by-zero, index out of range, un-tie'd bridge fns.

## E00004  token_tag_at 下标越界

- 消息模板 / template：`token_tag_at 下标越界：索引  <...>  超出长度 `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：token 流下标越界
- 常见解决方案 / common fix：先 len(token) 再取

## E00010  REPL 不支持调用 extern 函数 '?'（仅编译路径可用，请用 tie-llvm 编译运行）

- 消息模板 / template：`REPL 不支持调用 extern 函数 ' <...> '（仅编译路径可用，请用 tie-llvm 编译运行）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00011  trit 不支持除/取模运算（三值无除法）

- 消息模板 / template：`trit 不支持除/取模运算（三值无除法）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00012  '?' 不是宏（未以 macro 声明）

- 消息模板 / template：`' <...> ' 不是宏（未以 macro 声明）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00014  i64 与 trit 不支持该运算:

- 消息模板 / template：`i64 与 trit 不支持该运算: `
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00016  code 值 .call() 不接受参数（第一版）

- 消息模板 / template：`code 值 .call() 不接受参数（第一版）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00032  eval_call: 函数 '?' 必须恰好接收 1 个字符串参数（实际形参 ? 个）

- 消息模板 / template：`eval_call: 函数 ' <...> ' 必须恰好接收 1 个字符串参数（实际形参  <...>  个）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00036  eval_call: 函数 '?' 缺少第 ? 个参数且无默认值

- 消息模板 / template：`eval_call: 函数 ' <...> ' 缺少第  <...>  个参数且无默认值`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00040  case 区间起点必须是整数或字符

- 消息模板 / template：`case 区间起点必须是整数或字符`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00048  str_len 只支持字符串

- 消息模板 / template：`str_len 只支持字符串`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：str_len 参数不是字符串
- 常见解决方案 / common fix：传字符串

## E00049  len 只支持字符串、表或键值表

- 消息模板 / template：`len 只支持字符串、表或键值表`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00051  .call() 只能作用于 code 值（实际是 ?）

- 消息模板 / template：`.call() 只能作用于 code 值（实际是  <...> ）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00052  .chars() 只能作用于字符串（实际是 ?）

- 消息模板 / template：`.chars() 只能作用于字符串（实际是  <...> ）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00053  break?只能出现在循环体内

- 消息模板 / template：`break <...> 只能出现在循环体内`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00063  tokenize 失败: 词法错误 @?:?:

- 消息模板 / template：`tokenize 失败: 词法错误 @ <...> : <...> : `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00101  REPL v1 暂不支持 import

- 消息模板 / template：`REPL v1 暂不支持 import`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00102  REPL v1 暂不支持 struct 定义

- 消息模板 / template：`REPL v1 暂不支持 struct 定义`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00103  REPL v1 暂不支持 struct 方法调用

- 消息模板 / template：`REPL v1 暂不支持 struct 方法调用`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00104  REPL v1 暂不支持 goto 跳转（请用编译路径）

- 消息模板 / template：`REPL v1 暂不支持 goto 跳转（请用编译路径）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00105  REPL v1 暂不支持元组

- 消息模板 / template：`REPL v1 暂不支持元组`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00106  REPL v1 暂不支持字段访问（类/元组）

- 消息模板 / template：`REPL v1 暂不支持字段访问（类/元组）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00107  REPL v1 暂不支持字段赋值（类）

- 消息模板 / template：`REPL v1 暂不支持字段赋值（类）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00137  eval_call: 未定义的函数 '?'

- 消息模板 / template：`eval_call: 未定义的函数 ' <...> '`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00148  token 流为空

- 消息模板 / template：`token 流为空`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00149  token 流格式错误（第 ? 行缺少空格分隔）

- 消息模板 / template：`token 流格式错误（第  <...>  行缺少空格分隔）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00153  eval_code 源码语法错误:

- 消息模板 / template：`eval_code 源码语法错误: `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00160  table_push 的第 1 个参数必须是表

- 消息模板 / template：`table_push 的第 1 个参数必须是表`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00161  table_push 的第 1 个参数必须是表变量

- 消息模板 / template：`table_push 的第 1 个参数必须是表变量`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00163  for 的迭代对象必须是范围（0..10）、表或字符串迭代器

- 消息模板 / template：`for 的迭代对象必须是范围（0..10）、表或字符串迭代器`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00183  eval_expr 表达式为空

- 消息模板 / template：`eval_expr 表达式为空`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00193  break?逃出函数体（内部错误）

- 消息模板 / template：`break <...> 逃出函数体（内部错误）`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00195  token_tag_at 需要 token 流与下标参数

- 消息模板 / template：`token_tag_at 需要 token 流与下标参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00196  trit_val 需要一个 trit 参数

- 消息模板 / template：`trit_val 需要一个 trit 参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00197  deparse 需要一个 token 流参数

- 消息模板 / template：`deparse 需要一个 token 流参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00198  len 需要一个参数

- 消息模板 / template：`len 需要一个参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00199  gensym 需要一个字符串前缀参数

- 消息模板 / template：`gensym 需要一个字符串前缀参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00200  eval_expr 需要一个字符串参数

- 消息模板 / template：`eval_expr 需要一个字符串参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00201  eval_code 需要一个字符串源码参数

- 消息模板 / template：`eval_code 需要一个字符串源码参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00202  to_string 需要一个数字参数

- 消息模板 / template：`to_string 需要一个数字参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：to_string 参数不是数字
- 常见解决方案 / common fix：传数字（i64/f64）

## E00203  to_trit 需要一个整数参数

- 消息模板 / template：`to_trit 需要一个整数参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00204  eval_call 需要两个字符串参数（函数名, 参数）

- 消息模板 / template：`eval_call 需要两个字符串参数（函数名, 参数）`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00205  str_char 需要字符串与整数参数

- 消息模板 / template：`str_char 需要字符串与整数参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00206  table_push 需要表与元素参数

- 消息模板 / template：`table_push 需要表与元素参数`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00207  table_at 需要表与整数下标参数

- 消息模板 / template：`table_at 需要表与整数下标参数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00212  一元负号只能作用于数字

- 消息模板 / template：`一元负号只能作用于数字`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00216  下标必须是整数

- 消息模板 / template：`下标必须是整数`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

## E00218  下标访问仅支持表

- 消息模板 / template：`下标访问仅支持表`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

## E00219  下标访问仅支持表或键值表

- 消息模板 / template：`下标访问仅支持表或键值表`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

## E00221  下标赋值暂只支持单层表变量（t[i]）；二维表元素暂不支持写

- 消息模板 / template：`下标赋值暂只支持单层表变量（t[i]）；二维表元素暂不支持写`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

## E00228  位运算/移位只支持整数

- 消息模板 / template：`位运算/移位只支持整数`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00279  函数 '?' 的 ref 参数需要可寻址的表变量实参（字面量/下标/调用结果不可取地址）

- 消息模板 / template：`函数 ' <...> ' 的 ref 参数需要可寻址的表变量实参（字面量/下标/调用结果不可取地址）`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00280  函数 '?' 缺少第 ? 个参数且无默认值

- 消息模板 / template：`函数 ' <...> ' 缺少第  <...>  个参数且无默认值`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00315  变量 '?' 未声明

- 消息模板 / template：`变量 ' <...> ' 未声明`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

## E00318  变量 '?' 重复声明

- 消息模板 / template：`变量 ' <...> ' 重复声明`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

## E00320  右移量必须在 0..64 范围内

- 消息模板 / template：`右移量必须在 0..64 范围内`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00326  命名空间路径 '?' 不能作为值使用（只能用于调用）

- 消息模板 / template：`命名空间路径 ' <...> ' 不能作为值使用（只能用于调用）`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00347  字符串迭代器 s.chars() 不接受实参

- 消息模板 / template：`字符串迭代器 s.chars() 不接受实参`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00353  宏 '?' 必须返回 code 值（return 了一个 ?）

- 消息模板 / template：`宏 ' <...> ' 必须返回 code 值（return 了一个  <...> ）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

## E00355  宏 '?'

- 消息模板 / template：`宏 ' <...> ' 期望  <...>  个 code 参数，实际  <...>  个`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

## E00356  宏 '?' 未定义

- 消息模板 / template：`宏 ' <...> ' 未定义`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

## E00357  宏 '?' 未返回 code 值（函数体缺少 return code 语句）

- 消息模板 / template：`宏 ' <...> ' 未返回 code 值（函数体缺少 return code 语句）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

## E00359  宏 '?' 的实参必须是 code 值（准引用或插值），实际是

- 消息模板 / template：`宏 ' <...> ' 的实参必须是 code 值（准引用或插值），实际是 `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

## E00363  宏定义注册失败: 协议根既不是声明节点也不是语句列表

- 消息模板 / template：`宏定义注册失败: 协议根既不是声明节点也不是语句列表`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

## E00366  宏展开嵌套过深（超过 64 层，疑似无限递归）

- 消息模板 / template：`宏展开嵌套过深（超过 64 层，疑似无限递归）：`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：宏未定义/实参缺失/展开失败/返回类型错误
- 常见解决方案 / common fix：检查宏名与 code 实参；宏须返回 code 值

## E00376  左移量必须在 0..64 范围内

- 消息模板 / template：`左移量必须在 0..64 范围内`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00377  布尔只能做逻辑运算与相等比较

- 消息模板 / template：`布尔只能做逻辑运算与相等比较`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00380  插值 code 值缺少节点

- 消息模板 / template：`插值 code 值缺少节点`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00381  插值 $(表达式) 必须是 code 或字符串，实际是

- 消息模板 / template：`插值 $(表达式) 必须是 code 或字符串，实际是 `
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00382  插值变量 '?' 必须是 code 或字符串，实际是

- 消息模板 / template：`插值变量 ' <...> ' 必须是 code 或字符串，实际是 `
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00383  插值变量 '?' 未声明

- 消息模板 / template：`插值变量 ' <...> ' 未声明`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00384  插值名变量 '?' 必须是字符串或 code（实际 ?）

- 消息模板 / template：`插值名变量 ' <...> ' 必须是字符串或 code（实际  <...> ）`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00385  插值名变量 '?' 未声明

- 消息模板 / template：`插值名变量 ' <...> ' 未声明`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00386  插值赋值目标必须是变量（code 值根不是变量节点）

- 消息模板 / template：`插值赋值目标必须是变量（code 值根不是变量节点）`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00388  整数不能做逻辑运算（需布尔）

- 消息模板 / template：`整数不能做逻辑运算（需布尔）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00420  条件必须是布尔，实际是

- 消息模板 / template：`条件必须是布尔，实际是 `
- 出处 / source：`/compiler/interp/value.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00449  浮点数不能做逻辑运算（需布尔）

- 消息模板 / template：`浮点数不能做逻辑运算（需布尔）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00469  类型不匹配: ? ?

- 消息模板 / template：`类型不匹配:  <...>   <...>  `
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：类型未定义/缺少类型实参/约束不满足/实参过多
- 常见解决方案 / common fix：显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port

## E00476  编译错误:

- 消息模板 / template：`编译错误: `
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00477  自增/自减只支持变量

- 消息模板 / template：`自增/自减只支持变量`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00478  自增/自减只能作用于数字

- 消息模板 / template：`自增/自减只能作用于数字`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00482  范围起点必须是整数

- 消息模板 / template：`范围起点必须是整数`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：范围/区间端点类型错误
- 常见解决方案 / common fix：整数或字符端点；左闭右开

## E00486  词法错误 @?:?:

- 消息模板 / template：`词法错误 @ <...> : <...> : `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00505  过程宏 '?' 必须返回 code 值（return 了一个 ?）

- 消息模板 / template：`过程宏 ' <...> ' 必须返回 code 值（return 了一个  <...> ）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00506  过程宏 '?'

- 消息模板 / template：`过程宏 ' <...> ' 期望  <...>  个参数，实际  <...>  个`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00507  过程宏 '?' 未定义

- 消息模板 / template：`过程宏 ' <...> ' 未定义`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00508  过程宏 '?' 未返回 code 值（函数体缺少 return code 语句）

- 消息模板 / template：`过程宏 ' <...> ' 未返回 code 值（函数体缺少 return code 语句）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00512  运行时错误: table_at 下标越界

- 消息模板 / template：`运行时错误: table_at 下标越界：索引  <...>  超出长度 `
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00513  运行时错误: parse_int 参数 '?' 不是合法的整数

- 消息模板 / template：`运行时错误: parse_int 参数 ' <...> ' 不是合法的整数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00514  运行时错误: parse_float 参数 '?' 不是合法的浮点数

- 消息模板 / template：`运行时错误: parse_float 参数 ' <...> ' 不是合法的浮点数`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00515  运行时错误: 未实现的 stdio 桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的 stdio 桥函数 ' <...> '`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00516  运行时错误: 未实现的字节桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的字节桥函数 ' <...> '`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00517  运行时错误: 未实现的数学桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的数学桥函数 ' <...> '`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00518  运行时错误: 未实现的文件桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的文件桥函数 ' <...> '`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00519  运行时错误: 未实现的标量桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的标量桥函数 ' <...> '`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00520  运行时错误: 未实现的路径/目录桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的路径/目录桥函数 ' <...> '`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00521  运行时错误: 未实现的进程桥函数 '?'

- 消息模板 / template：`运行时错误: 未实现的进程桥函数 ' <...> '`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00522  运行时错误: 环境桥函数 'exit' 在解释器内受限（REPL 退出经 read_line EOF）

- 消息模板 / template：`运行时错误: 环境桥函数 'exit' 在解释器内受限（REPL 退出经 read_line EOF）`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00523  运行时错误: 环境桥函数 'byte_write' 尚未 tie 化（限制清单见 env.tie 头注释）

- 消息模板 / template：`运行时错误: 环境桥函数 'byte_write' 尚未 tie 化（限制清单见 env.tie 头注释）`
- 出处 / source：`/compiler/interp/env.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00524  运行时错误: map_get 键不存在

- 消息模板 / template：`运行时错误: map_get 键不存在：' <...> '`
- 出处 / source：`/compiler/interp/value.tie`
- 成因（如何发生）/ cause：运行时异常（除零/越界/桥函数受限）
- 常见解决方案 / common fix：按消息定位：除数非 0、下标在界内、避开受限桥

## E00527  逻辑非只能作用于布尔

- 消息模板 / template：`逻辑非只能作用于布尔`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：逻辑运算操作数不是 bool/trit
- 常见解决方案 / common fix：把条件转成布尔表达式

## E00530  键值表下标必须是字符串键

- 消息模板 / template：`键值表下标必须是字符串键`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00532  键值表元素必须全部带字符串键

- 消息模板 / template：`键值表元素必须全部带字符串键`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00537  除零错误

- 消息模板 / template：`除零错误`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00538  除零错误（取模）

- 消息模板 / template：`除零错误（取模）`
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00539  顶层全局变量必须有初始化

- 消息模板 / template：`顶层全局变量必须有初始化`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

## E00541  顶层只允许函数/类/import/using/命名空间/全局变量/extern 声明定义

- 消息模板 / template：`顶层只允许函数/类/import/using/命名空间/全局变量/extern 声明定义`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

