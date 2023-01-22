GM.Chat = GM.Chat or {}

GM.Chat["modes"] = {}

function GM.Chat:registerMode(mode)
    if (not mode) then return end

    if (not self.modes) then self.modes = {} end

    self.modes[mode.name] = mode
end

RegisterServerEvent("Chat:sendMessage", function(mode, message)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerName = playerSelected.getName()
    if (not playerName) then return end

    if (mode == "ALL") then
        if (playerSelected.getGroup() == "user") then return end

        local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
        if (not playerRank) then return end

        if (not playerRank:getPermissionsValue("SEND_ALL_CHAT", playerSelected.source)) then return end

        TriggerClientEvent("Chat:sendMsg", -1, {
            mode = mode,
            name = playerName,
            text = message
        })
    end
end)