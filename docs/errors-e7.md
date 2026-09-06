# tie 诊断标号 E7xxx — REPL / tie diagnostic codes

REPL v1 暂不支持项：struct/enum/import/using/元组/字段访问/goto 等解释器路径
限制——请改用编译路径（tiec 文件编译）。 / REPL v1 limitations: use the
compile path (tiec on a file) for these constructs.

## E70001  修饰角色重复

- 消息模板 / template：`修饰角色重复：" <...> "`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E70002  基础角色重复

- 消息模板 / template：`基础角色重复：" <...> "（基础角色只能声明一个）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E70003  未知基础角色 "?"（合法: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）

- 消息模板 / template：`未知基础角色 " <...> "（合法: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E70004  未知角色 "?"（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）

- 消息模板 / template：`未知角色 " <...> "（基础: script/data/ui/class/logic/port/db/ir/zd/tieir/test/bench；修饰: unsafe/owned/embedded；自定义角色需 tiec 在 config.data.tie roles 段注册，tie-prep 仅识别内建）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

## E70005  角色 "?" 不支持参数 "?"（合法参数: ui:window/web/embedded、db:schema/seed/vector、data:config/asset）

- 消息模板 / template：`角色 " <...> " 不支持参数 " <...> "（合法参数: ui:window/web/embedded、db:schema/seed/vector、data:config/asset）`
- 出处 / source：`/prep/core.tie`
- 成因（如何发生）/ cause：见家族说明 / see family guidance；消息模板见下。
- 常见解决方案 / common fix：按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。

