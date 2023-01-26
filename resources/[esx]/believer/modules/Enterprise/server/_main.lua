GM.Enterprise = GM.Enterprise or {}

GM.Enterprise.Loaded = false

GM:newThread(function()
    MySQL.query("SELECT * FROM user_enterprise", {}, function(results)
        if (results[1]) then
            for _, enterpriseValues in pairs(results) do
                GM.Enterprise:new(enterpriseValues.id, enterpriseValues.type, enterpriseValues.name, enterpriseValues.label, json.decode(enterpriseValues.players), json.decode(enterpriseValues.ranks), json.decode(enterpriseValues.zones), enterpriseValues.money)
            end
            GM.Enterprise.Loaded = true
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

    if (GM.Enterprise["list_players"][playerIdentifier]) then

        playerSelected.set("enterprise_id", GM.Enterprise["list_players"][playerIdentifier].enterprise_id)
        playerSelected.set("enterprise", GM.Enterprise["list_players"][playerIdentifier].name)
    else
        playerSelected.set("enterprise", "unemployed")
    end
end)

RegisterServerEvent("Admin:createEnterprise", function(enterpriseType, enterpriseName, enterpriseLabel)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("CREATE_ENTERPRISE", playerSelected.source)) then return end

    -- Todo check if entreprise already exist

    if (enterpriseName == nil or enterpriseName == "") then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous devez entrer un nom d'entreprise valide.")
        return
    end

    if (enterpriseLabel == nil or enterpriseLabel == "") then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous devez entrer un label d'entreprise valide.")
        return
    end

    defaultRank = {
        [1] = {
            id = 1,
            name = "owner",
            label = "Patron",
            permissions = GM.Enterprise.permissions
        },
        [2] = {
            id = 2,
            name = "recruit",
            label = "Recrue",
            permissions = GM.Enterprise.permissions
        }
    }

    MySQL.insert('INSERT INTO user_enterprise (type, name, label, players, ranks, zones, money) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        enterpriseType,
        enterpriseName,
        enterpriseLabel,
        json.encode({}),
        json.encode(defaultRank),
        json.encode({}),
        0
    }, function(enterpriseId)
        local newEnterprise = GM.Enterprise:new(enterpriseId, enterpriseType, enterpriseName, enterpriseLabel, {}, defaultRank, {}, 0)

        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", enterpriseId, newEnterprise)
        end
    end)
end)

RegisterServerEvent("Admin:enterpriseCreateRank", function(enterpriseId, gradeName, gradeLabel)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("CREATE_ENTERPRISE_RANK", playerSelected.source)) then return end

    local enterpriseSelected = GM.Enterprise:getFromId(enterpriseId)
    if (not enterpriseSelected) then return end

    if (enterpriseSelected:getRankFromName(gradeName) == true) then return end

    local rankId = enterpriseSelected:generateRankId()
    if (not rankId) then return end

    enterpriseSelected.ranks[rankId] = {
        id = rankId,
        name = gradeName,
        label = gradeLabel,
        permissions = GM.Enterprise.permissions
    }

    MySQL.update('UPDATE user_enterprise SET ranks = ? WHERE id = ?', {
        json.encode(enterpriseSelected.ranks), 
        enterpriseId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", enterpriseId, enterpriseSelected)
        end
    end)
end)

RegisterServerEvent("Admin:enterpriseUpdatePermissions", function(enterpriseId, gradeId, permissionName, permissionValue)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("UPDATE_ENTERPRISE_PERMISSIONS", playerSelected.source)) then return end

    local enterpriseSelected = GM.Enterprise:getFromId(enterpriseId)
    if (not enterpriseSelected) then return end

    if (not enterpriseSelected.ranks[gradeId]) then return end

    enterpriseSelected.ranks[gradeId].permissions[permissionName].value = permissionValue

    MySQL.update('UPDATE user_enterprise SET ranks = ? WHERE id = ?', {
        json.encode(enterpriseSelected.ranks), 
        enterpriseId
    }, function()
        TriggerClientEvent("esx:showNotification", playerSrc, "~b~Vous avez mis à jour les permissions du grade "..permissionName..".")

        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", enterpriseId, enterpriseSelected)
        end
    end)
end)

RegisterServerEvent("Admin:enterpriseDeleteRank", function(enterpriseId, gradeId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("DELETE_ENTERPRISE_RANK", playerSelected.source)) then return end

    local enterpriseSelected = GM.Enterprise:getFromId(enterpriseId)
    if (not enterpriseSelected) then return end

    if (not enterpriseSelected.ranks[gradeId]) then return end

    if (enterpriseSelected.ranks[gradeId].name == "owner") then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous ne pouvez pas supprimer le grade owner.")
        return
    end

    if (enterpriseSelected.ranks[gradeId].name == "recruit") then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous ne pouvez pas supprimer le grade recruit.")
        return
    end

    enterpriseSelected.ranks[gradeId] = nil

    MySQL.update('UPDATE user_enterprise SET ranks = ? WHERE id = ?', {
        json.encode(enterpriseSelected.ranks), 
        enterpriseId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", enterpriseId, enterpriseSelected)
        end
        -- Todo check if players in this current rank are connected and if they are connected send them to the default rank
    end)

end)

RegisterServerEvent("Admin:enterpriseRecruit", function(enterpriseId, playerId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("RECRUIT_ENTERPRISE_PLAYER", playerSelected.source)) then return end

    local enterpriseSelected = GM.Enterprise:getFromId(enterpriseId)
    if (not enterpriseSelected) then return end

    local targetSelected = ESX.GetPlayerFromId(playerId)
    if (not targetSelected) then return end

    -- Todo check the input if it is license or not

    local targetIdentifier = playerSelected.getIdentifier()
    if (not targetIdentifier) then return end

    if (enterpriseSelected.players[targetIdentifier]) then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Ce joueur est déjà recruté dans l'entreprise.")
        return
    end

    if (GM.Enterprise["list_players"][targetIdentifier] ~= nil) then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Ce joueur est déjà recruté dans une entreprise.")
        return
    end

    targetSelected.set("enterprise_id", enterpriseId)
    targetSelected.set("enterprise", enterpriseSelected.name)

    enterpriseSelected.players[targetIdentifier] = {
        identifier = targetIdentifier,
        name = targetSelected.getName(), -- Todo get the real name of the player not GameName
        rank = "recruit",
        rank_id = enterpriseSelected:getIdFromRankName("recruit"),
        arrival_date = os.date("%d-%m-%Y %H:%M:%S")
    }

    MySQL.update('UPDATE user_enterprise SET players = ? WHERE id = ?', {
        json.encode(enterpriseSelected.players), 
        enterpriseId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", enterpriseId, enterpriseSelected)
        end
    end)
end)

RegisterServerEvent("Admin:enterprisePlayerKick", function(enterpriseId, playerIdentifier, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("KICK_ENTERPRISE_PLAYER", playerSelected.source)) then return end

    local enterpriseSelected = GM.Enterprise:getFromId(enterpriseId)
    if (not enterpriseSelected) then return end

    if (not enterpriseSelected.players[playerIdentifier]) then return end

    local targetSelected = ESX.GetPlayerFromIdentifier(playerIdentifier)
    if (targetSelected) then
        targetSelected.set("enterprise_id", 0)
        targetSelected.set("enterprise", "unemployed")
    end

    enterpriseSelected.players[playerIdentifier] = nil

    MySQL.update('UPDATE user_enterprise SET players = ? WHERE id = ?', {
        json.encode(enterpriseSelected.players), 
        enterpriseId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", enterpriseId, enterpriseSelected)
        end
    end)
end)

RegisterServerEvent("Admin:deleteEnterprise", function(enterpriseId, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("DELETE_ENTERPRISE", playerSelected.source)) then return end

    local enterpriseSelected = GM.Enterprise:getFromId(enterpriseId)
    if (not enterpriseSelected) then return end

    GM.Enterprise["list"][enterpriseId] = nil

    MySQL.update('DELETE FROM user_enterprise WHERE id = ?', {
        enterpriseId
    }, function()
        -- Todo check if player are connected and update their jobs
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:removeValue", adminSrc, "enterprises", enterpriseId)
        end
    end)
end)

RegisterServerEvent("Admin:changeEnterpriseZonePosition", function(enterpriseId, zoneName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("CHANGE_ENTERPRISE_ZONE_POSITION", playerSelected.source)) then return end

    local enterpriseSelected = GM.Enterprise:getFromId(enterpriseId)
    if (not enterpriseSelected) then return end

    if (not enterpriseSelected.zones[zoneName]) then return end

    local playerCoords = playerSelected.getCoords(true)
    if (not playerCoords) then return end

    enterpriseSelected.zones_saved[zoneName].position = playerCoords

    MySQL.update('UPDATE user_enterprise SET zones = ? WHERE id = ?', {
        json.encode(enterpriseSelected.zones_saved), 
        enterpriseId
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", enterpriseId, enterpriseSelected)
        end
        local enterpriseZone = enterpriseSelected:getZone(zoneName)
        if (enterpriseZone) then
            local currentZone = GM.Zone:get(enterpriseZone.uniqueId)
            currentZone:setData("position", enterpriseSelected.zones_saved[zoneName].position)
        end

        playerSelected.showNotification("La zone ~g~"..zoneName.."~s~ a été déplacée à votre position.")
    end)
end)