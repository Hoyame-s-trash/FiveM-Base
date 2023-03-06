GM.Inventory = GM.Inventory or {}

Callback = {}
Callback.Functions = {}
Callback.ServerCallbacks = {}

GM.Inventory.Database = function(plugin,type,query,var)
    local wait = promise.new()
    if type == 'execute' and plugin == 'oxmysql' then
        exports.oxmysql:query(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'fetchAll' and plugin == 'oxmysql' then
        exports.oxmysql:query(query, var, function(result)
            wait:resolve(result)
        end)
    end
    return Citizen.Await(wait)
end

Callback.Functions.CreateCallback = function(name, cb)
    Callback.ServerCallbacks[name] = cb
end

Callback.Functions.TriggerCallback = function(name, source, cb, ...)
    local src = source
    if Callback.ServerCallbacks[name] then
        Callback.ServerCallbacks[name](src, cb, ...)
    end
end


RegisterNetEvent('inventory:Server:TriggerCallback', function(name, ...)
    local src = source
    Callback.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('inventory:Client:TriggerCallback', src, name, ...)
    end, ...)
end)

local CurrentInventorys = {}

Callback.Functions.CreateCallback("Inventory:s:getAllItems", function(source, cb, inventory)
    cb(GM.Inventory.Items)
end)

Callback.Functions.CreateCallback("Inventory:s:getPlayerInventory", function(source, cb)
    local Player = GM.Inventory.Functions.Server.GetPlayer(source)
    local PlayerID =  GM.Inventory.Functions.Server.GetIdentifier(source)
    if PlayerID ~= nil then
        if CurrentInventorys[PlayerID] ~= nil then
            cb(CurrentInventorys[PlayerID])
        else
            local resultCheck = GM.Inventory.Database("oxmysql", 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = PlayerID})
            if resultCheck[1] ~= nil then
                CurrentInventorys[PlayerID] = json.decode(resultCheck[1].data)

                cb(CurrentInventorys[PlayerID])
            else
                CurrentInventorys[PlayerID] = CreateDB(Player, PlayerID)
                
                cb(CurrentInventorys[PlayerID])
            end
        end
    end
end)

Callback.Functions.CreateCallback("Inventory:s:getSecondInventory", function(source, cb, inventory)
    if inventory.type == "vehicle" then
        if CurrentInventorys[inventory.identifier] ~= nil then
            cb(CurrentInventorys[inventory.identifier])
        else
            local resultCheck = GM.Inventory.Database("oxmysql", 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = inventory.identifier})
            if resultCheck[1] ~= nil then
                CurrentInventorys[inventory.identifier] = json.decode(resultCheck[1].data)

                cb(CurrentInventorys[inventory.identifier])
            else
                CurrentInventorys[inventory.identifier] = CreateSecondDB(inventory, inventory.identifier)
                
                cb(CurrentInventorys[inventory.identifier])
            end
        end
    elseif inventory.type == "player" then
        cb(CurrentInventorys[inventory.identifier])
    elseif inventory.type == "custom" then
        if CurrentInventorys[inventory.identifier] ~= nil then
            cb(CurrentInventorys[inventory.identifier])
        else
            local resultCheck = GM.Inventory.Database("oxmysql", 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = inventory.identifier})
            if resultCheck[1] ~= nil then
                CurrentInventorys[inventory.identifier] = json.decode(resultCheck[1].data)

                cb(CurrentInventorys[inventory.identifier])
            else
                CurrentInventorys[inventory.identifier] = CreateSecondDB(inventory, inventory.identifier)
                
                cb(CurrentInventorys[inventory.identifier])
            end
        end
    end
end)


RegisterNetEvent("Inventory:s:ItemChanged", function(data)
    data.itemD.amount = data.itemD.info.CurrentStack

    if (data.fromInventory ~= nil) then CurrentInventorys[data.fromInventory].items[data.itemD._id] = nil end
    
    if (data.notGonnaBeDeleted ~= nil) then 
        if (data.notGonnaBeDeleted) then
            if not CurrentInventorys[data.fromInventory] ~= nil then
                CurrentInventorys[data.fromInventory].items[data.itemD._id] = data.itemD 
            end
        end 
    end

    if (CurrentInventorys[data.toInventory] ~= nil) then CurrentInventorys[data.toInventory].items[data.itemD._id] = data.itemD end


    TriggerClientEvent("Inventory:c:ItemChanged", -1, data)
end)

RegisterNetEvent("Inventory:s:FastUseChanged", function(data)
    if (data.typeFastUse == "Add") then
        CurrentInventorys[data.fastUseInventory].fastUse["Item"..data.fastUseKey] = data.fastUseItemData
    else
        CurrentInventorys[data.fastUseInventory].fastUse["Item"..data.fastUseKey] = nil
    end
end)

RegisterNetEvent("Inventory:s:UseItem", function(data)
    local item = CurrentInventorys[data.fastUseInventory].items[CurrentInventorys[data.fastUseInventory].fastUse["Item"..data.key]]
    Inventory.UseItem(source, item)
end)

RegisterNetEvent("Inventory:s:UseItemContext", function(data)
    local item = data.inventoryItem
    Inventory.UseItem(source, item)
end)

RegisterNetEvent("Inventory:s:UpdateItem", function(data)
    CurrentInventorys[data.inventoryId].items[data.itemIdentifier] = data.itemData
end)

RegisterNetEvent("Inventory:s:RemoveItem", function(data)
    if data.isFullyRemove then
        CurrentInventorys[data.inventoryId].items[data.itemData._id] = nil
    else
        CurrentInventorys[data.inventoryId].items[data.itemData._id] = data.itemData
    end
    
end)

RegisterNetEvent("Inventory:s:AddItemFromAttachment", function(data)
    Inventory.AddItem(source, data.itemData._id, 1)
    
end)

function saveInventory()
    for _,v in pairs(CurrentInventorys) do
        if (v.temporary == nil or not v.temporary) then
            GM.Inventory.Database("oxmysql", 'execute', 'UPDATE `user_inventory` SET `data` = @data WHERE `identifier` = @identifier', {
                ['@identifier'] = v._inventoryId,
                ['@data']       = json.encode(v)
            })
        end
    end
    print('[Inventory] All inventories saved!' .. "\n")
end

Callback.Functions.CreateCallback("inventory:s:checkPrice", function(source, cb, data)
    cb(Inventory.BuyItem(source, data.item, data.amount))
end)



Callback.Functions.CreateCallback("inventory:s:GetDropItems", function(_, cb, inventory)
    
    local resultCheck = CurrentInventorys[inventory.identifier]
    if resultCheck then
        cb(CurrentInventorys[inventory.identifier])
    else
        CurrentInventorys[inventory.identifier] = CreateSecondDB(inventory, inventory.identifier)

        cb(CurrentInventorys[inventory.identifier])
    end
end)

Callback.Functions.CreateCallback("inventory:server:GetDrops", function(_, cb)
    local result = {}
    if (CurrentInventorys ~= nil) then
        for k,v in pairs(CurrentInventorys) do
            if (v._inventoryId ~= nil) then
                if string.match(v._inventoryId, "DROP-") then
                    result[k] = v
                end
            end
        end
    end
    cb(result)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000*GM.Inventory.RefreshServerDrops)
		if CurrentInventorys ~= nil then
			for k,v in pairs(CurrentInventorys) do
                if string.match(v._inventoryId, "DROP-") then
                    CurrentInventorys[k].open = false
                    Citizen.CreateThread(function()
                        TriggerClientEvent("inventory:c:checkDropOpen", -1, k)
                        Citizen.Wait(100)
                        if tablelength(v.items) < 3 and not CurrentInventorys[k].open then
                            CurrentInventorys[k] = nil
                        end
                    end)
                end
			end
		end
	end
end)

RegisterNetEvent("inventory:s:checkDropOpen", function(id)
	if CurrentInventorys[id] ~= nil then
		CurrentInventorys[id].open = true
	end
end)

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end

function GetCurrentInventory()
    return CurrentInventorys
end

local function CreateUsableItem(itemName, data)
	ESX.RegisterUsableItem(itemName, data)
end
exports("CreateUsableItem", CreateUsableItem)

local function GetUsableItem(itemName)
    print(Core.UsableItemsCallbacks[itemName])
	return ESX.GetUsableItems()[itemName]
end
exports("GetUsableItem", GetUsableItem)

function UseItem(itemName, ...)
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
        itemData.attach_component = "clip_extended"
        itemData.component = "clip_extended"

    elseif createdItem._name == "clip_drum" then
        itemData.attach_component = "clip_drum"
        itemData.component = "clip_drum"
        
    elseif createdItem._name == "scope" then
        itemData.attach_component = "scope"
        itemData.component = "scope"
    end
    return itemData
end


Inventory = {
    AddItem = function ( source, itemID, itemAmount, itemData )
        if GM.Inventory.Items[itemID] == nil then return print("Invalid Item " .. itemID .. "\n") end

        if itemAmount == nil then itemAmount = 1 end

        if itemData == nil then itemData = { ["CurrentStack"] = itemAmount } end

        local createdItem = json.decode(json.encode(GM.Inventory.Items[itemID].item))

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

            print("Added Item " .. itemID .. " to " .. GM.Inventory.Functions.Server.GetIdentifier(source) .. "\n")
            

            TriggerClientEvent("Inventory:c:addItem", source, createdItem)
        end
    end,

    RemoveItem = function ( source, itemIdentifier, amount)
        local curItem = GetCurrentInventory()[GM.Inventory.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
        if curItem ~= nil then 
            if curItem.info.CurrentStack >= amount then
                TriggerClientEvent("Inventory:c:removeItem", source, itemIdentifier, amount)
                return true
            end
        end
        return false
    end,

    GetItem = function ( source, itemIdentifier )
        return GetCurrentInventory()[GM.Inventory.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
    end,

    UpdateItem = function ( source, itemIdentifier, newData )
        if itemIdentifier == nil or newData == nil then return end
        TriggerClientEvent("Inventory:c:updateItem", source, itemIdentifier, GM.Inventory.Functions.Server.GetIdentifier(source), newData)
    end,

    UseItem = function ( source, item )
        if (type(item) == "table") then
            if item._data.Type == "Weapon" then
                if item.info.quality > 0 then
                    TriggerClientEvent("inventory:c:useWeapon", source, item, true)
                end
            else
                ESX.UseItem(source, item._tpl, item)
            end
        end
    end,


    GetItems = function ( source ) 
        return GetCurrentInventory()[GM.Inventory.Functions.Server.GetIdentifier(source)].items
    end,

    BuyItem = function ( source, item, amount)
        local Player = ESX.GetPlayerFromId(source)

        if Player == nil then return false end

        local cashBalance = Player.getAccount('bank').cash

		local price = tonumber((item.price*amount))

        if price <= cashBalance then
            Player.removeAccountMoney('cash', price) 
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

function UseItem(source, item)
    return Inventory.UseItem(source, item)
end
exports("UseItem", UseItem)

function GetItems(source, item)
    return Inventory.GetItems(source)
end
exports("GetItems", GetItems)

function InventoryClasses()
    return Inventory
end
exports("Inventory", InventoryClasses)

RegisterNetEvent("Inventory:giveClothes", function(itemName, Amount, ItemData)
    -- Todo securize this event

    print(itemName)
    print(Amount)
    print(ItemData)
    print(json.encode(ItemData, {indent = true}))

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

RegisterCommand("giveiteminventory", function(source, args)
    if (source ~= 0) then return end
    Inventory.AddItem(tonumber(args[1]), tostring(args[2]), tonumber(args[3]), nil)
end)

local charset = {}  do -- [0-9a-zA-Z]
    for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
end

function randomString(length)
    local stringList = "abcdefghijklmnopqrstuvwxyz0123456789"
    local output = ""

    for i = 1, length do
        local rand = math.random(#stringList)
        output = output .. string.sub(stringList, rand, rand)
    end

    return output
end
--

function CreateDB(Player, Identifier)
    local pocketID = randomString(22)
    local data = {
        _inventoryId = Identifier,
        items = {
            [Identifier] = {
                _id = Identifier,
                _tpl = "c6jgbwjs9tc2vb8gtpwe7rywe",
                _parent = "",
            },
            [pocketID] = {
                _id = pocketID,
                _tpl = "pbep0kj5kinr4yuvrlq8x2p9",
                _parent= Identifier,
            },
        },
        fastUse = {}
    }

    GM.Inventory.Database("oxmysql", 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
        ['@identifier'] = Identifier,
        ['@data']       = json.encode(data)
    })

    return data
end

function FindIsEmpty(InventoryData)
    if GM.Inventory.VehiclesInventory.Models[InventoryData.vehicleModel] ~= nil then
        if GM.Inventory.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType] ~= nil then
            return "Model"
        end
    end

    if GM.Inventory.VehiclesInventory.Classes[InventoryData.vehicleClass] ~= nil then
        if GM.Inventory.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType] ~= nil then
            return "Class"
        end
    end
    return false
end

function CreateSecondDB(InventoryData, Identifier)
    local data = {}
    if InventoryData.type == "vehicle" then
        local vehicleID = randomString(22)

        if FindIsEmpty(InventoryData) == "Model" then
            local vehicleModel = GM.Inventory.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType]
            data = {
                _inventoryId = Identifier,
                items = {
                    [Identifier] = {
                        _id = Identifier,
                        _tpl = "zfrko4gdc7h0cg8cd9xfsjkk",
                        _parent = "",
                    },
                    [vehicleID] = {
                        _id = vehicleID,
                        _tpl = vehicleModel,
                        _parent= Identifier,
                        slotId = "1",
                    }
                },
                fastUse = {},
            }
        elseif FindIsEmpty(InventoryData) == "Class" then
            local vehicleModel = GM.Inventory.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType]
            data = {
                _inventoryId = Identifier,
                items = {
                    [Identifier] = {
                        _id = Identifier,
                        _tpl = "zfrko4gdc7h0cg8cd9xfsjkk",
                        _parent = "",
                    },
                    [vehicleID] = {
                        _id = vehicleID,
                        _tpl = vehicleModel,
                        _parent= Identifier,
                        slotId = "1",
                    }
                },
                fastUse = {},
            }
        else
            if (InventoryData.vehicleStorageType == "glovebox") then
                data = {
                    _inventoryId = Identifier,
                    items = {
                        [Identifier] = {
                            _id = Identifier,
                            _tpl = "zfrko4gdc7h0cg8cd9xfsjkk",
                            _parent = "",
                        },
                        [vehicleID] = {
                            _id = vehicleID,
                            _tpl = "hhm3eomwf3cygww8e6kcgpt6",
                            _parent= Identifier,
                            slotId = "1",
                        }
                    },
                    fastUse = {},
                }
            else
                data = {
                    _inventoryId = Identifier,
                    items = {
                        [Identifier] = {
                            _id = Identifier,
                            _tpl = "zfrko4gdc7h0cg8cd9xfsjkk",
                            _parent = "",
                        },
                        [vehicleID] = {
                            _id = vehicleID,
                            _tpl = "qfjj7h3sb456b2z320vlamvu",
                            _parent= Identifier,
                            slotId = "1",
                        }
                    },
                    fastUse = {},
                }
            end
        end

        GM.Inventory.Database("oxmysql", 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
            ['@identifier'] = Identifier,
            ['@data']       = json.encode(data)
        })
    elseif InventoryData.type == "drop" then
        local dropID = randomString(22)

        data = {
            _inventoryId = Identifier,
            items = {
                [Identifier] = {
                    _id = Identifier,
                    _tpl = "zfrko4gdc7h0cg8cd9xfsjkk",
                    _parent = "",
                },
                [dropID] = {
                    _id = dropID,
                    _tpl = "b6riv7imc527u8r853clpy5j",
                    _parent= Identifier,
                    slotId = "1",
                }
            },
            temporary = true,
            coords = InventoryData.nearDrop.coords
        }
    elseif InventoryData.type == "custom" then
        local customID = randomString(22)
        
        data = {
            _inventoryId = Identifier,
            items = {
                [Identifier] = {
                    _id = Identifier,
                    _tpl = "zfrko4gdc7h0cg8cd9xfsjkk",
                    _parent = "",
                },
                [customID] = {
                    _id = customID,
                    _tpl = "custom_inventory",
                    _parent= Identifier,
                    slotId = "1",
                }
            },
            temporary = InventoryData.isTemporary,
        }

        if InventoryData.isTemporary then
            GM.Inventory.Database("oxmysql", 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
                ['@identifier'] = Identifier,
                ['@data']       = json.encode(data)
            })
        end
    end

    return data
end

Callback.Functions.CreateCallback("inventory:s:getPlayerId", function(source, cb, checkId)
    cb(GM.Inventory.Functions.Server.GetIdentifier(checkId))
end)

Callback.Functions.CreateCallback("inventory:s:getSkin", function(source, cb)
    local xPlayer = GM.Inventory.Functions.Server.GetPlayer(source)
    MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		local user = users[1]
		local skin = nil

		if user.skin ~= nil then
			skin = json.decode(user.skin)
		end

		cb("_", skin)
	end)
end)

RegisterNetEvent("inventory:s:changeClothes", function(data)
    local player = GM.Inventory.Functions.Server.GetPlayerFromUniqueValue(data.inventoryid)
	if player ~= nil then
		TriggerClientEvent("inventory:c:changeClothes", player.PlayerData.source, data)
	end
end)

RegisterCommand('convertitems', function(src, args, raw)
    if src == 0 then
        local convertDB, convertedDB = ESX.Items, {}

        for k,v in pairs(convertDB) do

            local rarity = "common"
            if string.match(k, "WEAPON_") then
                rarity = "rare"
            end

            local maxStack = 100
            if string.match(k, "WEAPON_") then
                maxStack = 1
            end

            local width = 1
            local height = 1
            if string.match(k, "WEAPON_") then
                width = 2
                height= 2
            end

            local bg = "black"
            if string.match(k, "WEAPON_") then
                bg = "blue"
            end

            local newtxt = "Its a item!"

            if (v.type == nil) then
                v.type = "item"
            end

            convertedDB[k] = { 
                item = {
                    _id = k,
                    _name = v.type.."_"..k,
                    _parent = "", 
                    _type = "Item",
                    _data = {
                        Name = k,
                        Label = v.label,
                        MaxStack = maxStack,
                        Rarity = rarity,
                        Width = width,
                        Height = height,
                        ItemSound = "gear_generic",
                        Itemimage = "icons/"..k..".png",
                        ExamineTime = 1.0,
                        Weight = v.weight,
                        Description = newtxt,
                        Backgroundcolor = bg,
                        Type = firstToUpper(v.type),
                    },
                }
            }

        end
        local converted = print_table( convertedDB )

        SaveResourceFile(GetCurrentResourceName(), './config_converted.lua', converted, -1)
    end
end)

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function print_table(node)
    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)

    return output_str
end

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(GM.Inventory.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end
    end
    return retval
end

-- Callback

ESX.RegisterServerCallback("weapons:server:GetConfig", function(_, cb)
    cb(GM.Inventory.WeaponRepairPoints)
end)

ESX.RegisterServerCallback("weapon:server:GetWeaponAmmo", function(source, cb, WeaponData)
    local Player = ESX.GetPlayerFromId(source)
    local retval = 0
    if WeaponData then
        if Player then
            retval = WeaponData.info.ammo and WeaponData.info.ammo or 0
        end
    end
    cb(retval, WeaponData._name)
end)

ESX.RegisterServerCallback("weapons:server:RepairWeapon", function(source, cb, RepairPoint, data)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = GM.Inventory.WeaponList[GetHashKey(data._name)]
    local WeaponClass = (ESX.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()

    local wpn = GetItem(src, data._id)
    if wpn then
        if wpn.info.quality then
            if wpn.info.quality ~= 100 then
                if Player.Functions.RemoveMoney('cash', GM.Inventory.WeaponRepairCosts[WeaponClass]) then
                    GM.Inventory.WeaponRepairPoints[RepairPoint].IsRepairing = true
                    GM.Inventory.WeaponRepairPoints[RepairPoint].RepairingData = {
                        CitizenId = Player.PlayerData.citizenid,
                        WeaponData = wpn,
                        Ready = false,
                    }
                    Player.Functions.RemoveItem(data._name, 1, data._id)
                    TriggerClientEvent("inventory:client:CheckWeapon", src, data._name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, GM.Inventory.WeaponRepairPoints[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        GM.Inventory.WeaponRepairPoints[RepairPoint].IsRepairing = false
                        GM.Inventory.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, GM.Inventory.WeaponRepairPoints[RepairPoint], RepairPoint)
                        SetTimeout(7 * 60000, function()
                            if GM.Inventory.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                                GM.Inventory.WeaponRepairPoints[RepairPoint].IsRepairing = false
                                GM.Inventory.WeaponRepairPoints[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, GM.Inventory.WeaponRepairPoints[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerEvent('Notification',"No damage wepaon")
                cb(false)
            end
        else
            TriggerEvent('Notification',"No damage wepaon")
            cb(false)
        end
    else
        TriggerEvent('Notification',"No weapon on hand")
        TriggerClientEvent('Inventory:setCurrentWeapon', src, {}, false)
        cb(false)
    end
end)

-- Events

RegisterNetEvent("weapons:server:AddWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
    local itemNew = GetItem(src, CurrentWeaponData._id)
    if itemNew then
        itemNew.info.ammo = amount
        UpdateItem(src, itemNew._id, itemNew.info)
    end
end)

RegisterNetEvent("Inventory:updateWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
    local itemNew = GetItem(src, CurrentWeaponData._id)
    if itemNew then
        itemNew.info.ammo = amount
        UpdateItem(src, itemNew._id, itemNew.info)
    end
end)

RegisterNetEvent("weapons:server:TakeBackWeapon", function(k)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local itemdata = GM.Inventory.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata._name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, GM.Inventory.Items[itemdata._name], "add")
    GM.Inventory.WeaponRepairPoints[k].IsRepairing = false
    GM.Inventory.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, GM.Inventory.WeaponRepairPoints[k], k)
end)

RegisterNetEvent("Inventory:setWeaponQuality", function(CurrentWeaponData, hp)
    local src = source

    CurrentWeaponData.info.quality = hp
    UpdateItem(src, CurrentWeaponData._id, CurrentWeaponData.info)
end)

RegisterNetEvent('Inventory:updateWeaponQuality', function(data, RepeatAmount)
    local src = source
    Citizen.Wait(10)
    local WeaponData = GM.Inventory.WeaponList[GetHashKey(data._name)]
    local WeaponSlot = GetItem(src, data._id)
    local DecreaseAmount = GM.Inventory.DurabilityMultiplier[data._name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData._name) then
            if WeaponSlot.info.quality then
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        UseItem(src, data)
                        TriggerEvent('Notification',"Weapon broken need to be repaired!")
                        break
                    end
                end
            else
                WeaponSlot.info.quality = 100
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        UseItem(src, data)
                        TriggerEvent('Notification',"Weapon broken need to be repaired!")
                        break
                    end
                end
            end
        end
    end
    UpdateItem(src, data._id, WeaponSlot.info)
end)

ESX.RegisterUsableItem('pistol_ammo', function(source, item)
    local playerSelected = ESX.GetPlayerFromId(source)
    if (not playerSelected) then return end

    TriggerClientEvent('Inventory:addAmmo', source, 'AMMO_PISTOL', 12, item)
end)

ESX.RegisterUsableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('Inventory:addAmmo', source, 'AMMO_RIFLE', 30, item)
end)

ESX.RegisterUsableItem('smg_ammo', function(source, item)
    TriggerClientEvent('Inventory:addAmmo', source, 'AMMO_SMG', 20, item)
end)

ESX.RegisterUsableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('Inventory:addAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

ESX.RegisterUsableItem('mg_ammo', function(source, item)
    TriggerClientEvent('Inventory:addAmmo', source, 'AMMO_MG', 30, item)
end)

ESX.RegisterUsableItem('snp_ammo', function(source, item)
    TriggerClientEvent('Inventory:addAmmo', source, 'AMMO_SNIPER', 10, item)
end)

ESX.RegisterUsableItem('emp_ammo', function(source, item)
    TriggerClientEvent('Inventory:addAmmo', source, 'AMMO_EMPLAUNCHER', 10, item)
end)

RegisterServerEvent("Inventory:RemoveItem", function(itemName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    print("Removing item: " .. itemName)

    playerSelected.removeInventoryItem(itemName, 1)
end)