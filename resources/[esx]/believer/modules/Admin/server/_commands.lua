GM:newThread(function()
    while (GM.Command == nil) do
        Wait(50)
    end

    GM.Command:register({
        name = "admin",
        label = "Ouvrir le menu d'administration",
        description = "Permet d'ouvrir le menu d'administration",
        keys = {"keyboard", "F10"},
    }, function(playerSrc)
        TriggerClientEvent("Admin:openMenu", playerSrc)
    end)

    GM.Command:register({
        name = "noclip",
        label = "Activer le noclip",
        description = "Permet d'activer le noclip",
        keys = {"keyboard", "O"},
    }, function(playerSrc)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        if (playerSelected.get("noclip") == true) then
            playerSelected.set("noclip", false)
        else
            playerSelected.set("noclip", true)
        end

        TriggerClientEvent("Admin:noClip", playerSrc)
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
        if (playerSrc == 0) then
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
        
            if (type(targetPlayer) == "number") then
                local selectedPlayer = ESX.GetPlayerFromId(targetPlayer)
                if (not selectedPlayer) then
                    return
                end
                
                selectedPlayer.ban(reason, finishTimer, "Console")
            else
                GM.Connecting:ban(targetPlayer, {
                    reason = reason,
                    expiration = finishTimer or -1,
                    author = "Console"
                })
            end
        else
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
        name = "giveitem",
        label = "Donner un item à un joueur",
        description = "Permet de donner un item à un joueur",
    }, function(playerSrc, args)
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        local item = args[2]
        local count = tonumber(args[3])

        if (not item or not count) then return end

        targetSelected.addInventoryItem(item, count)
    end)

    GM.Command:register({
        name = "giveweapon",
        label = "Donner une arme à un joueur",
        description = "Permet de donner une arme à un joueur",
    }, function(playerSrc, args)
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        local weaponName = args[2]
        local ammoCount = tonumber(args[3])

        if (not weaponName or not ammoCount) then return end

        targetSelected.addWeapon(weaponName, ammoCount)
    end)

    GM.Command:register({
        name = "giveaccount",
        label = "Donner de l'argent à un joueur",
        description = "Permet de donner de l'argent à un joueur",
    }, function(playerSrc, args)
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        local accountName = args[2]
        local accountAmount = tonumber(args[3])

        if (not accountName or not accountAmount) then return end

        targetSelected.addAccountMoney(accountName, accountAmount)
    end)
end)