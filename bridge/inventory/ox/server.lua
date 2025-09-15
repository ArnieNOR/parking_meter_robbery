function GiveParkingReward(source, amount)
    exports.ox_inventory:AddItem(source, 'cash', amount)
end

function RemoveItem(source)
    local lockpick = exports.ox_inventory:GetItemCount(source, 'lockpick')

        if lockpick >= 1 then 
            exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
            return
        else
        exports.ox_inventory:RemoveItem(source, 'advancedlockpick', 1)
    end
end