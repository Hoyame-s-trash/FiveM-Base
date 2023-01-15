GM.Command = GM.Command or {}

GM.Command.List = {}

GM.Command.Callback = {}

function GM.Command:register(commandData, func)
    if (not func or type(func) ~= "function") then return end
    
    if (not GM.Command.List[commandData.name]) then
        GM.Command.List[commandData.name] = {
            name = commandData.name,
            label = commandData.label,
            description = commandData.description,
            keys = commandData.keys or nil,
        }
        GM.Command.Callback[commandData.name] = func
        TriggerClientEvent("chat:addSuggestion", -1, "/"..commandData.name, commandData.description, {})
    end

    RegisterCommand(commandData.name, function(source, args)
        if (source ~= 0) then
            -- local playerSelected = GM.Player:getFromSource(source)
            -- if (not playerSelected) then return end

            -- local playerRank = GM.Admin.Ranks:getFromId(playerSelected:getMetadata("rank_id"))
            -- if (not playerRank) then return end

            -- if (not playerRank:getCommandValue(commandData.name, playerSelected.source)) then return end

			-- Todo check if player got enough permissions to execute this command
        end
        func(source, args)
    end)
end

function GM.Command:getCommandsKeys()
    local commandsKeys = {}
    for commandName, commandValues in pairs(GM.Command.List) do
        if (commandValues.keys) then
            commandsKeys[commandName] = commandValues
        end
    end
    return commandsKeys
end

RegisterNetEvent("Believer:command:execute", function(commandName, commandArgs)
    local playerSrc = source
    if (not playerSrc) then return end

    -- local playerSelected = GM.Player:getFromSource(playerSrc)
    -- if (not playerSelected) then return end

    if (not commandName or not GM.Command.List[commandName]) then return end

    -- local playerRank = GM.Admin.Ranks:getFromId(playerSelected:getMetadata("rank_id"))
    -- if (not playerRank) then return end

    -- if (not playerRank:getCommandValue(commandName, playerSrc)) then return end

	-- Todo check if player got enough permissions to execute this command

    GM.Command.Callback[commandName](playerSrc, table.unpack(commandArgs or {}))
end)

AddEventHandler("esx:playerLoaded", function(playerSrc)
    if (not playerSrc) then return end

    local keysCommands = GM.Command:getCommandsKeys()
    if (not keysCommands) then return end

    for commandName, commandValues in pairs(keysCommands) do
        TriggerClientEvent("Believer:command:keyMapping", playerSrc, commandValues)
    end
end)

GM.Command:register({
    name = "car",
    label = "Faire apparaître un véhicule",
    description = "Permet de faire apparaître un véhicule",
}, function(playerSrc, args)
    if (playerSrc) == 0 then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

	local coords = playerSelected.getCoords(true)
	local PlayerPed = GetPlayerPed(playerSelected.source)
	ESX.OneSync.SpawnVehicle(args[1], coords - vector3(0,0, 0.9), GetEntityHeading(PlayerPed), {}, function(networkId)
		local vehicle = NetworkGetEntityFromNetworkId(networkId)
		Wait(250)
		TaskWarpPedIntoVehicle(PlayerPed, vehicle, -1)
        playerSelected.showNotification("Véhicule ~g~"..args[1].."~s~ apparu.")
	end)
end)

GM.Command:register({
    name = "creator",
    label = "Ouvrir le menu du créateur",
    description = "Permet d'ouvrir le menu du créateur",
}, function(playerSrc)
    TriggerClientEvent("Believer:creator:openMenu", playerSrc)
end)

GM.Command:register({
    name = "setcoords",
    label = "Se téléporter à des coordonnées",
    description = "Permet de se téléporter à des coordonnées",
}, function(playerSrc, args)
    if (playerSrc) == 0 then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    playerSelected.setCoords({x = args[1], y = args[2], z = args[3]})
end)

GM.Command:register({
    name = "setjob",
    label = "Changer de métier",
    description = "Permet de changer de métier",
}, function(playerSrc, args)
    if (playerSrc == 0) then
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        if (ESX.DoesJobExist(args[2], args[3])) then
            targetSelected.setJob(args[2], args[3])
            print("Le métier de ~g~"..targetSelected.getName().."~s~ a été changé en ~g~"..args[2].."~s~.")
        else
            print("Le métier ~r~"..args[2].."~s~ n'existe pas.")
            return
        end
    else
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        if (ESX.DoesJobExist(args[2], args[3])) then
            targetSelected.setJob(args[2], args[3])
            playerSelected.showNotification("Le métier de ~g~"..targetSelected.getName().."~s~ a été changé en ~g~"..args[2].."~s~.")
        else
            playerSelected.showNotification("Le métier ~r~"..args[2].."~s~ n'existe pas.")
            return
        end
    end
end)

GM.Command:register({
    name = "cardel",
    label = "Supprimer des véhicules",
    description = "Permet de supprimer des véhicules",
}, function(playerSrc, args)
    if (playerSrc == 0) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerVehicle = GetVehiclePedIsIn(GetPlayerPed(playerSelected.source), false)
	if DoesEntityExist(playerVehicle) then
		DeleteEntity(playerVehicle)
	end

	local vehicles = ESX.OneSync.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(playerSelected.source)), tonumber(args[1]) or 5.0)

	for i=1, #vehicles do 
		local currentVehicle = NetworkGetEntityFromNetworkId(vehicles[i])
		if DoesEntityExist(currentVehicle) then
			DeleteEntity(currentVehicle)
		end
	end
end)

GM.Command:register({
    name = "setaccountmoney",
    label = "Definir de l'argent sur un compte",
    description = "Permet de definir de l'argent sur un compte",
}, function(playerSrc, args)
    if (playerSrc == 0) then
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        if (targetSelected.getAccount(args[2])) then
            targetSelected.setAccountMoney(args[2], args[3])
            print("L'argent du compte ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été modifié.")
        else
            print("Le compte ~r~"..args[2].."~s~ n'existe pas.")
            return
        end
    else
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        if (targetSelected.getAccount(args[2])) then
            targetSelected.setAccountMoney(args[2], args[3])
            playerSelected.showNotification("L'argent du compte ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été modifié.")
        else
            playerSelected.showNotification("Le compte ~r~"..args[2].."~s~ n'existe pas.")
            return
        end
    end
end)

GM.Command:register({
    name = "giveaccountmoney",
    label = "Ajouter de l'argent sur un compte",
    description = "Permet d'ajouter de l'argent sur un compte",
}, function(playerSrc, args)
    if (playerSrc == 0) then
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        if (targetSelected.getAccount(args[2])) then
            targetSelected.addAccountMoney(args[2], args[3])
            print("L'argent du compte ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été modifié.")
        else
            print("Le compte ~r~"..args[2].."~s~ n'existe pas.")
            return
        end
    else
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        if (targetSelected.getAccount(args[2])) then
            targetSelected.addAccountMoney(args[2], args[3])
            playerSelected.showNotification("L'argent du compte ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été modifié.")
        else
            playerSelected.showNotification("Le compte ~r~"..args[2].."~s~ n'existe pas.")
            return
        end
    end
end)

GM.Command:register({
    name = "giveitem",
    label = "Ajouter un item",
    description = "Permet d'ajouter un item",
}, function(playerSrc, args)
    if (playerSrc == 0) then
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        targetSelected.addInventoryItem(args[2], args[3])
        print("L'item ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été ajouté.")
    else
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        targetSelected.addInventoryItem(args[2], args[3])
        playerSelected.showNotification("L'item ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été ajouté.")
    end
end)

GM.Command:register({
    name = "giveweapon",
    label = "Ajouter une arme",
    description = "Permet d'ajouter une arme",
}, function(playerSrc, args)
    if (playerSrc == 0) then
        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end


        if (targetSelected.hasWeapon(args[2])) then
            print("Le joueur possède déjà cette arme.")
            return
        else
            targetSelected.addWeapon(args[2], args[3])
            print("L'arme ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été ajouté.")
        end
    else
        local playerSelected = ESX.GetPlayerFromId(playerSrc)
        if (not playerSelected) then return end

        local targetSelected = ESX.GetPlayerFromId(args[1])
        if (not targetSelected) then return end

        if (targetSelected.hasWeapon(args[2])) then
            playerSelected.showNotification("Le joueur possède déjà cette arme.")
            return
        else
            targetSelected.addWeapon(args[2], args[3])
            playerSelected.showNotification("L'arme ~g~"..args[2].."~s~ de ~g~"..targetSelected.getName().."~s~ a été ajouté.")
        end
    end
end)



-- 	ESX.RegisterCommand('giveammo', 'admin', function(xPlayer, args, showError)
-- 		if args.playerId.hasWeapon(args.weapon) then
-- 			args.playerId.addWeaponAmmo(args.weapon, args.ammo)   
-- 		else
-- 			showError(TranslateCap("command_giveammo_noweapon_found"))
-- 		end
-- 	end, true, {help = TranslateCap('command_giveweapon'), validate = false, arguments = {
-- 		{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'},
-- 		{name = 'weapon', help = TranslateCap('command_giveammo_weapon'), type = 'weapon'},
-- 		{name = 'ammo', help = TranslateCap('command_giveammo_ammo'), type = 'number'}
-- 	}})

-- 	ESX.RegisterCommand('giveweaponcomponent', 'admin', function(xPlayer, args, showError)
-- 		if args.playerId.hasWeapon(args.weaponName) then
-- 			local component = ESX.GetWeaponComponent(args.weaponName, args.componentName)

-- 			if component then
-- 				if args.playerId.hasWeaponComponent(args.weaponName, args.componentName) then
-- 					showError(TranslateCap('command_giveweaponcomponent_hasalready'))
-- 				else
-- 					args.playerId.addWeaponComponent(args.weaponName, args.componentName)
-- 				end
-- 			else
-- 				showError(TranslateCap('command_giveweaponcomponent_invalid'))
-- 			end
-- 		else
-- 			showError(TranslateCap('command_giveweaponcomponent_missingweapon'))
-- 		end
-- 	end, true, {help = TranslateCap('command_giveweaponcomponent'), validate = true, arguments = {
-- 		{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'},
-- 		{name = 'weaponName', help = TranslateCap('command_giveweapon_weapon'), type = 'weapon'},
-- 		{name = 'componentName', help = TranslateCap('command_giveweaponcomponent_component'), type = 'string'}
-- 	}})

-- ESX.RegisterCommand({'clear', 'cls'}, 'user', function(xPlayer, args, showError)
-- 	xPlayer.triggerEvent('chat:clear')
-- end, false, {help = TranslateCap('command_clear')})

-- ESX.RegisterCommand({'clearall', 'clsall'}, 'admin', function(xPlayer, args, showError)
-- 	TriggerClientEvent('chat:clear', -1)
-- end, true, {help = TranslateCap('command_clearall')})

-- ESX.RegisterCommand("refreshjobs", 'admin', function(xPlayer, args, showError)
-- 	ESX.RefreshJobs()
-- end, true, {help = TranslateCap('command_clearall')})

-- 	ESX.RegisterCommand('clearinventory', 'admin', function(xPlayer, args, showError)
-- 		for k,v in ipairs(args.playerId.inventory) do
-- 			if v.count > 0 then
-- 				args.playerId.setInventoryItem(v.name, 0)
-- 			end
-- 		end
-- 		TriggerEvent('esx:playerInventoryCleared',args.playerId)
-- 	end, true, {help = TranslateCap('command_clearinventory'), validate = true, arguments = {
-- 		{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- 	}})

-- 	ESX.RegisterCommand('clearloadout', 'admin', function(xPlayer, args, showError)
-- 		for i=#args.playerId.loadout, 1, -1 do
-- 			args.playerId.removeWeapon(args.playerId.loadout[i].name)
-- 		end
-- 		TriggerEvent('esx:playerLoadoutCleared',args.playerId)
-- 	end, true, {help = TranslateCap('command_clearloadout'), validate = true, arguments = {
-- 		{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- 	}})

-- ESX.RegisterCommand('setgroup', 'admin', function(xPlayer, args, showError)
-- 	if not args.playerId then args.playerId = xPlayer.source end
-- 	if args.group == "superadmin" then args.group = "admin" print("[^3WARNING^7] ^5Superadmin^7 detected, setting group to ^5admin^7") end
-- 	args.playerId.setGroup(args.group)
-- end, true, {help = TranslateCap('command_setgroup'), validate = true, arguments = {
-- 	{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'},
-- 	{name = 'group', help = TranslateCap('command_setgroup_group'), type = 'string'},
-- }})

-- ESX.RegisterCommand('save', 'admin', function(xPlayer, args, showError)
-- 	Core.SavePlayer(args.playerId)
-- 	print("[^2Info^0] Saved Player - ^5".. args.playerId.source .. "^0")
-- end, true, {help = TranslateCap('command_save'), validate = true, arguments = {
-- 	{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- }})

-- ESX.RegisterCommand('saveall', 'admin', function(xPlayer, args, showError)
-- 	Core.SavePlayers()
-- end, true, {help = TranslateCap('command_saveall')})

-- ESX.RegisterCommand('group', {"user", "admin"}, function(xPlayer, args, showError)
-- 	print(xPlayer.getName()..", You are currently: ^5".. xPlayer.getGroup() .. "^0")
-- end, true)

-- ESX.RegisterCommand('job', {"user", "admin"}, function(xPlayer, args, showError)
-- 	print(xPlayer.getName()..", You are currently: ^5".. xPlayer.getJob().name.. "^0 - ^5".. xPlayer.getJob().grade_label .. "^0")
-- end, true)

-- ESX.RegisterCommand('info', {"user", "admin"}, function(xPlayer, args, showError)
-- 	local job = xPlayer.getJob().name
-- 	local jobgrade = xPlayer.getJob().grade_name
-- 	print("^2ID : ^5"..xPlayer.source.." ^0| ^2Name:^5"..xPlayer.getName().." ^0 | ^2Group:^5"..xPlayer.getGroup().."^0 | ^2Job:^5".. job.."^0")
-- end, true)

-- ESX.RegisterCommand('coords', "admin", function(xPlayer, args, showError)
--     local ped = GetPlayerPed(xPlayer.source)
-- 	local coords = GetEntityCoords(ped, false)
-- 	local heading = GetEntityHeading(ped)
-- 	print("Coords - Vector3: ^5".. vector3(coords.x,coords.y,coords.z).. "^0")
-- 	print("Coords - Vector4: ^5".. vector4(coords.x, coords.y, coords.z, heading) .. "^0")
-- end, true)

-- ESX.RegisterCommand('tpm', "admin", function(xPlayer, args, showError)
-- 	xPlayer.triggerEvent("esx:tpm")
-- end, true)

-- ESX.RegisterCommand('goto', "admin", function(xPlayer, args, showError)
-- 	local targetCoords = args.playerId.getCoords()
-- 	xPlayer.setCoords(targetCoords)
-- end, true, {help = TranslateCap('command_goto'), validate = true, arguments = {
-- 	{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- }})

-- ESX.RegisterCommand('bring', "admin", function(xPlayer, args, showError)
-- 	local playerCoords = xPlayer.getCoords()
-- 	args.playerId.setCoords(playerCoords)
-- end, true, {help = TranslateCap('command_bring'), validate = true, arguments = {
-- 	{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- }})

-- ESX.RegisterCommand('kill', "admin", function(xPlayer, args, showError)
-- 	args.playerId.triggerEvent("esx:killPlayer")
-- end, true, {help = TranslateCap('command_kill'), validate = true, arguments = {
-- 	{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- }})

-- ESX.RegisterCommand('freeze', "admin", function(xPlayer, args, showError)
-- 	args.playerId.triggerEvent('esx:freezePlayer', "freeze")
-- end, true, {help = TranslateCap('command_freeze'), validate = true, arguments = {
-- 	{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- }})

-- ESX.RegisterCommand('unfreeze', "admin", function(xPlayer, args, showError)
-- 	args.playerId.triggerEvent('esx:freezePlayer', "unfreeze")
-- end, true, {help = TranslateCap('command_unfreeze'), validate = true, arguments = {
-- 	{name = 'playerId', help = TranslateCap('commandgeneric_playerid'), type = 'player'}
-- }})

-- ESX.RegisterCommand("noclip", 'admin', function(xPlayer, args, showError)
-- 	xPlayer.triggerEvent('esx:noclip')
-- end, false)

-- ESX.RegisterCommand('players', "admin", function(xPlayer, args, showError)
-- 	local xPlayers = ESX.GetExtendedPlayers() -- Returns all xPlayers
-- 	print("^5"..#xPlayers.." ^2online player(s)^0")
-- 	for i=1, #(xPlayers) do 
-- 		local xPlayer = xPlayers[i]
-- 		print("^1[ ^2ID : ^5"..xPlayer.source.." ^0| ^2Name : ^5"..xPlayer.getName().." ^0 | ^2Group : ^5"..xPlayer.getGroup().." ^0 | ^2Identifier : ^5".. xPlayer.identifier .."^1]^0\n")
-- 	end
-- end, true)