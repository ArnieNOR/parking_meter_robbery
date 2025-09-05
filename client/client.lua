local cooldownType = 'parkingmeter'

lib.locale()
-- TODO: Add support for Policecheck
-- local function police()
--     local policeCheck = lib.callback.await('police', false)
--     if not policeCheck then
--         return false
--     end
--     return true
-- end

-- On Interaction --
local function onInteract()
    -- TODO: Add support for Policecheck
    -- if not police() then
    --     lib.notify({
    --         title = locale('not_enough_police_title'),
    --         description = locale('not_enough_police_desc'),
    --         type = 'error'
    --     })
    --     return
    -- end

    local isOnCooldown = lib.callback.await('parkingrobbery:checkCooldown', false, cooldownType)
    if isOnCooldown then
        lib.notify({
            title = locale('on_cooldown_title'),
            description = locale('on_cooldown_desc'),
            type = 'error'
        })
        return
    end
    if lib.progressActive() then
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
        duration = Config.ProgressBar.duration,
        label = locale(Config.ProgressBar.label),
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            sprint = true
        },
        anim = Config.Emote
    }) then
        local broke = lib.callback.await('parkingrobbery:success', false, cooldownType)
        if broke then
            lib.notify({
                title = locale('lockpick_broke_title'),
                description = locale('lockpick_broke_desc'),
                type = 'error' 
            })
        end
    end
end


exports('onInteract', onInteract)