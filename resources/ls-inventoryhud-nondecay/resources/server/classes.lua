local function CreateUsableItem(itemName, data)
	Config.ServerFramework.Functions.CreateUseableItem(itemName, data)
end
exports("CreateUsableItem", CreateUsableItem)

local function GetUsableItem(itemName)
	return Config.ServerFramework.Functions.CanUseItem(itemName)
end
exports("GetUsableItem", GetUsableItem)

local function UseItem(itemName, ...)
	local itemData = GetUsableItem(itemName)
	local callback = type(itemData) == 'table' and (rawget(itemData, '__cfx_functionReference') and itemData or itemData.cb or itemData.callback) or type(itemData) == 'function' and itemData
    if not callback then return end
	callback(...)
end
exports("UseItem", UseItem)


function CreateItemData(itemData, createdItem)
    if createdItem._data.Type == "Weapon" then
        itemData.serie = tostring(randomString(15))
        itemData.ammo = 0
        itemData.quality = 100
        itemData.info = {}
    elseif createdItem._name == "suppressor" then
        itemData.attach_component = "suppressor"
        itemData.component = "suppressor"

    elseif createdItem._name == "flashlight" then
        itemData.attach_component = "flashlight"
        itemData.component = "flashlight"

    elseif createdItem._name == "clip_extended" then
        itemData.attach_component = "clip"
        itemData.component = "clip_extended"
    elseif createdItem._name == "clip_drum" then
        itemData.attach_component = "clip"
        itemData.component = "clip_drum"
        
    elseif createdItem._name == "scope" then
        itemData.attach_component = "scope"
        itemData.component = "scope"

    -- elseif createdItem._tpl == "bag1" then
        -- itemData.clothData = {
            -- drawable = 5,
            -- Male = {id= 45, texture=1},
            -- Female = {id= 45, texture=1},
        -- }
    -- elseif createdItem._tpl == "rig1" then
        -- itemData.clothData = {
            -- drawable = 9,
            -- Male = {id= 5, texture=1},
            -- Female = {id= 5, texture=1},
        -- }
    end
	
    return itemData
end


Inventory = {
    AddItem = function ( source, itemID, itemAmount, itemData )
        if Config.Items[itemID] == nil then return RconPrint("Invalid Item " .. itemID .. "\n") end

        if itemAmount == nil then itemAmount = 1 end

        if itemData == nil then itemData = { ["CurrentStack"] = itemAmount } end

        local createdItem = json.decode(json.encode(Config.Items[itemID].item))

        if itemAmount <= createdItem._data.MaxStack then
            local randomID = randomString(22)

            createdItem._id = randomID
            createdItem._tpl = itemID
            createdItem._parent = ""
            createdItem.isSearched = true 
            createdItem.loc = {}

            itemData = CreateItemData(itemData, createdItem)

            itemData.CurrentStack = itemAmount

            createdItem.info = itemData
            createdItem.amount = itemAmount
            createdItem.slot = randomID
            createdItem.name = createdItem._name
            

            TriggerClientEvent("ls-inventory:c:addItem", source, createdItem)
        end
    end,

    RemoveItem = function ( source, itemIdentifier, amount)
        local curItem = GetCurrentInventory()[Config.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
        if curItem ~= nil then 
            if curItem.info.CurrentStack >= amount then
                TriggerClientEvent("ls-inventory:c:removeItem", source, itemIdentifier, amount)
                return true
            end
        end
        return false
    end,


    GetItem = function ( source, itemIdentifier )
        return GetCurrentInventory()[Config.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
    end,

    UpdateItem = function ( source, itemIdentifier, newData )
        if itemIdentifier == nil or newData == nil then return end
        TriggerClientEvent("ls-inventory:c:updateItem", source, itemIdentifier, Config.Functions.Server.GetIdentifier(source), newData)
    end,

    UseItem = function ( source, item )
		if type(item) == "table" then
			if item._data.Type == "Weapon" then
				if item.info.quality > 0 then
					TriggerClientEvent("ls-inventoryhud:c:useWeapon", source, item, true)
				end
			else
				UseItem(item._tpl, source, item)
			end
		end
    end,

    GetItems = function ( source )
		if GetCurrentInventory() == nil or Config.Functions.Server.GetIdentifier(source) == nil or GetCurrentInventory()[Config.Functions.Server.GetIdentifier(source)] == nil then return {} end
        return GetCurrentInventory()[Config.Functions.Server.GetIdentifier(source)].items
    end,

    BuyItem = function ( source, item, amount)
        local Player = Config.ServerFramework.Functions.GetPlayer(source)

        if Player == nil then return false end

        local cashBalance = Player.PlayerData.money["cash"]

		local price = tonumber((item.price*amount))

        if price <= cashBalance then
            Player.Functions.RemoveMoney('cash', price, "Item bought")
            return true
        else
            return false
        end
    end,
}

function GetItem(source, itemIdentifier)
    return Inventory.GetItem(source, itemIdentifier)
end
exports("GetItem", GetItem)

function AddItem(source, itemID, itemAmount, itemData )
    return Inventory.AddItem(source, itemID, itemAmount, itemData )
end
exports("AddItem", AddItem)

function UpdateItem(source, itemIdentifier, newData)
    return Inventory.UpdateItem(source, itemIdentifier, newData)
end
exports("UpdateItem", UpdateItem)

function RemoveItem(source, id, amount)
    return Inventory.RemoveItem(source, id, amount)
end
exports("RemoveItem", RemoveItem)

function UseItem2(source, item)
    return Inventory.UseItem(source, item)
end
exports("UseItem", UseItem2)

function GetItems(source, item)
    return Inventory.GetItems(source)
end
exports("GetItems", GetItems)

function InventoryClasses()
    return Inventory
end
exports("Inventory", InventoryClasses)

RegisterNetEvent("inventory:s:GiveItem", function(itemName, Amount, ItemData)
    Inventory.AddItem(source, itemName, Amount, ItemData)
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        saveInventory()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5 * 60 * 1000)
        saveInventory()
    end
end)

RegisterCommand('saveInventories', function(src, args, raw)
    if src == 0 then
        saveInventory()
    end
end)

Config.ServerFramework.Commands.Add("giveitem", "Give An Item (Admin Only)", {{name="id", help="Player ID"},{name="item", help="Name of the item (not a label)"}, {name="amount", help="Amount of items"}}, false, function(source, args)
	local id = tonumber(args[1])
	local Player = Config.ServerFramework.Functions.GetPlayer(id)
	local amount = tonumber(args[3]) or 1
	local itemData = tostring(args[2])
	if Player then
        Inventory.AddItem(id, itemData, amount)
	end
end, "admin")

CreateUsableItem("14ehcp8zup6cqffe3nxwy8pz", function(source, item)
	print(json.encode(item))
end)

CreateUsableItem("zehd54y3no4yfvizu17qwe98", function(source, item)
    print("ASDASD")
	exports["ls-inventoryhud"]:Inventory().RemoveItem(source, item._id, 1)
end)




if Config.CheckInventoryEveryStart then
    AddEventHandler('onResourceStart', function(resourceName)
        if (GetCurrentResourceName() ~= resourceName) then
            return
        end
        Citizen.Wait(2500)
        ExecuteCommand("checkinventory")
    end)
end


InventoryCheck = {
    isWorking = false,
    isTriggered = false,
}

RegisterCommand("checkinventory", function( src, args ,raw )
    if src == 0 then
        InventoryCheck.isWorking = false
        InventoryCheck.isTriggered = false

        InventoryCheck.isWorking = true
        RconPrint('[ls-inventory] Inventory will be checking...' .. "\n")
        RconPrint('^1[ls-inventory] Warning this checking will not give definitive results!' .. "^7\n\n")
        Citizen.Wait(1000)
        local resourcename = "qb-core"
        if GetResourceState(resourcename) ~= 'missing' then RconPrint('[ls-inventory] '..resourcename..' enabled and working!' .. "\n")
        else InventoryCheck.isWorking = false return RconPrint('[ls-inventory] '..resourcename..' not working it causes several issues!' .. "\n") 
        end

        Citizen.Wait(100)
        resourcename = "fivem-appearance"
        if GetResourceState(resourcename) == 'missing' then
            resourcename = "qb-clothing"
            if GetResourceState(resourcename) ~= 'missing' then RconPrint('[ls-inventory] '..resourcename..' enabled and working!' .. "\n")
            else InventoryCheck.isWorking = false return RconPrint('[ls-inventory] '..resourcename..' not working it causes several issues!' .. "\n")
            end

        else
            if GetResourceState(resourcename) ~= 'missing' then RconPrint('[ls-inventory] '..resourcename..' enabled and working!' .. "\n")
            else InventoryCheck.isWorking = false return RconPrint('[ls-inventory] '..resourcename..' not working it causes several issues!' .. "\n")
            end
        end


        Citizen.Wait(100)
        RconPrint('[ls-inventory] Dependecies checked, everything fine starting next step...' .. "\n")
        Citizen.Wait(1000)
        RconPrint('\n[ls-inventory] qb-core checking...' .. "\n")

        local isFound = FindFolder(io.popen"cd":read'*l'.."/resources", "qb-core")

        if not isFound then
            InventoryCheck.isWorking = false 
            return RconPrint('[ls-inventory] qb-core not found!' .. "\n")
        end

        local file = io.open(isFound.."/server/player.lua", "rb")
        if file == nil then 
            InventoryCheck.isWorking = false 
            return RconPrint('[ls-inventory] qb-core not found!' .. "\n")
        end

        local content = file:read "*a"
        file:close()
        Citizen.Wait(250)

        if not string.match(content, ':AddItem') then
            InventoryCheck.isWorking = false 
            return RconPrint('[ls-inventory] AddItem not implemented!' .. "\n")
        else
            RconPrint('[ls-inventory] AddItem implemented!' .. "\n")
        end

        if not string.match(content, ':RemoveItem') then
            InventoryCheck.isWorking = false 
            return RconPrint('[ls-inventory] RemoveItem not implemented!' .. "\n")
        else
            RconPrint('[ls-inventory] RemoveItem implemented!' .. "\n")
        end

        RconPrint('[ls-inventory] qb-core is works fine!' .. "\n")
        Citizen.Wait(1000)
        RconPrint('\n^1[ls-inventory] Warning clothing check will not give definitive results!' .. "^7\n")
        resourcename = "fivem-appearance"
        if GetResourceState(resourcename) == 'missing' then


            RconPrint('[ls-inventory] qb-clothing checking...' .. "\n")
            Citizen.Wait(1000)
    
            local isFound = FindFolder(io.popen"cd":read'*l'.."/resources", "qb-clothing")

            if not isFound then
                InventoryCheck.isWorking = false 
                return RconPrint('[ls-inventory] qb-clothing not found!' .. "\n")
            end
    
            local file = io.open(isFound.."/client/main.lua", "rb")
            if file == nil then 
                InventoryCheck.isWorking = false 
                return RconPrint('[ls-inventory] qb-clothing not found!' .. "\n")
            end
    
            local content = file:read "*a"
            file:close()
            Citizen.Wait(250)
    
            if not string.match(content, 'giveClothesAsItem') then
                InventoryCheck.isWorking = false 
                return RconPrint('[ls-inventory] Clothing not implemented!' .. "\n")
            else
                RconPrint('[ls-inventory] Clothing implemented!' .. "\n")
            end

        else

            RconPrint('[ls-inventory] fivem-appearance didnt\'t know how it worls currently!' .. "\n")

        end

        RconPrint('[ls-inventory] Resources checked, everything fine starting next step...' .. "\n\n")
        Citizen.Wait(1000)
        if GetCurrentResourceName() ~= "ls-inventoryhud" then
            InventoryCheck.isWorking = false 
            return RconPrint('[ls-inventory] Change inventory name to ^1ls-inventoryhud!' .. "^7\n")
        else
            RconPrint('[ls-inventory] Inventory name correct!' .. "\n")
        end

        Citizen.Wait(250)

        if Config.ServerFramework == nil then
            RconPrint('[ls-inventory] Framework not works fine!' .. "^7\n")
        else
            RconPrint('[ls-inventory] Framework works fine!' .. "^7\n")
        end

        Citizen.Wait(250)
        RconPrint('^2[ls-inventory] Inventory checking process finished, there is no important errors!' .. "^7\n")
        InventoryCheck.isWorking = false
        InventoryCheck.isTriggered = false
    end
end)

local directory = false

function FoundedDIR( found )
    directory = found
end

function FindFolder(DIR, searching)
    directory = false

    CheckEveryFolder(DIR, searching)

    Citizen.Wait(500)

    return directory
end

function CheckEveryFolder(DIR, searching)
    for dir in io.popen([[dir "]].. DIR ..[[" /b /ad]]):lines() do 
        if directory ~= false then break end
        if dir == searching then
            FoundedDIR(DIR .. "/".. dir)
            break
        else
            if string.match(dir, "%[") and string.match(dir, "%]") and not string.match(dir, "cfx-default") and not string.match(dir, "CFX-DEFAULT") then
            -- if dir ~= "webpack" and dir ~= "yarn" and dir ~= "chat" and dir ~= "screenshot-basic" and not string.match(dir, "cfx-default") and not string.match(dir, "CFX-DEFAULT") and dir ~= "html" and dir ~= "objects" and dir ~= "server" and dir ~= "client" and dir ~= "workflows" and dir ~= "" then
                local addValue = DIR .. "/".. dir
                CheckEveryFolder(addValue, searching)
            end
        end
    end
end

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    if GetResourceState("ls-core") == "missing" or GetResourceState("ls-core") == "stopped" then
        while true do
            Citizen.Wait(2000)
            print("[ls-inventory] ls-core is missing, download before using!")
        end
    else
        exports["ls-core"]:CheckVersion(Config.Version, "ls-inventoryhud")
    end
end)