GM.Admin = GM.Admin or {}

RegisterServerEvent("Admin:repairVehicle", function(vehicleId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("VEHICLES_REPAIR", playerSelected.source)) then return end

    playerSelected.showNotification("~b~Le véhicule a été correctement réparé.")

    TriggerClientEvent("Admin:repairVehicle", -1, vehicleId)
end)