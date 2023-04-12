GM.Police = GM.Police or {}

GM.Police.registeredZones = {}
GM.Police.registeredZones["lockers"] = {}
GM.Police.registeredZones["garages"] = {}

GM.Police.registeredBlips = {}
GM.Police.registeredBlips["lockers"] = {}
GM.Police.registeredBlips["garages"] = {}

GM.Police.registeredPeds = {}
GM.Police.registeredPeds["garages"] = {}

GM:newThread(function()
    while (GM.Police.Lockers == nil) do
        Wait(100)
    end

    for i = 1, #GM.Police.Lockers do
        local lockerId = "lockers_" .. i
        local locker = GM.Police.Lockers[i]

        GM.Police.registeredZones["lockers"][lockerId] = GM.Zone.Management:create(GM.Police.Lockers[i], 2.0, "pour accéder à votre casier", function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local selectedStash = exports["believer"]:GetInventory("police_locker_"..playerSelected.identifier.."_"..i)
            if (selectedStash == nil) then
                exports["believer"]:RegisterStash({
                    isPublic = false,
                    isPermanent = true,
                    ownerLicense = playerSelected.identifier,
                    inventoryName = "Casier police "..playerSelected.getName(),
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

AddEventHandler("esx:playerLoaded", function(playerSrc)
    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getJob().name == "police") then
        for i = 1, #GM.Police.Garage do
            local garageId = "garages_" .. i
    
            GM.Police.registeredZones["garages"][garageId]:allowedPlayer(playerSelected.source)
    
            GM.Police.registeredBlips["garages"][garageId]:allowedPlayer(playerSelected.source)
        end

        for i = 1, #GM.Police.Lockers do
            local lockerId = "lockers_" .. i
    
            GM.Police.registeredZones["lockers"][lockerId]:allowedPlayer(playerSelected.source)
    
            GM.Police.registeredBlips["lockers"][lockerId]:allowedPlayer(playerSelected.source)
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