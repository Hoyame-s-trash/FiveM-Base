GM.Weapon = GM.Weapon or {}

local unarmedHash = `WEAPON_UNARMED`
local currWeapon = unarmedHash
local holstered = true
local canFire = true

function GetFrontVehicle(ped)
	local entCoords = GetEntityCoords(ped, false)
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, 4.0, 0.0)
	local ray = StartShapeTestRay(entCoords, offset, 2, ped, 0)
	local _, _, _, _, result = GetShapeTestResult(ray)

	return result
end

Citizen.CreateThread(function()
	while true do
		if not IsEntityDead(PlayerPedId()) and IsPedOnFoot(PlayerPedId()) then
			Wait(0)
		else
			Wait(1000)
		end

		if not IsEntityDead(PlayerPedId()) and IsPedOnFoot(PlayerPedId()) then
			local newWeap = GetSelectedPedWeapon(PlayerPedId())

			if newWeap ~= currWeapon then
				SetCurrentPedWeapon(PlayerPedId(), currWeapon, true)
				local continue = true

				if (GM.Weapon["list_chest"][newWeap] ~= nil) and (GM.Weapon["list_chest"][newWeap].parameters.onlyBag) then
					local bagIndex = GetPedDrawableVariation(PlayerPedId(), 5)

					if GM.Weapon["list_bags"][bagIndex] ~= nil then
                        print("debug bagIndex: "..bagIndex)
						--continue = false
					else
						local vehicle = GetFrontVehicle(PlayerPedId())

						if DoesEntityExist(vehicle) then
							SetVehicleDoorOpen(vehicle, 5, false, false)
							Citizen.Wait(2000)
							SetVehicleDoorShut(vehicle, 5, false)
						else
							ESX.ShowNotification("~r~Vous devez disposer d'un sac ou être proche d'une voiture.")
							continue = false
						end
					end
				end

				if continue then
					ESX.Streaming.RequestAnimDict('reaction@intimidation@1h')

					if (GM.Weapon["list_chest"][newWeap] ~= nil) and (GM.Weapon["list_chest"][newWeap].parameters.anim) then
						if holstered then
							canFire = false
							TaskPlayAnimAdvanced(PlayerPedId(), 'reaction@intimidation@1h', 'intro', GetEntityCoords(PlayerPedId()), 0, 0, GetEntityPhysicsHeading(PlayerPedId()), 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(PlayerPedId(), newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(2000)
							ClearPedTasks(PlayerPedId())
							holstered = false
							canFire = true
						elseif newWeap ~= currWeapon then
							canFire = false
							TaskPlayAnimAdvanced(PlayerPedId(), 'reaction@intimidation@1h', 'outro', GetEntityCoords(PlayerPedId()), 0, 0, GetEntityPhysicsHeading(PlayerPedId()), 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1600)
							SetCurrentPedWeapon(PlayerPedId(), unarmedHash, true)
							TaskPlayAnimAdvanced(PlayerPedId(), 'reaction@intimidation@1h', 'intro', GetEntityCoords(PlayerPedId()), 0, 0, GetEntityPhysicsHeading(PlayerPedId()), 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(PlayerPedId(), newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(2000)
							ClearPedTasks(PlayerPedId())
							holstered = false
							canFire = true
						end
					else
						if not holstered and (GM.Weapon["list_chest"][currWeapon] ~= nil) and (GM.Weapon["list_chest"][currWeapon].parameters.anim) then
							canFire = false
							TaskPlayAnimAdvanced(PlayerPedId(), 'reaction@intimidation@1h', 'outro', GetEntityCoords(PlayerPedId()), 0, 0, GetEntityPhysicsHeading(PlayerPedId()), 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1600)
							SetCurrentPedWeapon(PlayerPedId(), unarmedHash, true)
							ClearPedTasks(PlayerPedId())
							SetCurrentPedWeapon(PlayerPedId(), newWeap, true)
							holstered = true
							canFire = true
							currWeapon = newWeap
						else
							SetCurrentPedWeapon(PlayerPedId(), newWeap, true)
							holstered = false
							canFire = true
							currWeapon = newWeap
						end
					end

					RemoveAnimDict('reaction@intimidation@1h')
				end
			end
		end

		if not canFire then
			DisableControlAction(0, 25, true)
			DisablePlayerFiring(PlayerPedId(), true)
		end
	end
end)