getgenv().Predict = function(TargetPosition, Velocity, ProjectileSpeed, ProjectileDrop, Continuous)
    local PSpeed, PDrop = ProjectileSpeed or GetProjectileInfo()
    if not PSpeed or not PDrop then return Vector3.zero, nil end
    local function PredictOnce()
        local Dist = (TargetPosition - Camera.CFrame.Position).Magnitude
        if Dist <= 0 then return Vector3.zero, nil end
        local TimeToHit = Dist / PSpeed
        local PredictedPosition = TargetPosition + ((Velocity or Vector3.zero) / 0.15) * TimeToHit
        PredictedPosition += Vector3.new(0, PDrop ^ (TimeToHit * PDrop) - 1, 0)
        return PredictedPosition, TimeToHit
    end
    return Continuous and RunService.Stepped:Wait() and PredictOnce() or PredictOnce()
end
