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