-- Hook for `__namecall` on `game`. Use `newcclosure` to stay undetected.

local old_Hook; old_Hook = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local stack = debug.getstack(1, 1)
    if typeof(stack) == "table" then
        table.foreach(stack, print)
    else
        warn(stack)
    end
    return old_Hook(...)
end))
