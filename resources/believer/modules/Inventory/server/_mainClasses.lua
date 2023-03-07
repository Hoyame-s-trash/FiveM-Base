local function CreateUsableItem(itemName, data)
	BlueStarkInventory.ServerFramework.RegisterUsableItem(itemName, data)
end
exports("CreateUsableItem", CreateUsableItem)

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
        itemData.attach_component = "clip_extended"
        itemData.component = "clip_extended"

    elseif createdItem._name == "clip_drum" then
        itemData.attach_component = "clip_drum"
        itemData.component = "clip_drum"
        
    elseif createdItem._name == "scope" then
        itemData.attach_component = "scope"
        itemData.component = "scope"

    elseif createdItem._tpl == "bag1" then
        itemData.clothData = {
            drawable = 5,
            Male = {id= 45, texture=1},
            Female = {id= 45, texture=1},
        }
    elseif createdItem._tpl == "rig1" then
        itemData.clothData = {
            drawable = 9,
            Male = {id= 5, texture=1},
            Female = {id= 5, texture=1},
        }
    end
	
    return itemData
end


Inventory = {
    AddItem = function ( source, itemID, itemAmount, itemData )
		if itemID == nil then return RconPrint("Invalid Item " .. itemID .. "\n") end
        if BlueStarkInventory.Items[itemID] == nil then return RconPrint("Invalid Item " .. itemID .. "\n") end

        if itemAmount == nil then itemAmount = 1 end

        if itemData == nil then itemData = { ["CurrentStack"] = itemAmount } end

        local createdItem = json.decode(json.encode(BlueStarkInventory.Items[itemID].item))

        if tonumber(itemAmount) <= tonumber(createdItem._data.MaxStack) then
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
			createdItem.count = itemAmount
            createdItem.slot = randomID
			createdItem.name = createdItem._tpl
            

            TriggerClientEvent("ls-inventory:c:addItem", source, createdItem)
        end
    end,

    RemoveItem = function ( source, itemIdentifier, amount)
        local curItem = GetCurrentInventory()[BlueStarkInventory.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
        if curItem ~= nil then 
            if curItem.info.CurrentStack >= amount then
                TriggerClientEvent("ls-inventory:c:removeItem", source, itemIdentifier, amount)
                return true
            end
        end
        return false
    end,

    GetItem = function ( source, itemIdentifier )
        return GetCurrentInventory()[BlueStarkInventory.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
    end,

    UpdateItem = function ( source, itemIdentifier, newData )
        if itemIdentifier == nil or newData == nil then return end
        TriggerClientEvent("ls-inventory:c:updateItem", source, itemIdentifier, BlueStarkInventory.Functions.Server.GetIdentifier(source), newData)
    end,

    UseItem = function ( source, item )
        if (type(item) == "table") then
            if item._data.Type == "Weapon" then
                if item.info.quality > 0 then
                    TriggerClientEvent("ls-inventoryhud:c:useWeapon", source, item, true)
                end
            else
                BlueStarkInventory.ServerFramework.UseItem(source, item._tpl, item)
            end
        end
    end,


    GetItems = function ( source )
		if GetCurrentInventory() == nil or BlueStarkInventory.Functions.Server.GetIdentifier(source) == nil or GetCurrentInventory()[BlueStarkInventory.Functions.Server.GetIdentifier(source)] == nil then return {} end
        return GetCurrentInventory()[BlueStarkInventory.Functions.Server.GetIdentifier(source)].items
    end,

    BuyItem = function ( source, item, amount)
        local Player = BlueStarkInventory.Functions.Server.GetPlayer(source)

        if Player == nil then return false end

        local cashBalance = Player.getAccount('money').money

		local price = tonumber((item.price*amount))

        if price <= cashBalance then
            Player.removeAccountMoney('money', price) 
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

Citizen.CreateThread(function()
    Citizen.Wait(100)
	ESX = nil

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(30)
	end
	
	Citizen.Wait(500)

    ESX.RegisterCommand('giveitem', 'admin', function(xPlayer, args, showError)
        Inventory.AddItem(args.playerId.source, args.item, args.count, nil)
    end, true, {help = "Give item", validate = false, arguments = {
        {name = 'playerId', help = "Player ID", type = 'player'},
        {name = 'item', help = "Item ID", type = 'string'},
        {name = 'count', help = "Item Count", type = 'number'}
    }})
end)

CreateUsableItem("14ehcp8zup6cqffe3nxwy8pz", function(source, item)
	print(json.encode(item))
end)

CreateUsableItem("zehd54y3no4yfvizu17qwe98", function(source, item)
    print("ASDASD")
	Inventory.RemoveItem(source, item._id, 1)
end)