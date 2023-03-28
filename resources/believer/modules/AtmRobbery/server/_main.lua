GM.AtmRobbery = GM.AtmRobbery or {}

GM.AtmRobbery.Robbed = {}

GM.AtmRobbery.currentRope = {}

GM.AtmRobbery.Destroyed = {}

ESX.RegisterServerCallback("atmRobbery:canRobAtm", function(source, cb, atmCoords)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerCoords = playerSelected.getCoords(true)
    local distance = #(playerCoords - atmCoords)

    if (distance > 5.0) then
        cb(false)
        return
    end

    if (GM.AtmRobbery.Robbed[playerSelected.uniqueId] ~= nil) then
        playerSelected.showNotification("~r~Vous avez déjà braqué un ATM recemment.")
        cb(false)
    end 

    -- Todo check if player got the right item

    GM.AtmRobbery.Robbed[playerSelected.uniqueId] = true
    cb(true)
end)

ESX.RegisterServerCallback("atmRobbery:start", function(source, cb, atmNetId, atmModel, atmCoords, atmRot)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.AtmRobbery.currentRope[atmNetId] ~= nil) then
        playerSelected.showNotification("~r~Un autre joueur est déjà en train de braquer cet ATM.")
        cb(false)
        return
    end

    GM.AtmRobbery.currentRope[atmNetId] = {
        PlayerServerId = playerSrc,
        AtmCoords = atmCoords,
        AtmRot = atmRot,
        AtmModel = atmModel,
    }

    TriggerClientEvent("atmRobbery:syncRope", playerSrc, atmNetId, GM.AtmRobbery.currentRope[atmNetId])

    cb(true)
end)

RegisterServerEvent("atmRobbery:attachBetweenAtmAndVehicle", function(atmNetId, vehicleNetId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.AtmRobbery.currentRope[atmNetId] == nil) then return end

    GM.AtmRobbery.currentRope[atmNetId].VehicleNetId = vehicleNetId
    GM.AtmRobbery.currentRope[atmNetId].PlayerServerId = nil

    TriggerClientEvent("atmRobbery:syncRope", playerSrc, atmNetId, GM.AtmRobbery.currentRope[atmNetId])
end)

RegisterServerEvent("atmRobbery:destroyAtm", function(atmNetId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.AtmRobbery.currentRope[atmNetId] == nil) then return end

    if (GM.AtmRobbery.Destroyed[atmNetId] ~= nil) then return end

    GM.AtmRobbery.Destroyed[atmNetId] = {
        Coords = GM.AtmRobbery.currentRope[atmNetId].AtmCoords,
        Rot = GM.AtmRobbery.currentRope[atmNetId].AtmRot,
        Model = GM.AtmRobbery.currentRope[atmNetId].AtmModel,
        Source = playerSrc,
    }

    playerSelected.showNotification("~g~Vous avez réussi à détruire l'ATM.")

    TriggerClientEvent("atmRobbery:syncDestroyedAtm", -1, GM.AtmRobbery.Destroyed[atmNetId])
    GM.AtmRobbery.currentRope[atmNetId] = nil
end)

RegisterServerEvent("atmRobbery:reward", function(atmNetId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.AtmRobbery.Robbed[playerSelected.uniqueId] == nil) then return end

    if (GM.AtmRobbery.Destroyed[atmNetId] == nil) then return end

    if (GM.AtmRobbery.Destroyed[atmNetId].Source ~= playerSrc) then return end

    local random = math.random(4000, 10000)

    playerSelected.addMoney(random)
    playerSelected.showNotification("~g~Vous avez reçu ~w~$" .. random .. " ~g~pour avoir détruit l'ATM.")

    TriggerClientEvent("atmRobbery:syncRope", playerSrc, atmNetId, nil)
end)

RegisterServerEvent("atmRobbery:detachRope", function(atmNetId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.AtmRobbery.Robbed[playerSelected.uniqueId] == nil) then return end

    GM.AtmRobbery.Robbed[playerSelected.uniqueId] = nil

    TriggerClientEvent("atmRobbery:syncRope", playerSrc, atmNetId, nil)
end)

-- Todo sync every destroyed atm to every player