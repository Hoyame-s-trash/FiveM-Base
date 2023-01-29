GM.MazeBankArena = GM.MazeBankArena or {}

RegisterServerEvent("MazeBankArena:modifyArena", function(mappingName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("CHANGE_MAZE_BANK_ARENA", playerSelected.source)) then return end

    if (GM.MazeBankArena["list"][mappingName] == nil) then
        return
    end

    TriggerClientEvent("MazeBankArena:modifyArena", -1, mappingName)
end)