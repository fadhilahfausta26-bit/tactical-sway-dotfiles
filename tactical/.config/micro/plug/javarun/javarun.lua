local micro = import("micro")
local shell = import("micro/shell")

function runJava(bp)
    bp:Save()
    local path = bp.Buf.Path
    shell.RunInteractiveShell("run-code \"" .. path .. "\"", true, false)
end
