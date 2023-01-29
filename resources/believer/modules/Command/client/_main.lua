GM.Command = GM.Command or {}

RegisterNetEvent("Believer:command:keyMapping", function(commandData)
	if (not commandData) then return end

	if (GM.Command.Debug == true) then
		print("Believer:command:keyMapping", commandData.name, commandData.description, commandData.keys[1], commandData.keys[2])
	end

	RegisterCommand(commandData.name, function(source, args)
		TriggerServerEvent("Believer:command:execute", commandData.name, args)
	end)
	RegisterKeyMapping(commandData.name, commandData.description, commandData.keys[1], commandData.keys[2])
end)

-- Todo add debug on this module (if debug is enabled)