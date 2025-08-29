local config <const> = require('config.config')

local cooldownType = 'parkingmeter'

lib.locale()

local function police()
    local policeCheck = lib.callback.await('police', false)
    if not policeCheck then
        return false
    end
    return true
end

-- On Interaction --
local function onInteract()
    if not police() then
        lib.notify({
            title = locale('not_enough_police_title'),
            description = locale('not_enough_police_desc'),
            type = 'error'
        })
        return
    end
    local isOnCooldown = lib.callback.await('parkingobbery:checkCooldown', false, cooldownType)
    if isOnCooldown then
        lib.notify({
            title = locale('on_cooldown_title'),
            description = locale('on_cooldown_desc'),
            type = 'error'
        })
        return
    end
    local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
    if not success then
        lib.notify({
            title = locale('failed_title'),
            description = locale('failed_desc'),
            type = 'error'
        })
        return
    end
    if lib.progressBar({
        duration = config.progressBar.duration,
        label = locale(config.progressBar.label),
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            sprint = true
        },
        anim = config.emote
    }) then 
        local broke = lib.callback.await('success', false, cooldownType)
        if broke then
            lib.notify({
                title = locale('lockpick_broke_title'),
                description = locale('lockpick_broke_desc'),
                type = 'error' 
            })
        end
    end
end

-- Interaction --
exports.ox_target:addModel(config.meterModels, {
    {
        icon = config.target.icon,
        label = locale(config.target.label),
        distance = config.targetDistance,
        items = config.requiredItems,
        anyItem = true,
        onSelect = onInteract,
        serverEvent = 'breakLockpick'
    }
})