ESX = exports["believer"]:getSharedObject()

local lastSelected = nil
local lastValidatedCase = nil

RegisterNUICallback('closeMenu', function(data, cb)
	SetNuiFocus(false, false)
end)

local openMenuSpamProtect = 0
RegisterCommand(Cases.OpenCommand, function()
    if openMenuSpamProtect < GetGameTimer() then 
        openMenuSpamProtect = GetGameTimer() + 1500
        ESX.TriggerServerCallback("Cases:getPlayerDetails", function(result)
            local firstname = result.charName
            local lastname = ""
            apiKey = result.apiKey
            if result.steamid then
                steamID = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. apiKey .. "&steamids=" .. result.steamid
            else
                steamID = 'null'
            end
            SetNuiFocus(true,true)
            SendNUIMessage({
                type = 'openUi', 
                premiumCases = Cases.PremiumCases,
                standardCases = Cases.StandardCases,
                myGoldCoin = result.creditcoin,
                mySilverCoin = result.silvercoin,
                myFirstName = firstname,
                myLastName = lastname,
                webSiteLink = Cases.WebsiteLink,
                discordLink = Cases.DiscordLink,
                steamid = steamID,
                translate = Cases.Translate,
                lastItems = result.lastItems,
            })	
        end)
    end
end)

local collectItemSpamProtect = 0
RegisterNUICallback("collectItem", function(data, cb)
    if collectItemSpamProtect < GetGameTimer() then 
        collectItemSpamProtect = GetGameTimer() + 1500
        if lastSelected.itemName == data.collectedItem.itemName then 
            ESX.TriggerServerCallback("Cases:collectItem", function(result)
                SendNUIMessage({
                    type = 'setLastItems', 
                    lastItems = result.lastItems,
                })	
                cb(result.state)
            end, lastSelected, lastValidatedCase)
        else
            cb(false)
        end
        Wait(100)
        lastValidatedCase = nil
        lastSelected = nil
    else
        cb(false)
    end
end)

local sellItemSpamProtect = 0
RegisterNUICallback("sellItem", function(data, cb)
    if sellItemSpamProtect < GetGameTimer() then 
        sellItemSpamProtect = GetGameTimer() + 1500
        if lastSelected.sellCredit == data.sellItem.sellCredit then 
            ESX.TriggerServerCallback("Cases:sellItem", function(result)
                cb(result)
            end, lastValidatedCase, lastSelected)
        else
            cb(false)
        end
        Wait(100)
        lastValidatedCase = nil
        lastSelected = nil
    else
        cb(false)
    end
end)

local openCaseSpamProtect = 0
RegisterNUICallback('caseOpenSelect', function(data, cb)
    if openCaseSpamProtect < GetGameTimer() then 
        openCaseSpamProtect = GetGameTimer() + 1500
        if data then 
            lastValidatedCase = nil
            lastSelected = nil
            local selectedCaseSeries = Cases.StandardCases
            if data.selectedCase.caseType and data.selectedCase.caseType == "premium" then
                selectedCaseSeries = Cases.PremiumCases
            end
            for k, v in pairs(selectedCaseSeries) do 
                if v.uniqueId == data.selectedCase.uniqueId then 
                    lastValidatedCase = v
                    break
                end
            end
            if lastValidatedCase then 
                local randomItemList = {}
                for k, v in pairs(lastValidatedCase.items) do 
                    local chance = math.ceil(v.chance / 0.1)
                    for i = 0, chance do 
                        table.insert(randomItemList, v)
                    end
                end
                lastSelected = randomItemList[math.random(1, #randomItemList)]
                ESX.TriggerServerCallback("Cases:selectedCaseOpen", function(result)
                    if result then 
                        cb(lastSelected)
                    else
                        cb(false)
                    end
                end, lastValidatedCase, lastSelected)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
	
end)

local sendInputSpamProtect = 0
RegisterNUICallback('sendInput', function(data, cb)
	if sendInputSpamProtect <= GetGameTimer() then
		sendInputSpamProtect = GetGameTimer() + 2000 
		ESX.TriggerServerCallback("Cases:sendInput", function(result)
			if result then 	
				cb(tonumber(result))
			else
				cb(false)
			end
		end, data)
    else
        cb(false)
	end
end)

RegisterNetEvent('Cases:serverNotif')
AddEventHandler('Cases:serverNotif', function(data)
	SendNUIMessage({
        type = 'serverNotif', 
        notifInfo = data,
    })	
end)