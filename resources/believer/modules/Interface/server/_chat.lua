GM.Chat = GM.Chat or {}

GM.Chat["modes"] = {}

function GM.Chat:registerMode(modeName)
    if (not modeName) then return end

    if (not self.modes) then self.modes = {} end

    self.modes[modeName] = {}
end

function GM.Chat:IsPlayerRegisted(modeName, player)
    if (not player) then return end

    if (not self.modes) then self.modes = {} end

    if (not self.modes[modeName]) then return false end

    if (self.modes[modeName][player]) then return true end

    return false
end

function GM.Chat:addPlayerToMode(modeName, player)
    if (not modeName) then return end
    if (not player) then return end

    if (not self.modes) then self.modes = {} end
    if (not self.modes[modeName]) then self.modes[modeName] = {} end

    self.modes[modeName][player] = true

    TriggerClientEvent("Chat:addMode", player, modeName)
end

GM:newThread(function()
    GM.Chat:registerMode("STAFF")
end)

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
        return
    end

    if (not GM.Chat:IsPlayerRegisted(mode, playerSrc)) then return end

    for player,_ in pairs(GM.Chat.modes[mode]) do
        TriggerClientEvent("Chat:sendMsg", player, {
            mode = mode,
            name = playerName,
            text = message
        })
    end
end)