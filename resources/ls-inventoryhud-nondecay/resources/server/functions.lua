-- https://gist.github.com/haggen/2fd643ea9a261fea2094
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

    Config.Database(Config.DatabaseName, 'execute', 'INSERT INTO `ls_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
        ['@identifier'] = Identifier,
        ['@data']       = json.encode(data)
    })

    return data
end

function FindIsEmpty(InventoryData)
    if Config.VehiclesInventory.Models[InventoryData.vehicleModel] ~= nil then
        if Config.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType] ~= nil then
            return "Model"
        end
    end

    if Config.VehiclesInventory.Classes[InventoryData.vehicleClass] ~= nil then
        if Config.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType] ~= nil then
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
            local vehicleModel = Config.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType]
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
            local vehicleModel = Config.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType]
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

        Config.Database(Config.DatabaseName, 'execute', 'INSERT INTO `ls_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
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
            Config.Database(Config.DatabaseName, 'execute', 'INSERT INTO `ls_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
                ['@identifier'] = Identifier,
                ['@data']       = json.encode(data)
            })
        end
    elseif InventoryData.type == "shop" then
        local customID = randomString(22)

        for k,v in pairs(InventoryData.inventoryItems)do
            if Config.Items[k] == nil then return RconPrint("Invalid Item " .. k .. "\n") end

            local createdItem = json.decode(json.encode(Config.Items[k].item))

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
    cb(Config.Functions.Server.GetIdentifier(checkId))
end)

Callback.Functions.CreateCallback("ls-inventoryhud:s:getSkin", function(source, cb)
	local result = Config.Database(Config.DatabaseName, 'fetchAll', 'SELECT * FROM playerskins where citizenid = ? AND active = ?', { Config.Functions.Server.GetIdentifier(source), 1 })
    if result[1] ~= nil then
        cb(result[1].model, result[1].skin)
    else
        cb(nil)
    end
end)

RegisterNetEvent("ls-inventoryhud:s:changeClothes", function(data)
    local player = Config.Functions.Server.GetPlayerFromUniqueValue(data.inventoryid)
	if player ~= nil then
		TriggerClientEvent("ls-inventoryhud:c:changeClothes", player.PlayerData.source, data)
	end
end)

RegisterNetEvent("ls-inventory:s:ItemChanged", function(data)
    if Config.Functions.Server.GetPlayerFromUniqueValue(data.fromInventory) then
        if data.itemD._data.Type == "Weapon" then
            TriggerClientEvent("ls-inventoryhud:c:checkAndUse", Config.Functions.Server.GetPlayerFromUniqueValue(data.fromInventory).PlayerData.source, data.itemD, true)
        end
    end
end)