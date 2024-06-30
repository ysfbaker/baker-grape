local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    local function createBlip(coords, settings)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, settings.Sprite)
        SetBlipDisplay(blip, settings.Display)
        SetBlipScale(blip, settings.Scale)
        SetBlipColour(blip, settings.Colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(settings.Name)
        EndTextCommandSetBlipName(blip)
    end
    
    if Config.Blips.CollectionBlip.Enable then
        createBlip(Config.Locations.grapeField, Config.Blips.CollectionBlip)
    end
    
    if Config.Blips.ProcessingBlip.Enable then
        createBlip(Config.Locations.processingSpot, Config.Blips.ProcessingBlip)
    end
    
    if Config.Blips.SellingBlip.Enable then
        createBlip(Config.Locations.sellingSpot, Config.Blips.SellingBlip)
    end
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        
        if Vdist(coords, Config.Locations.grapeField.x, Config.Locations.grapeField.y, Config.Locations.grapeField.z) < 10.0 then
            DrawMarker(1, Config.Locations.grapeField.x, Config.Locations.grapeField.y, Config.Locations.grapeField.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 0, 200, 0, 0, 0, 0)
            
            if Vdist(coords, Config.Locations.grapeField.x, Config.Locations.grapeField.y, Config.Locations.grapeField.z) < 1.5 then
                QBCore.Functions.DrawText3D(Config.Locations.grapeField.x, Config.Locations.grapeField.y, Config.Locations.grapeField.z, Config.Texts.GrapePick)
                if IsControlJustReleased(0, 38) then
                    QBCore.Functions.Progressbar('meslek_processing', Config.Texts.GrapePickProg, (5000), false, true, {
                        disableMovement = true,
                        canCancel = false,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        }, {
                        animDict = 'mini@repair',
                        anim = 'fixing_a_player',
                        flags = 16,
                        }, {}, {}, function()
                            TriggerServerEvent('baker-grape:harvestGrapes')
                            QBCore.Functions.Notify(Config.Notifications.HarvestSuccess, "success")
                        end, function()
                    end)
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        
        if Vdist(coords, Config.Locations.processingSpot.x, Config.Locations.processingSpot.y, Config.Locations.processingSpot.z) < 10.0 then
            DrawMarker(1, Config.Locations.processingSpot.x, Config.Locations.processingSpot.y, Config.Locations.processingSpot.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 255, 255, 0, 200, 0, 0, 0, 0)
            
            if Vdist(coords, Config.Locations.processingSpot.x, Config.Locations.processingSpot.y, Config.Locations.processingSpot.z) < 1.5 then
                QBCore.Functions.DrawText3D(Config.Locations.processingSpot.x, Config.Locations.processingSpot.y, Config.Locations.processingSpot.z, Config.Texts.GrapeGrind)
                
                if IsControlJustReleased(0, 38) then
                    QBCore.Functions.Progressbar('meslek_processing2', Config.Texts.GrapeGrindProg, (5000), false, true, {
                        disableMovement = true,
                        canCancel = false,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        }, {
                        animDict = 'mini@repair',
                        anim = 'fixing_a_player',
                        flags = 16,
                        }, {}, {}, function()
                            TriggerServerEvent('baker-grape:processGrapes')
                        end, function()
                    end)
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        
        if Vdist(coords, Config.Locations.sellingSpot.x, Config.Locations.sellingSpot.y, Config.Locations.sellingSpot.z) < 10.0 then
            DrawMarker(1, Config.Locations.sellingSpot.x, Config.Locations.sellingSpot.y, Config.Locations.sellingSpot.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 255, 0, 0, 200, 0, 0, 0, 0)
            
            if Vdist(coords, Config.Locations.sellingSpot.x, Config.Locations.sellingSpot.y, Config.Locations.sellingSpot.z) < 1.5 then
                QBCore.Functions.DrawText3D(Config.Locations.sellingSpot.x, Config.Locations.sellingSpot.y, Config.Locations.sellingSpot.z, Config.Texts.GrapeSell)
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('baker-grape:sellWine')
                end
            end
        end
    end
end)