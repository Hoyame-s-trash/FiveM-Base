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

    local selectedRank = GM.Admin.Ranks:getRankFromId(playerSelected.get("rank_id"))
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

RegisterServerEvent("Admin:removeAllWeapons", function(source)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Admin.Ranks:getRankFromId(playerSelected.get("rank_id"))
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

AddEventHandler("Player:destroy", function(playerSrc)
    if (not playerSrc) then return end

    if (GM.Admin.Weapon[playerSrc] ~= nil) then
        TriggerEvent("Admin:removeAllWeapons", playerSrc)
    end
end)