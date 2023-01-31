GM.Ambulance = GM.Ambulance or {}

GM.Ambulance["calls_list"] = {}
GM.Ambulance["calls_number"] = 0

RegisterServerEvent("Ambulance:requestCalls", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    TriggerClientEvent("Ambulance:updateValue", playerSrc, "calls", GM.Ambulance["calls_list"])
end)

RegisterServerEvent("Ambulance:sendDistressSignal", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Ambulance["calls_list"][playerSelected.source] ~= nil) then
        playerSelected.showNotification("~r~Vous avez déjà un appel en cours.")
        return
    end

    GM.Ambulance["calls_number"] = GM.Ambulance["calls_number"] + 1

    GM.Ambulance["calls_list"][playerSelected.source] = {
        id = GM.Ambulance["calls_number"],
        position = playerSelected.getCoords(true),
        taken = false,
        date = os.date("%H:%M"),
        reason = "Une personne est inconsciente"
    }

    local ambulanceList = GM.Service:getPeopleService("ambulance")
    if (ambulanceList == 0) then
        playerSelected.showNotification("~r~Aucun médecin n'est en service.")
        return
    end

    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:updateValue", ambulanceSrc, "calls", playerSelected.source, GM.Ambulance["calls_list"][playerSelected.source])
    end
end)

RegisterServerEvent("Ambulance:takeCall", function(callId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    if (GM.Ambulance["calls_list"][callId] == nil) then
        playerSelected.showNotification("~r~Cet appel n'existe pas.")
        return
    end

    if (GM.Ambulance["calls_list"][callId].taken == true) then
        playerSelected.showNotification("~r~Cet appel a déjà été pris.")
        return
    end

    GM.Ambulance["calls_list"][callId].taken = true
    GM.Ambulance["calls_list"][callId].taken_src = playerSelected.source
    GM.Ambulance["calls_list"][callId].taken_name = playerSelected.getName()

    local ambulanceList = GM.Service:getPeopleService("ambulance")
    if (ambulanceList == 0) then
        playerSelected.showNotification("~r~Aucun médecin n'est en service.")
        return
    end

    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:updateValue", ambulanceSrc, "calls", callId, GM.Ambulance["calls_list"][callId])
    end
end)

RegisterServerEvent("Ambulance:informPatient", function(callId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    if (GM.Ambulance["calls_list"][callId] == nil) then
        playerSelected.showNotification("~r~Cet appel n'existe pas.")
        return
    end

    if (GM.Ambulance["calls_list"][callId].taken == false) then
        playerSelected.showNotification("~r~Cet appel n'a pas été pris.")
        return
    end

    local targetSelected = ESX.GetPlayerFromId(callId)
    if (not targetSelected) then
        playerSelected.showNotification("~r~Le joueur n'est plus connecté.")
        return
    end

    distance = #(playerSelected.getCoords(true) - GM.Ambulance["calls_list"][callId].position)
    targetSelected.showNotification('Un medecin est en route (~g~'..math.floor(distance)..'m~w~)')
end)

RegisterServerEvent("Ambulance:closeCall", function(callId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    if (GM.Ambulance["calls_list"][callId] == nil) then
        playerSelected.showNotification("~r~Cet appel n'existe pas.")
        return
    end

    if (GM.Ambulance["calls_list"][callId].taken == false) then
        playerSelected.showNotification("~r~Cet appel n'a pas été pris.")
        return
    end

    GM.Ambulance["calls_list"][callId] = nil

    local ambulanceList = GM.Service:getPeopleService("ambulance")
    if (ambulanceList == 0) then
        playerSelected.showNotification("~r~Aucun médecin n'est en service.")
        return
    end

    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", callId)
    end
end)