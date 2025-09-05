function GiveParkingReward(source, amount)
    exports.ox_inventory:AddItem(source, 'cash', amount)
end

function RemoveLockpick(source)
    exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
end