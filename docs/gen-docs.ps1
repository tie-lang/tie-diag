# gen-docs.ps1 —— tie-diag 家族文档生成器
# ============================================================
# 读 docs/diagcodes.data.tie（td 数据表字面量，由 tie-main/scripts/
# gen-diagcodes.tie 生成；不用 JSON），按家族输出 docs/errors-eN.md：
# 每条标号含 消息模板 / 出处 / 成因 / 常见解决方案。
# 成因与方案来自内置 nameMap/prefMap（按消息名前缀）；未覆盖的条目用
# 家族级默认说明兜底。性能敏感读取场景使用 zd 变体
# （tiec --compress-data diagcodes.data.tie -o diagcodes.zd）。
#
# 用法：.\docs\gen-docs.ps1

$ErrorActionPreference = "Stop"
$Repo = Split-Path -Parent $PSScriptRoot

# ---------- td 解析（自产受控格式：type tie<data> 头 + diagcodes = [ 行式对象数组 ]） ----------
function Unescape-Td([string]$s) {
    $sb = New-Object System.Text.StringBuilder
    $i = 0
    while ($i -lt $s.Length) {
        if ($s[$i] -eq '\' -and $i + 1 -lt $s.Length) {
            $nx = $s[$i + 1]
            switch ($nx) {
                'n' { [void]$sb.Append("`n"); $i += 2; continue }
                'r' { [void]$sb.Append("`r"); $i += 2; continue }
                't' { [void]$sb.Append("`t"); $i += 2; continue }
                '"' { [void]$sb.Append('"'); $i += 2; continue }
                '\' { [void]$sb.Append('\'); $i += 2; continue }
                default { [void]$sb.Append($nx); $i += 2; continue }
            }
        }
        [void]$sb.Append($s[$i]); $i++
    }
    return $sb.ToString()
}

function Read-TdManifest([string]$path) {
    $rows = [System.Collections.Generic.List[object]]::new()
    $lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)
    foreach ($ln in $lines) {
        $t = $ln.Trim()
        if (-not $t.StartsWith('[')) { continue }
        $rec = [ordered]@{}
        foreach ($field in @('code', 'key', 'name', 'family', 'src', 'template')) {
            $m = [regex]::Match($t, '("' + $field + '":\s*)(?:"((?:[^"\\]|\\.)*)"|(\d+))')
            if ($m.Success) {
                if ($m.Groups[2].Success) {
                    $rec[$field] = Unescape-Td $m.Groups[2].Value
                } else {
                    $rec[$field] = [int]$m.Groups[3].Value
                }
            } else {
                $rec[$field] = ""
            }
        }
        $rows.Add([PSCustomObject]$rec)
    }
    return $rows
}

$json = Read-TdManifest (Join-Path $Repo "docs\diagcodes.data.tie")

# ---------- 家族介绍 ----------
$famIntro = @{
    1 = @"
tie 词法错误（扫描阶段）：字符串/字符字面量未闭合、转义问题、块注释未闭合、
无法识别的字符。都发生在源码的「符号切分」时刻——检查引号配对、转义序列、
注释块。 / Lexer errors: unclosed string/char/block-comment, bad escapes,
unrecognized chars — check quotes, escapes and comment blocks.
"@
    2 = @"
tie 语法错误（解析阶段）：期望 X 实际 Y、标签只能用于循环、extern 只能顶层、
赋值目标非法等。多为漏分号、多/缺括号、关键字位置错误。 / Parser errors:
expected X but got Y, label misuse, extern placement, bad assignment target —
usually missing semicolons/brackets or keyword misplacement.
"@
    3 = @"
tie 语义错误（类型/作用域/调用/移动/泛型/宏）：最丰富的一族。类型不匹配、
未定义符号、ref 实参规则、unsafe 门禁、移动语义、泛型实例化、宏展开都在此。
多数可按「名字 + 期望/实际」直接定位。 / Semantic errors: the largest family —
types, scopes, calls, ref args, unsafe gates, move semantics, generics, macro
expansion. Most resolve via the name plus expected/actual.
"@
    4 = @"
tie 运行时/解释器错误（REPL 与内置函数）：内置函数参数错误（len/str_char/…）、
除零、下标越界、桥函数未 tie 化等。 / Runtime/interpreter errors: builtin
argument mistakes, divide-by-zero, index out of range, un-tie'd bridge fns.
"@
    5 = @"
tie CLI 与配置错误：参数错误、角色声明、config 解析、compress-data、文件读写。
检查命令行参数、头部角色声明、config.data.tie 与 roles 段格式。 / CLI & config
errors: args, role headers, config parsing, compress-data, file IO.
"@
    6 = @"
tie 后端与 IR 错误：opt/clang/llvm-ar/lld 工具链失败、tieir 序列化、后端未接入。
多为环境问题（LLVM 工具缺失/版本）或编译器内部错误。 / Backend & IR errors:
toolchain (opt/clang/llvm-ar/lld) failures, tieir serialization, unimplemented
backend — often environment (missing LLVM tools) or compiler-internal.
"@
    7 = @"
REPL v1 暂不支持项：struct/enum/import/using/元组/字段访问/goto 等解释器路径
限制——请改用编译路径（tiec 文件编译）。 / REPL v1 limitations: use the
compile path (tiec on a file) for these constructs.
"@
    9 = @"
内部错误（E9）：编译器自身断言/未实现分支。请提交 issue 并附最小复现与
`tiec -O0` 输出。 / Internal errors: compiler bugs — file an issue with a
minimal repro.
"@
}

# ---------- 按消息名精确覆盖（成因/方案；名字稳定，码号随重生成会漂移）----------
$nameMap = @{
    '字符串未闭合' = @('字符串字面量缺少结束引号（词法扫描）', '补齐结束引号；检查多行字符串是否需拼接')
    '字符字面量未闭合' = @('字符字面量缺少结束引号', '补齐结束引号')
    '字符字面量只能包含一个字符' = @('字符字面量里放了多个字符/码元', '只保留一个字符；转义序列用 \\u 或直接字符')
    '无法识别的字符' = @('扫描到非法符号', '删除或替换为合法符号')
    '未知转义序列' = @('\\ 后的转义符不是支持项', '使用支持的转义（\\n \\t \\r \\" \\\\ 等）')
    '块注释未闭合' = @('块注释 /* ... */ 没有闭合 */', '补齐 */，或将误写的 /* 改为 /')
    '转义符后缺少字符' = @('转义符 \\ 后没有字符（字符串尾）', '补齐转义字符，或检查字符串是否提前终止')
    '期望标识符' = @('该位置期望标识符（名字/关键字），实际是别的符号', '检查拼写与关键字位置；确认未遗漏标识符名')
    '期望类型' = @('该位置期望类型表达式', '补齐类型标注，并检查类型名与泛型实参')
    '无法在' = @('该符号后不能开始表达式', '检查运算符/括号顺序')
    'extern 声明只能出现在文件顶层' = @('extern 声明写进了函数体内', '移到文件顶层')
    '不能在这里嵌套代码块' = @('嵌套代码块出现在不允许的位置', '调整块结构')
    '赋值目标必须是变量或字段' = @('赋值左侧不是可写目标', '改为变量/字段/下标 t[i]')
    "table_at() 下标必须是整数" = @('table_at 下标不是整数', '用整数下标（i64）')
    "atomic.store() 值类型不匹配" = @('atomic.store 的值与原子元素类型不一致', '按 atomic<T> 的 T 传值')
    "asm! 内联汇编必须在 unsafe 块或 unsafe 函数中使用" = @('asm! 用在安全代码里', '包进 unsafe { } 或标 unsafe fn')
    "'?' 解包错误类型不匹配" = @('? 解包的操作数不是 Result/Option，或其错误类型与函数返回不一致', '核对操作数与返回类型')
    "'?' 解包只能用于返回 Result/Option 的函数内" = @('? 用在非 Result/Option 返回函数里', '让函数返回 Result/Option')
    '函数重复定义' = @('同名函数/签名重复注册', '去重；不同命名空间同名用完整前缀调用')
    "函数值调用 '?' 的 ref 参数需要可寻址的表变量实参" = @('ref 实参是字面量/下标/调用结果，不可取地址', '先存成表变量再传')
    '变量未声明' = @('使用未声明的变量', '先声明；检查作用域/拼写')
    '变量重复声明' = @('同一作用域重复声明同名变量', '去重或换名')
    'token_tag_at 下标越界' = @('token 流下标越界', '先 len(token) 再取')
    'str_len 只支持字符串' = @('str_len 参数不是字符串', '传字符串')
    'to_string 需要一个数字参数' = @('to_string 参数不是数字', '传数字（i64/f64）')
    'config 容器未闭合' = @('config 表/数组缺结束括号', '补 ]')
    'config 值意外字符' = @('config 值位置出现非法字符', '检查值语法（数字/字符串/表/数组）')
    'config 数字缺少整数部分' = @('config 数字以 . 开头缺整数部分', '补整数部分（如 0.5）')
    '构建配置加载失败' = @('config.data.tie 加载/合并失败', '检查语法与合并规则（顶层须为表）')
    '参数错误' = @('CLI 参数错误', '运行 tiec --help 查看用法')
    'struct 类型未定义' = @('引用了未声明的 struct 类型', '先声明 struct 或 import')
    'guard 不支持方法' = @('guard<cap> 上调用了不支持的方法', '检查 guard 方法集')
    '内部错误' = @('编译器内部断言/未实现分支', '提交 issue，附最小复现与 -O0 输出')
}

# ---------- 按消息名前缀覆盖（成因/方案）----------
$prefMap = @(
    @{ P = '变量'; C = '变量声明/使用问题：类型不匹配、重复声明、未声明、const 修改、移动后使用等'; F = '按消息名细分：类型标注或初始化；const 不可赋值；move 后用 clone 复制' }
    @{ P = '参数'; C = '函数参数声明问题：默认值、ref 修饰、变参、类型不匹配'; F = '默认值须为字面量且连续排在必选后；ref 仅表参数；变参须为最后一个且元素标量' }
    @{ P = '调用'; C = '调用/实参类型或数量不匹配、ref 实参非可寻址'; F = '核对签名：实参类型/个数；ref 实参必须是可寻址表变量' }
    @{ P = '函数'; C = '函数未定义/重复定义/私有函数跨命名空间/参数错误'; F = '检查命名空间与 pub 修饰；同名函数去重' }
    @{ P = '方法'; C = '方法调用的对象不是 struct 实例，或参数/首参类型不匹配'; F = '接收者须为 struct 实例；方法首参类型须与 struct 匹配' }
    @{ P = '类型'; C = '类型未定义/缺少类型实参/约束不满足/实参过多'; F = '显式指定类型实参（如 Box<i64>）；泛型约束须 impl 对应 port' }
    @{ P = '构造'; C = 'struct/enum 构造参数数量或类型不匹配'; F = '按字段声明顺序传参；缺省用默认值' }
    @{ P = '枚举'; C = '枚举变体不存在/重复定义/payload 类型白名单限制/== 不支持'; F = '检查变体名；payload 仅标量；枚举不比较相等' }
    @{ P = '宏'; C = '宏未定义/实参缺失/展开失败/返回类型错误'; F = '检查宏名与 code 实参；宏须返回 code 值' }
    @{ P = '内部错误'; C = '编译器内部状态不一致'; F = '提交 issue 附最小复现' }
    @{ P = '导入文件'; C = 'import 的文件不存在或解析/语义失败'; F = '检查路径与文件内容；补缺失文件' }
    @{ P = '顶层'; C = '顶层只允许函数/类/import/using/命名空间/全局变量/extern'; F = '把声明移到函数体内外的正确层级' }
    @{ P = '赋值'; C = '赋值目标未声明/类型不匹配/const 赋值'; F = '先声明；类型一致；const 不可重新赋值' }
    @{ P = '下标'; C = '下标访问/赋值目标非法（仅表/键值表；写须 t[i] 可寻址）'; F = '表用 t[i]；键值表用 m[k]；追加用 table_push' }
    @{ P = '逻辑'; C = '逻辑运算操作数不是 bool/trit'; F = '把条件转成布尔表达式' }
    @{ P = '取模'; C = '取模/取负/自增自减操作数类型错误'; F = '整数取模；数字取负；可写数字变量自增自减' }
    @{ P = '范围'; C = '范围/区间端点类型错误'; F = '整数或字符端点；左闭右开' }
    @{ P = '比较'; C = '比较运算符用于非数字/字符串/bool/trit 类型'; F = '元组/指针仅 ==/!=；枚举不支持比较' }
    @{ P = '配置'; C = 'config 文件语法错误'; F = '检查括号/引号/转义/数字格式' }
    @{ P = '运行时错误'; C = '运行时异常（除零/越界/桥函数受限）'; F = '按消息定位：除数非 0、下标在界内、避开受限桥' }
)

# ---------- 生成 ----------
$famNames = @{ 1 = "词法 / Lexer"; 2 = "语法 / Parser"; 3 = "语义 / Semantic"; 4 = "运行时 / Runtime"; 5 = "CLI 与配置 / CLI & Config"; 6 = "后端与 IR / Backend & IR"; 7 = "REPL"; 9 = "内部错误 / Internal" }
foreach ($fam in 1..9) {
    if (-not $famNames.ContainsKey($fam)) { continue }
    $entries = $json | Where-Object { $_.family -eq $fam } | Sort-Object code
    if ($entries.Count -eq 0) {
        $body = "# tie 诊断标号（家族 $($famNames[$fam])） / tie diagnostic codes — $($famNames[$fam])`n`n_（暂无条目）_`n"
        [System.IO.File]::WriteAllText((Join-Path $Repo "docs\errors-e${fam}.md"), $body, [System.Text.UTF8Encoding]::new($false))
        continue
    }
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine("# tie 诊断标号（家族 $($famNames[$fam])） / tie diagnostic codes — $($famNames[$fam])")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($famIntro[$fam])
    [void]$sb.AppendLine("")
    foreach ($e in $entries) {
        $code = $e.code
        $cause = ""
        $fix = ""
        # nameMap 前缀匹配（最长优先）：名字带尾段（如 "，实际是"）也命中
        $bestKey = ""
        foreach ($nk in $nameMap.Keys) {
            if ($e.name.StartsWith($nk) -and $nk.Length -gt $bestKey.Length) {
                $bestKey = $nk
            }
        }
        if ($bestKey -ne "") {
            $cause = $nameMap[$bestKey][0]
            $fix = $nameMap[$bestKey][1]
        } else {
            foreach ($pm in $prefMap) {
                if ($e.name.StartsWith($pm.P)) {
                    $cause = $pm.C
                    $fix = $pm.F
                    break
                }
            }
        }
        if ($cause -eq "") {
            $cause = "见家族说明 / see family guidance；消息模板见下。"
            $fix = "按模板与「期望/实际」定位；仍未解时参考 [experience.md](experience.md)。"
        }
        [void]$sb.AppendLine("## $code  $($e.name)")
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine("- 消息模板 / template：``$($e.template)``")
        [void]$sb.AppendLine("- 出处 / source：``$($e.src)``")
        [void]$sb.AppendLine("- 成因（如何发生）/ cause：$cause")
        [void]$sb.AppendLine("- 常见解决方案 / common fix：$fix")
        [void]$sb.AppendLine("")
    }
    [System.IO.File]::WriteAllText((Join-Path $Repo "docs\errors-e${fam}.md"), $sb.ToString(), [System.Text.UTF8Encoding]::new($false))
    Write-Host "[gen-docs] E${fam}: $($entries.Count) 条"
}
Write-Host "[gen-docs] done"