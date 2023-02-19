ESX = exports["believer"]:getSharedObject()

ESX.RegisterServerCallback("PauseMenu:Getserverdata", function(source, cb)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    -- Todo set the real coins

    local data = {
        name = playerSelected.getName(),
        playtime = exports.believer:getActualTime(playerSelected.getIdentifier()),
        players = GetNumPlayerIndices(),
        slots = GetConvarInt("sv_maxclients", 32),
        serverId = playerSelected.source,
        uniqueId = playerSelected.getUniqueId(),
        job = playerSelected.job.label,
        job2 = "Chômeur",
        bank = playerSelected.getAccount("bank").money,
        money = playerSelected.getMoney(),
        black_money = playerSelected.getAccount("black_money").money,
        coins = 10000
    }

    cb(data)
end)

RegisterServerEvent("PauseMenu:disconnected", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    DropPlayer(playerSrc, "Déconnexion du serveur")
end)