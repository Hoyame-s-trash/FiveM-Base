GM.Service = GM.Service or {}

GM.Service["Enterprise_list"] = {}
GM.Service["Player_list"] = {}

RegisterServerEvent("Service:interact", function(bool)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerJob = playerSelected.job.name

    if (playerJob == "unemployed") then
        playerSelected.showNotification("~r~Vous n'avez pas de métier.")
        return
    end

    if (GM.Service["Enterprise_list"][playerJob] == nil) then
        GM.Service["Enterprise_list"][playerJob] = {}
    end

    if (bool) then
        GM.Service["Player_list"][playerSrc] = true
        GM.Service["Enterprise_list"][playerJob][playerSrc] = true
        playerSelected.showNotification("~g~Vous avez pris votre service.")
    else
        GM.Service["Player_list"][playerSrc] = nil
        GM.Service["Enterprise_list"][playerJob][playerSrc] = nil
        playerSelected.showNotification("~r~Vous avez pris votre fin de service.")
    end

    TriggerClientEvent("Service:sendActivity", playerSrc, bool)
end)

function GM.Service:getPeopleService(jobName)
    if (GM.Service["Enterprise_list"][jobName] == nil) then
        return 0
    end

    return GM.Service["Enterprise_list"][jobName]
end

AddEventHandler("playerDropped", function()
    if (GM.Service["Player_list"][source]) then
        GM.Service["Player_list"][source] = nil
    end
end)