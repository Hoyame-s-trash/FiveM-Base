ESX = exports["believer"]:getSharedObject()

Citizen.CreateThread(function()
	while ESX == nil do 
		Citizen.Wait(100)
	end
	Wait(1000)
	SendNUIMessage({
		type = "setJs", 
		vehicles = Boutique.Vehicles,
		motos = Boutique.Motos,
		categories = Boutique.Categories,
		weapons = Boutique.Weapons,
		moneys = Boutique.Money,
		packs = Boutique.Packs,
		customPlatePrice = Boutique.CustomPlatePriceOnBuyVehicle,
		minCharForPhone = Boutique.MinCharForPhoneNumber,
		minCharForPlate = Boutique.MinCharForPlate,
		maxCharForPhone = Boutique.MaxCharForPhoneNumber,
		maxCharForPlate = Boutique.MaxCharForPlate,
		language = Boutique.Translate,
	})	
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    SendNUIMessage({
		type = "setJs", 
		vehicles = Boutique.Vehicles,
		motos = Boutique.Motos,
		categories = Boutique.Categories,
		weapons = Boutique.Weapons,
		moneys = Boutique.Money,
		packs = Boutique.Packs,
		customPlatePrice = Boutique.CustomPlatePriceOnBuyVehicle,
		minCharForPhone = Boutique.MinCharForPhoneNumber,
		minCharForPlate = Boutique.MinCharForPlate,
		maxCharForPhone = Boutique.MaxCharForPhoneNumber,
		maxCharForPlate = Boutique.MaxCharForPlate,
		language = Boutique.Translate,
	})
end)

local openMenuSpamProtect = 0
RegisterKeyMapping("shop", "Ouvrir la boutique", "keyboard", "F1")
RegisterCommand("shop", function()
	if openMenuSpamProtect <= GetGameTimer() then 
		openMenuSpamProtect = GetGameTimer() + 1000
		ESX.TriggerServerCallback("Boutique:getPlayerDetails", function(result)
			SetNuiFocus(true,true)
			SendNUIMessage({
				type = "openUi", 
				currentCredit = result.playerData.credit,
				firstName = result.charInfo,
				lastName = "",
			})	
		end)
	else
		Boutique.ClientNotify(Boutique.Translate.openSpam, "error")
	end
end)

RegisterNUICallback("openCaseSystem", function()
    ExecuteCommand("cases")
end)

local sendInputSpamProtect = 0
RegisterNUICallback("sendInput", function(data, cb)
	if sendInputSpamProtect <= GetGameTimer() then
		sendInputSpamProtect = GetGameTimer() + 2000 
		ESX.TriggerServerCallback("Boutique:sendInput", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		Boutique.ClientNotify(Boutique.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getVehicleSpamProtect = 0
RegisterNUICallback("getVehicle", function(data, cb)
	if getVehicleSpamProtect <= GetGameTimer() then
		getVehicleSpamProtect = GetGameTimer() + 2000
		ESX.TriggerServerCallback("Boutique:getVehicle", function(result)
			if result == true then 	
				cb(true)
			else
				cb(Boutique.Translate.errorDuringPurchase)
			end
		end, data)
	else
		Boutique.ClientNotify(Boutique.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getWeaponSpamProtect = 0
RegisterNUICallback("getWeapon", function(data, cb)
	if getWeaponSpamProtect <= GetGameTimer() then
		getWeaponSpamProtect = GetGameTimer() + 2000
		ESX.TriggerServerCallback("ak4y-donateSystem:getWeapon", function(result)
			if result then 	
				cb(true)
			else
				cb(Boutique.Translate.errorDuringPurchase)
			end
		end, data)
	else
		Boutique.ClientNotify(Boutique.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getItemSpamProtect = 0
RegisterNUICallback("getItem", function(data, cb)
	if getItemSpamProtect <= GetGameTimer() then
		getItemSpamProtect = GetGameTimer() + 2000
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:getItem", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		Boutique.ClientNotify(Boutique.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getMoneySpamProtect = 0
RegisterNUICallback("getMoney", function(data, cb)
	if getMoneySpamProtect <= GetGameTimer() then
		getMoneySpamProtect = GetGameTimer() + 2000
		ESX.TriggerServerCallback("ak4y-donateSystem:getMoney", function(result)
			if result then 	
				cb(true)
			else
				cb(Boutique.Translate.errorDuringPurchase)
			end
		end, data)
	else
		Boutique.ClientNotify(Boutique.Translate.spamNotify, "error")
		cb(false)
	end	
end)

local getCustomPlate = 0
RegisterNUICallback("getCustomPlate", function(data, cb)
	if getCustomPlate <= GetGameTimer() then
		getCustomPlate = GetGameTimer() + 2000
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local veh = GetVehiclePedIsIn(PlayerPedId(), false)
			local oldPlate = GetVehicleNumberPlateText(veh)
			ESX.TriggerServerCallback("ak4y-donateSystem:getCustomPlate", function(result)
				if result then 	
					local newPlate = data.input
					SetVehicleNumberPlateText(veh, data.input)
					if Boutique.GiveAddKeys then 
						Boutique.GiveAddKeysFunction(newPlate)
					end
					cb(true)
				else
					cb(Boutique.Translate.errorDuringPurchase)
				end
			end, data, oldPlate)
		else
			cb(Boutique.Translate.insideVehicle)
		end
	else
		Boutique.ClientNotify(Boutique.Translate.spamNotify, "error")
		cb(false)
	end	
end)

local getPacksSpamProtect = 0
RegisterNUICallback("getPacks", function(data, cb)
	if getPacksSpamProtect <= GetGameTimer() then
		getPacksSpamProtect = GetGameTimer() + 2000
		ESX.TriggerServerCallback("ak4y-donateSystem:getPacks", function(result)
			if result then 	
				cb(true)
			else
				cb(Boutique.Translate.errorDuringPurchase)
			end
		end, data)
	else
		Boutique.ClientNotify(Boutique.Translate.spamNotify, "error")
		cb(false)
	end	
end)

RegisterNUICallback("closeMenu", function(data, cb)
	SetNuiFocus(false, false)
end)

local startTest = false

local isInTest = false

RegisterNUICallback("tryVehicle",function(data, cb)
	-- Todo check if player is in safezone

	if (isInTest == true) then
		ESX.ShowNotification("~r~Vous êtes déjà en test.")
		cb(true)
		return
	end

	lastPlayerCoords = GetEntityCoords(PlayerPedId())
	SetEntityCoords(PlayerPedId(), -2117.638671875,1098.8151855469,-27.99235534668)
	ESX.Game.SpawnVehicle(data.model, vector3(-2103.7111816406,1096.8862304688,-28.036245346069), 269.29, function(entity)
		isInTest = true
		cb(true)
		TaskWarpPedIntoVehicle(PlayerPedId(), entity, -1)
		SetVehicleNumberPlateText(entity, "BOUTIQUE")
		startTest = true
		while startTest do
			Wait(1)
			ESX.ShowHelpNotification("~INPUT_ENTER~ pour quitter.\n~INPUT_DETONATE~ pour afficher le menu custom.")
			if IsControlJustPressed(0, 23) then
				startTest = false
				isInTest = false
				DeleteEntity(entity)
				SetEntityCoords(PlayerPedId(), lastPlayerCoords)
			end
			if IsControlJustPressed(0, 47) then
				ESX.ShowNotification("~r~Vous ne pouvez pas customiser un véhicule en test module non fais.")
			end
		end
	end, false)
end)