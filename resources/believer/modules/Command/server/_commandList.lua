GM:newThread(function()
    while (GM.Command == nil) do
        Wait(50)
    end

    GM.Command:register({
        name = "commands",
        label = "Ouvrir le menu des commandes",
        description = "Permet d'ouvrir le menu des commandes",
        permissions = false,
    }, function(playerSrc)
        TriggerClientEvent("Command:openMenu", playerSrc, GM.Command.List)
    end)

    GM.Command:register({
        name = "admin",
        label = "Ouvrir le menu d'administration",
        description = "Permet d'ouvrir le menu d'administration",
        keys = {"keyboard", "F10"},
    }, function(playerSrc)
        TriggerClientEvent("Admin:openMenu", playerSrc)
    end)

    GM.Command:register({
        name = "jobs",
        label = "Ouvrir le menu d'interaction de son métier'",
        description = "Permet d'ouvrir le menu d'interaction de son métier",
        keys = {"keyboard", "F6"},
    }, function(playerSrc)
        if (playerSrc == 0) then return end
        
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end
        
        local playerJob = playerSelected.job.name

        if (playerJob == "unemployed") then
            TriggerClientEvent("esx:showNotification", playerSrc, "Vous n'avez pas de métier")
            return
        end

        local jobName = playerJob:sub(1, 1):upper() .. playerJob:sub(2)
        TriggerClientEvent(jobName..":openMenu", playerSrc)
    end)

    GM.Command:register({
        name = "die",
        label = "Se suicider",
        description = "Permet de se suicider",
        permissions = false
    }, function(playerSrc)
        TriggerClientEvent("Ambulance:suicide", playerSrc)
    end)

end)