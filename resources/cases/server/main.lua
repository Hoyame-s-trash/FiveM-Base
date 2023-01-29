ESX = exports["believer"]:getSharedObject()

local lastItems = {}

ESX.RegisterServerCallback('Cases:getPlayerDetails', function(source, cb)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local steamid = tonumber(identifier:gsub("steam:",""), 16)
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.identifier
    local firstName = GetPlayerName(src)
    local callbackData = {}
    local result = ExecuteSql("SELECT * FROM boutique_account WHERE identifier = '"..identifier.."'")
    if result[1] == nil then    
        ExecuteSql("INSERT INTO boutique_account SET identifier = '"..identifier.."', credit = '0', silvercoin = '0'")
        callbackData = {
            creditcoin = 0,
            silvercoin = 0,
            apiKey = steamApiKey,
            steamid = steamid,
            lastItems = lastItems,
            charName = firstName,
        }
    else
        callbackData = {
            creditcoin = result[1].credit,
            silvercoin = result[1].silvercoin,
            apiKey = steamApiKey,
            steamid = steamid,
            lastItems = lastItems,
            charName = firstName,
        }
    end
    cb(callbackData)
end)


ESX.RegisterServerCallback('Cases:selectedCaseOpen', function(source, cb, caseData, itemData)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.identifier

    local result = ExecuteSql("SELECT * FROM boutique_account WHERE identifier = '"..identifier.."'")
    if result[1] ~= nil then    
        if caseData.priceType == "COINS" then 
            if result[1].credit >= caseData.price then 
                ExecuteSql("UPDATE boutique_account SET credit = credit - '"..caseData.price.."' WHERE identifier = '"..identifier.."'")
                SendToDiscord("identifier: ``"..identifier.."``\nCASE UNIQUE ID: ``"..caseData.uniqueId.."``\nCASE OPENED!")
                cb(true)
            else
                cb(false)
            end
        else
            if result[1].silvercoin >= caseData.price then 
                ExecuteSql("UPDATE boutique_account SET silvercoin = silvercoin - '"..caseData.price.."' WHERE identifier = '"..identifier.."'")
                SendToDiscord("identifier: ``"..identifier.."``\nCASE UNIQUE ID: ``"..caseData.uniqueId.."``\nCASE OPENED!")
                cb(true)
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('Cases:collectItem', function(source, cb, itemData, caseData)  
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier

    local firstName = GetPlayerName(_source)
    local lastName = ""
    
    local itemValue = itemData.itemType
    local itemType = itemData.giveItemType
    local itemName = itemData.itemName
    local itemCount = itemData.itemCount
    local itemLabel = itemData.label
    local itemImage = itemData.image
    local caseName = caseData.label

    local lastRegister = false 
    local serverNotify = false
    for k, v in pairs(Cases.LastItemCategories) do 
        if v == itemValue then 
            lastRegister = true
        end
    end  
    for k, v in pairs(Cases.ServerNotifyCategories) do 
        if v == itemValue then 
            serverNotify = true
        end
    end  
    
    if serverNotify then 
        TriggerClientEvent('Cases:serverNotif', -1, {firstName = firstName, lastName = lastName, itemLabel = itemLabel, itemImage = itemImage})
    end

    if lastRegister then 
        local idData = #lastItems + 1
    
        if #lastItems > 9 then 
            local lowestIndex = 99999
            for k, v in pairs(lastItems) do
                local indexim = v.id
                if indexim < lowestIndex then 
                    lowestIndex = indexim
                end
            end
            for k, v in pairs(lastItems) do 
                if v.id == lowestIndex then 
                    lastItems[k] = nil
                end
            end
        end
    
        local indexData = #lastItems + 1
        lastItems[indexData] = {}
        lastItems[indexData]["id"] = idData
        lastItems[indexData]["itemLabel"] = itemLabel
        lastItems[indexData]["itemImage"] = itemImage
        lastItems[indexData]["itemType"] = itemValue
        lastItems[indexData]["caseName"] = caseName
        lastItems[indexData]["firstname"] = firstName
        lastItems[indexData]["lastname"] = lastName
    end

    
    if itemType == "item" then 
        xPlayer.addInventoryItem(itemName, itemCount)
    elseif itemType == "weapon" then 
        if Cases.WeaponsAreItem then 
            for i = 1, count, 1 do 
                xPlayer.addInventoryItem(itemName, 1)
            end
        else
            xPlayer.addWeapon(itemName, itemCount)
        end
    elseif itemType == "vehicle" then
        for i = 1, itemCount do 
            local plate = GeneratePlate()
            local vehicleData = {}
            vehicleData.model = GetHashKey(itemName)
            vehicleData.plate = plate
            ExecuteSql("INSERT INTO owned_vehicles (owner, plate, label, vehicle, type, state, boutique) VALUES ('"..identifier.."', '"..plate.."', '"..itemName.."', '"..json.encode(vehicleData).."', 'car', 1, 1)")
        end
    elseif itemType == "money" then 
        xPlayer.addAccountMoney("cash", itemCount)
    elseif itemType == "coins" then 
        xPlayer.addAccountMoney("cash", itemCount)
        ExecuteSql("UPDATE boutique_account SET credit = credit + '"..itemCount.."' WHERE identifier = '"..identifier.."'")
    end
    SendToDiscord("identifier: ``"..identifier.."``\nITEM: ``"..itemName.."``\nCOUNT: ``"..itemCount.."``\nITEM TYPE: ``"..itemType.."``\nITEM COLLECTED!")
    callBackData = {
        state = true,
        lastItems = lastItems,
    }
    cb(callBackData)  
end)

ESX.RegisterServerCallback('Cases:sellItem', function(source, cb, caseData, itemData)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.identifier
    local result = ExecuteSql("SELECT * FROM boutique_account WHERE identifier = '"..identifier.."'")
    if result[1] ~= nil then    
        if caseData.priceType == "COINS" then 
            ExecuteSql("UPDATE boutique_account SET credit = credit + '"..itemData.sellCredit.."' WHERE identifier = '"..identifier.."'")
            cb(true)
        else
            ExecuteSql("UPDATE boutique_account SET silvercoin = silvercoin + '"..itemData.sellCredit.."' WHERE identifier = '"..identifier.."'")
            cb(true)
        end
        SendToDiscord("identifier: ``"..identifier.."``\nCREDIT: ``"..itemData.sellCredit.."``\nPRICE TYPE: ``"..caseData.priceType.."``\nITEM SELLED!")
    else
        cb(false)
    end
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

        local result = ExecuteSql("SELECT 1 FROM owned_vehicles WHERE plate = '"..generatedPlate.."'")
        if result[1] == nil then 
            doBreak = true
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

ESX.RegisterServerCallback('Cases:sendInput', function(source, cb, data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local inputData = data.input
    local result = ExecuteSql("SELECT * FROM caseopening_codes WHERE code = '"..inputData.."'")
    if result[1] ~= nil then
        ExecuteSql("DELETE FROM caseopening_codes WHERE code = '"..inputData.."'")
        ExecuteSql("UPDATE boutique_account SET credit = credit + '"..result[1].creditCount.."' WHERE identifier = '"..identifier.."'")
        SendToDiscord("identifier: ``"..identifier.."``\nCODE: ``"..inputData.."``\nCREDIT: ``"..result[1].creditCount.."``\nCode used!")
        cb(result[1].creditCount)
    else
        cb(false)
    end
end)

RegisterCommand('purchase_caseopening_credit', function(source, args)
	local src = source
    if src == 0 then
        local dec = json.decode(args[1])
        local tbxid = dec.transid
        local credit = dec.credit
        while inProgress do
            Wait(1000)
        end
        inProgress = true
        local result = ExecuteSql("SELECT * FROM caseopening_codes WHERE code = '"..tbxid.."'")
        if result[1] == nil then
            ExecuteSql("INSERT INTO caseopening_codes (code, creditCount) VALUES ('"..tbxid.."', '"..credit.."')")
            SendToDiscord("Code: ``"..tbxid.."``\nCredit: ``"..credit.."``\nsuccessfuly into your database!")
        end
        inProgress = false  
    end
end)



local DISCORD_NAME = "Cases Scripts"
local DISCORD_IMAGE = "https://steamuserimages-a.akamaihd.net/ugc/848220336390493472/73E4DDF575623F925D0E727FBB0AE67EBFF6902E/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true"
Discord_Webhook = Discord_Webhook
function SendToDiscord(name, message, color)
	if Discord_Webhook == "CHANGE_WEBHOOK" then
	else
		local connect = {
            {
                ["color"] = color,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                ["text"] = "Cases CASEOPENING",
                },
            },
	    }
		PerformHttpRequest(Discord_Webhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
	end
end

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if MySQL == nil then
        exports.oxmysql:execute(query, function(data)
            result = data
            IsBusy = false
        end)
    else
        MySQL.query(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    end
    
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end