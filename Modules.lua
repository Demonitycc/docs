local modules = { ["PlayerClient"] = {}, ["Character"] = {}, }
for _, v in pairs(getgc(true)) do
    if typeof(v) == "function" and islclosure(v) then
        local info = debug.getinfo(v)
        local name = string.match(info.short_src, "%.([%w_]+)$")

        if name and modules[name] and info.name ~= nil then
            modules[name][info.name] = info.func
        end
    end
end
