ESX = exports['believer']:getSharedObject()

ESX.RegisterServerCallback('ak4y-donateSystem:getPlayerDetails', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local charInfo = GetPlayerName(_source)
    local callbackData = {}
    if AK4Y.Mysql == "oxmysql" then 
        local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
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
    end
end)

ESX.RegisterServerCallback('ak4y-donateSystem:sendInput', function(source, cb, data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local inputData = data.input
    if AK4Y.Mysql == "oxmysql" then
        local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem_codes WHERE code = ?', { inputData })
        if result[1] ~= nil then
            local newCoins = 0
            for i = 1, #result do
                newCoins = newCoins + result[i].credit
            end
            MySQL.query('DELETE FROM ak4y_donatesystem_codes WHERE code = ?', { inputData })
            local result2 = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
            if result2[1] ~= nil then 
                MySQL.update('UPDATE ak4y_donatesystem SET credit = credit + '..newCoins..' WHERE identifier = ?', { identifier })
            else
                MySQL.insert('INSERT INTO ak4y_donatesystem (identifier, credit) VALUES (?, ?)', {
                    identifier,
                    newCoins,
                })
            end
            SendToDiscord("identifier: ``"..identifier.."``\nCredit: ``"..newCoins.."\nCode: ``"..inputData.."``\nUsed code!")
            cb(newCoins)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('ak4y-donateSystem:getVehicle', function(source, cb, veri, VehData)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local data = nil
    local data2 = veri

    if data2.itemInfo.vehType == "car" then
        for k, v in pairs(AK4Y.Vehicles) do
            if v.id == veri.itemInfo.id then 
                data = v
                break
            end
        end
    elseif data2.itemInfo.vehType == "motorcycle" then
        for k, v in pairs(AK4Y.Motos) do
            if v.id == veri.itemInfo.id then 
                data = v
                data2.itemInfo.vehType = "car"
                break
            end
        end
    elseif data2.itemInfo.vehType == "air" then
        for k, v in pairs(AK4Y.Helicopters) do
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
            costCredit = costCredit + AK4Y.CustomPlatePriceOnBuyVehicle
        end
        local vehicleData = {
            model = GetHashKey(data.spawnName),
            plate = plate
        }
        if AK4Y.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    if plateCheck then 
                        local resultPlate = MySQL.query.await('SELECT * FROM owned_vehicles WHERE plate = ?', { plate })
                        if resultPlate[1] == nil then 
                            MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                            MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state, boutique) VALUES (?, ?, ?, ?, ?, ?)', {
                                identifier,
                                plate,
                                json.encode(vehicleData),
                                data2.itemInfo.vehType,
                                1,
                                1
                            })
                            SendToDiscord("identifier: ``"..identifier.."``\nVehicle: ``"..vehicle.."``\nPlate: ``"..plate.."``\nPurchased vehicle!")
                            cb(true)
                        else
                            print("4")
                            cb(false)
                        end
                    else
                        MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                        MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state, boutique) VALUES (?, ?, ?, ?, ?, ?)', {
                            identifier,
                            plate,
                            json.encode(vehicleData),
                            data2.itemInfo.vehType,
                            1,
                            1
                        })
                        SendToDiscord("identifier: ``"..identifier.."``\nVehicle: ``"..vehicle.."``\nPlate: ``"..plate.."``\nPurchased vehicle!")
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
    for k, v in pairs(AK4Y.Weapons) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then
        local costCredit = tonumber(data.costCredit)
        local rewardItem = data.weaponName
        if AK4Y.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    if xPlayer.hasWeapon(rewardItem) then
                        cb(false)
                    end
                    MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                    if AK4Y.WeaponType == "item" then 
                        xPlayer.addInventoryItem(rewardItem, 1)
                    elseif AK4Y.WeaponType == "weapon" then 
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
    for k, v in pairs(AK4Y.Packs) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then 
        local costCredit = tonumber(data.costCredit)
        if AK4Y.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
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
    for k, v in pairs(AK4Y.Money) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then 
        local costCredit = tonumber(data.costCredit)
        local rewardMoney = data.inGameMoney
        if AK4Y.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
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

ESX.RegisterServerCallback('ak4y-donateSystem:getCustomPlate', function(source, cb, veri, plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local data = nil
    for k, v in pairs(AK4Y.Customize) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then 
        local costCredit = tonumber(data.costCredit)
        local newPlate = veri.input:upper()
        local oldPlate = string.gsub(plate, "%s+", "")
        if AK4Y.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    local resultPlate = MySQL.query.await('SELECT * FROM owned_vehicles WHERE plate = ?', { newPlate })
                    if resultPlate[1] == nil then
                        local lastCheckPlate = MySQL.query.await('SELECT * FROM owned_vehicles WHERE plate = ?', { oldPlate })
                        if lastCheckPlate[1] == nil then 
                            cb(false)
                        else
                            if lastCheckPlate[1].owner == identifier then 
                                MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                                local jsonData = json.decode(lastCheckPlate[1].vehicle)
                                if jsonData.plate ~= nil then 
                                    jsonData.plate = newPlate
                                    local mods = json.encode(jsonData)
                                    MySQL.update('UPDATE owned_vehicles SET plate = ?, vehicle = ? WHERE plate = ?', { newPlate, mods, oldPlate })
                                else
                                    MySQL.update('UPDATE owned_vehicles SET plate = ? WHERE plate = ?', { newPlate, oldPlate })
                                end
                                SendToDiscord("identifier: ``"..identifier.."``\nOld Plate: ``"..oldPlate.."``\nNew Plate: ``"..newPlate.."``\nVehicle plate changed!")
                                cb(true)
                            else
                                cb(false)
                            end
                        end
                    else
                        cb(false)
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

ESX.RegisterServerCallback('ak4y-donateSystem:getPrivNumber', function(source, cb, veri)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local data = nil
    for k, v in pairs(AK4Y.Customize) do
        if v.id == veri.itemInfo.id then 
            data = v
            break
        end
    end
    if data then
        local costCredit = tonumber(data.costCredit)
        local newNumber = veri.input
        if AK4Y.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem WHERE identifier = ?', { identifier })
            if result[1] ~= nil then 
                if result[1].credit >= costCredit then
                    local resultData = MySQL.query.await('SELECT * FROM users WHERE identifier = ?', { identifier })
                    if resultData[1] ~= nil then 
                        if AK4Y.Phone == "qb-phone" then 
                            local query = '%' .. newNumber .. '%'
                            local checkPhone = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE charinfo LIKE ?', { query })
                            if checkPhone == 0 then
                                local charInfo = json.decode(resultData[1].charinfo)
                                if charInfo.phone then 
                                    MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                                    charInfo.phone = newNumber
                                    cb(true)
                                    DropPayer(_source, "[ak4y-donateSystem] Phone number changed!")
                                    SendToDiscord("identifier: ``"..identifier.."``\nNew Number: ``"..newNumber.."``\nPhone number changed!")
                                    Wait(5000)
                                    local newInfo = json.encode(charInfo)
                                    MySQL.update('UPDATE users SET charinfo = ? WHERE identifier = ?', { newInfo, identifier })
                                else
                                    cb(false)
                                end
                            else
                                cb(false)
                            end
                        elseif AK4Y.Phone == "gcphone" then
                            local resultPhone = MySQL.query.await('SELECT * FROM users WHERE phone_number = ?', { newNumber })
                            if resultPhone[1] == nil then
                                MySQL.update('UPDATE ak4y_donatesystem SET credit = credit - ? WHERE identifier = ?', { costCredit, identifier })
                                cb(true)
                                DropPlayer(_source, "[ak4y-donateSystem] Phone number changed!")
                                SendToDiscord("identifier: ``"..identifier.."``\nNew Number: ``"..newNumber.."``\nPhone number changed!")
                                Wait(5000)
                                MySQL.update('UPDATE users SET phone_number = ? WHERE identifier = ?', { newNumber, identifier })
                            else
                                cb(false)                                    
                            end
                        end
                    else
                        cb(false)
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
        if AK4Y.Mysql == "oxmysql" then
            local result = MySQL.query.await('SELECT * FROM ak4y_donatesystem_codes WHERE code = ?', { tbxid })
            if result[1] == nil then
                MySQL.insert('INSERT INTO ak4y_donatesystem_codes (code, credit) VALUES (?, ?)', { tbxid, credit })
                SendToDiscord("Code: ``"..tbxid.."``\nCredit: ``"..credit.."``\nsuccessfuly into your database!")
            end
            inProgress = false  
        end
    end
end)


AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        if AK4Y.UseTebex then 
            local tebexConvar = GetConvar('sv_tebexSecret', '')
            if tebexConvar == '' or tebexConvar == nil then
                print('^1////////////////////////////////////////////////////////////////////////////////////////////////////////////')
                print('^1//////////////////////////////////////////^Tebex Secret Missing.^1//////////////////////////////////////////')
                print('^1////////////////////////////////////////////////////////////////////////////////////////////////////////////')
                print('ak4y-donateSystem: Tebex Secret Missing please set in server.cfg and try again. Script will not work correctly.')
                shouldStop = true
            end
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

        if AK4Y.Mysql == "oxmysql" then 
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

-- Todo faire l'event pour les packs