if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function GiveParkingReward(source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then
        warn("Could not get player data")
    return false
    end

    local gaveReward = Player.Functions.AddMoney('cash', amount)
    if not gaveReward then
        warn("QBCore could not give the reward to the player.")
        return false
    end

    return true
end