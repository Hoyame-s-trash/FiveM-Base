local CurrentInventorys = {}

Callback.Functions.CreateCallback("ls-inventory:s:getAllItems", function(source, cb, inventory)
    cb(BlueStarkInventory.Items)
end)

Callback.Functions.CreateCallback("ls-inventory:s:getPlayerInventory", function(source, cb)
    local Player = BlueStarkInventory.Functions.Server.GetPlayer(source)
    local PlayerID =  BlueStarkInventory.Functions.Server.GetIdentifier(source)
	print(PlayerID)
    if PlayerID ~= nil then
        if CurrentInventorys[PlayerID] ~= nil then
            cb(CurrentInventorys[PlayerID])
        else
            local resultCheck = BlueStarkInventory.Database(BlueStarkInventory.DatabaseName, 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = PlayerID})
			print("TEST")
			print(resultCheck[1])
            if resultCheck[1] ~= nil then
                CurrentInventorys[PlayerID] = json.decode(resultCheck[1].data)
				print(CurrentInventorys[PlayerID])
                cb(CurrentInventorys[PlayerID])
            else
                CurrentInventorys[PlayerID] = CreateDB(Player, PlayerID)
				Wait(10)
                print(CurrentInventorys[PlayerID])
				print(json.encode(CurrentInventorys[PlayerID]))
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
            local resultCheck = BlueStarkInventory.Database(BlueStarkInventory.DatabaseName, 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = inventory.identifier})
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
            local resultCheck = BlueStarkInventory.Database(BlueStarkInventory.DatabaseName, 'fetchAll', 'SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {['@identifier'] = inventory.identifier})
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
	data.itemD.count = data.itemD.info.CurrentStack

    if (data.fromInventory ~= nil) then 
		if CurrentInventorys[data.fromInventory] ~= nil then 
			if CurrentInventorys[data.fromInventory].items ~= nil then
				CurrentInventorys[data.fromInventory].items[data.itemD._id] = nil 
			end
		end 
	end
    
    if (data.notGonnaBeDeleted ~= nil) then 
        if (data.notGonnaBeDeleted) then
            if CurrentInventorys[data.fromInventory] ~= nil then
                CurrentInventorys[data.fromInventory].items[data.itemD._id] = data.itemD 
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
            BlueStarkInventory.Database(BlueStarkInventory.DatabaseName, 'execute', 'UPDATE `user_inventory` SET `data` = @data WHERE `identifier` = @identifier', {
                ['@identifier'] = v._inventoryId,
                ['@data']       = json.encode(v)
            })
        end
    end
    RconPrint('[ls-inventory] All inventories saved!' .. "\n")
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
		Citizen.Wait(1000*BlueStarkInventory.RefreshServerDrops)
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
