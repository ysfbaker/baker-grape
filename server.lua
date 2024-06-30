local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('baker-grape:harvestGrapes')
AddEventHandler('baker-grape:harvestGrapes', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(Config.GrapeItem, 10)
end)

RegisterNetEvent('baker-grape:processGrapes')
AddEventHandler('baker-grape:processGrapes', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(Config.GrapeItem, 10) then
        Player.Functions.AddItem(Config.WineItem, 1)
        TriggerClientEvent('QBCore:Notify', src, Config.Notifications.ProcessSuccess, "success")
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Notifications.HarvestFail, "error")
    end
end)

RegisterNetEvent('baker-grape:sellWine')
AddEventHandler('baker-grape:sellWine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job then
        if Player.Functions.RemoveItem(Config.WineItem, 1) then
            Player.Functions.AddItem(Config.BlackMoneyItem, Config.SellPrice)
            TriggerClientEvent('QBCore:Notify', src, Config.Notifications.SellSuccess1.. Config.SellPrice.. Config.Notifications.SellSuccess2, "success")
        else
            TriggerClientEvent('QBCore:Notify', src, Config.Notifications.SellFailNoWine, "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Notifications.SellFailJob, "error")
    end
end)