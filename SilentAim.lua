-- Silent aim hook using `unpack`.

local saim; saim = hookfunction(unpack, newcclosure(function(...)
    local stack = debug.getstack(2, 2)
    if typeof(stack[9]) == "CFrame" then
        local target = nil
        local playerList = getPlayerList()
        for _, player in pairs(playerList) do
            if player:FindFirstChild("Head") then
                target = player.Head
                break
            end
        end
        --
        if target then
            local predictedPos = target.Position
            local cameraPosition = Camera.CFrame.Position
            stack[9] = CFrame.lookAt(cameraPosition, predictedPos)
        end
    else
        return saim(...)
    end
    return saim(...)
end))
