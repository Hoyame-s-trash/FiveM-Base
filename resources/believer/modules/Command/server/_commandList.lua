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

    GM.Command:register({
        name = "revive",
        label = "Réanimer",
        description = "Réanimer une personne",
    }, function(playerSrc, args)
        if (playerSrc == 0) then
            local targetSelected = ESX.GetPlayerFromId(args[1])
            if (not targetSelected) then return end

            if (GM.Ambulance["dead_list"][targetSelected.source] == nil) then
                print("LE JOUEUR N'EST PAS MORT")
                return
            end

            if (GM.Ambulance["calls_list"][targetSelected.source] ~= nil) then
                if (GM.Ambulance["calls_list"][targetSelected.source].taken_src) then
                    TriggerClientEvent("esx:showNotification", GM.Ambulance["calls_list"][targetSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient à été réanimer par un staff.")
                end
                GM.Ambulance["calls_list"][targetSelected.source] = nil
        
                local ambulanceList = GM.Service:getPeopleService("ambulance")
            
                for ambulanceSrc, _ in pairs(ambulanceList) do
                    TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", targetSelected.source)
                end
            end
        
            if (GM.Ambulance["dead_list"][targetSelected.source] ~= nil) then
                GM.Ambulance["dead_list"][targetSelected.source] = nil
            end
        
            targetSelected.setDead(false)
            targetSelected.showNotification("~b~Vous avez été réanimer par un staff.")  

            print("LE JOUEUR A BIEN ÉTÉ REVIVE")
        
            TriggerClientEvent("Ambulance:revivePlayer", targetSelected.source)
        else
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local targetSelected = ESX.GetPlayerFromId(args[1])
            if (not targetSelected) then return end

            if (GM.Ambulance["dead_list"][targetSelected.source] == nil) then
                playerSelected.showNotification("~r~Ce joueur n'est pas mort.")
                return
            end

            if (GM.Ambulance["calls_list"][targetSelected.source] ~= nil) then
                if (GM.Ambulance["calls_list"][targetSelected.source].taken_src) then
                    TriggerClientEvent("esx:showNotification", GM.Ambulance["calls_list"][targetSelected.source].taken_src, "~r~L'appel en cours à été annulé le patient à été réanimer par un staff.")
                end
                GM.Ambulance["calls_list"][targetSelected.source] = nil
        
                local ambulanceList = GM.Service:getPeopleService("ambulance")
            
                for ambulanceSrc, _ in pairs(ambulanceList) do
                    TriggerClientEvent("Ambulance:removeValue", ambulanceSrc, "calls", targetSelected.source)
                end
            end
        
            if (GM.Ambulance["dead_list"][targetSelected.source] ~= nil) then
                GM.Ambulance["dead_list"][targetSelected.source] = nil
            end
        
            targetSelected.setDead(false)
            targetSelected.showNotification("~b~Vous avez été réanimer par un staff.")  
            playerSelected.showNotification("~b~Vous avez réanimer "..targetSelected.getName()..".")
        
            TriggerClientEvent("Ambulance:revivePlayer", targetSelected.source)
        end
    end)
end)