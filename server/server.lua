local config <const> = require('config.config')

local playerCooldown = {}

lib.callback.register('police', function(source)
    local police = exports.jobs:getPoliceCount()
    if police >= Config.PoliceCount then
        return true
    else 
        return false
    end
end)

lib.callback.register('success', function(source, cooldownType)
    local amount = math.random(Config.Payout.minCash, Config.Payout.maxCash)
    exports.ox_inventory:AddItem(source, 'cash', amount)
    local shouldBreak = math.random(1,100) <= Config.BreakChance
    if shouldBreak then
        exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
        return shouldBreak
    end
    if not playerCooldown[source] then
        playerCooldown[source] = {}
    end
    playerCooldown[source][cooldownType] = GetGameTimer() + Config.CooldownTime
    return false
end)

lib.callback.register('parkingobbery:checkCooldown', function(source, cooldownType)
    if playerCooldown[source] and playerCooldown[source][cooldownType] then
        return GetGameTimer() < playerCooldown[source][cooldownType]
    end
    return false
end)