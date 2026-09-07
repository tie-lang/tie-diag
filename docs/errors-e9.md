# tie 诊断标号（家族 内部错误 / Internal） / tie diagnostic codes — 内部错误 / Internal

内部错误（E9）：编译器自身断言/未实现分支。请提交 issue 并附最小复现与
	iec -O0 输出。 / Internal errors: compiler bugs — file an issue with a
minimal repro.

## E00246  内部错误: 准引用节点缺少子 AST

- 消息模板 / template：`内部错误: 准引用节点缺少子 AST`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00247  内部错误: 包装后的 main 未找到

- 消息模板 / template：`内部错误: 包装后的 main 未找到`
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00248  内部错误: eval_expr 包装程序根不是语句列表 (tag=?)

- 消息模板 / template：`内部错误: eval_expr 包装程序根不是语句列表 (tag= <...> )`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00249  内部错误: eval_expr 包装程序缺少 return 语句

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少 return 语句`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00250  内部错误: eval_expr 包装程序缺少函数体

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少函数体`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00251  内部错误: eval_expr 包装程序缺少函数定义

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少函数定义`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00252  内部错误: eval_expr 包装程序缺少节点

- 消息模板 / template：`内部错误: eval_expr 包装程序缺少节点`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00253  内部错误: eval_expr 协议加载失败

- 消息模板 / template：`内部错误: eval_expr 协议加载失败`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00254  内部错误: AST 协议加载失败（code 执行）

- 消息模板 / template：`内部错误: AST 协议加载失败（code 执行）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00255  内部错误: AST 协议加载失败（宏定义注册）

- 消息模板 / template：`内部错误: AST 协议加载失败（宏定义注册）`
- 出处 / source：`/compiler/interp/interp_macro.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00256  内部错误: 协议文本拼接失败（空协议）

- 消息模板 / template：`内部错误: 协议文本拼接失败（空协议）`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00257  内部错误: 插值 code 值解析失败

- 消息模板 / template：`内部错误: 插值 code 值解析失败`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00258  内部错误: 插值节点协议 id 映射缺失

- 消息模板 / template：`内部错误: 插值节点协议 id 映射缺失`
- 出处 / source：`/compiler/interp/interp_code.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00259  内部错误: 未实现的内置函数 '?'

- 消息模板 / template：`内部错误: 未实现的内置函数 ' <...> '`
- 出处 / source：`/compiler/interp/interp_call.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00260  内部错误: 未知二元运算符

- 消息模板 / template：`内部错误: 未知二元运算符 `
- 出处 / source：`/compiler/interp/interp_bin.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00261  内部错误: 未知表达式节点 tag

- 消息模板 / template：`内部错误: 未知表达式节点 tag `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00262  内部错误: 未知语句节点 tag

- 消息模板 / template：`内部错误: 未知语句节点 tag `
- 出处 / source：`/compiler/interp/interp.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00263  内部错误: 表达式语句节点找不到父节点

- 消息模板 / template：`内部错误: 表达式语句节点找不到父节点`
- 出处 / source：`/compiler/frontend/mexpand.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00264  内部错误

- 消息模板 / template：`内部错误：struct ' <...> ' 定义节点未找到`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00265  内部错误

- 消息模板 / template：`内部错误：impl 方法 ' <...> ' 无签名`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00266  内部错误

- 消息模板 / template：`内部错误：'?' 解包操作数缺少枚举类型（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00267  内部错误

- 消息模板 / template：`内部错误：'?' 解包枚举缺少 Err/None 变体（函数  <...> ）`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00268  内部错误

- 消息模板 / template：`内部错误：'?' 解包的 Ok/Some 变体应恰有一个 payload 字段`
- 出处 / source：`/compiler/frontend/sinfer_ret.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00269  内部错误

- 消息模板 / template：`内部错误：函数 ' <...> ' 无签名`
- 出处 / source：`/compiler/frontend/scheck.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00270  内部错误

- 消息模板 / template：`内部错误：枚举 ' <...> ' 定义节点未找到`
- 出处 / source：`/compiler/frontend/scollect_port.tie`
- 成因（如何发生）/ cause：编译器内部断言/未实现分支
- 常见解决方案 / common fix：提交 issue，附最小复现与 -O0 输出

## E00450  消息

- 消息模板 / template：`消息`
- 出处 / source：`/compiler/backend/irgen_rt.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00475  编译器内部错误: ir.add_operand 操作数段交错 (fn=? inst=? op=? off=? cnt=? len_ops=? 最近指令:?)——调用方不得在 add_operand 序列中间向全局操作数段 push（常量生成请先存变量）

- 消息模板 / template：`编译器内部错误: ir.add_operand 操作数段交错 (fn= <...>  inst= <...>  op= <...>  off= <...>  cnt= <...>  len_ops= <...>  最近指令: <...> )——调用方不得在 add_operand 序列中间向全局操作数段 push（常量生成请先存变量）`
- 出处 / source：`/compiler/middle/ir.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

