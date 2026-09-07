# tie 诊断标号（家族 后端与 IR / Backend & IR） / tie diagnostic codes — 后端与 IR / Backend & IR

tie 后端与 IR 错误：opt/clang/llvm-ar/lld 工具链失败、tieir 序列化、后端未接入。
多为环境问题（LLVM 工具缺失/版本）或编译器内部错误。 / Backend & IR errors:
toolchain (opt/clang/llvm-ar/lld) failures, tieir serialization, unimplemented
backend — often environment (missing LLVM tools) or compiler-internal.

## E00007  irgen 不支持 code 字面量作语句（tag=136，函数 ?）

- 消息模板 / template：`irgen 不支持 code 字面量作语句（tag=136，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00008  guard<cap> 不支持方法 '?'（函数 ?）

- 消息模板 / template：`guard<cap> 不支持方法 ' <...> '（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00015  actor 与 import trm-lite 冲突

- 消息模板 / template：`actor 与 import trm-lite 冲突：actor 默认由 trm-lite 简单执行体承载，与 import 是替代运行时路径，不能混用（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00017  case 值 '?' 不是 struct（函数 ?）

- 消息模板 / template：`case 值 ' <...> ' 不是 struct（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00020  case 值不是枚举 '?' 的变体引用（函数 ?）

- 消息模板 / template：`case 值不是枚举 ' <...> ' 的变体引用（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00028  const 全局表暂不支持

- 消息模板 / template：`const 全局表暂不支持：' <...> '需要 main 入口运行时创建，无法静态初始化`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00029  spawn 内置与 import trm-lite 冲突

- 消息模板 / template：`spawn 内置与 import trm-lite 冲突：内置与 import 是替代运行时路径，不能混用（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00041  cb_ptr 参数 '?' 不是命名函数（函数 ?）

- 消息模板 / template：`cb_ptr 参数 ' <...> ' 不是命名函数（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00043  spawn 参数必须是函数值（fn() -> i64 / fn() -> void），函数

- 消息模板 / template：`spawn 参数必须是函数值（fn() -> i64 / fn() -> void），函数 `
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00046  cb_ptr 参数必须是无捕获闭包字面量或命名函数（函数 ?）

- 消息模板 / template：`cb_ptr 参数必须是无捕获闭包字面量或命名函数（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00047  cb_ptr 参数闭包含捕获变量（C 回调函数指针不携带环境），函数

- 消息模板 / template：`cb_ptr 参数闭包含捕获变量（C 回调函数指针不携带环境），函数 `
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00064  addr_of_field() 字段 '?' 不存在（函数 ?）

- 消息模板 / template：`addr_of_field() 字段 ' <...> ' 不存在（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00065  addr_of_field() 字段名必须是字符串字面量（函数 ?）

- 消息模板 / template：`addr_of_field() 字段名必须是字符串字面量（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00072  slice_index() 实参必须是切片类型（函数 ?）

- 消息模板 / template：`slice_index() 实参必须是切片类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00073  deref() 实参必须是指针类型（函数 ?）

- 消息模板 / template：`deref() 实参必须是指针类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00074  addr_of() 实参类型未知（函数 ?）

- 消息模板 / template：`addr_of() 实参类型未知（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00078  switch 对象仅支持数字、布尔、字符或字符串类型，实际是

- 消息模板 / template：`switch 对象仅支持数字、布尔、字符或字符串类型，实际是 `
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00082  addr_of_field() 对象类型未知（函数 ?）

- 消息模板 / template：`addr_of_field() 对象类型未知（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00083  asm! 平台 target(?) 与当前编译目标 ? 不匹配（无目标平台分支可编译）

- 消息模板 / template：`asm! 平台 target( <...> ) 与当前编译目标  <...>  不匹配（无目标平台分支可编译）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00096  actor 方法 '?' 未找到（函数 ?）

- 消息模板 / template：`actor 方法 ' <...> ' 未找到（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00097  atomic 方法 '?' 生成失败（函数 ?）

- 消息模板 / template：`atomic 方法 ' <...> ' 生成失败（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00099  actor 方法 ? 节点未找到

- 消息模板 / template：`actor 方法  <...>  节点未找到`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00108  spawn 暂只支持返回 i64/void 的闭包（当前 ?），函数

- 消息模板 / template：`spawn 暂只支持返回 i64/void 的闭包（当前  <...> ），函数 `
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00138  struct '?' 未定义（函数 ?）

- 消息模板 / template：`struct ' <...> ' 未定义（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00139  irgen 未支持的表达式（tag=?，函数 ?）

- 消息模板 / template：`irgen 未支持的表达式（tag= <...> ，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00140  irgen 未支持的语句（tag=?，函数 ?）

- 消息模板 / template：`irgen 未支持的语句（tag= <...> ，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00146  port '?' 没有方法 '?'（函数 ?）

- 消息模板 / template：`port ' <...> ' 没有方法 ' <...> '（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_vtable.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00155  run 的 '?' 不是已声明的 actor 类型（函数 ?）

- 消息模板 / template：`run 的 ' <...> ' 不是已声明的 actor 类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00170  deref_write() 第 1 实参必须是指针类型（函数 ?）

- 消息模板 / template：`deref_write() 第 1 实参必须是指针类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00171  slice_of() 第一版只支持字符串或动态表（函数 ?）

- 消息模板 / template：`slice_of() 第一版只支持字符串或动态表（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00174  case 类型匹配（?）不是可装箱类型（函数 ?）

- 消息模板 / template：`case 类型匹配（ <...> ）不是可装箱类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00185  any 装箱暂不支持类型 ?（函数 ?）

- 消息模板 / template：`any 装箱暂不支持类型  <...> （函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00211  tieir 读取失败

- 消息模板 / template：`tieir 读取失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00215  下标复合赋值运算失败（函数 ?）

- 消息模板 / template：`下标复合赋值运算失败（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）
- 常见解决方案 / common fix：表用 t[i]；键值表用 m[k]；追加用 table_push

## E00232  元组仅支持 ==/!= 比较（函数 ?）

- 消息模板 / template：`元组仅支持 ==/!= 比较（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00233  元组字段为表类型，不支持 ==/!= 比较（字段类型 ?）

- 消息模板 / template：`元组字段为表类型，不支持 ==/!= 比较（字段类型  <...> ）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00235  元组字面量缺少语义类型（函数 ?）

- 消息模板 / template：`元组字面量缺少语义类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00236  元组比较目标不是元组（函数 ?）

- 消息模板 / template：`元组比较目标不是元组（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00245  内置调用 '?' 生成失败（函数 ?）

- 消息模板 / template：`内置调用 ' <...> ' 生成失败（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_expr.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00271  函数 ? 参数类型解析失败

- 消息模板 / template：`函数  <...>  参数类型解析失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00274  函数 '?' 无定义节点，无法补齐默认值参数（函数 ?）

- 消息模板 / template：`函数 ' <...> ' 无定义节点，无法补齐默认值参数（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00275  函数 '?' 无签名（函数 ?）

- 消息模板 / template：`函数 ' <...> ' 无签名（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00278  函数 '?'

- 消息模板 / template：`函数 ' <...> ' 期望  <...>  到  <...>  个参数，实际  <...>  个`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00281  函数 '?' 缺少第 ? 个参数且无默认值（函数 ?）

- 消息模板 / template：`函数 ' <...> ' 缺少第  <...>  个参数且无默认值（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00282  函数 ? 返回类型解析失败

- 消息模板 / template：`函数  <...>  返回类型解析失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00288  函数值调用

- 消息模板 / template：`函数值调用：变量 ' <...> ' 在实参求值后不可见（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00289  函数值调用

- 消息模板 / template：`函数值调用：变量 ' <...> ' 类型缺失（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：函数未定义/重复定义/私有函数跨命名空间/参数错误
- 常见解决方案 / common fix：检查命名空间与 pub 修饰；同名函数去重

## E00292  动态库边界错误: 导出函数 ? 参数

- 消息模板 / template：`动态库边界错误: 导出函数  <...>  参数`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00293  动态库边界错误: 导出函数 ? 返回

- 消息模板 / template：`动态库边界错误: 导出函数  <...>  返回`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00294  原子变量 '?' 未入作用域（函数 ?）

- 消息模板 / template：`原子变量 ' <...> ' 未入作用域（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00314  变量 '?' 未入作用域（函数 ?）

- 消息模板 / template：`变量 ' <...> ' 未入作用域（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等
- 常见解决方案 / common fix：按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制

## E00321  命名函数提升

- 消息模板 / template：`命名函数提升：函数 ' <...> ' 无签名（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00322  命名空间 ? 的函数 ? 生成失败

- 消息模板 / template：`命名空间  <...>  的函数  <...>  生成失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00324  命名空间函数 '?'

- 消息模板 / template：`命名空间函数 ' <...> ' 期望  <...>  到  <...>  个参数，实际  <...>  个`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00331  复合字段赋值运算失败（字段 ?，函数 ?）

- 消息模板 / template：`复合字段赋值运算失败（字段  <...> ，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00335  复合赋值运算失败（变量 ?，函数 ?）

- 消息模板 / template：`复合赋值运算失败（变量  <...> ，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00338  字段 '?' 解析失败（函数 ?）

- 消息模板 / template：`字段 ' <...> ' 解析失败（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00339  字段访问 '.' 的对象不是元组/struct（类型 ?，函数 ?）

- 消息模板 / template：`字段访问 '.' 的对象不是元组/struct（类型  <...> ，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00342  字段赋值的目标不是元组/struct（类型 ?，函数 ?）

- 消息模板 / template：`字段赋值的目标不是元组/struct（类型  <...> ，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00379  提升操作数类型缺失（函数 ?）

- 消息模板 / template：`提升操作数类型缺失（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_vtable.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00392  方法 '?'

- 消息模板 / template：`方法 ' <...> ' 期望  <...>  个参数（不含接收者），实际  <...>  个`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

## E00396  方法调用接收者不可解析（方法 ?，函数 ?）

- 消息模板 / template：`方法调用接收者不可解析（方法  <...> ，函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_call.tie`
- 成因（如何发生）/ cause：方法调用的对象不是 struct 实例，或参数/首参类型不匹配
- 常见解决方案 / common fix：接收者须为 struct 实例；方法首参类型须与 struct 匹配

## E00412  未找到 opt，请确认 LLVM 已安装并在 PATH 中

- 消息模板 / template：`未找到 opt，请确认 LLVM 已安装并在 PATH 中`
- 出处 / source：`/compiler/backend/toolchain.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00413  未知 checked_* 函数 '?'（函数 ?）

- 消息模板 / template：`未知 checked_* 函数 ' <...> '（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00429  枚举 '?' 没有变体 '?'（函数 ?）

- 消息模板 / template：`枚举 ' <...> ' 没有变体 ' <...> '（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持
- 常见解决方案 / common fix：检查变体名；payload 仅标量；枚举不比较相等

## E00451  父 struct '?' 未定义

- 消息模板 / template：`父 struct ' <...> ' 未定义`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00452  程序使用了 tie-interp 桥内置，但未找到 tie-interp 静态库。? ? -lws2_32 -luserenv -lntdll -lbcrypt -ladvapi32 -lole32 -lshell32

- 消息模板 / template：`程序使用了 tie-interp 桥内置，但未找到 tie-interp 静态库。 <...>   <...>  -lws2_32 -luserenv -lntdll -lbcrypt -ladvapi32 -lole32 -lshell32`
- 出处 / source：`/compiler/backend/toolchain.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00453  程序使用了 trm-lite 运行时（spawn/yield/collect 或表容器 table<T>），但未找到 trm-lite 静态库。? ? -rtlib=compiler-rt

- 消息模板 / template：`程序使用了 trm-lite 运行时（spawn/yield/collect 或表容器 table<T>），但未找到 trm-lite 静态库。 <...>   <...>  -rtlib=compiler-rt`
- 出处 / source：`/compiler/backend/toolchain.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00459  箭头赋值目标 '?' 未入作用域（函数 ?）

- 消息模板 / template：`箭头赋值目标 ' <...> ' 未入作用域（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00461  类 '?' 未定义

- 消息模板 / template：`类 ' <...> ' 未定义`
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00480  自增自减目标 '?' 未入作用域（函数 ?）

- 消息模板 / template：`自增自减目标 ' <...> ' 未入作用域（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_arith.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00483  表元素类型不一致

- 消息模板 / template：`表元素类型不一致： <...>  与 `
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00497  调用表达式要求被调者为函数类型（函数 ?）

- 消息模板 / template：`调用表达式要求被调者为函数类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：调用/实参类型或数量不匹配、ref 实参非可寻址
- 常见解决方案 / common fix：核对签名：实参类型/个数；ref 实参必须是可寻址表变量

## E00499  赋值目标 '?' 未入作用域（函数 ?）

- 消息模板 / template：`赋值目标 ' <...> ' 未入作用域（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_stmt.tie`
- 成因（如何发生）/ cause：赋值目标未声明/类型不匹配/const 赋值
- 常见解决方案 / common fix：先声明；类型一致；const 不可重新赋值

## E00531  键值表值类型不匹配

- 消息模板 / template：`键值表值类型不匹配：map 值为  <...>  与 `
- 出处 / source：`/compiler/proto/semantic.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00533  键值表字面量元素缺少字符串键（函数 ?）

- 消息模板 / template：`键值表字面量元素缺少字符串键（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_agg.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00536  闭包返回类型解析失败

- 消息模板 / template：`闭包返回类型解析失败`
- 出处 / source：`/compiler/backend/irgen_closure.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00540  顶层函数 ? 生成失败

- 消息模板 / template：`顶层函数  <...>  生成失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

## E00542  顶层命名空间生成失败

- 消息模板 / template：`顶层命名空间生成失败`
- 出处 / source：`/compiler/backend/irgen.tie`
- 成因（如何发生）/ cause：顶层只允许函数/类/import/using/命名空间/全局变量/extern
- 常见解决方案 / common fix：把声明移到函数体内外的正确层级

