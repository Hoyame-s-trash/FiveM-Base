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

    BlueStarkInventory.Database(BlueStarkInventory.DatabaseName, 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
        ['@identifier'] = Identifier,
        ['@data']       = json.encode(data)
    })

    return data
end

function FindIsEmpty(InventoryData)
    if BlueStarkInventory.VehiclesInventory.Models[InventoryData.vehicleModel] ~= nil then
        if BlueStarkInventory.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType] ~= nil then
            return "Model"
        end
    end

    if BlueStarkInventory.VehiclesInventory.Classes[InventoryData.vehicleClass] ~= nil then
        if BlueStarkInventory.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType] ~= nil then
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
            local vehicleModel = BlueStarkInventory.VehiclesInventory.Models[InventoryData.vehicleModel][InventoryData.vehicleStorageType]
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
            local vehicleModel = BlueStarkInventory.VehiclesInventory.Classes[InventoryData.vehicleClass][InventoryData.vehicleStorageType]
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

        BlueStarkInventory.Database(BlueStarkInventory.DatabaseName, 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
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
            BlueStarkInventory.Database(BlueStarkInventory.DatabaseName, 'execute', 'INSERT INTO `user_inventory` (`identifier`, `data`) VALUES (@identifier, @data)', {
                ['@identifier'] = Identifier,
                ['@data']       = json.encode(data)
            })
        end
    elseif InventoryData.type == "shop" then
        local customID = randomString(22)

        for k,v in pairs(InventoryData.inventoryItems)do
            if BlueStarkInventory.Items[k] == nil then return RconPrint("Invalid Item " .. k .. "\n") end

            local createdItem = json.decode(json.encode(BlueStarkInventory.Items[k].item))

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
    cb(BlueStarkInventory.Functions.Server.GetIdentifier(checkId))
end)

Callback.Functions.CreateCallback("ls-inventoryhud:s:getSkin", function(source, cb)
    local xPlayer = BlueStarkInventory.Functions.Server.GetPlayer(source)
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

RegisterNetEvent("ls-inventoryhud:s:changeClothes", function(data)
    local player = BlueStarkInventory.Functions.Server.GetPlayerFromUniqueValue(data.inventoryid)
	if player ~= nil then
		TriggerClientEvent("ls-inventoryhud:c:changeClothes", player.PlayerData.source, data)
	end
end)