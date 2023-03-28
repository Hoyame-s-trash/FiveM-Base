GM.Drug = GM.Drug or {}

GM:newThread(function()
    MySQL.query("SELECT * FROM user_drugs", {}, function(results)
        if (results[1]) then
            for _, drug in pairs(results) do
                GM.Drug:new(drug.id, drug.type, drug.name, drug.label, json.decode(drug.position), json.decode(drug.data))
            end
        end
    end)
end)

RegisterServerEvent("Admin:requestDrugs", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    TriggerClientEvent("Admin:updateValue", playerSrc, "drugs", GM.Drug["list"])
end)

RegisterServerEvent("Admin:createDrugs", function(type, drugData)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("CREATE_DRUGS", playerSelected.source)) then return end

    if (type == nil or type == "" or type ~= "harvest" and type ~= "treatment") then return playerSelected.showNotification("~r~Merci d'entrer un type valide.") end

    local drugPosition = playerSelected.getCoords(true)

    if (type == "harvest") then
        drugData = {
            name = drugData["name"],
            label = drugData["label"],
            quantityGive = drugData["quantityGive"],
            itemGive = drugData["itemGive"]
        }
    elseif (type == "treatment") then
        drugData = {
            name = drugData["name"],
            label = drugData["label"],
            quantityGive = drugData["quantityGive"],
            itemGive = drugData["itemGive"],
            quantityTake = drugData["quantityTake"],
            itemTake = drugData["itemTake"]
        }
    end
    MySQL.insert('INSERT INTO user_drugs (type, name, label, position, data) VALUES (?, ?, ?, ?, ?)', {
        type,
        drugData["name"],
        drugData["label"],
        json.encode(drugPosition),
        json.encode(drugData),
    }, function(drugId)
        local newDrug = GM.Drug:new(drugId, type, drugData["name"], drugData["label"], drugPosition, drugData)
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "drugs", drugId, newDrug)
        end
        -- Todo refresh for all players that got a job2
    end)
end)

RegisterServerEvent("Admin:deleteDrugs", function(drugId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("DELETE_DRUGS", playerSelected.source)) then return end

    local selectedDrug = GM.Drug:getFromId(drugId)
    if (not selectedDrug) then return end

    MySQL.Async.execute("DELETE FROM user_drugs WHERE id = ?", {
        drugId
    }, function()
        GM.Drug["list"][drugId] = nil
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:removeValue", adminSrc, "drugs", drugId)
        end
    end)
end)

RegisterServerEvent("Admin:drugsModifyPosition", function(drugId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("MODIFY_DRUGS", playerSelected.source)) then return end

    local selectedDrug = GM.Drug:getFromId(drugId)
    if (not selectedDrug) then return end

    selectedDrug.position = playerSelected.getCoords(true)

    MySQL.Async.execute("UPDATE user_drugs SET position = ? WHERE id = ?", {
        json.encode(selectedDrug.position),
        drugId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "drugs", drugId, selectedDrug)
        end
        local drugZone = selectedDrug:getZone(selectedDrug.name)
        if (drugZone) then
            local currentZone = GM.Zone:get(drugZone.uniqueId)
            currentZone:setData("position", selectedDrug.position)
        end
    end)
end)

RegisterServerEvent("Admin:drugsModifyQuantityGive", function(drugId, quantity)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("MODIFY_DRUGS", playerSelected.source)) then return end

    local selectedDrug = GM.Drug:getFromId(drugId)
    if (not selectedDrug) then return end

    selectedDrug.data["quantityGive"] = quantity

    MySQL.Async.execute("UPDATE user_drugs SET data = ? WHERE id = ?", {
        json.encode(selectedDrug.data),
        drugId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "drugs", drugId, selectedDrug)
        end
    end)
end)

RegisterServerEvent("Admin:drugsModifyItemGive", function(drugId, item)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("MODIFY_DRUGS", playerSelected.source)) then return end

    if (not ESX.GetItemExist(item)) then return playerSelected.showNotification("~r~Cet item n'existe pas.") end

    local selectedDrug = GM.Drug:getFromId(drugId)
    if (not selectedDrug) then return end

    selectedDrug.data["itemGive"] = item

    MySQL.Async.execute("UPDATE user_drugs SET data = ? WHERE id = ?", {
        json.encode(selectedDrug.data),
        drugId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "drugs", drugId, selectedDrug)
        end
    end)
end)

RegisterServerEvent("Admin:drugsModifyQuantityTake", function(drugId, quantity)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("MODIFY_DRUGS", playerSelected.source)) then return end

    local selectedDrug = GM.Drug:getFromId(drugId)
    if (not selectedDrug) then return end

    if (selectedDrug.type == "harvest") then return end

    selectedDrug.data["quantityTake"] = quantity

    MySQL.Async.execute("UPDATE user_drugs SET data = ? WHERE id = ?", {
        json.encode(selectedDrug.data),
        drugId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "drugs", drugId, selectedDrug)
        end
    end)
end)

RegisterServerEvent("Admin:drugsModifyItemTake", function(drugId, item)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("MODIFY_DRUGS", playerSelected.source)) then return end

    if (not ESX.GetItemExist(item)) then return playerSelected.showNotification("~r~Cet item n'existe pas.") end

    local selectedDrug = GM.Drug:getFromId(drugId)
    if (not selectedDrug) then return end

    selectedDrug.data["itemTake"] = item

    MySQL.Async.execute("UPDATE user_drugs SET data = ? WHERE id = ?", {
        json.encode(selectedDrug.data),
        drugId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "drugs", drugId, selectedDrug)
        end
    end)
end)

AddEventHandler("esx:playerLoaded", function(playerSrc)
    local playerSrc = playerSrc
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    for drugId, _ in pairs(GM.Drug["list"]) do
        local selectedDrug = GM.Drug:getFromId(drugId)
        if (selectedDrug ~= nil) then
            local Zone = selectedDrug:getZone(selectedDrug.name)
            Zone:allowedPlayer(playerSrc)
        end
    end
end)