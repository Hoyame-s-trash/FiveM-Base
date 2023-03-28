GM.Ambulance = GM.Ambulance or {}

RegisterServerEvent("Ambulance:requestCalls", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    TriggerClientEvent("Ambulance:updateValue", playerSrc, "calls", GM.Death["calls_list"])
end)

RegisterServerEvent("Ambulance:takeCall", function(callId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    if (GM.Death["calls_list"][callId] == nil) then
        playerSelected.showNotification("~r~Cet appel n'existe pas.")
        return
    end

    if (GM.Death["calls_list"][callId].taken == true) then
        playerSelected.showNotification("~r~Cet appel a déjà été pris.")
        return
    end

    GM.Death["calls_list"][callId].taken = true
    GM.Death["calls_list"][callId].taken_src = playerSelected.source
    GM.Death["calls_list"][callId].taken_name = playerSelected.getName()

    local ambulanceList = GM.Service:getPeopleService("ambulance")
    
    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:updateValue", ambulanceSrc, "calls", callId, GM.Death["calls_list"][callId])
    end
end)

RegisterServerEvent("Ambulance:informPatient", function(callId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    if (GM.Death["calls_list"][callId] == nil) then
        playerSelected.showNotification("~r~Cet appel n'existe pas.")
        return
    end

    if (GM.Death["calls_list"][callId].taken == false) then
        playerSelected.showNotification("~r~Cet appel n'a pas été pris.")
        return
    end

    local targetSelected = ESX.GetPlayerFromId(callId)
    if (not targetSelected) then
        playerSelected.showNotification("~r~Le joueur n'est plus connecté.")
        return
    end

    distance = #(playerSelected.getCoords(true) - GM.Death["calls_list"][callId].position)
    targetSelected.showNotification('Un medecin est en route (~g~'..math.floor(distance)..'m~w~)')
end)

RegisterServerEvent("Ambulance:closeCall", function(callId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    if (GM.Death["calls_list"][callId] == nil) then
        playerSelected.showNotification("~r~Cet appel n'existe pas.")
        return
    end

    if (GM.Death["calls_list"][callId].taken == false) then
        playerSelected.showNotification("~r~Cet appel n'a pas été pris.")
        return
    end

    GM.Death["calls_list"][callId] = nil

    local ambulanceList = GM.Service:getPeopleService("ambulance")
    
    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", callId)
    end
end)