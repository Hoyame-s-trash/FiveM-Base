Callback = {}
Callback.Functions = {}
Callback.ServerCallbacks = {}

Callback.Functions.CreateCallback = function(name, cb)
    Callback.ServerCallbacks[name] = cb
end

Callback.Functions.TriggerCallback = function(name, source, cb, ...)
    local src = source
    if Callback.ServerCallbacks[name] then
        Callback.ServerCallbacks[name](src, cb, ...)
    end
end


RegisterNetEvent('ls-inventoryhud:Server:TriggerCallback', function(name, ...)
    local src = source
    Callback.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('ls-inventoryhud:Client:TriggerCallback', src, name, ...)
    end, ...)
end)

local CurrentInventorys = {}

Callback.Functions.CreateCallback("ls-inventory:s:getAllItems", function(source, cb, inventory)
    cb(Inventory.Items)
end)

Callback.Functions.CreateCallback("ls-inventory:s:getPlayerInventory", function(source, cb)
    local Player = Inventory.Functions.Server.GetPlayer(source)
    local PlayerID =  Inventory.Functions.Server.GetIdentifier(source)
    if PlayerID ~= nil then
        if CurrentInventorys[PlayerID] ~= nil then
            cb(CurrentInventorys[PlayerID])
        else
            local resultCheck = Inventory.Database("oxmysql", 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = PlayerID})
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

Callback.Functions.CreateCallback("ls-inventory:s:getSecondInventory", function(source, cb, inventory)
    if inventory.type == "vehicle" then
        if CurrentInventorys[inventory.identifier] ~= nil then
            cb(CurrentInventorys[inventory.identifier])
        else
            local resultCheck = Inventory.Database("oxmysql", 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = inventory.identifier})
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
            local resultCheck = Inventory.Database("oxmysql", 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = inventory.identifier})
            if resultCheck[1] ~= nil then
                CurrentInventorys[inventory.identifier] = json.decode(resultCheck[1].data)

                cb(CurrentInventorys[inventory.identifier])
            else
                CurrentInventorys[inventory.identifier] = CreateSecondDB(inventory, inventory.identifier)
                
                cb(CurrentInventorys[inventory.identifier])
            end
        end
    elseif inventory.type == "shop" then
        cb(CreateSecondDB(inventory, inventory.identifier))
    end
end)


RegisterNetEvent("ls-inventory:s:ItemChanged", function(data)
	data.itemD.amount = data.itemD.info.CurrentStack
	data.itemD.slot = data.itemD._id
	data.itemD.name = data.itemD._tpl

    if (data.fromInventory ~= nil) then 
		if CurrentInventorys[data.fromInventory] ~= nil then
			if CurrentInventorys[data.fromInventory].items[data.itemD._id] ~= nil then
				CurrentInventorys[data.fromInventory].items[data.itemD._id] = nil 
			end
		end
	end
    
    if (data.notGonnaBeDeleted ~= nil) then 
        if (data.notGonnaBeDeleted) then
            if CurrentInventorys[data.fromInventory] ~= nil then
				if CurrentInventorys[data.fromInventory].items ~= nil then
					if CurrentInventorys[data.fromInventory].items[data.itemD._id] ~= nil then
						CurrentInventorys[data.fromInventory].items[data.itemD._id] = data.itemD 
					end
				end
            end
        end 
    end

    if (CurrentInventorys[data.toInventory] ~= nil) then CurrentInventorys[data.toInventory].items[data.itemD._id] = data.itemD end


    TriggerClientEvent("ls-inventory:c:ItemChanged", -1, data)
end)

RegisterNetEvent("ls-inventory:s:FastUseChanged", function(data)
    if (data.typeFastUse == "Add") then
        CurrentInventorys[data.fastUseInventory].fastUse["Item"..data.fastUseKey] = data.fastUseItemData
    else
        CurrentInventorys[data.fastUseInventory].fastUse["Item"..data.fastUseKey] = nil
    end
end)

RegisterNetEvent("ls-inventory:s:UseItem", function(data)
    local item = CurrentInventorys[data.fastUseInventory].items[CurrentInventorys[data.fastUseInventory].fastUse["Item"..data.key]]
    Inventory.UseItem(source, item)
end)

RegisterNetEvent("ls-inventory:s:UseItemContext", function(data)
    local item = data.inventoryItem
    Inventory.UseItem(source, item)
end)

RegisterNetEvent("ls-inventory:s:UpdateItem", function(data)
    CurrentInventorys[data.inventoryId].items[data.itemIdentifier] = data.itemData
end)

RegisterNetEvent("ls-inventory:s:RemoveItem", function(data)
    if data.isFullyRemove then
        CurrentInventorys[data.inventoryId].items[data.itemData._id] = nil
    else
        CurrentInventorys[data.inventoryId].items[data.itemData._id] = data.itemData
    end
    
end)

RegisterNetEvent("ls-inventory:s:AddItemFromAttachment", function(data)
    Inventory.AddItem(source, data.itemData._id, 1)
    
end)


function saveInventory()
    for _,v in pairs(CurrentInventorys) do
        if (v.temporary == nil or not v.temporary) then
            Inventory.Database("oxmysql", 'execute', 'UPDATE `user_inventory` SET `data` = @data WHERE `identifier` = @identifier', {
                ['@identifier'] = v._inventoryId,
                ['@data']       = json.encode(v)
            })
        end
    end
    print('[ls-inventory] All inventories saved!' .. "\n")
end



Callback.Functions.CreateCallback("ls-inventoryhud:s:checkPrice", function(source, cb, data)
    cb(Inventory.BuyItem(source, data.item, data.amount))
end)


Callback.Functions.CreateCallback("ls-inventoryhud:s:GetDropItems", function(_, cb, inventory)
    
    local resultCheck = CurrentInventorys[inventory.identifier]
    if resultCheck then
        cb(CurrentInventorys[inventory.identifier])
    else
        CurrentInventorys[inventory.identifier] = CreateSecondDB(inventory, inventory.identifier)

        cb(CurrentInventorys[inventory.identifier])
    end
end)

Callback.Functions.CreateCallback("ls-inventoryhud:server:GetDrops", function(_, cb)
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
		Citizen.Wait(1000*1)
		if CurrentInventorys ~= nil then
			for k,v in pairs(CurrentInventorys) do
                if string.match(v._inventoryId, "DROP-") then
                    CurrentInventorys[k].open = false
                    Citizen.CreateThread(function()
                        TriggerClientEvent("ls-inventoryhud:c:checkDropOpen", -1, k)
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

RegisterNetEvent("ls-inventoryhud:s:checkDropOpen", function(id)
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
	return ESX.CanUseItem(itemName)
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
        if Inventory.Items[itemID] == nil then return print("Invalid Item " .. itemID .. "\n") end

        if itemAmount == nil then itemAmount = 1 end

        if itemData == nil then itemData = { ["CurrentStack"] = itemAmount } end

        local createdItem = json.decode(json.encode(Inventory.Items[itemID].item))

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
        local curItem = GetCurrentInventory()[Inventory.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
        if curItem ~= nil then 
            if curItem.info.CurrentStack >= amount then
                TriggerClientEvent("ls-inventory:c:removeItem", source, itemIdentifier, amount)
                return true
            end
        end
        return false
    end,


    GetItem = function ( source, itemIdentifier )
        return GetCurrentInventory()[Inventory.Functions.Server.GetIdentifier(source)].items[itemIdentifier]
    end,

    UpdateItem = function ( source, itemIdentifier, newData )
        if itemIdentifier == nil or newData == nil then return end
        TriggerClientEvent("ls-inventory:c:updateItem", source, itemIdentifier, Inventory.Functions.Server.GetIdentifier(source), newData)
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
		if GetCurrentInventory() == nil or Inventory.Functions.Server.GetIdentifier(source) == nil or GetCurrentInventory()[Inventory.Functions.Server.GetIdentifier(source)] == nil then return {} end
        return GetCurrentInventory()[Inventory.Functions.Server.GetIdentifier(source)].items
    end,

    BuyItem = function ( source, item, amount)
        local Player = ESX.GetPlayerFromId(source)

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

-- Inventory.Commands.Add("giveitem", "Give An Item (Admin Only)", {{name="id", help="Player ID"},{name="item", help="Name of the item (not a label)"}, {name="amount", help="Amount of items"}}, false, function(source, args)
-- 	local id = tonumber(args[1])
-- 	local Player = Inventory.Functions.GetPlayer(id)
-- 	local amount = tonumber(args[3]) or 1
-- 	local itemData = tostring(args[2])
-- 	if Player then
--         Inventory.AddItem(id, itemData, amount)
-- 	end
-- end, "admin")

CreateUsableItem("14ehcp8zup6cqffe3nxwy8pz", function(source, item)
	print(json.encode(item))
end)

CreateUsableItem("zehd54y3no4yfvizu17qwe98", function(source, item)
	Inventory.RemoveItem(source, item._id, 1)
end)

if Inventory.CheckInventoryEveryStart then
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
        print('[ls-inventory] Inventory will be checking...' .. "\n")
        print('^1[ls-inventory] Warning this checking will not give definitive results!' .. "^7\n\n")
        Citizen.Wait(1000)
        local resourcename = "qb-core"
        if GetResourceState(resourcename) ~= 'missing' then print('[ls-inventory] '..resourcename..' enabled and working!' .. "\n")
        else InventoryCheck.isWorking = false return print('[ls-inventory] '..resourcename..' not working it causes several issues!' .. "\n") 
        end

        Citizen.Wait(100)
        resourcename = "fivem-appearance"
        if GetResourceState(resourcename) == 'missing' then
            resourcename = "qb-clothing"
            if GetResourceState(resourcename) ~= 'missing' then print('[ls-inventory] '..resourcename..' enabled and working!' .. "\n")
            else InventoryCheck.isWorking = false return print('[ls-inventory] '..resourcename..' not working it causes several issues!' .. "\n")
            end

        else
            if GetResourceState(resourcename) ~= 'missing' then print('[ls-inventory] '..resourcename..' enabled and working!' .. "\n")
            else InventoryCheck.isWorking = false return print('[ls-inventory] '..resourcename..' not working it causes several issues!' .. "\n")
            end
        end


        Citizen.Wait(100)
        print('[ls-inventory] Dependecies checked, everything fine starting next step...' .. "\n")
        Citizen.Wait(1000)
        print('\n[ls-inventory] qb-core checking...' .. "\n")

        local isFound = FindFolder(io.popen"cd":read'*l'.."/resources", "qb-core")

        if not isFound then
            InventoryCheck.isWorking = false 
            return print('[ls-inventory] qb-core not found!' .. "\n")
        end

        local file = io.open(isFound.."/server/player.lua", "rb")
        if file == nil then 
            InventoryCheck.isWorking = false 
            return print('[ls-inventory] qb-core not found!' .. "\n")
        end

        local content = file:read "*a"
        file:close()
        Citizen.Wait(250)

        if not string.match(content, ':AddItem') then
            InventoryCheck.isWorking = false 
            return print('[ls-inventory] AddItem not implemented!' .. "\n")
        else
            print('[ls-inventory] AddItem implemented!' .. "\n")
        end

        if not string.match(content, ':RemoveItem') then
            InventoryCheck.isWorking = false 
            return print('[ls-inventory] RemoveItem not implemented!' .. "\n")
        else
            print('[ls-inventory] RemoveItem implemented!' .. "\n")
        end

        print('[ls-inventory] qb-core is works fine!' .. "\n")
        Citizen.Wait(1000)
        print('\n^1[ls-inventory] Warning clothing check will not give definitive results!' .. "^7\n")
        resourcename = "fivem-appearance"
        if GetResourceState(resourcename) == 'missing' then


            print('[ls-inventory] qb-clothing checking...' .. "\n")
            Citizen.Wait(1000)
    
            local isFound = FindFolder(io.popen"cd":read'*l'.."/resources", "qb-clothing")

            if not isFound then
                InventoryCheck.isWorking = false 
                return print('[ls-inventory] qb-clothing not found!' .. "\n")
            end
    
            local file = io.open(isFound.."/client/main.lua", "rb")
            if file == nil then 
                InventoryCheck.isWorking = false 
                return print('[ls-inventory] qb-clothing not found!' .. "\n")
            end
    
            local content = file:read "*a"
            file:close()
            Citizen.Wait(250)
    
            if not string.match(content, 'giveClothesAsItem') then
                InventoryCheck.isWorking = false 
                return print('[ls-inventory] Clothing not implemented!' .. "\n")
            else
                print('[ls-inventory] Clothing implemented!' .. "\n")
            end

        else

            print('[ls-inventory] fivem-appearance didnt\'t know how it worls currently!' .. "\n")

        end

        print('[ls-inventory] Resources checked, everything fine starting next step...' .. "\n\n")
        Citizen.Wait(1000)
        if GetCurrentResourceName() ~= "ls-inventoryhud" then
            InventoryCheck.isWorking = false 
            return print('[ls-inventory] Change inventory name to ^1ls-inventoryhud!' .. "^7\n")
        else
            print('[ls-inventory] Inventory name correct!' .. "\n")
        end

        Citizen.Wait(250)

        if ESX == nil then
            print('[ls-inventory] Framework not works fine!' .. "^7\n")
        else
            print('[ls-inventory] Framework works fine!' .. "^7\n")
        end

        Citizen.Wait(250)
        print('^2[ls-inventory] Inventory checking process finished, there is no important errors!' .. "^7\n")
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

    Inventory.Database("oxmysql", 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
        ['@identifier'] = Identifier,
        ['@data']       = json.encode(data)
    })

    return data
end

function FindIsEmpty(InventoryData)
    if Inventory.VehiclesInventory.Models[InventoryData.vehicleModel] ~= nil then
        if Inventory.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType] ~= nil then
            return "Model"
        end
    end

    if Inventory.VehiclesInventory.Classes[InventoryData.vehicleClass] ~= nil then
        if Inventory.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType] ~= nil then
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
            local vehicleModel = Inventory.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType]
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
            local vehicleModel = Inventory.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType]
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

        Inventory.Database("oxmysql", 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
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
                    _tpl = InventoryData.inventoryCode,
                    _parent= Identifier,
                    slotId = "1",
                }
            },
            temporary = InventoryData.isTemporary,
        }
		
		if not InventoryData.isTemporary then
            Inventory.Database("oxmysql", 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
                ['@identifier'] = Identifier,
                ['@data']       = json.encode(data)
            })
        end
    elseif InventoryData.type == "shop" then
        local customID = randomString(22)

        for k,v in pairs(InventoryData.inventoryItems)do
            if Inventory.Items[k] == nil then return print("Invalid Item " .. k .. "\n") end

            local createdItem = json.decode(json.encode(Inventory.Items[k].item))

            local itemData = {}

            local randomID = randomString(22)

            createdItem._id = randomID
            createdItem._tpl = k
            createdItem._parent = ""
            createdItem.isSearched = true 
            createdItem.loc = {}

            itemData = CreateItemData(itemData, createdItem)

            createdItem.info = itemData
            createdItem.info.CurrentStack = v.amount
            createdItem.price = v.price

            InventoryData.inventoryItems[k] = createdItem
        end
        
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
                    _tpl = InventoryData.inventoryCode,
                    _parent= Identifier,
                    slotId = "1",
                }
            },
            temporary = InventoryData.isTemporary,
            shopItems = {InventoryData.inventoryItems}
        }
    end

    return data
end

Callback.Functions.CreateCallback("ls-inventoryhud:s:getPlayerId", function(source, cb, checkId)
    cb(Inventory.Functions.Server.GetIdentifier(checkId))
end)

Callback.Functions.CreateCallback("ls-inventoryhud:s:getSkin", function(source, cb)
	local result = Inventory.Database("oxmysql", 'fetchAll', 'SELECT * FROM playerskins where citizenid = ? AND active = ?', { Inventory.Functions.Server.GetIdentifier(source), 1 })
    if result[1] ~= nil then
        cb(result[1].model, result[1].skin)
    else
        cb(nil)
    end
end)

RegisterNetEvent("ls-inventoryhud:s:changeClothes", function(data)
    local player = Inventory.Functions.Server.GetPlayerFromUniqueValue(data.inventoryid)
	if player ~= nil then
		TriggerClientEvent("ls-inventoryhud:c:changeClothes", player.PlayerData.source, data)
	end
end)

RegisterNetEvent("ls-inventory:s:ItemChanged", function(data)
    if Inventory.Functions.Server.GetPlayerFromUniqueValue(data.fromInventory) then
        if data.itemD._data.Type == "Weapon" then
            TriggerClientEvent("ls-inventoryhud:c:checkAndUse", Inventory.Functions.Server.GetPlayerFromUniqueValue(data.fromInventory).PlayerData.source, data.itemD, true)
        end
    end
end)

RegisterCommand('convertitems', function(src, args, raw)
    if src == 0 then
        local convertDB, convertedDB = ESX.Items, {}
        
        for k,v in pairs(convertDB) do
            local rarity = "common"
            if v.type == "weapon" then
                rarity = "rare"
            end

            local maxStack = 100
            if v.unique then
                maxStack = 1
            end

            local width = 1
            local height = 1
            if v.type == "weapon" then
                width = 2
                height= 2
            end

            local bg = "black"
            if v.type == "weapon" then
                bg = "green"
            end

            local newtxt = v.description
			if v.description ~= nil then
				if string.find(v.description, "'") then
					newtxt = string.gsub(v.description, "'", "\\" .. "'")
				end
			end

            convertedDB[k] = { 
                item = {
                    _id = k,
                    _name = v.type.."_"..v.name,
                    _parent = "", 
                    _type = "Item",
                    _data = {
                        Name = v.name,
                        Label = v.label,
                        MaxStack = maxStack,
                        Rarity = rarity,
                        Width = width,
                        Height = height,
                        ItemSound = "gear_generic",
                        Itemimage = "icons/"..v.image,
                        ExamineTime = 1.0,
                        Weight = v.weight/1000,
                        Description = newtxt,
                        Backgroundcolor = bg,
                        Type = firstToUpper(v.type),
                    }
                }
            }

        end
        local converted = print_table( convertedDB )

        SaveResourceFile(GetCurrentResourceName(), './Inventory_converted.lua', converted, -1)
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

local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(Inventory.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end
    end
    return retval
end

-- Callback

QBCore.Functions.CreateCallback("weapons:server:GetInventory", function(_, cb)
    cb(Inventory.WeaponRepairPoints)
end)

QBCore.Functions.CreateCallback("weapon:server:GetWeaponAmmo", function(source, cb, WeaponData)
    local Player = QBCore.Functions.GetPlayer(source)
    local retval = 0
    if WeaponData then
        if Player then
            retval = WeaponData.info.ammo and WeaponData.info.ammo or 0
        end
    end
    cb(retval, WeaponData._name)
end)

QBCore.Functions.CreateCallback("weapons:server:RepairWeapon", function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = Inventory.WeaponList[GetHashKey(data._name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()

    local wpn = exports["ls-inventoryhud"]:GetItem(src, data._id)
    if wpn then
        if wpn.info.quality then
            if wpn.info.quality ~= 100 then
                if Player.Functions.RemoveMoney('cash', Inventory.WeaponRepairCosts[WeaponClass]) then
                    Inventory.WeaponRepairPoints[RepairPoint].IsRepairing = true
                    Inventory.WeaponRepairPoints[RepairPoint].RepairingData = {
                        CitizenId = Player.PlayerData.citizenid,
                        WeaponData = wpn,
                        Ready = false,
                    }
                    Player.Functions.RemoveItem(data._name, 1, data._id)
                    TriggerClientEvent("inventory:client:CheckWeapon", src, data._name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Inventory.WeaponRepairPoints[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        Inventory.WeaponRepairPoints[RepairPoint].IsRepairing = false
                        Inventory.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, Inventory.WeaponRepairPoints[RepairPoint], RepairPoint)
                        TriggerEvent('qb-phone:server:sendNewMailToOffline', Player.PlayerData.citizenid, {
                            sender = Lang:t('mail.sender'),
                            subject = Lang:t('mail.subject'),
                            message = Lang:t('mail.message', { value = WeaponData._data.Label })
                        })
                        SetTimeout(7 * 60000, function()
                            if Inventory.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                                Inventory.WeaponRepairPoints[RepairPoint].IsRepairing = false
                                Inventory.WeaponRepairPoints[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, Inventory.WeaponRepairPoints[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
                cb(false)
            end
        else
            TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_weapon_in_hand'), "error")
        TriggerClientEvent('weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
    end
end)

-- Events

RegisterNetEvent("weapons:server:AddWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
    local itemNew = exports["ls-inventoryhud"]:GetItem(src, CurrentWeaponData._id)
    if itemNew then
        itemNew.info.ammo = amount
        exports["ls-inventoryhud"]:UpdateItem(src, itemNew._id, itemNew.info)
    end
end)

RegisterNetEvent("weapons:server:UpdateWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
    local itemNew = exports["ls-inventoryhud"]:GetItem(src, CurrentWeaponData._id)
    if itemNew then
        itemNew.info.ammo = amount
        exports["ls-inventoryhud"]:UpdateItem(src, itemNew._id, itemNew.info)
    end
end)

RegisterNetEvent("weapons:server:TakeBackWeapon", function(k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemdata = Inventory.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata._name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, Inventory.Items[itemdata._name], "add")
    Inventory.WeaponRepairPoints[k].IsRepairing = false
    Inventory.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Inventory.WeaponRepairPoints[k], k)
end)

RegisterNetEvent("weapons:server:SetWeaponQuality", function(CurrentWeaponData, hp)
    local src = source

    CurrentWeaponData.info.quality = hp
    exports["ls-inventoryhud"]:UpdateItem(src, CurrentWeaponData._id, CurrentWeaponData.info)
end)

RegisterNetEvent('weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
    Citizen.Wait(10)
    local WeaponData = Inventory.WeaponList[GetHashKey(data._name)]
    local WeaponSlot = exports["ls-inventoryhud"]:GetItem(src, data._id)
    local DecreaseAmount = Inventory.DurabilityMultiplier[data._name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData._name) then
            if WeaponSlot.info.quality then
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        exports["ls-inventoryhud"]:UseItem(src, data)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
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
                        exports["ls-inventoryhud"]:UseItem(src, data)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            end
        end
        exports["ls-inventoryhud"]:UpdateItem(src, data._id, WeaponSlot.info)
    end
end)

-- Commands

QBCore.Commands.Add("repairweapon", "Repair Weapon (God Only)", {{name="hp", help=Lang:t('info.hp_of_weapon')}}, true, function(source, args)
    TriggerClientEvent('weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, "god")

-- Items

-- AMMO
ESX.RegisterUsableItem('pistol_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_PISTOL', 12, item)
end)

ESX.RegisterUsableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_RIFLE', 30, item)
end)

ESX.RegisterUsableItem('smg_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SMG', 20, item)
end)

ESX.RegisterUsableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

ESX.RegisterUsableItem('mg_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_MG', 30, item)
end)

ESX.RegisterUsableItem('snp_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SNIPER', 10, item)
end)

ESX.CreateUseableItem('emp_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_EMPLAUNCHER', 10, item)
end)