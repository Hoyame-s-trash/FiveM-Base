GM.ArenaWars = GM.ArenaWars or {}

GM.ArenaWars.currentArena = "dystopian"

RegisterServerEvent("ArenaWars:modifyArena", function(arenaName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("MODIFY_ARENAWARS", playerSelected.source)) then return end

    GM.ArenaWars.currentArena = arenaName

    TriggerClientEvent("ArenaWars:modifyArena", -1, arenaName)
end)

RegisterServerEvent("ArenaWars:getCurrentArena", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    TriggerClientEvent("ArenaWars:modifyArena", playerSrc, GM.ArenaWars.currentArena)
end)