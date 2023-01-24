GM.AxeOfFury = GM.AxeOfFury or {}

GM.AxeOfFury.Scores = {}

GM.AxeOfFury.registeredZones = {}

GM.AxeOfFury.currentMachine = {}

GM:newThread(function()
    while (GM.AxeOfFury["AxeFuryMachines"] == nil) do
        Wait(150)
    end

    MySQL.query("SELECT * FROM user_axeoffury", {}, function(results)
        if (results[1]) then
            for _, axeoffury in pairs(results) do
                GM.AxeOfFury.Scores[axeoffury.id] = axeoffury.score
            end
        end
    end)

    for machineId, machineValues in pairs(GM.AxeOfFury["AxeFuryMachines"]) do
        GM.AxeOfFury.registeredZones[machineId] = GM.Zone.Management:create(machineValues.Coords, 2.0, "jouer à Axe Of Fury.", function(playerSrc)
            if (GM.AxeOfFury.currentMachine[machineId] == true) then
                TriggerClientEvent("esx:showNotification", playerSrc, "~r~Cette machine est déjà utilisée.")
                return
            end

            GM.AxeOfFury.currentMachine[machineId] = true

            TriggerClientEvent("AxeOfFury:Play", playerSrc, machineId)
        end, {
            private = false,
        })
    end
end)

RegisterServerEvent("AxeOfFury:startSound", function(arcadePropCoords, machineId, playerId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    -- Todo check the distance between the player and the arcade machine

    local playerCoords = playerSelected.getCoords(true)
    local distance = #(playerCoords - arcadePropCoords)

    if (distance > 5.0) then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous êtes trop loin de la machine.")
        return
    end

    TriggerClientEvent("AxeOfFury:startSound", playerSrc, arcadePropCoords, machineId, playerId)    
end)

RegisterServerEvent("AxeOfFury:updateScore", function(barHighScore, screenScore, arcadePropCoords, hammerHitSound, soundResult, lightCoord, id, hammerCoord, arcadePropHeading, hammerRotation)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    -- Todo check the distance between the player and the arcade machine

    local playerCoords = playerSelected.getCoords(true)
    local distance = #(playerCoords - arcadePropCoords)

    if (distance > 5.0) then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous êtes trop loin de la machine.")
        return
    end

    if (GM.AxeOfFury.Scores[id] == nil) then
        GM.AxeOfFury.Scores[id] = 0
    end

    if (screenScore > GM.AxeOfFury.Scores[id]) then
        GM.AxeOfFury.Scores[id] = screenScore
        MySQL.update('UPDATE user_axeoffury SET score = ? WHERE id = ?', {
            screenScore, 
            id
        }, function()
        end)
    end

    TriggerClientEvent("AxeOfFury:updateScore", -1, barHighScore, screenScore, arcadePropCoords, hammerHitSound, soundResult, lightCoord, id, hammerCoord, arcadePropHeading, hammerRotation, GM.AxeOfFury.Scores[id])
end)

RegisterServerEvent("AxeOfFury:leave", function(machineId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.AxeOfFury.currentMachine[machineId] == true) then
        GM.AxeOfFury.currentMachine[machineId] = nil
    end
end)

ESX.RegisterServerCallback("AxeofFury:getHighScore", function(source, cb, machineId)
    local playerScore = GM.AxeOfFury.Scores[machineId] or 0

    cb(playerScore)
end)