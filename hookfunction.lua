
-- Hook for `Character.IsGrounded`. Always use `newcclosure` to avoid detection.

local old; old = hookfunction(getrenv()._G.classes.Character.IsGrounded, newcclosure(function(...)
    local args = {...}
    table.foreach(args, print)  -- Print all arguments for debugging

    local mt = getmetatable(args)
    if mt and mt.__index then
        for key, value in pairs(mt.__index) do
            print("From mt.__index", key, value)
        end
    end
    return old(...)
end))
