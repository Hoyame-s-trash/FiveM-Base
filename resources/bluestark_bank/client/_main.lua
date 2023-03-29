ESX = exports['believer']:getSharedObject()
inMenu = true

-- Todo set the player account when script is loaded with thread

function IsNearATM()
	local objects = {}
	for _,v in pairs(Config.Banque.Atm) do
		table.insert(objects, v.prop)
	end
	
	local ped = GetPlayerPed(-1)
	local list = {}
	
	for _,v in pairs(objects) do
		local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 5.0, GetHashKey(v), false, true ,true)
		local dist = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(obj), true)
		table.insert(list, {object = obj, distance = dist})
		end
	
		local closest = list[1]
		for _,v in pairs(list) do
		if v.distance < closest.distance then
			closest = v
		end
		end
	
		local distance = closest.distance
		local object = closest.object
		

		if distance < 1.8 then
		return true
		end
end

RegisterNetEvent('bluestark_bank:UseAtm')
AddEventHandler('bluestark_bank:UseAtm', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        RequestAnimDict('anim@amb@prop_human_atm@interior@male@enter')
        if IsNearATM() then
            TaskPlayAnim(PlayerPedId(), "anim@amb@prop_human_atm@interior@male@enter","enter",8.0, 8.0, -1, 0, 0, 0, 0, 0)
            Wait(2000)
            ClearPedTasksImmediately(PlayerPedId())
            StartScreenEffect("MenuMGIn", 1, true)
            inMenu = true
            SetNuiFocus(true, true)
            SendNUIMessage({type = 'openGeneral'})
        else
            ESX.ShowNotification("~r~Vous devez être devant un ATM.")
        end
	end
end)

Citizen.CreateThread(function()
    for _, info in pairs(Config.Banque.blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, info.scale)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i=1, #(ESX.PlayerData.accounts) do
		if (ESX.PlayerData.accounts[i].name == "money") then
			SendNUIMessage({
				type = "balanceHUD",
				balance = balance,
				player = GetPlayerName(PlayerId())
			})
		elseif (ESX.PlayerData.accounts[i].name == "bank") then
			SendNUIMessage({
				type = "balanceHUD",
				balance2 = balance2,
				player = GetPlayerName(PlayerId())
			})
		end
	end
end)

RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bluestark_bank:Deposit', tonumber(data.amount))
end)

RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bluestark_bank:Withdraw', tonumber(data.amountw))
end)

RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bluestark_bank:Transfer', data.to, data.amountt)
end)

RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

RegisterNUICallback('NUIFocusOff', function()
	inMenu = false
	StopScreenEffect("MenuMGIn")
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)