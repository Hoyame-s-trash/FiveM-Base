GM.Alien = GM.Alien or {}

RegisterServerEvent("Alien:sendParticles", function(ptfxAsset, ptfxName, ptfxNetId, ptfxWait, position, ptfxLoop, scale, nbLoop, loopWait)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    -- Todo check if playerSrc got the good model and it's not a cheater

    local players = ESX.OneSync.GetPlayersInArea(playerSrc, 75.0)
    if (not players) then return end

    for playerId in pairs(players) do
        TriggerClientEvent("Alien:syncParticle", playerId, ptfxAsset, ptfxName, ptfxNetId, ptfxWait, position, ptfxLoop, scale, nbLoop, loopWait)
    end
end)