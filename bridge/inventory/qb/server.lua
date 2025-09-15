if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function RemoveLockpick(source)
    local lockpick = exports['qb-inventory']:GetItemCount(source, 'lockpick')

        if lockpick >= 1 then 
            exports['qb-inventory']:RemoveItem(source, 'lockpick', 1, false)
            return
        else
        exports['qb-inventory']:RemoveItem(source, 'advancedlockpick', 1, false)
    end
end