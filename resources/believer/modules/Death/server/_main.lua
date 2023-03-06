GM.Death = GM.Death or {}

GM.Death["calls_list"] = {}
GM.Death["calls_number"] = 0

GM.Death["dead_list"] = {}

RegisterServerEvent("Ambulance:setDead", function(boolean)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (boolean) then
        GM.Death["dead_list"][playerSelected.source] = {
            deadTime = os.time(os.date("!*t")),
            time = GM.Death.Time
        }
        playerSelected.setDead(true)
    else
        GM.Death["dead_list"][playerSelected.source] = nil
        playerSelected.setDead(false)
    end
end)

RegisterServerEvent("Ambulance:sendDistressSignal", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Death["calls_list"][playerSelected.source] ~= nil) then
        playerSelected.showNotification("~r~Vous avez déjà un appel en cours.")
        return
    end

    GM.Death["calls_number"] = GM.Death["calls_number"] + 1

    GM.Death["calls_list"][playerSelected.source] = {
        id = GM.Death["calls_number"],
        position = playerSelected.getCoords(true),
        taken = false,
        date = os.date("%H:%M"),
        reason = "Une personne est inconsciente"
    }

    local ambulanceList = GM.Service:getPeopleService("ambulance")
    
    for ambulanceSrc, _ in pairs(ambulanceList) do
        TriggerClientEvent("Ambulance:updateValue", ambulanceSrc, "calls", playerSelected.source, GM.Death["calls_list"][playerSelected.source])
    end

    TriggerClientEvent("esx:showNotification", playerSelected.source, "~b~Vous avez envoyé un appel d'urgence.")
end)

RegisterServerEvent("Ambulance:revivePlayerToHospital", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Death["dead_list"][playerSelected.source] ~= nil) then
        local time = GM.Death["dead_list"][playerSelected.source].time
        local deadTime = GM.Death["dead_list"][playerSelected.source].deadTime
        local currentTime = os.time(os.date("!*t"))
        local timeLeft = time - (currentTime - deadTime)

        if (timeLeft > 0) then
            playerSelected.showNotification("~r~Vous devez attendre " .. timeLeft .. " secondes avant de pouvoir être réanimer à l'hôpital.")
            return
        end
        GM.Death["dead_list"][playerSelected.source] = nil
        playerSelected.setDead(false)
    end

    if (GM.Death["calls_list"][playerSelected.source] ~= nil) then
        if (GM.Death["calls_list"][playerSelected.source].taken_src) then
            TriggerClientEvent("esx:showNotification", GM.Death["calls_list"][playerSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient à été réanimer à l'hôpital.")
        end
        GM.Death["calls_list"][playerSelected.source] = nil
        local ambulanceList = GM.Service:getPeopleService("ambulance")
    
        for ambulanceSrc, _ in pairs(ambulanceList) do
            TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", playerSelected.source)
        end
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

    if (GM.Death["calls_list"][targetSelected.source] ~= nil) then
        if (GM.Death["calls_list"][targetSelected.source].taken_src) then
            TriggerClientEvent("esx:showNotification", GM.Death["calls_list"][targetSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient à été réanimer à l'hôpital.")
        end
        GM.Death["calls_list"][targetSelected.source] = nil

        local ambulanceList = GM.Service:getPeopleService("ambulance")
    
        for ambulanceSrc, _ in pairs(ambulanceList) do
            TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", targetSelected.source)
        end
    end

    if (GM.Death["dead_list"][targetSelected.source] ~= nil) then
        GM.Death["dead_list"][targetSelected.source] = nil
    end

    playerSelected.showNotification("~g~Vous avez réanimer le joueur.")

    TriggerClientEvent("Ambulance:revivePlayer", targetSelected.source)
end)

AddEventHandler("playerDropped", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Death["calls_list"][playerSelected.source] ~= nil) then
        if (GM.Death["calls_list"][playerSelected.source].taken_src) then
            TriggerClientEvent("esx:showNotification", GM.Death["calls_list"][playerSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient n'est plus là.")
        end
        GM.Death["calls_list"][playerSelected.source] = nil

        local ambulanceList = GM.Service:getPeopleService("ambulance")
    
        for ambulanceSrc, _ in pairs(ambulanceList) do
            TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", playerSelected.source)
        end
    end

    if (GM.Death["dead_list"][playerSelected.source] ~= nil) then
        playerSelected.setDead(true)
        GM.Death["dead_list"][playerSelected.source] = nil
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
        playerSelected.setDead(true)
        GM.Death["dead_list"][playerSelected.source] = true
        TriggerClientEvent("Ambulance:suicide", playerSelected.source)
    end
end)