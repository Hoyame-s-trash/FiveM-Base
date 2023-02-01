GM.Ambulance = GM.Ambulance or {}

GM.Ambulance["calls_list"] = {}
GM.Ambulance["calls_number"] = 0

GM.Ambulance["dead_list"] = {}

RegisterServerEvent("Ambulance:setDead", function(boolean)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (boolean) then
        GM.Ambulance["dead_list"][playerSelected.source] = true
        playerSelected.setDead(true)
    else
        GM.Ambulance["dead_list"][playerSelected.source] = nil
        playerSelected.setDead(false)
    end
end)

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
    
    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:updateValue", ambulanceSrc, "calls", playerSelected.source, GM.Ambulance["calls_list"][playerSelected.source])
    end

    TriggerClientEvent("esx:showNotification", playerSelected.source, "~b~Vous avez envoyé un appel d'urgence.")
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
    
    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", callId)
    end
end)

RegisterServerEvent("Ambulance:revivePlayerToHospital", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Ambulance["calls_list"][playerSelected.source] ~= nil) then
        if (GM.Ambulance["calls_list"][playerSelected.source].taken_src) then
            TriggerClientEvent("esx:showNotification", GM.Ambulance["calls_list"][playerSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient à été réanimer à l'hôpital.")
        end
        GM.Ambulance["calls_list"][playerSelected.source] = nil
        local ambulanceList = GM.Service:getPeopleService("ambulance")
    
        for ambulanceSrc, _ in pairs(ambulanceList) do
            TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", playerSelected.source)
        end
    end

    if (GM.Ambulance["dead_list"][playerSelected.source] ~= nil) then
        GM.Ambulance["dead_list"][playerSelected.source] = nil
        playerSelected.setDead(false)
    end

    playerSelected.setCoords(vector3(316.44668579102, -582.14978027344, 43.284076690674))
    playerSelected.showNotification("~g~Vous avez été réanimer à l'hôpital.")

    TriggerClientEvent("Ambulance:revivePlayer", playerSelected.source)
end)

RegisterServerEvent("Ambulance:revivePlayer", function(targetId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "ambulance") then return end

    -- Todo check if player got enough item on him

    local targetSelected = ESX.GetPlayerFromId(targetId)
    if (not targetSelected) then
        playerSelected.showNotification("~r~Le joueur n'est plus connecté.")
        return
    end

    if (GM.Ambulance["calls_list"][targetSelected.source] ~= nil) then
        if (GM.Ambulance["calls_list"][targetSelected.source].taken_src) then
            TriggerClientEvent("esx:showNotification", GM.Ambulance["calls_list"][targetSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient à été réanimer à l'hôpital.")
        end
        GM.Ambulance["calls_list"][targetSelected.source] = nil
    end

    if (GM.Ambulance["dead_list"][targetSelected.source] ~= nil) then
        GM.Ambulance["dead_list"][targetSelected.source] = nil
    end

    playerSelected.showNotification("~g~Vous avez réanimer le joueur.")

    TriggerClientEvent("Ambulance:revivePlayer", targetSelected.source)

    local ambulanceList = GM.Service:getPeopleService("ambulance")
    
    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", targetSelected.source)
    end
end)

AddEventHandler("playerDropped", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Ambulance["calls_list"][playerSelected.source] ~= nil) then
        if (GM.Ambulance["calls_list"][playerSelected.source].taken_src) then
            TriggerClientEvent("esx:showNotification", GM.Ambulance["calls_list"][playerSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient n'est plus là.")
        end
        GM.Ambulance["calls_list"][playerSelected.source] = nil

        local ambulanceList = GM.Service:getPeopleService("ambulance")
    
        for ambulanceSrc, _ in pairs(ambulanceList) do
            TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", playerSelected.source)
        end
    end

    if (GM.Ambulance["dead_list"][playerSelected.source] ~= nil) then
        playerSelected.setDead(true)
        GM.Ambulance["dead_list"][playerSelected.source] = nil
    end
end)

RegisterServerEvent("Ambulance:requestDeathStatus", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIsDead = playerSelected.getDead()

    if (playerIsDead == 1) then
        playerSelected.showNotification("~r~Vous avez déconnecter en étant mort, vous avez été replacer mort.")
        GM.Ambulance["dead_list"][playerSelected.source] = true
        TriggerClientEvent("Ambulance:suicide", playerSelected.source)
    end
end)