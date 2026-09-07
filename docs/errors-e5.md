# tie 诊断标号（家族 CLI 与配置 / CLI & Config） / tie diagnostic codes — CLI 与配置 / CLI & Config

tie CLI 与配置错误：参数错误、角色声明、config 解析、compress-data、文件读写。
检查命令行参数、头部角色声明、config.data.tie 与 roles 段格式。 / CLI & config
errors: args, role headers, config parsing, compress-data, file IO.

## E00023  config 值意外字符（位置 ?）

- 消息模板 / template：`config 值意外字符（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 值位置出现非法字符
- 常见解决方案 / common fix：检查值语法（数字/字符串/表/数组）

## E00024  config 值意外结束

- 消息模板 / template：`config 值意外结束`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00055  config 合并要求顶层均为表（[ "key": value, ... ]）

- 消息模板 / template：`config 合并要求顶层均为表（[ "key": value, ... ]）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00066  config 字符串未闭合

- 消息模板 / template：`config 字符串未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00067  config 字符串转义不完整（位置 ?）

- 消息模板 / template：`config 字符串转义不完整（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00068  config 字面量不完整（位置 ?）

- 消息模板 / template：`config 字面量不完整（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00075  config 容器未闭合

- 消息模板 / template：`config 容器未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 表/数组缺结束括号
- 常见解决方案 / common fix：补 ]

## E00085  config 数字小数部分缺少数字（位置 ?）

- 消息模板 / template：`config 数字小数部分缺少数字（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00086  config 数字缺少整数部分（位置 ?）

- 消息模板 / template：`config 数字缺少整数部分（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 数字以 . 开头缺整数部分
- 常见解决方案 / common fix：补整数部分（如 0.5）

## E00087  config 数组

- 消息模板 / template：`config 数组期望 , 或 ]（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00088  config 数组未闭合

- 消息模板 / template：`config 数组未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00089  config 文件为空或读取失败:

- 消息模板 / template：`config 文件为空或读取失败: `
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00141  config 未知转义 \?（位置 ?）

- 消息模板 / template：`config 未知转义 \ <...> （位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00144  config 根值后有额外内容（位置 ?）

- 消息模板 / template：`config 根值后有额外内容（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00180  config 表

- 消息模板 / template：`config 表期望 , 或 ]（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00181  config 表

- 消息模板 / template：`config 表期望 :（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00182  config 表未闭合

- 消息模板 / template：`config 表未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00184  config 表键必须是字符串（位置 ?）

- 消息模板 / template：`config 表键必须是字符串（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00210  compress-data 失败

- 消息模板 / template：`compress-data 失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00230  修饰角色重复: '?'

- 消息模板 / template：`修饰角色重复: ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00291  动态库模式错误

- 消息模板 / template：`动态库模式错误`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00302  参数错误

- 消息模板 / template：`参数错误。输入 tiec --help 查看用法。`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：CLI 参数错误
- 常见解决方案 / common fix：运行 tiec --help 查看用法

## E00329  基础角色重复: '?'

- 消息模板 / template：`基础角色重复: ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00389  文件类型声明错误

- 消息模板 / template：`文件类型声明错误`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00415  未知基础角色 '?'

- 消息模板 / template：`未知基础角色 ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00417  未知角色 '?'（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded）

- 消息模板 / template：`未知角色 ' <...> '（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded）`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E00421  构建配置加载失败

- 消息模板 / template：`构建配置加载失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：config.data.tie 加载/合并失败
- 常见解决方案 / common fix：检查语法与合并规则（顶层须为表）

## E00484  角色 '?' 不支持参数 '?'

- 消息模板 / template：`角色 ' <...> ' 不支持参数 ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

