GM.Garage = GM.Garage or {}

GM.Garage["vehicle_out"] = GM.Garage["vehicle_out"] or {}

GM:newThread(function()
    MySQL.query("SELECT * FROM user_garage", {}, function(results)
        if (results[1]) then
            for _, garage in pairs(results) do
                GM.Garage:new(garage.id, garage.type, garage.name, garage.label, json.decode(garage.menuPosition), json.decode(garage.spawnPosition), garage.spawnHeading, json.decode(garage.deletePosition))
            end
        end
    end)

    -- Set the stored to 1 to every vehicle in DATABASE

    MySQL.query("UPDATE owned_vehicles SET stored = 1", {}, function()
    end)
end)

RegisterServerEvent("Garage:requestGarage", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    TriggerClientEvent("Garage:managementUpdateValue", playerSrc, "garage", GM.Garage["list"])
end)

RegisterServerEvent("Garage:createGarage", function(garageData)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("CREATE_GARAGE", playerSelected.source)) then return end

    MySQL.insert('INSERT INTO user_garage (type, name, label, menuPosition, spawnPosition, spawnHeading, deletePosition) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        garageData["type"],
        garageData["name"],
        garageData["label"],
        json.encode(garageData["menuPosition"]),
        json.encode(garageData["spawnPosition"]),
        garageData["spawnHeading"],
        json.encode(garageData["deletePosition"]),
    }, function(garageId)
        local newGarage = GM.Garage:new(garageId, garageData["type"], garageData["name"], garageData["label"], garageData["menuPosition"], garageData["spawnPosition"], garageData["spawnHeading"], garageData["deletePosition"])
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Garage:managementUpdateValue", adminSrc, "garage", garageId, newGarage)
        end
        playerSelected.showNotification("~g~Nouveau garage créé !")
        -- Todo refresh all players
    end)
end)

RegisterServerEvent("Garage:deleteGarage", function(garageId, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("DELETE_GARAGE", playerSelected.source)) then return end

    if (input ~= "OUI") then return end

    MySQL.Async.execute("DELETE FROM user_garage WHERE id = ?", {
        garageId
    }, function()
        GM.Garage["list"][garageId] = nil
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Garage:managementRemoveValue", adminSrc, "garage", garageId)
        end
        -- Todo remove zone for all players
    end)
end)

RegisterServerEvent("Garage:renameVehicle", function(garageType, vehicleId, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Garage["vehicle_list"][playerSrc] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule dans ce garage.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId] == nil) then
        playerSelected.showNotification("~r~Ce véhicule n'existe pas.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["owner"] ~= playerIdentifier) then
        playerSelected.showNotification("~r~Ce véhicule ne vous appartient pas.")
        return
    end

    MySQL.update('UPDATE owned_vehicles SET label = ? WHERE plate = ?', {input, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["plate"]}, function()
        GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId].label = input
        playerSelected.showNotification("~g~Vous avez changer le nom du véhicule !")

        TriggerClientEvent("Garage:UpdateValue", playerSrc, "vehicles", vehicleId, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId])
    end)
end)

RegisterServerEvent("Garage:exitVehicle", function(garageType, vehicleId, networkId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    local playerVehicle = NetworkGetEntityFromNetworkId(networkId)
    if (not DoesEntityExist(playerVehicle)) then
        playerSelected.showNotification("~r~Ce véhicule n'existe pas sur le serveur\nCode d'erreur : 504.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule dans ce garage.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId] == nil) then
        playerSelected.showNotification("~r~Ce véhicule n'existe pas dans vos données.\nSuppression du véhicule et contact auprès de la modération.")
        if (DoesEntityExist(playerVehicle)) then
            DeleteEntity(playerVehicle)
            playerSelected.showNotification("~r~Véhicule supprimé.")
        end
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["owner"] ~= playerIdentifier) then
        playerSelected.showNotification("~r~Ce véhicule ne vous appartient pas.")
        return
    end
    

    if (DoesEntityExist(playerVehicle)) then
        MySQL.update('UPDATE owned_vehicles SET stored = ? WHERE plate = ?', {0, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["plate"]}, function(affectedRows)
            playerSelected.showNotification("~b~Vous avez sorti votre véhicule !\nNetworkdId : "..playerVehicle..".")

            GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId].stored = 0

            if (GM.Garage["vehicle_out"][playerVehicle] == nil) then
                GM.Garage["vehicle_out"][playerVehicle] = GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]
                GM.Garage["vehicle_out"][playerVehicle].playerSrc = playerSrc
                GM.Garage["vehicle_out"][playerVehicle].garageType = garageType
                GM.Garage["vehicle_out"][playerVehicle].vehicleId = vehicleId
            end

            TriggerClientEvent("Garage:UpdateValue", playerSrc, "vehicles", vehicleId, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId])
        end)
    end
end)

RegisterServerEvent("Garage:attribuateJob", function(garageType, vehicleId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Garage["vehicle_list"][playerSrc] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule dans ce garage.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId] == nil) then
        playerSelected.showNotification("~r~Ce véhicule n'existe pas.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["owner"] ~= playerIdentifier) then
        playerSelected.showNotification("~r~Ce véhicule ne vous appartient pas.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["job"] ~= nil) then
        playerSelected.showNotification("~r~Ce véhicule est déjà attribué à un métier.")
        return
    end

    MySQL.update('UPDATE owned_vehicles SET job = ? WHERE plate = ?', {playerSelected.job.name, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["plate"]}, function(affectedRows)
        playerSelected.showNotification("~g~Vous avez attribué ce véhicule à votre métier !")
        GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId].type = "Job"
        GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId].job = playerSelected.job.name

        TriggerClientEvent("Garage:UpdateValue", playerSrc, "vehicles", vehicleId, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId])
    end)
end)

RegisterServerEvent("Garage:removeJob", function(garageType, vehicleId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Garage["vehicle_list"][playerSrc] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule dans ce garage.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId] == nil) then
        playerSelected.showNotification("~r~Ce véhicule n'existe pas.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["owner"] ~= playerIdentifier) then
        playerSelected.showNotification("~r~Ce véhicule ne vous appartient pas.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["job"] == nil) then
        playerSelected.showNotification("~r~Ce véhicule n'est pas attribué à un métier.")
        return
    end

    MySQL.update('UPDATE owned_vehicles SET job = ? WHERE plate = ?', {nil, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId]["plate"]}, function(affectedRows)
        playerSelected.showNotification("~r~Vous avez retiré l'attribution de ce véhicule à votre métier !")

        GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId].type = nil
        GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId].job = nil

        TriggerClientEvent("Garage:UpdateValue", playerSrc, "vehicles", vehicleId, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId])
    end)
end)

RegisterServerEvent("Garage:storeVehicle", function(garageType, vehicleProps, networkId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    local playerVehicle = NetworkGetEntityFromNetworkId(networkId)
    if (not DoesEntityExist(playerVehicle)) then
        playerSelected.showNotification("~r~Ce véhicule n'existe pas sur le serveur\nCode d'erreur : 503.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas de véhicule dans ce garage.")
        return
    end

    if (GM.Garage["vehicle_out"][playerVehicle] == nil) then
        playerSelected.showNotification("~r~Ce véhicule n'est pas sorti.")
        return
    end

    if (GM.Garage["vehicle_out"][playerVehicle]["owner"] ~= playerIdentifier) then -- Todo check if player is in the vehicle job or orga
        playerSelected.showNotification("~r~Ce véhicule ne vous appartient pas.")
        return
    end

    if (GM.Garage["vehicle_out"][playerVehicle]["garageType"] ~= garageType) then
        playerSelected.showNotification("~r~Ce véhicule n'est pas dans ce garage.")
        return
    end

    if (GM.Garage["vehicle_list"][playerSrc][garageType][GM.Garage["vehicle_out"][playerVehicle]["vehicleId"]] == nil) then
        playerSelected.showNotification("~r~Ce véhicule n'existe pas.")
        return
    end

    GM.Garage["vehicle_list"][playerSrc][garageType][GM.Garage["vehicle_out"][playerVehicle]["vehicleId"]].stored = 1

    MySQL.update('UPDATE owned_vehicles SET vehicle = @vehicle, stored = @stored WHERE plate = @plate', {
        ["@stored"] = 1,
        ["@vehicle"] = json.encode(vehicleProps),
        ["@plate"] = GM.Garage["vehicle_out"][playerVehicle]["plate"]
    }, function(success)
        if (success) then
            playerSelected.showNotification("~g~Vous avez rangé votre véhicule.")
            DeleteEntity(playerVehicle)
            GM.Garage["vehicle_out"][playerVehicle] = nil
            TriggerClientEvent("Garage:UpdateValue", playerSrc, "vehicles", vehicleId, GM.Garage["vehicle_list"][playerSrc][garageType][vehicleId])
        end
    end)
end)