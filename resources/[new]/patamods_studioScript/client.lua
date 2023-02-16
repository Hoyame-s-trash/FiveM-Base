function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

_menuPool = NativeUI.CreatePool()
Menu = NativeUI.CreateMenu("Scene Control", "~b~Change the scene")
_menuPool:Add(Menu)

local newitem = {}
newitem[1] = {item = NativeUI.CreateItem("Default", "Change the scene to: "..tostring("Default")), scene = "Default"}
Menu:AddItem(newitem[1].item)
for k,v in pairs(entitySet) do
	local idx = #newitem+1
	newitem[idx] = {item = NativeUI.CreateItem(v.name, "Change the scene to: "..tostring(v.name)), scene = k}
	Menu:AddItem(newitem[idx].item)
	Menu.OnItemSelect = function(sender, item, index)
		for k1,v1 in pairs(newitem) do
			if item == v1.item then
				if showPrint then
					print("Change to: "..tostring(v1.scene))
				end
				TriggerServerEvent("Studio:ChangeEntitySet", v1.scene)
			end
		end
	end
end

_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if (Menu:Visible()) then
            _menuPool:ProcessMenus()
		else
			Wait(10)
        end
	end
end)

local isNear = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
		local coords = {}
		coords.x,coords.y,coords.z = table.unpack(GetEntityCoords(ped))
		if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl.x,sceneControl.y,sceneControl.z)) < 40.0 then
			--DrawMarker
			if not isNear then
				TriggerServerEvent("Studio:AskForEntitySet")
				TriggerServerEvent("Studio:AskForBuzzer")
			end
			isNear = true
			if #(vector3(coords.x,coords.y,coords.z)-vector3(sceneControl.x,sceneControl.y,sceneControl.z)) < 1.5 then
				DisplayHelpText("Press ~input_context~ to access the scene menu")
				if IsControlJustReleased(1, 51) then
					Menu:Visible(true)
				end
			else
				if Menu:Visible() then
					Menu:Visible(false)
				end
			end
		else
			Citizen.Wait(100)
		end
	end
end)

RegisterNetEvent('Studio:SendEntitySet', function(set)
	if showPrint then
		print("receive new set : "..tostring(set).." current id: "..tostring( GetInteriorAtCoords(GetEntityCoords(PlayerPedId()))))
	end
	for k,v in pairs(entitySet) do
		if k==set then
			ActivateInteriorEntitySet(interiorID,k)
			if showPrint then
				print(tostring(k).." activated"..tostring(interiorID))
			end
		else
			DeactivateInteriorEntitySet(interiorID,k)
			if showPrint then
				print(tostring(k).." deactivated")
			end
		end
	end
	 RefreshInterior(interiorID)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
		if IsInteriorEntitySetActive(interiorID, "jeu2") then
			local ped = PlayerPedId()
			local coords = {}
			coords.x,coords.y,coords.z = table.unpack(GetEntityCoords(ped))
			if #(vector3(coords.x,coords.y,coords.z)-vector3(Quizz.MasterBuzz.coords.x,Quizz.MasterBuzz.coords.y,Quizz.MasterBuzz.coords.z)) < 20.0 then
				if #(vector3(coords.x,coords.y,coords.z)-vector3(Quizz.MasterBuzz.coords.x,Quizz.MasterBuzz.coords.y,Quizz.MasterBuzz.coords.z)) < 0.8 then
					DisplayHelpText("Press ~input_context~ to reset the buzzer")
					if IsControlJustReleased(1, 51) then
						if showPrint then
							print("Push : MasterBuzz")
						end
						TriggerServerEvent("Studio:ResetBuzzer")
					end
				end
				for k,v in pairs(Quizz) do
					if k ~= "MasterBuzz" then
						if #(vector3(coords.x,coords.y,coords.z)-vector3(v.coords.x,v.coords.y,v.coords.z)) < 0.8 then
							DisplayHelpText("Press ~input_context~ to push the buzzer")
							if IsControlJustReleased(1, 51) then
								if showPrint then
									print("Push : "..tostring(k))
								end
								TriggerServerEvent("Studio:PushBuzzer", k)
								Wait(50)
							end
						end
					end
				end
			else
				Citizen.Wait(100)
			end
		elseif IsInteriorEntitySetActive(interiorID, "jeu10") then
			local ped = PlayerPedId()
			local coords = {}
			coords.x,coords.y,coords.z = table.unpack(GetEntityCoords(ped))
			if #(vector3(coords.x,coords.y,coords.z)-vector3(Quizz2.MasterBuzz.coords.x,Quizz2.MasterBuzz.coords.y,Quizz2.MasterBuzz.coords.z)) < 20.0 then
				if #(vector3(coords.x,coords.y,coords.z)-vector3(Quizz2.MasterBuzz.coords.x,Quizz2.MasterBuzz.coords.y,Quizz2.MasterBuzz.coords.z)) < 0.8 then
					DisplayHelpText("Press ~input_context~ to reset the buzzer")
					if IsControlJustReleased(1, 51) then
						if showPrint then
							print("Push : MasterBuzz")
						end
						TriggerServerEvent("Studio:ResetBuzzer")
					end
				end
				for k,v in pairs(Quizz2) do
					if k ~= "MasterBuzz" then
						if #(vector3(coords.x,coords.y,coords.z)-vector3(v.coords.x,v.coords.y,v.coords.z)) < 0.8 then
							DisplayHelpText("Press ~input_context~ to push the buzzer")
							if IsControlJustReleased(1, 51) then
								if showPrint then
									print("Push : "..tostring(k))
								end
								TriggerServerEvent("Studio:PushBuzzer", k)
								Wait(50)
							end
						end
					end
				end
			else
				Citizen.Wait(100)
			end
		elseif IsInteriorEntitySetActive(interiorID, "jeu9") then
			local ped = PlayerPedId()
			local coords = {}
			coords.x,coords.y,coords.z = table.unpack(GetEntityCoords(ped))
			if #(vector3(coords.x,coords.y,coords.z)-vector3(Talent.Reset.coords.x, Talent.Reset.coords.y, Talent.Reset.coords.z)) < 20.0 then
				if #(vector3(coords.x,coords.y,coords.z)-vector3(Talent.Reset.coords.x, Talent.Reset.coords.y, Talent.Reset.coords.z)) < 0.8 then
					DisplayHelpText("Press ~input_context~ to reset the buzzer")
					if IsControlJustReleased(1, 51) then
						if showPrint then
							print("Push : Reset")
						end
						TriggerServerEvent("Studio:ResetBuzzer")
					end
				end
				for k,v in pairs(Talent) do
					if k ~= "Reset" then
						if #(vector3(coords.x, coords.y, coords.z)-vector3(v.coords.x, v.coords.y, v.coords.z)) < 0.8 then
							DisplayHelpText("Press ~input_context~ to push the buzzer")
							if IsControlJustReleased(1, 51) then
								if showPrint then
									print("Push : "..tostring(k))
								end
								TriggerServerEvent("Studio:PushTalentBuzzer", k)
								Wait(50)
							end
						end
					end
				end
			end
		else
			Citizen.Wait(100)
		end
	end
end)


RegisterNetEvent('Studio:SendBuzzer', function(idx)
    local mycoords = GetEntityCoords(PlayerPedId())
		if IsInteriorEntitySetActive(interiorID, "jeu2") then
			local coords = vector3(Quizz[idx].coords.x, Quizz[idx].coords.y, Quizz[idx].coords.z)
			if (#(coords-mycoords)<50.0) then
				RequestStreamedTextureDict(Quizz[idx].textureDict, false)
				while not HasStreamedTextureDictLoaded(Quizz[idx].textureDict) do
					Wait(100)
				end
				if showPrint then
					print(tostring(Quizz[idx].textureDict).." "..tostring(Quizz[idx].textureSlot).." "..tostring(Quizz[idx].textureDict).." "..tostring(Quizz[idx].textureVariation2))
				end
				AddReplaceTexture(Quizz[idx].textureDict, Quizz[idx].textureSlot, Quizz[idx].textureDict, Quizz[idx].textureVariation2)
				RequestScriptAudioBank("BIG_SCORE_TRUCK_RAMP", false, 0)
        		PlaySoundFromCoord(1, "Insert_Coin", coords, "DLC_EXEC_ARC_MAC_SOUNDS", false, 0)
			end
		elseif IsInteriorEntitySetActive(interiorID, "jeu10") then
			local coords = vector3(Quizz2[idx].coords.x, Quizz2[idx].coords.y, Quizz2[idx].coords.z)
			if (#(coords-mycoords)<50.0) then
				RequestStreamedTextureDict(Quizz2[idx].textureDict, false)
				while not HasStreamedTextureDictLoaded(Quizz2[idx].textureDict) do
					Wait(100)
				end
				if showPrint then
					print(tostring(Quizz2[idx].textureDict).." "..tostring(Quizz2[idx].textureSlot).." "..tostring(Quizz2[idx].textureDict).." "..tostring(Quizz2[idx].textureVariation2))
				end
				AddReplaceTexture(Quizz2[idx].textureDict, Quizz2[idx].textureSlot, Quizz2[idx].textureDict, Quizz2[idx].textureVariation2)
				RequestScriptAudioBank("BIG_SCORE_TRUCK_RAMP", false, 0)
				PlaySoundFromCoord(1, "Insert_Coin", coords, "DLC_EXEC_ARC_MAC_SOUNDS", false, 0)
			end
		elseif IsInteriorEntitySetActive(interiorID, "jeu9") then
			local coords = vector3(Talent[idx].coords.x, Talent[idx].coords.y, Talent[idx].coords.z)
			if (#(coords-mycoords)<50.0) then
				RequestStreamedTextureDict(Talent[idx].textureDict, false)
				while not HasStreamedTextureDictLoaded(Talent[idx].textureDict) do
						Wait(100)
				end
				if showPrint then
					print(tostring(Talent[idx].textureDict).." "..tostring(Talent[idx].textureSlot).." "..tostring(Talent[idx].textureDict).." "..tostring(Talent[idx].textureVariation2))
				end
				AddReplaceTexture(Talent[idx].textureDict, Talent[idx].textureSlot, Talent[idx].textureDict, Talent[idx].textureVariation2)
				RequestScriptAudioBank("BIG_SCORE_TRUCK_RAMP", false, 0)
				PlaySoundFromCoord(1, "Insert_Coin", coords, "DLC_EXEC_ARC_MAC_SOUNDS", false, 0)
			end
		end
end)

RegisterNetEvent('Studio:SendBuzzerState', function(idx)
	if IsInteriorEntitySetActive(interiorID, "jeu2") then
		RequestStreamedTextureDict(Quizz[idx].textureDict, false)
		while not HasStreamedTextureDictLoaded(Quizz[idx].textureDict) do
			Wait(100)
		end
		if showPrint then
			print(tostring(Quizz[idx].textureDict).." "..tostring(Quizz[idx].textureSlot).." "..tostring(Quizz[idx].textureDict).." "..tostring(Quizz[idx].textureVariation2))
		end
		AddReplaceTexture(Quizz[idx].textureDict, Quizz[idx].textureSlot, Quizz[idx].textureDict, Quizz[idx].textureVariation2)
	elseif IsInteriorEntitySetActive(interiorID, "jeu10") then
		RequestStreamedTextureDict(Quizz2[idx].textureDict, false)
		while not HasStreamedTextureDictLoaded(Quizz2[idx].textureDict) do
			Wait(100)
		end
		if showPrint then
			print(tostring(Quizz2[idx].textureDict).." "..tostring(Quizz2[idx].textureSlot).." "..tostring(Quizz2[idx].textureDict).." "..tostring(Quizz2[idx].textureVariation2))
		end
		AddReplaceTexture(Quizz2[idx].textureDict, Quizz2[idx].textureSlot, Quizz2[idx].textureDict, Quizz2[idx].textureVariation2)
	elseif IsInteriorEntitySetActive(interiorID, "jeu9") then
		RequestStreamedTextureDict(Talent[idx].textureDict, false)
		while not HasStreamedTextureDictLoaded(Talent[idx].textureDict) do
			Wait(100)
		end
		if showPrint then
			print(tostring(Talent[idx].textureDict).." "..tostring(Talent[idx].textureSlot).." "..tostring(Talent[idx].textureDict).." "..tostring(Talent[idx].textureVariation2))
		end
		AddReplaceTexture(Talent[idx].textureDict, Talent[idx].textureSlot, Talent[idx].textureDict, Talent[idx].textureVariation2)
	end
end)

RegisterNetEvent('Studio:SendResetBuzzer', function()
	if IsInteriorEntitySetActive(interiorID, "jeu2") then
		for k,v in pairs(Quizz) do
			if k ~= "MasterBuzz" then
				RequestStreamedTextureDict(Quizz[k].textureDict, false)
				while not HasStreamedTextureDictLoaded(Quizz[k].textureDict) do
					Wait(100)
				end
				if showPrint then
					print(tostring(Quizz[k].textureDict).." "..tostring(Quizz[k].textureSlot).." "..tostring(Quizz[k].textureDict).." "..tostring(Quizz[k].textureVariation2))
				end
				AddReplaceTexture(Quizz[k].textureDict, Quizz[k].textureSlot, Quizz[k].textureDict, Quizz[k].textureVariation1)
			end
		end
	elseif IsInteriorEntitySetActive(interiorID, "jeu10") then
		for k,v in pairs(Quizz2) do
			if k ~= "MasterBuzz" then
				RequestStreamedTextureDict(Quizz2[k].textureDict, false)
				while not HasStreamedTextureDictLoaded(Quizz2[k].textureDict) do
					Wait(100)
				end
				if showPrint then
					print(tostring(Quizz2[k].textureDict).." "..tostring(Quizz2[k].textureSlot).." "..tostring(Quizz2[k].textureDict).." "..tostring(Quizz2[k].textureVariation2))
				end
				AddReplaceTexture(Quizz2[k].textureDict, Quizz2[k].textureSlot, Quizz2[k].textureDict, Quizz2[k].textureVariation1)
			end
		end		
	elseif IsInteriorEntitySetActive(interiorID, "jeu9") then
		for k, v in pairs(Talent) do
			if k ~= "MasterBuzz" then
				RequestStreamedTextureDict(Talent[k].textureDict, false)
				while not HasStreamedTextureDictLoaded(Talent[k].textureDict) do
					Wait(100)
				end
				if showPrint then
					print(tostring(Talent[k].textureDict).." "..tostring(Talent[k].textureSlot).." "..tostring(Talent[k].textureDict).." "..tostring(Talent[k].textureVariation2))
				end
				AddReplaceTexture(Talent[k].textureDict, Talent[k].textureSlot, Talent[k].textureDict, Talent[k].textureVariation1)
			end
		end
	end
end)

--RegisterCommand("+PlaySound", function(source, args, fullCommand)
--	--PlaySound(5,
--	print("sound")
--	HintAmbientAudioBank("TELESCOPES", 0, -1)
--	RequestAmbientAudioBank("TELESCOPES", false, -1)
--	
--	RequestScriptAudioBank("BIG_SCORE_TRUCK_RAMP",false,0)
--	PlaySoundFrontend(1,"Insert_Coin", "DLC_EXEC_ARC_MAC_SOUNDS", true)
--	Wait(50)
--	StopSound(1)
--	PlaySoundFrontend(1,"Insert_Coin", "DLC_EXEC_ARC_MAC_SOUNDS", true)
--	Wait(50)
--	StopSound(1)
--	PlaySoundFrontend(-1,"Insert_Coin", "DLC_EXEC_ARC_MAC_SOUNDS", true)
--	
--	PlaySoundFromEntity(-1,"10_Seconds",PlayerPedId(),"TELESCOPE_High_End",false,0)
--end, false)

-- RequestScriptAudioBank("GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", false, -1)
-- LoadStream("Truck_Ramp_Scrape", "BIG_SCORE_3A_SOUNDS")
-- RequestScriptAudioBank("BIG_SCORE_TRUCK_RAMP",false,0)