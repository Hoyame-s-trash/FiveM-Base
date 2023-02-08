ESX = exports['believer']:getSharedObject()

ESX.RegisterServerCallback('Boutique:sendInput', function(source, cb, data)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    local inputData = data.input

    local result = MySQL.query.await('SELECT * FROM boutique_codes WHERE code = ?', { inputData })
    if result[1] ~= nil then
        local newCoins = 0
        for i = 1, #result do
            newCoins = newCoins + result[i].credit
        end
        MySQL.query('DELETE FROM boutique_codes WHERE code = ?', { inputData })
        local result2 = MySQL.query.await('SELECT * FROM boutique_account WHERE identifier = ?', { playerIdentifier })
        if result2[1] ~= nil then 
            MySQL.update('UPDATE boutique_account SET credit = credit + '..newCoins..' WHERE identifier = ?', { playerIdentifier })
        else
            MySQL.insert('INSERT INTO boutique_account (identifier, credit) VALUES (?, ?)', {
                playerIdentifier,
                newCoins,
            })
        end
        -- Todo send discord log
        cb(newCoins)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('Boutique:getPlayerDetails', function(source, cb)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    local charInfo = GetPlayerName(playerSrc)
    local callbackData = {}

    local result = MySQL.query.await('SELECT * FROM boutique_account WHERE identifier = ?', { playerIdentifier })
    if result[1] == nil then 
        callbackData = {
            playerData = {
                ["credit"] = 0,
            },
            charInfo = charInfo,
        }
    else
        callbackData = {playerData = result[1], charInfo = charInfo}
    end
    cb(callbackData)
end)

ESX.RegisterServerCallback('Boutique:getVehicle', function(source, cb, veri, VehData)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    local data = nil
    local data2 = veri

    if data2.itemInfo.vehType == "car" then
        for k, v in pairs(Boutique.Vehicles) do
            if v.id == veri.itemInfo.id then 
                data = v
                break
            end
        end
    elseif data2.itemInfo.vehType == "motorcycle" then
        for k, v in pairs(Boutique.Motos) do
            if v.id == veri.itemInfo.id then 
                data = v
                data2.itemInfo.vehType = "car"
                break
            end
        end
    elseif data2.itemInfo.vehType == "air" then
        for k, v in pairs(Boutique.Helicopters) do
            if v.id == veri.itemInfo.id then 
                data = v
                data2.itemInfo.vehType = "helicopter"
                break
            end
        end
    end
    if data then
        local vehicle = data.spawnName
        local plate = GeneratePlate()
        local costCredit = tonumber(data.costCredit)
        local plateCheck = false
        if data2.extra ~= "undefined" then 
            plateCheck = true
            plate = data2.extra:upper()
            costCredit = costCredit + Boutique.CustomPlatePriceOnBuyVehicle
        end
        local vehicleData = {
            model = GetHashKey(data.spawnName),
            plate = plate
        }
        if Boutique.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM boutique_account WHERE identifier = ?', { playerIdentifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    if plateCheck then 
                        local resultPlate = MySQL.query.await('SELECT * FROM owned_vehicles WHERE plate = ?', { plate })
                        if resultPlate[1] == nil then 
                            MySQL.update('UPDATE boutique_account SET credit = credit - ? WHERE identifier = ?', { costCredit, playerIdentifier })
                            MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state, boutique) VALUES (?, ?, ?, ?, ?, ?)', {
                                playerIdentifier,
                                plate,
                                json.encode(vehicleData),
                                data2.itemInfo.vehType,
                                1,
                                1
                            })
                            -- Todo send discord log
                            cb(true)
                        else
                            print("4")
                            cb(false)
                        end
                    else
                        MySQL.update('UPDATE boutique_account SET credit = credit - ? WHERE identifier = ?', { costCredit, playerIdentifier })
                        MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state, boutique) VALUES (?, ?, ?, ?, ?, ?)', {
                            playerIdentifier,
                            plate,
                            json.encode(vehicleData),
                            data2.itemInfo.vehType,
                            1,
                            1
                        })
                        -- Todo send discord log
                        cb(true)
                    end
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('ak4y-donateSystem:getWeapon', function(source, cb, veri)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local data = nil
    for k, v in pairs(Boutique.Weapons) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then
        local costCredit = tonumber(data.costCredit)
        local rewardItem = data.weaponName
        if Boutique.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM boutique_account WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    if xPlayer.hasWeapon(rewardItem) then
                        cb(false)
                    end
                    MySQL.update('UPDATE boutique_account SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                    if Boutique.WeaponType == "item" then 
                        xPlayer.addInventoryItem(rewardItem, 1)
                    elseif Boutique.WeaponType == "weapon" then 
                        xPlayer.addWeapon(rewardItem, 255)
                    end
                    SendToDiscord("identifier: ``"..identifier.."``\nItem: ``"..rewardItem.."``\nGot item!")
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('ak4y-donateSystem:getPacks', function(source, cb, veri)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local data = nil
    for k, v in pairs(Boutique.Packs) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then 
        local costCredit = tonumber(data.costCredit)
        if Boutique.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM boutique_account WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    MySQL.update('UPDATE boutique_account SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                    for itemName, itemCount in pairs(data.rewardsItems) do
                        xPlayer.addInventoryItem(itemName, itemCount)
                    end
                    for moneyType, moneyCount in pairs(data.rewardsMoney) do
                        xPlayer.addAccountMoney(moneyType, moneyCount)
                    end
                    for weaponName, weaponPerm in pairs(data.rewardsWeapons) do
                        xPlayer.addWeapon(weaponName, 255)
                    end
                    for vehicleName, vehicleValue in pairs(data.rewardsVehicles) do
                        local plate = GeneratePlate()
                        local vehicleData = {
                            model = GetHashKey(vehicleName),
                        }
                        vehicleData.plate = plate
                        MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state, boutique) VALUES (?, ?, ?, ?, ?, ?)', {
                            identifier,
                            plate,
                            json.encode(vehicleData),
                            "car",
                            1,
                            1
                        })
                    end
                    SendToDiscord("identifier: ``"..identifier.."``\nPaid pack:``"..data.id.."``.")
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('ak4y-donateSystem:getMoney', function(source, cb, veri)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local data = nil
    for k, v in pairs(Boutique.Money) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then 
        local costCredit = tonumber(data.costCredit)
        local rewardMoney = data.inGameMoney
        if Boutique.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM boutique_account WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    MySQL.update('UPDATE boutique_account SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                    xPlayer.addMoney(rewardMoney)
                    SendToDiscord("identifier: ``"..identifier.."``\nMoney:``"..rewardMoney.."``\nGot money!")
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

RegisterCommand("giveshopvehicle", function(source, args)
    if (source ~= 0) then return end
    local plate = GeneratePlate()
    local vehicleData = {
        plate = plate,
        model = GetHashKey(tostring(args[2]))
    }
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state, boutique) VALUES (@owner, @plate, @vehicle, @type, @state, @boutique)', {
        ["@owner"] = tostring(args[1]),
        ["@plate"] = plate,
        ["@vehicle"] = json.encode(vehicleData),
        ["@type"] = "car",
        ["@state"] = 1,
        ["@boutique"] = 1
    }, function()
        print("Vehicle "..tostring(args[2]).." added to "..tostring(args[1]).. " plate : "..plate)
    end)
end)

RegisterCommand('purchase_donate_credit', function(source, args)
	local src = source
    if src == 0 then
        local dec = json.decode(args[1])
        local tbxid = dec.transid
        local credit = dec.credit
        while inProgress do
            Wait(1000)
        end
        inProgress = true
        if Boutique.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM boutique_codes WHERE code = ?', { tbxid })
            if result[1] == nil then
                MySQL.insert('INSERT INTO boutique_codes (code, credit) VALUES (?, ?)', { tbxid, credit })
                SendToDiscord("Code: ``"..tbxid.."``\nCredit: ``"..credit.."``\nsuccessfuly into your database!")
            end
            inProgress = false  
        end
    end
end)

local DISCORD_NAME = "ak4y-donateSystem"
local DISCORD_IMAGE = "https://i.imgur.com/Q72RWcB.png"
DiscordWebhook = Discord_Webhook
function SendToDiscord(name, message, color)
	if DiscordWebhook == "CHANGE_WEBHOOK" then
	else
		local connect = {
            {
                ["color"] = color,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                ["text"] = "ak4y development",
                },
            },
	    }
		PerformHttpRequest(DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
	end
end

ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function (source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function (result)
		cb(result[1] ~= nil)
	end)
end)

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		generatedPlate = string.upper(GetRandomLetter(3) .. GetRandomNumber(3))

        if Boutique.Mysql == "oxmysql" then 
            local result = MySQL.query.await('SELECT 1 FROM owned_vehicles WHERE plate = ?', { generatedPlate })
            if result[1] == nil then 
                doBreak = true
            end
        end

		if doBreak then
			break
		end
	end

	return generatedPlate
end

exports('GeneratePlate', function()
    return GeneratePlate()
end)

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end