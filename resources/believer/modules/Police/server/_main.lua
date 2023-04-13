GM.Police = GM.Police or {}

GM.Police.registeredZones = {}
GM.Police.registeredZones["lockers"] = {}
GM.Police.registeredZones["garages"] = {}
GM.Police.registeredZones["duty"] = {}
GM.Police.registeredZones["wardrobe"] = {}
GM.Police.registeredZones["armory"] = {}

GM.Police.registeredBlips = {}
GM.Police.registeredBlips["lockers"] = {}
GM.Police.registeredBlips["garages"] = {}
GM.Police.registeredBlips["duty"] = {}
GM.Police.registeredBlips["wardrobe"] = {}
GM.Police.registeredBlips["armory"] = {}

GM.Police.registeredPeds = {}
GM.Police.registeredPeds["garages"] = {}
GM.Police.registeredPeds["duty"] = {}
GM.Police.registeredPeds["wardrobe"] = {}

GM.Police.registeredCalls = {}

GM:newThread(function()
    while (GM.Police.Locker == nil) do
        Wait(100)
    end

    for i = 1, #GM.Police.Locker do
        local lockerId = "lockers_" .. i
        local locker = GM.Police.Locker[i]

        GM.Police.registeredZones["lockers"][lockerId] = GM.Zone.Management:create(GM.Police.Locker[i], 2.0, "pour accéder à votre casier", function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local selectedStash = exports["believer"]:GetInventory("police_locker_"..playerSelected.identifier.."_"..i)
            if (selectedStash == nil) then
                exports["believer"]:RegisterStash({
                    isPublic = false,
                    isPermanent = true,
                    ownerLicense = playerSelected.identifier,
                    inventoryName = "Casier "..playerSelected.getName(),
                    maxWeight = 200,
                    slotsAmount = 30,
                    uniqueID = "police_locker_"..playerSelected.identifier.."_"..i,
                })

                exports["believer"]:OpenStash(playerSelected.source, "police_locker_"..playerSelected.identifier.."_"..i)
            else
                exports["believer"]:OpenStash(playerSelected.source, "police_locker_"..playerSelected.identifier.."_"..i)
            end
            TriggerClientEvent("Inventory:openInventory", playerSelected.source)
        end, {
            private = true,
            marker = true
        })

        GM.Police.registeredBlips["lockers"][lockerId] = GM.Blip:add(locker, {
            sprite = 1,
            colour = 3,
            name = "Police - Casier - "..i,
            display = 5,
        }, {
            isPrivate = true
        })
    end
end)

GM:newThread(function()
    while (GM.Police.Garage == nil) do
        Wait(100)
    end
    
    for i = 1, #GM.Police.Garage do
        local garageId = "garages_" .. i
        local garage = GM.Police.Garage[i]

        GM.Police.registeredZones["garages"][garageId] = GM.Zone.Management:create(garage.position, 3.0, garage.helpNotification, function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local playerIsInVehicle = GetVehiclePedIsIn(GetPlayerPed(playerSrc), false)
            if (playerIsInVehicle == 0) then
                TriggerClientEvent("Police:openGarage", playerSelected.source, {
                    garageId = garageId,
                    garageVehicle = garage.vehicles.list,
                    garagePosition = garage.vehicles.position
                })
            else
                -- Todo check if vehicle is registered in databse and stored it and ownn it
                DeleteEntity(playerIsInVehicle)
            end
        end, {
            private = true,
            marker = true
        })

        GM.Police.registeredBlips["garages"][garageId] = GM.Blip:add(garage.position, {
            sprite = 1,
            colour = 3,
            name = "Police - Garage - "..i,
            display = 5,
        }, {
            isPrivate = true
        })

        GM.Police.registeredPeds["garages"][garageId] = GM.Ped:create(9, garage.ped["model"], {
            x = garage.ped["position"].x,
            y = garage.ped["position"].y,
            z = garage.ped["position"].z
        }, garage.ped["heading"])

        -- Todo check for freeze and set attributes
    end
end)

GM:newThread(function()
    while (GM.Police.Duty == nil) do
        Wait(100)
    end
    
    for i = 1, #GM.Police.Duty do
        local dutyId = "dutys_" .. i
        local duty = GM.Police.Duty[i]

        GM.Police.registeredZones["duty"][dutyId] = GM.Zone.Management:create(duty.position, 2.0, duty.helpNotification, function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            TriggerEvent("Service:interact", playerSelected.source)
        end, {
            private = true,
            marker = true
        })

        GM.Police.registeredBlips["duty"][dutyId] = GM.Blip:add(duty.position, {
            sprite = 1,
            colour = 3,
            name = "Police - Prise de service - "..i,
            display = 5,
        }, {
            isPrivate = true
        })

        GM.Police.registeredPeds["duty"][dutyId] = GM.Ped:create(9, duty.ped["model"], {
            x = duty.ped["position"].x,
            y = duty.ped["position"].y,
            z = duty.ped["position"].z
        }, duty.ped["heading"])

        -- Todo check for freeze and set attributes
    end
end)

GM:newThread(function()
    while (GM.Police.Wardrobe == nil) do
        Wait(100)
    end
    
    for i = 1, #GM.Police.Wardrobe do
        local wardrobeId = "wardrobes_" .. i
        local cloakroom = GM.Police.Wardrobe[i]

        GM.Police.registeredZones["wardrobe"][wardrobeId] = GM.Zone.Management:create(cloakroom.position, 2.0, cloakroom.helpNotification, function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            TriggerClientEvent("Police:openWardrobe", playerSelected.source, {
                outfits = cloakroom.outfits,
            })
        end, {
            private = true,
            marker = true
        })

        GM.Police.registeredBlips["wardrobe"][wardrobeId] = GM.Blip:add(cloakroom.position, {
            sprite = 1,
            colour = 3,
            name = "Police - Vestiaire - "..i,
            display = 5,
        }, {
            isPrivate = true
        })
    end
end)

GM:newThread(function()
    while (GM.Police.Armory == nil) do
        Wait(100)
    end
    
    for i = 1, #GM.Police.Armory do
        local armoryId = "armorys_" .. i
        local armory = GM.Police.Armory[i]

        GM.Police.registeredZones["armory"][armoryId] = GM.Zone.Management:create(armory.position, 3.0, armory.helpNotification, function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            TriggerClientEvent("Police:openArmory", playerSelected.source, {
                armoryId = i,
                items = armory.items,
            })
        end, {
            private = true,
            marker = true
        })

        GM.Police.registeredBlips["armory"][armoryId] = GM.Blip:add(armory.position, {
            sprite = 1,
            colour = 3,
            name = "Police - Armurerie - "..i,
            display = 5,
        }, {
            isPrivate = true
        })
    end
end)

AddEventHandler("esx:playerLoaded", function(playerSrc)
    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getJob().name == "police") then
        for i = 1, #GM.Police.Garage do
            local garageId = "garages_" .. i
    
            GM.Police.registeredZones["garages"][garageId]:allowedPlayer(playerSelected.source)
    
            GM.Police.registeredBlips["garages"][garageId]:allowedPlayer(playerSelected.source)
        end

        for i = 1, #GM.Police.Locker do
            local lockerId = "lockers_" .. i
    
            GM.Police.registeredZones["lockers"][lockerId]:allowedPlayer(playerSelected.source)
    
            GM.Police.registeredBlips["lockers"][lockerId]:allowedPlayer(playerSelected.source)
        end

        for i = 1, #GM.Police.Duty do
            local dutyId = "dutys_" .. i
    
            GM.Police.registeredZones["duty"][dutyId]:allowedPlayer(playerSelected.source)
    
            GM.Police.registeredBlips["duty"][dutyId]:allowedPlayer(playerSelected.source)
        end

        for i = 1, #GM.Police.Wardrobe do
            local wardrobeId = "wardrobes_" .. i
    
            GM.Police.registeredZones["wardrobe"][wardrobeId]:allowedPlayer(playerSelected.source)
    
            GM.Police.registeredBlips["wardrobe"][wardrobeId]:allowedPlayer(playerSelected.source)
        end

        for i = 1, #GM.Police.Armory do
            local armoryId = "armorys_" .. i
    
            GM.Police.registeredZones["armory"][armoryId]:allowedPlayer(playerSelected.source)
    
            GM.Police.registeredBlips["armory"][armoryId]:allowedPlayer(playerSelected.source)
        end
    end
end)

RegisterServerEvent("Police:spawnVehicle", function(vehicleName, garagePosition)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getJob().name ~= "police") then
        playerSelected.showNotification("~r~Vous n'êtes pas policier.")
        return
    end

    local upgrades = {
        modEngine = 4,
        modBrakes = 4,
        modTransmission = 4,
        modSuspension = 4,
        modArmor = false,
    }

    local playerPed = playerSelected.getPed()
    if (not playerPed) then return end

    local playerPosition = playerSelected.getCoords(true)
    if (not playerPosition) then return end

    ESX.OneSync.SpawnVehicle(vehicleName, garagePosition, garagePosition.w, false, false, function(networkId)
        if networkId then
            local vehicle = NetworkGetEntityFromNetworkId(networkId)
            for i = 1, 20 do
                Wait(0)
                SetPedIntoVehicle(playerPed, vehicle, -1)
        
                if GetVehiclePedIsIn(playerPed, false) == vehicle then
                    break
                end
            end
            if GetVehiclePedIsIn(playerPed, false) ~= vehicle then
                playerSelected.showNotification("~r~Impossible de rentrer dans le véhicule !")
            end
        end
    end)
end)

RegisterServerEvent("Police:armory:giveBackItems", function()
    -- Todo remove every equipement from police player
end)

RegisterServerEvent("Police:armory:giveBackMunitions", function()
    -- Todo remove every equipement from police player
end)

RegisterServerEvent("Police:armory:takeItem", function(armoryId, itemName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getJob().name ~= "police") then
        playerSelected.showNotification("~r~Vous n'êtes pas policier.")
        return
    end

    -- Todo check position of player

    if (not GM.Police.Armory[armoryId]) then
        playerSelected.showNotification("~r~L'armurerie n'existe pas.")
        return
    end

    for i = 1, #GM.Police.Armory[armoryId].items do
        local item = GM.Police.Armory[armoryId].items[i]
        if (item.name == itemName) then
            if (item.price) then
                if (playerSelected.getMoney() >= item.price) then
                    playerSelected.removeMoney(item.price)
                else
                    playerSelected.showNotification("~r~Vous n'avez pas assez d'argent.")
                    return
                end
            end
            if (playerSelected.canCarryItem(item.name, 1)) then
                playerSelected.addInventoryItem(item.name, 1)
                playerSelected.showNotification("~g~Vous avez pris un(e) ~b~"..item.label.."~g~.")
            else
                playerSelected.showNotification("~r~Vous ne pouvez pas prendre cet item.")
            end
        end
    end
end)

RegisterServerEvent("Police:menu:backup", function(backupName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getJob().name ~= "police") then
        playerSelected.showNotification("~r~Vous n'êtes pas policier.")
        return
    end

    for i = 1, #GM.Police.Menu.backup do
        local backup = GM.Police.Menu.backup[i]
        if (backup.name == backupName) then

            if (playerSelected.job.grade >= backup.grade) then
                local callId = (#GM.Police.registeredCalls + 1)
                if (not callId) then return end

                GM.Police.registeredCalls[tonumber(callId)] = {
                    id = callId,
                    name = backup.name,
                    label = backup.label,
                    message = backup.message,
                    position = playerSelected.getCoords(true),
                    time = os.time(),
                    playerName = playerSelected.getName(),
                }

                if (GM.Service["Enterprise_list"]) then
                    if (GM.Service["Enterprise_list"]["police"] == nil) then
                        GM.Service["Enterprise_list"]["police"] = {}
                    end
                    for playerSrc, _ in pairs(GM.Service["Enterprise_list"]["police"]) do
                        local request = GM.Request:sendMessage(playerSrc, backup.message)
                        if (request == "accept") then
                            TriggerClientEvent("esx:showNotification", playerSrc, "~g~Vous avez accepté l'appel.")
                        elseif (request == "decline") then
                            TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous avez refusé l'appel.")
                        elseif (request == "delay") then
                            TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous avez automatiquement refusé l'appel.")
                        end
                    end
                end
            else
                playerSelected.showNotification("~r~Vous n'avez pas le grade requis.")
                return
            end
        end
    end
end)