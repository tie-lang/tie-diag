# tie 诊断标号 E5xxx — CLI 与配置 / CLI & Config / tie diagnostic codes

tie CLI 与配置错误：参数错误、角色声明、config 解析、compress-data、文件读写。
检查命令行参数、头部角色声明、config.data.tie 与 roles 段格式。 / CLI & config
errors: args, role headers, config parsing, compress-data, file IO.

## E50001  config 值意外字符（位置 ?）

- 消息模板 / template：`config 值意外字符（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 值位置出现非法字符
- 常见解决方案 / common fix：检查值语法（数字/字符串/表/数组）

## E50002  config 值意外结束

- 消息模板 / template：`config 值意外结束`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50003  config 合并要求顶层均为表（[ "key": value, ... ]）

- 消息模板 / template：`config 合并要求顶层均为表（[ "key": value, ... ]）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50004  config 字符串未闭合

- 消息模板 / template：`config 字符串未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50005  config 字符串转义不完整（位置 ?）

- 消息模板 / template：`config 字符串转义不完整（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50006  config 字面量不完整（位置 ?）

- 消息模板 / template：`config 字面量不完整（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50007  config 容器未闭合

- 消息模板 / template：`config 容器未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 表/数组缺结束括号
- 常见解决方案 / common fix：补 ]

## E50008  config 数字小数部分缺少数字（位置 ?）

- 消息模板 / template：`config 数字小数部分缺少数字（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50009  config 数字缺少整数部分（位置 ?）

- 消息模板 / template：`config 数字缺少整数部分（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：config 数字以 . 开头缺整数部分
- 常见解决方案 / common fix：补整数部分（如 0.5）

## E50010  config 数组

- 消息模板 / template：`config 数组期望 , 或 ]（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50011  config 数组未闭合

- 消息模板 / template：`config 数组未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50012  config 文件为空或读取失败:

- 消息模板 / template：`config 文件为空或读取失败: `
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50013  config 未知转义 \?（位置 ?）

- 消息模板 / template：`config 未知转义 \ <...> （位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50014  config 根值后有额外内容（位置 ?）

- 消息模板 / template：`config 根值后有额外内容（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50015  config 表

- 消息模板 / template：`config 表期望 , 或 ]（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50016  config 表

- 消息模板 / template：`config 表期望 :（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50017  config 表未闭合

- 消息模板 / template：`config 表未闭合`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50018  config 表键必须是字符串（位置 ?）

- 消息模板 / template：`config 表键必须是字符串（位置  <...> ）`
- 出处 / source：`/compiler/config.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50019  compress-data 失败

- 消息模板 / template：`compress-data 失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50020  修饰角色重复: '?'

- 消息模板 / template：`修饰角色重复: ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50021  动态库模式错误

- 消息模板 / template：`动态库模式错误`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50022  参数错误

- 消息模板 / template：`参数错误。输入 tiec --help 查看用法。`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：CLI 参数错误
- 常见解决方案 / common fix：运行 tiec --help 查看用法

## E50023  基础角色重复: '?'

- 消息模板 / template：`基础角色重复: ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50024  文件类型声明错误

- 消息模板 / template：`文件类型声明错误`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50025  未知基础角色 '?'

- 消息模板 / template：`未知基础角色 ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50026  未知角色 '?'（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded）

- 消息模板 / template：`未知角色 ' <...> '（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded）`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E50027  构建配置加载失败

- 消息模板 / template：`构建配置加载失败`
- 出处 / source：`(manual)`
- 成因（如何发生）/ cause：config.data.tie 加载/合并失败
- 常见解决方案 / common fix：检查语法与合并规则（顶层须为表）

## E50028  角色 '?' 不支持参数 '?'

- 消息模板 / template：`角色 ' <...> ' 不支持参数 ' <...> '`
- 出处 / source：`/compiler/driver.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

