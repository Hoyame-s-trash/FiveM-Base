ESX = exports['believer']:getSharedObject()

ESX.RegisterServerCallback('bluestark_animation:requestStarAnimations', function(source, cb)
    local playerSelected = ESX.GetPlayerFromId(source)
	if (not playerSelected) then return end

    MySQL.Async.fetchAll('SELECT * FROM bluestark_animation WHERE identifier = @identifier',{
        ['@identifier'] = playerSelected.identifier
    },function(result)
        cb(result)  
    end)
end)

RegisterServerEvent('bluestark_animation:StarAnimation')
AddEventHandler('bluestark_animation:StarAnimation', function(animation)
	local playerSrc = source
	if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

    MySQL.Async.execute('INSERT INTO bluestark_animation (identifier, nameanim) VALUES (@identifier, @nameanim)', {
        ['@identifier'] = playerSelected.identifier,
        ['@nameanim'] = animation
    })
end)

RegisterServerEvent('bluestark_animation:UnstarAnimation')
AddEventHandler('bluestark_animation:UnstarAnimation', function(animation)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

    MySQL.Async.execute('DELETE FROM bluestark_animation WHERE identifier = @identifier AND nameanim = @animation', {
        ['@identifier'] = playerSelected.identifier,
        ['@animation'] = animation,
    })
end)

RegisterServerEvent('bluestark_animation:load')
AddEventHandler('bluestark_animation:load', function()
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end
	
	MySQL.Async.fetchAll('SELECT animation FROM users WHERE identifier = @identifier', {
		['@identifier'] = playerSelected.identifier
	}, function(result)
		if result[1].animation then
			TriggerClientEvent('bluestark_animation:bind', playerSelected.source, json.decode(result[1].animation))
		else
			MySQL.Async.execute('UPDATE users SET animation = @animation WHERE identifier = @identifier',
			{
				['@animation'] = "[[],[],[],[],[],[]]",
				['@identifier'] = playerSelected.identifier
			})
			TriggerClientEvent('bluestark_animation:bind', playerSelected.source, json.decode("[[],[],[],[],[],[]]"))
		end
	end)
end)


RegisterServerEvent('bluestark_animation:SaveFavoris')
AddEventHandler('bluestark_animation:SaveFavoris', function(binds)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end
	
	MySQL.Async.execute('UPDATE users SET animation = @animation WHERE identifier = @identifier',
	{
		['@animation'] = json.encode(binds),
		['@identifier'] = playerSelected.identifier
	})
end)

RegisterServerEvent('bluestark_animation:saveWalk')
AddEventHandler('bluestark_animation:saveWalk', function(style)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end
	
	MySQL.Async.execute('UPDATE users SET demarche = @demarche WHERE identifier = @identifier',
	{
		['@demarche'] = json.encode(style),
		['@identifier'] = playerSelected.identifier
	})
end)

RegisterServerEvent('bluestark_animation:loadWalk')
AddEventHandler('bluestark_animation:loadWalk', function()
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

	MySQL.Async.fetchAll('SELECT demarche FROM users WHERE identifier = @identifier', {
		['@identifier'] = playerSelected.identifier
	}, function(result)
		if result[1].demarche then
			TriggerClientEvent('bluestark_animation:walkLoad', playerSelected.source, json.decode(result[1].demarche))
		end
	end)
end)

RegisterServerEvent('bluestark_animation:saveFace')
AddEventHandler('bluestark_animation:saveFace', function(style)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end
	
	MySQL.Async.execute('UPDATE users SET expression = @expression WHERE identifier = @identifier',
	{
		['@expression'] = json.encode(style),
		['@identifier'] = playerSelected.identifier
	})
end)

RegisterServerEvent('bluestark_animation:loadFace')
AddEventHandler('bluestark_animation:loadFace', function()
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

	MySQL.Async.fetchAll('SELECT expression FROM users WHERE identifier = @identifier', {
		['@identifier'] = playerSelected.identifier
	}, function(result)
		if result[1].expression then
			TriggerClientEvent('bluestark_animation:faceLoad', playerSelected.source, json.decode(result[1].expression))
		end
	end)
end)

RegisterServerEvent("bluestark_animation:animrequest")
AddEventHandler("bluestark_animation:animrequest", function(target, emotename, etype)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

	TriggerClientEvent("bluestark_animation:animationrequest", target, emotename, etype, playerSelected.source)
end)

RegisterServerEvent("bluestark_animation:animationaccepted") 
AddEventHandler("bluestark_animation:animationaccepted", function(target, requestedemote, otheremote)
	local player2 = source
	TriggerClientEvent("bluestark_animation:playshared", source, otheremote, source)
	TriggerClientEvent("bluestark_animation:playsharedsource", target, requestedemote, player2)
end)