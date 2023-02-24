GM.Garage = GM.Garage or {}

GM:newThread(function()
    MySQL.query("SELECT * FROM user_garage", {}, function(results)
        if (results[1]) then
            for _, garage in pairs(results) do
                GM.Garage:new(garage.id, garage.name, garage.label, json.decode(garage.menuPosition), json.decode(garage.spawnPosition), garage.spawnHeading, json.decode(garage.deletePosition))
            end
        end
    end)
end)

RegisterServerEvent("Garage:requestGarage", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    TriggerClientEvent("Garage:updateValue", playerSrc, "garage", GM.Garage["list"])
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

    MySQL.insert('INSERT INTO user_garage (name, label, menuPosition, spawnPosition, spawnHeading, deletePosition) VALUES (?, ?, ?, ?, ?, ?)', {
        garageData["name"],
        garageData["label"],
        json.encode(garageData["menuPosition"]),
        json.encode(garageData["spawnPosition"]),
        garageData["spawnHeading"],
        json.encode(garageData["deletePosition"]),
    }, function(garageId)
        local newGarage = GM.Garage:new(garageId, garageData["name"], garageData["label"], garageData["menuPosition"], garageData["spawnPosition"], garageData["spawnHeading"], garageData["deletePosition"])
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Garage:updateValue", adminSrc, "garage", garageId, newGarage)
        end
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
            TriggerClientEvent("Garage:removeValue", adminSrc, "garage", garageId)
        end
        -- Todo remove zone for all players
    end)
end)