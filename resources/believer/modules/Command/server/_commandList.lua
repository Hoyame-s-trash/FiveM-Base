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

            if (not args[1]) then
                args[1] = playerSrc
            end

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

    GM.Command:register({
        name = "noclip",
        label = "Noclip",
        description = "Permet de passer en mode noclip",
        keys = {"keyboard", "O"}
    }, function(playerSrc)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        if (GM.Admin.inAdmin[playerSelected.source] == nil) then
            playerSelected.showNotification("~r~Vous n'êtes pas en mode admin.")
            return
        end

        if (playerSelected.get("noclip") == false) then
            playerSelected.set("noclip", true)
            playerSelected.showNotification("~b~Vous avez activé le mode noclip.")
        else
            playerSelected.set("noclip", false)
            playerSelected.showNotification("~b~Vous avez désactivé le mode noclip.")
        end

        TriggerClientEvent("Admin:noClip", playerSrc)
    end)

    GM.Command:register({
        name = "enterprises",
        label = "Ouvrir le menu des entreprises",
        description = "Permet d'ouvrir le menu des entreprises",
    }, function(playerSrc)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        TriggerClientEvent("EnterpriseManagement:openMenu", playerSrc)
    end)

    GM.Command:register({
        name = "ranks",
        label = "Rangs",
        description = "Permet de gérer les rangs",
    }, function(playerSrc)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        TriggerClientEvent("Ranks:openMenu", playerSrc)
    end)

    GM.Command:register({
        name = "setcoords",
        label = "Se téléporter à une position",
        description = "Permet de se téléporter à une position",
    }, function(playerSrc, args)
        if (playerSrc == 0) then return end

        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local position = vector3(tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))
	    if (not position) then return end

        playerSelected.setCoords(position)
    end)

    GM.Command:register({
        name = "bring",
        label = "Téléporter une personne à soi",
        description = "Permet de téléporter une personne à soi",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local playerPosition = playerSelected.getCoords(true)
        if (not playerPosition) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        targetSelected.set("last_position", targetSelected.getCoords(true))

        if (targetSelected.get("noclip") == true) then
            TriggerClientEvent("Admin:setCameraCoords", targetSelected.source, playerPosition)
        else
            targetSelected.setCoords(playerPosition)
        end
    end)

    GM.Command:register({
        name = "bringback",
        label = "Téléporter une personne à sa dernière position",
        description = "Permet de téléporter une personne à sa dernière position",
    }, function(playerSrc, args)
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        local lastPosition = targetSelected.get("last_position")

        if (targetSelected.get("noclip") == true) then
            TriggerClientEvent("Admin:setCameraCoords", targetSelected.source, lastPosition)
        else
            targetSelected.setCoords(lastPosition)
        end
    end)

    GM.Command:register({
        name = "goto",
        label = "Se téléporter à une personne",
        description = "Permet de se téléporter à une personne",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        local targetPosition = targetSelected.getCoords(true)

        if (playerSelected.get("noclip") == true) then
            TriggerClientEvent("Admin:setCameraCoords", playerSelected.source, targetPosition)
        else
            playerSelected.setCoords(targetPosition)
        end
    end)

    GM.Command:register({
        name = "kick",
        label = "Expulser une personne",
        description = "Permet d'expulser une personne du serveur",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        local kickReason = table.concat(args, " ", 2)

        targetSelected.kick("Vous avez été kick de BlueStark !\n"..kickReason)
    end)

    GM.Command:register({
        name = "ban",
        label = "Ban un joueur",
        description = "Permet de bannir temporairement ou définitivement une personne.",
    }, function(playerSrc, args)
        if (not args[1] or not args[2] or not args[3]) then
            return
        end

        local targetPlayer = tonumber(args[1]) or args[1]
        local reason = table.concat(args, " ", 3)
        
        local finishTimer
        if (tonumber(args[2]) == 0) then
            finishTimer = -1
        else
            finishTimer = (os.time() + (tonumber(args[2]) * 60)) * 1000
        end

        print(reason)
        print(finishTimer)
    
        if (type(targetPlayer) == "number") then
            local selectedPlayer = ESX.GetPlayerFromId(targetPlayer)
            if (not selectedPlayer) then
                return
            end
            
            selectedPlayer.ban(reason, finishTimer, GetPlayerName(playerSrc))
        else
            GM.Connecting:ban(targetPlayer, {
                reason = reason,
                expiration = finishTimer or -1,
                author = GetPlayerName(playerSrc)
            })
        end
    end)

    GM.Command:register({
        name = "unban",
        label = "Unban un joueur",
        description = "Permet de débannir une personne.",
    }, function(playerSrc, args)
        if (playerSrc == 0) then
            if (not args[1]) then
                return
            end
        
            GM.Connecting:unban(playerSrc, args[1])
        else
            if (not args[1]) then
                return
            end
        
            GM.Connecting:unban(playerSrc, args[1])
        end
    end)

    GM.Command:register({
        name = "car",
        label = "Faire apparaître un véhicule",
        description = "Permet de faire apparaître un véhicule",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local vehicleName = args[1]
        local upgrades = {
            plate = "ADMINCAR", 
            modEngine = 3,
            modBrakes = 2,
            modTransmission = 2,
            modSuspension = 3,
            modArmor = true,
            windowTint = 1,
        }

        local playerPed = playerSelected.getPed()
        if (not playerPed) then return end

        local playerPosition = playerSelected.getCoords(true)
        if (not playerPosition) then return end

        ESX.OneSync.SpawnVehicle(vehicleName, playerPosition - vector3(0,0, 0.9), GetEntityHeading(playerPed), upgrades, function(networkId)
            local vehicle = NetworkGetEntityFromNetworkId(networkId)
            Wait(250)
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        end)
    end)

    GM.Command:register({
        name = "dv",
        label = "Supprimer le véhicule",
        description = "Permet de supprimer des véhicules",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local playerPed = playerSelected.getPed()
        if (not playerPed) then return end

        local playerVehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(playerVehicle) then
            DeleteEntity(playerVehicle)
        end

        local allVehicles = ESX.OneSync.GetVehiclesInArea(GetEntityCoords(playerPed), tonumber(args[1]) or 5.0)
        for i = 1, #allVehicles do 
            local currentVehicle = NetworkGetEntityFromNetworkId(allVehicles[i])

            if DoesEntityExist(currentVehicle) then
                DeleteEntity(currentVehicle)
            end
        end
    end)

    GM.Command:register({
        name = "msg",
        label = "Envoyer un message à un joueur",
        description = "Permet d'envoyer un message à un joueur",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        local message = table.concat(args, " ", 2)
        targetSelected.showAdvancedNotification("BlueStark", '~b~ADMIN '..playerSelected.getName(), message, "bluestark")
    end)

    GM.Command:register({
        name = "setgroup",
        label = "Changer le rank d'un joueur",
        description = "Permet de changer le rank d'un joueur",
    }, function(playerSrc, args)
        if (playerSrc == 0) then
            local selectedRank = GM.Ranks:getFromName(args[2])
            if (not selectedRank) then return end

            local targetPlayer = tonumber(args[1]) or args[1]

            if (type(targetPlayer) == "number") then
                local selectedPlayer = ESX.GetPlayerFromId(targetPlayer)
                if (not selectedPlayer) then
                    return
                end

                local targetIdentifier = selectedPlayer.getIdentifier()
                if (not targetIdentifier) then return end

                if (GM.Ranks["players"][targetIdentifier]) then return end

                GM.Ranks["players"][targetIdentifier] = {
                    rankId = selectedRank.id,
                    name = selectedRank.name,
                    reports = 0,
                    staffName = selectedPlayer.getName()
                }

                selectedRank.players[targetIdentifier] = {
                    name = selectedPlayer.getName(),
                    arrival_date = os.date("%d-%m-%Y %H:%M:%S"),
                    reports = 0
                }

                MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
                    json.encode(selectedRank.players), 
                    selectedRank.id
                }, function()
                    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                        TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
                    end
                end)
            else
                local targetIdentifier = args[1]

                if (GM.Ranks["players"][targetIdentifier]) then return end

                GM.Ranks["players"][targetIdentifier] = {
                    rankId = selectedRank.id,
                    name = selectedRank.name,
                    reports = 0,
                    staffName = targetIdentifier
                }

                selectedRank.players[targetIdentifier] = {
                    name = targetIdentifier,
                    arrival_date = os.date("%d-%m-%Y %H:%M:%S"),
                    reports = 0
                }

                MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
                    json.encode(selectedRank.players), 
                    selectedRank.id
                }, function()
                    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                        TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
                    end
                end)
            end
        else
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            if (playerSelected.getGroup() == "user") then return end

            local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
            if (not selectedRank) then return end

            if (not selectedRank:getPermissionsValue("RECRUIT_PLAYER_RANKS", playerSelected.source)) then return end

            if (not selectedRank:canInteract(args[2])) then return playerSelected.showNotification("~r~Vous ne pouvez pas recruter un joueur dans un rank plus haut que vous.") end

            local selectedRank = GM.Ranks:getFromName(args[2])
            if (not selectedRank) then return end

            local targetPlayer = tonumber(args[1]) or args[1]

            if (type(targetPlayer) == "number") then
                local selectedPlayer = ESX.GetPlayerFromId(targetPlayer)
                if (not selectedPlayer) then
                    return
                end

                local targetIdentifier = selectedPlayer.getIdentifier()
                if (not targetIdentifier) then return end

                if (GM.Ranks["players"][targetIdentifier]) then return end

                GM.Ranks["players"][targetIdentifier] = {
                    rankId = selectedRank.id,
                    name = selectedRank.name,
                    reports = 0,
                    staffName = selectedPlayer.getName()
                }

                selectedRank.players[targetIdentifier] = {
                    name = targetSelected.getName(),
                    arrival_date = os.date("%d-%m-%Y %H:%M:%S"),
                    reports = 0
                }

                MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
                    json.encode(selectedRank.players), 
                    selectedRank.id
                }, function()
                    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                        TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
                    end
                end)
            else
                local targetIdentifier = args[1]

                if (GM.Ranks["players"][targetIdentifier]) then return end

                GM.Ranks["players"][targetIdentifier] = {
                    rankId = selectedRank.id,
                    name = selectedRank.name,
                    reports = 0,
                    staffName = targetIdentifier
                }

                selectedRank.players[targetIdentifier] = {
                    name = targetIdentifier,
                    arrival_date = os.date("%d-%m-%Y %H:%M:%S"),
                    reports = 0
                }

                MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
                    json.encode(selectedRank.players), 
                    selectedRank.id
                }, function()
                    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                        TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
                    end
                end)
            end
        end
    end)

    GM.Command:register({
        name = "removegroup",
        label = "Retirer le rank d'un joueur",
        description = "Permet de retirer le rank d'un joueur",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local playerIdentifier = args[1]

        if (GM.Ranks["players"][playerIdentifier] == nil) then return playerSelected.showNotification("~r~Cet identifiant n'est pas un staff.") end

        local selectedRank = GM.Ranks:getFromId(GM.Ranks["players"][playerIdentifier].rankId)
        if (not selectedRank) then return end

        if (not selectedRank.players[playerIdentifier]) then return end

        local playerRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
        if (not playerRank) then return end

        if (not playerRank:getPermissionsValue("KICK_PLAYER_RANKS", playerSelected.source)) then return end

        if (not playerRank:canInteract(GM.Ranks["players"][playerIdentifier].rankId)) then return playerSelected.showNotification("~r~Vous ne pouvez pas kick un staff plus haut que vous.") end

        local selectedPlayer = ESX.GetPlayerFromIdentifier(playerIdentifier)

        selectedRank.players[playerIdentifier] = nil
        GM.Ranks["players"][playerIdentifier] = nil

        MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
            json.encode(selectedRank.players), 
            selectedRank.id
        }, function()
            if (selectedPlayer) then
                selectedPlayer:setMetadata("rank_id", GM.Ranks["rank_user"])
                selectedPlayer:setMetadata("rank", "user")
            end
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
            end
        end)
    end)

    GM.Command:register({
        name = "report",
        label = "Contacter l'équipe de modération",
        description = "Permet d'envoyer un message à un joueur",
    }, function(playerSrc, args)
        if (playerSrc == 0) then return end

        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local reason = table.concat(args, " ", 1)

        GM.Admin.Reports:new(nil, playerSrc, playerSelected.getName(), reason)
    end)

    GM.Command:register({
        name = "closereport",
        label = "Fermer son report actuel",
        description = "Permet de fermer son report actuel",
    }, function(playerSrc)
        if (playerSrc == 0) then return end

        if (GM.Admin.Reports["player"][playerSrc]) then
            if GM.Admin.Reports["close_report"][playerSrc] then
                TriggerClientEvent("esx:showNotification", playerSrc, "~b~Votre report à bien été fermé.")
                GM.Admin.Reports["list"][GM.Admin.Reports["player"][playerSrc]] = nil
                
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:removeValue", adminSrc, "reports", GM.Admin.Reports["player"][playerSrc])
                end
        
                GM.Admin.Reports["player"][playerSrc] = nil
            else
                TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous devez attendre 10 minutes avant de pouvoir fermer votre report.")
                return
            end
        else
            TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous n'avez pas de report en cours.")
            return
        end
    end)
end)