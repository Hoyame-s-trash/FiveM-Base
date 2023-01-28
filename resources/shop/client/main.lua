ESX = exports["believer"]:getSharedObject()

Citizen.CreateThread(function()
	while ESX == nil do 
		Citizen.Wait(100)
	end
	Wait(1000)
	SendNUIMessage({
		type = "setJs", 
		vehicles = AK4Y.Vehicles,
		motos = AK4Y.Motos,
		categories = AK4Y.Categories,
		weapons = AK4Y.Weapons,
		moneys = AK4Y.Money,
		packs = AK4Y.Packs,
		customItems = AK4Y.Customize,
		customPlatePrice = AK4Y.CustomPlatePriceOnBuyVehicle,
		minCharForPhone = AK4Y.MinCharForPhoneNumber,
		minCharForPlate = AK4Y.MinCharForPlate,
		maxCharForPhone = AK4Y.MaxCharForPhoneNumber,
		maxCharForPlate = AK4Y.MaxCharForPlate,
		language = AK4Y.Translate,
	})	
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    -- SendNUIMessage({
	-- 	type = "setJs", 
	-- 	vehicles = AK4Y.Vehicles,
	-- 	motos = AK4Y.Motos,
	-- 	categories = AK4Y.Categories,
	-- 	weapons = AK4Y.Weapons,
	-- 	moneys = AK4Y.Money,
	-- 	packs = AK4Y.Packs,
	-- 	customItems = AK4Y.Customize,
	-- 	customPlatePrice = AK4Y.CustomPlatePriceOnBuyVehicle,
	-- 	minCharForPhone = AK4Y.MinCharForPhoneNumber,
	-- 	minCharForPlate = AK4Y.MinCharForPlate,
	-- 	maxCharForPhone = AK4Y.MaxCharForPhoneNumber,
	-- 	maxCharForPlate = AK4Y.MaxCharForPlate,
	-- 	language = AK4Y.Translate,
	-- })
end)

local openMenuSpamProtect = 0
RegisterKeyMapping("shop", "Ouvrir la boutique", "keyboard", "F1")
RegisterCommand("shop", function()
	if openMenuSpamProtect <= GetGameTimer() then 
		openMenuSpamProtect = GetGameTimer() + 1000
		ESX.TriggerServerCallback("ak4y-donateSystem:getPlayerDetails", function(result)
			SetNuiFocus(true,true)
			SendNUIMessage({
				type = "openUi", 
				currentCredit = result.playerData.credit,
				firstName = result.charInfo,
				lastName = "",
			})	
		end)
	else
		AK4Y.ClientNotify(AK4Y.Translate.openSpam, "error")
	end
end)

RegisterNUICallback("openCaseSystem", function()
    ExecuteCommand("caseOpening")
end)

local sendInputSpamProtect = 0
RegisterNUICallback("sendInput", function(data, cb)
	if sendInputSpamProtect <= GetGameTimer() then
		sendInputSpamProtect = GetGameTimer() + 2000 
		ESX.TriggerServerCallback("ak4y-donateSystem:sendInput", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getVehicleSpamProtect = 0
RegisterNUICallback("getVehicle", function(data, cb)
	if getVehicleSpamProtect <= GetGameTimer() then
		getVehicleSpamProtect = GetGameTimer() + 2000
		ESX.TriggerServerCallback("ak4y-donateSystem:getVehicle", function(result)
			if result == true then 	
				cb(true)
			else
				cb(AK4Y.Translate.errorDuringPurchase)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
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
				cb(AK4Y.Translate.errorDuringPurchase)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
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
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
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
				cb(AK4Y.Translate.errorDuringPurchase)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
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
					if AK4Y.GiveAddKeys then 
						AK4Y.GiveAddKeysFunction(newPlate)
					end
					cb(true)
				else
					cb(AK4Y.Translate.errorDuringPurchase)
				end
			end, data, oldPlate)
		else
			cb(AK4Y.Translate.insideVehicle)
		end
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end	
end)

local getPrivNumber = 0
RegisterNUICallback("getPrivNumber", function(data, cb)
	if getPrivNumber <= GetGameTimer() then
		getPrivNumber = GetGameTimer() + 2000
		ESX.TriggerServerCallback("ak4y-donateSystem:getPrivNumber", function(result)
			if result then 	
				cb(true)
			else
				cb(AK4Y.Translate.errorDuringPurchase)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
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
				cb(AK4Y.Translate.errorDuringPurchase)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end	
end)

RegisterNUICallback("closeMenu", function(data, cb)
	SetNuiFocus(false, false)
end)

local startCountDown = false

RegisterNUICallback("tryVehicle",function(data, cb)
	-- Todo check if player is in safezone

	-- Todo check if player already test a vehicle

	lastPlayerCoords = GetEntityCoords(PlayerPedId())
	ESX.Game.SpawnVehicle(data.model, vector3(-960.03155517578,-3362.8012695312,13.944436073303), 60.82, function(entity)
		cb(true)
		TaskWarpPedIntoVehicle(PlayerPedId(), entity, -1)
		SetVehicleNumberPlateText(entity, "BOUTIQUE")
		startCountDown = true
		local timeGG = GetGameTimer()
		while startCountDown do
			Citizen.Wait(1)
			if GetGameTimer() < timeGG + tonumber(1000 * 60) then
				drawTxt("~r~ TEMPS RESTANT : " .. math.ceil(60 - (GetGameTimer() - timeGG)/1000) ,4,0.5,0.93,0.50,255,255,255,180)
			else
				DeleteEntity(entity)
				SetEntityCoords(PlayerPedId(), lastPlayerCoords)
				startCountDown = false
			end
		end
	end, false)
end)

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(5)
     SetTextFont(8)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end