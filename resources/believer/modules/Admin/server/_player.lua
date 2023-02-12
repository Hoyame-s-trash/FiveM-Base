GM.Admin = GM.Admin or {}

RegisterServerEvent("Admin:spectatePlayer", function(playerId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local targetSelected = ESX.GetPlayerFromId(playerId)
    if (not targetSelected) then return end

    TriggerClientEvent("Admin:spectatePlayer", playerSrc, {id = targetSelected.source})
end)

RegisterServerEvent("Admin:teleportWaypoint", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    TriggerClientEvent("esx:tpm", playerSrc)
end)

GM.Admin.Weapon = {}

RegisterServerEvent("Admin:giveAllWeapons", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("MY_PLAYER_GIVEALLWEAPONS", playerSelected.source)) then return end

    local allWeapons = ESX.GetWeaponList()
    if (not allWeapons) then return end

    if (GM.Admin.Weapon[playerSelected.source] == nil) then
        GM.Admin.Weapon[playerSelected.source] = {}
    else
        return
    end

    for i = 1, #allWeapons, 1 do
        local weapon = allWeapons[i]
        if (not playerSelected.hasWeapon(weapon.name)) then
            table.insert(GM.Admin.Weapon[playerSelected.source], weapon.name)
            playerSelected.addWeapon(weapon.name, 1000)
        end
    end
end)

RegisterServerEvent("Admin:removeAllWeapons", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("MY_PLAYER_REMOVEALLWEAPONS", playerSelected.source)) then return end

    if (GM.Admin.Weapon[playerSelected.source] == nil) then return end

    for i = 1, #GM.Admin.Weapon[playerSelected.source], 1 do
        local weapon = GM.Admin.Weapon[playerSelected.source][i]
        if (playerSelected.hasWeapon(weapon)) then
            playerSelected.removeWeapon(weapon)
        end
    end

    GM.Admin.Weapon[playerSelected.source] = nil
end)

AddEventHandler("playerDropped", function()
    local playerSrc = source

    if (not playerSrc) then return end

    if (GM.Admin.Weapon[playerSrc] ~= nil) then
        local playerSrc = source
        if (not playerSrc) then return end

        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        if (playerSelected.getGroup() == "user") then return end

        local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
        if (not selectedRank) then return end

        if (GM.Admin.Weapon[playerSelected.source] == nil) then return end

        for i = 1, #GM.Admin.Weapon[playerSelected.source], 1 do
            local weapon = GM.Admin.Weapon[playerSelected.source][i]
            if (playerSelected.hasWeapon(weapon)) then
                playerSelected.removeWeapon(weapon)
            end
        end

        GM.Admin.Weapon[playerSelected.source] = nil
    end
end)

RegisterServerEvent("Admin:gamerTag", function(BOOLEAN)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("MY_PLAYER_GAMERTAG", playerSelected.source)) then return end

    TriggerClientEvent("Admin:updateValue", playerSrc, "players", GM.Admin.Players["list"])
    TriggerClientEvent("Admin:gamerTag", playerSrc, BOOLEAN)
end)

GM.Admin.Blips = {}
GM.Admin.Blips["InBlips"] = {}
GM.Admin.Blips["list"] = {}

RegisterServerEvent("Admin:blipsManager", function(BOOLEAN)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("MY_PLAYER_BLIPS", playerSelected.source)) then return end

    if (BOOLEAN == false) then
        GM.Admin.Blips["InBlips"][playerSrc] = nil
        TriggerClientEvent("Admin:blipsManager", playerSrc, BOOLEAN)
    end

    if (not GM.Admin.Blips["InBlips"][playerSrc]) then
        GM.Admin.Blips["InBlips"][playerSrc] = true
    end
end)

GM:newThread(function()
    while true do
        GM.Admin.Blips["list"] = {}
        for _, playerSrc in pairs(GetPlayers()) do
            playerSrc = tonumber(playerSrc)
            if (GetPlayerPed(playerSrc) ~= 0) then
                if (not GM.Admin.Blips["list"][playerSrc]) then
                    GM.Admin.Blips["list"][playerSrc] = {
                        x = GetEntityCoords(GetPlayerPed(playerSrc)),
                        y = GetEntityCoords(GetPlayerPed(playerSrc)),
                        z = GetEntityCoords(GetPlayerPed(playerSrc)),
                        name = GetPlayerName(playerSrc),
                    }
                end
            end
        end
        for adminSrc, _ in pairs(GM.Admin.Blips["InBlips"]) do
            TriggerClientEvent("Admin:blipsManager", adminSrc, GM.Admin.Blips["list"])
        end
        Wait(1000)
    end
end)

GM.Admin.Invisible = {}

RegisterServerEvent("Admin:invisibleStaff", function(BOOLEAN)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("MY_PLAYER_INVISIBLESTAFF", playerSelected.source)) then return end

    local staffSelected = GM.Admin.Players:getFromId(playerSelected.source)
    if (not staffSelected) then return end

    if (BOOLEAN == true) then
        if (GM.Admin.Invisible[playerSrc] == nil) then
            GM.Admin.Invisible[playerSrc] = true
            staffSelected.invisible = true
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "players", staffSelected.id, staffSelected)
            end
        end
    else
        if (GM.Admin.Invisible[playerSrc] ~= nil) then
            GM.Admin.Invisible[playerSrc] = nil
            staffSelected.invisible = false
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "players", staffSelected.id, staffSelected)
            end
        end
    end
end)

RegisterServerEvent("Admin:getInformationsPlayer", function(playerId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("PLAYER_INFORMATIONS", playerSelected.source)) then return end

    local playerTarget = ESX.GetPlayerFromId(playerId)
    if (not playerTarget) then return end

    local targetIdentifier = playerTarget.getIdentifier()
    if (not targetIdentifier) then return end

    local playerInformations = {
        name = playerTarget.getName(),
        uniqueId = playerTarget.getUniqueId(),
        job = playerTarget.job.name,
        money = playerTarget.getMoney(),
        bank = playerTarget.getAccount("bank").money,
        dirty = playerTarget.getAccount("black_money").money,
        first_connection = GM.PlayTime:convertTimestampToDate(playerTarget.getFirstConnection()),
        time_play = GM.PlayTime:getActualTime(targetIdentifier),
    }

    TriggerClientEvent("Admin:updateValue", playerSelected.source, "informations", playerInformations)
end)

RegisterServerEvent("Admin:setWarningPlayer", function(playerId, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("PLAYER_WARNING", playerSelected.source)) then return end

    local playerTarget = ESX.GetPlayerFromId(playerId)
    if (not playerTarget) then return end

    local targetIdentifier = playerTarget.getIdentifier()
    if (not targetIdentifier) then return end

    local warn = {
        reason = input,
        date = os.date("%d/%m/%Y %H:%M:%S"),
        admin = playerSelected.getName(),
    }

    MySQL.insert('INSERT INTO user_sanctions (identifier, type, data) VALUES (?, ?, ?)', {playerIdentifier, "Avertissement", json.encode(warn)}, function(id)
        playerSelected.showNotification("~b~Vous avez mis un avertissement à "..playerTarget.getName().." pour "..input)
    end)
end)

RegisterServerEvent("Admin:requestSanctionsPlayer", function(playerId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("PLAYER_SANCTIONS", playerSelected.source)) then return end

    local playerTarget = ESX.GetPlayerFromId(playerId)
    if (not playerTarget) then return end

    local targetIdentifier = playerTarget.getIdentifier()
    if (not targetIdentifier) then return end

    MySQL.query('SELECT * FROM user_sanctions WHERE identifier = ?', {targetIdentifier}, function(result)
        if result then
            local sanctions = {}
            for _,v in pairs(result) do
                table.insert(sanctions, {
                    type = v.type,
                    data = json.decode(v.data),
                })
            end
            TriggerClientEvent("Admin:updateValue", playerSelected.source, "sanctions", sanctions)
        end
    end)
end)