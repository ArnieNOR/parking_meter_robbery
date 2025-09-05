if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function RemoveLockpick(source)
    exports['qb-inventory']:RemoveItem(source, 'lockpick', 1, false)
end