local playerCooldown = {}

lib.callback.register('parkingrobbery:success', function(source, cooldownType)
    local amount = math.random(Config.Payout.minCash, Config.Payout.maxCash)
   
    GiveParkingReward(source, amount)
    
    local shouldBreak = math.random(1,100) <= Config.BreakChance
    if shouldBreak then
        RemoveLockpick(source)
        return shouldBreak
    end

    if not playerCooldown[source] then
        playerCooldown[source] = {}
    end
    playerCooldown[source][cooldownType] = GetGameTimer() + Config.CooldownTime
    return false
end)

lib.callback.register('parkingrobbery:checkCooldown', function(source, cooldownType)
    if playerCooldown[source] and playerCooldown[source][cooldownType] then
        return GetGameTimer() < playerCooldown[source][cooldownType]
    end
    return false
end)

-- TODO: Add support for Policecheck
-- lib.callback.register('police', function(source)
--     local police = QBCore.Functions.GetPlayersOnDuty('police')
--     if police >= Config.PoliceCount then
--         return true
--     else 
--         return false
--     end
-- end)