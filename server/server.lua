local config <const> = require('config.config')

local playerCooldown = {}

lib.callback.register('police', function(source)
    local police = exports.jobs:getPoliceCount()
    if police >= config.policeCount then
        return true
    else 
        return false
    end
end)

lib.callback.register('success', function(source, cooldownType)
    local amount = math.random(config.payout.minCash, config.payout.maxCash)
    exports.ox_inventory:AddItem(source, 'cash', amount)
    local shouldBreak = math.random(1,100) <= config.breakChance
    if shouldBreak then
        exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
        return shouldBreak
    end
    if not playerCooldown[source] then
        playerCooldown[source] = {}
    end
    playerCooldown[source][cooldownType] = GetGameTimer() + config.cooldownTime
    return false
end)

lib.callback.register('parkingobbery:checkCooldown', function(source, cooldownType)
    if playerCooldown[source] and playerCooldown[source][cooldownType] then
        return GetGameTimer() < playerCooldown[source][cooldownType]
    end
    return false
end)