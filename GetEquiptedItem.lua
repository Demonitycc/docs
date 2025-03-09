local charlist = getupvalue(modules.Character.getGroundCastResult, 2)
local function GetProjectileInfo()
    local equippedItem = charlist.GetEquippedItem()
    if not equippedItem then return 0, 0 end
    return equippedItem.ProjectileSpeed or 0, equippedItem.ProjectileDrop or 0
end
