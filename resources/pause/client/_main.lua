ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports['believer']:getSharedObject()
		Citizen.Wait(0)
    end
end)

local open = false

RegisterNetEvent("PauseMenu:openMenu")
AddEventHandler("PauseMenu:openMenu", function()
	OpenPauseMenu()
end)

function OpenPauseMenu()
    if not open and not IsPauseMenuActive() then
		exports.believer:toggleInterface(false)
		DisplayRadar(false)
        SetNuiFocus(true,true)
        SendNUIMessage({
            action = 'show',
        })
        open = true
		
        GetDataFromServer()
	
		while open do 
			Wait(0)
			SetPauseMenuActive(false) 
		end
    end
end

function GetDataFromServer()
	ESX.TriggerServerCallback("PauseMenu:Getserverdata", function(data) 
		SendNUIMessage({
			action = "showData",
			name = data.name,
			playTime = data.playtime,
			players = data.players,
			slots = data.slots,
			serverId = data.serverId,
			uniqueId = data.uniqueId,
			job = data.job,
			job2 = data.job2,
			bank = ESX.Math.GroupDigits(data.bank),
			money = ESX.Math.GroupDigits(data.money),
			black_money = ESX.Math.GroupDigits(data.black_money),
			coins = data.coins,
		})
	end)
end

function ResetDisplay()
	SetNuiFocus(false, false)
  	open = false
	DisplayRadar(true)
	exports.believer:toggleInterface(true)
end

RegisterNUICallback('exit', function(data, cb)
	ResetDisplay()
end)

RegisterNUICallback('SendAction', function(data, cb)
    if data.action == 'settings' then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
        ResetDisplay()
    elseif data.action == 'map' then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
        ResetDisplay()
	elseif data.action == 'getinventory' then 
		-- Todo open inventory
		ResetDisplay()
	elseif data.action == 'report' then 
		ResetDisplay()
		local input = exports["input"]:openInput({
			label = "Envoyer un report",
			submitLabel = "ENVOYER",
			placeHolders = {
				{label = "Votre message"},
			}
		})

		if (input["0"] == nil) then
			ESX.ShowNotification("~r~Votre report doit contenir un message.")
			return 
		end
		ExecuteCommand("report "..input["0"])
	elseif data.action == 'quit' then 
		ResetDisplay()
		local input = exports["input"]:openInput({
			label = "Quitter le serveur",
			submitLabel = "QUITTER",
			placeHolders = {
				{label = "OUI / NON"},
			}
		})

		if (input["0"] == nil) then
			return 
		end

		if (input["0"] == "OUI") then
			TriggerServerEvent("PauseMenu:disconnected")
		end
	elseif data.action == 'discord' then
		ResetDisplay()
	elseif data.action == 'achievements-random-button' then 
		-- Todo open shop
		ResetDisplay()
	end
end)