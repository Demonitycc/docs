-- Optimized player table fetching in workspace.

local workspace = workspace
local getChildren = game.GetChildren

local function isPlayer(model)
    return model.PrimaryPart and model.PrimaryPart.Name == "HumanoidRootPart"
end

local function getPlayerList()
    local list = {}
    local vtable = getChildren(workspace)
    for i = 1, #vtable do
        local v = vtable[i]
        if v.ClassName == "Model" and isPlayer(v) then
            list[#list+1] = v
        end
    end
    return list
end
