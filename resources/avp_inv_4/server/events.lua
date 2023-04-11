RegisterNetEvent("avp_inv:ITEM_MOVE_TO_SLOT", function(d)
    local source <const> = source
    local fromUniqueID <const> = d.fromUniqueID
    local fromSlot <const> = d.fromSlot
    local toUniqueID <const> = d.toUniqueID
    local toSlot <const> = d.toSlot
    local quantity = d.quantity

    local grabbed_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = fromUniqueID })
    local to_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = toUniqueID })
    if not (grabbed_inventory and to_inventory) then return end

    local item <const> = grabbed_inventory:getItemBy({ slot = fromSlot })
    if not item then return end

    if type(quantity) ~= "number" or quantity > item.quantity or quantity < 1 then quantity = item.quantity end
    if not item.data.stackable then quantity = 1 end

    if grabbed_inventory:isSame(to_inventory) then
        local addedResult = grabbed_inventory:addItem({
            name = item.name,
            quantity = quantity,
            meta = item.meta,
            toSlot = toSlot
        }, true)
        if addedResult.success then
            grabbed_inventory:removeItemBy(quantity, { slot = fromSlot })
        end
    else
        local addedResult = nil
        if to_inventory.type == "dropped_grid" then
            local pX <const>, pY <const>, pZ <const> = table.unpack(GetEntityCoords(GetPlayerPed(source)))
            addedResult = to_inventory:addItem({
                name = item.name,
                quantity = quantity,
                meta = item.meta,
                toSlot = toSlot,
                coordX = pX,
                coordY = pY,
                coordZ = pZ
            }, true)
        else
            addedResult = to_inventory:addItem({
                name = item.name,
                quantity = quantity,
                meta = item.meta,
                toSlot = toSlot
            })
        end

        if addedResult.success then
            grabbed_inventory:removeItemBy(quantity, { slot = fromSlot })
        end
    end
end)
RegisterNetEvent("avp_inv:CLOSE_SECOND_INVENTORY", function(uniqueID)
    local source <const> = source
    local inv <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = uniqueID }) --[[@as unknown]]
    if not inv then return end

    if type(inv.close) == 'function' then
        inv:close(source)
    end
end)
RegisterNetEvent("avp_inv:ADD_NOTE_ITEM", function(data)
    local source <const> = source
    local itemHash <const> = data.itemHash
    local uniqueID <const> = data.uniqueID
    local newNote <const> = data.newNote

    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = uniqueID })
    if not inventory then return end
    local item <const> = inventory:getItemBy({ itemHash = itemHash })
    if not item then return end

    if item.meta.note == newNote then return end

    if type(newNote) == "string" and string.len(newNote) > 0 then
        item.meta.note = newNote
    else
        item.meta.note = nil
    end

    inventory:OnItemUpdated(item)
    aPlayer.notification("success", "Item note modified successfully!")
end)
RegisterNetEvent("avp_inv:RENAME_ITEM", function(data)
    local source <const> = source
    local itemHash <const> = data.itemHash
    local uniqueID <const> = data.uniqueID
    local newName <const> = data.newName

    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = uniqueID })
    if not inventory then return end
    local item <const> = inventory:getItemBy({ itemHash = itemHash })
    if not item then return end

    if item.meta.customName == newName then return end

    if type(newName) == "string" and string.len(newName) > 0 then
        item.meta.customName = newName
    else
        item.meta.customName = nil
    end

    inventory:OnItemUpdated(item)
    aPlayer.notification("success", "Item renamed successfully!")
end)
RegisterNetEvent("avp_inv:OPEN_VEHICLE_TRUNK_INVENTORY", function(plate, modelHash)
    local source <const> = source
    if not CONFIG.IS_VEHICLE_EXIST(plate) then return end

    local uniqueID <const> = 'trunk-' .. plate
    local trunk_inventory = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = uniqueID }) --[[@as TrunkInventory]]
    if not trunk_inventory then
        trunk_inventory = ScriptServer.Classes.TrunkInventory.new({
            inventoryName = string.format('Trunk (%s)', plate),
            maxWeight = CONFIG.VEHICLE_SIZES.getTrunkMaxWeight(modelHash),
            plate = plate,
            slotsAmount = CONFIG.VEHICLE_SIZES.getTrunkSlots(modelHash),
            uniqueID = uniqueID
        })
    end

    trunk_inventory:open(source)
end)

RegisterNetEvent("avp_inv:OPEN_VEHICLE_GLOVEBOX_INVENTORY", function(plate, modelHash)
    local source <const> = source
    if not CONFIG.IS_VEHICLE_EXIST(plate) then return end

    local uniqueID <const> = 'glovebox-' .. plate
    local glovebox_inventory = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = uniqueID }) --[[@as GloveboxInventory]]
    if not glovebox_inventory then
        glovebox_inventory = ScriptServer.Classes.GloveboxInventory.new({
            inventoryName = string.format('Glovebox (%s)', plate),
            maxWeight = CONFIG.VEHICLE_SIZES.getGloveboxMaxWeight(modelHash),
            plate = plate,
            slotsAmount = CONFIG.VEHICLE_SIZES.getGloveboxSlots(modelHash),
            uniqueID = uniqueID
        })
    end

    glovebox_inventory:open(source)
end)

RegisterNetEvent("avp_inv:OPEN_NEAR_SHOP", function(shopId)
    local source <const> = source

    local shop = ScriptServer.Managers.Shops:GetShop(shopId)
    if not shop then return end

    shop:openShop(source)
end)

RegisterNetEvent("avp_inv:OPEN_NEAR_FACTION_SAFE", function(faction)
    local source <const> = source

    local safe = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = faction }) --[[@as FactionInventory]]
    if not safe then return end

    safe:open(source)
end)

RegisterNetEvent("avp_inv:BUY_FROM_SHOP", function(data)
    local source <const> = source
    local shopId <const> = data.shopId
    local fromSlot <const> = data.fromSlot
    local toSlot <const> = data.toSlot
    local quantity = data.quantity

    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = source })
    if not inventory then return end

    local shop <const> = ScriptServer.Managers.Shops:GetShop(shopId)
    if not shop then return end

    local shop_item <const> = shop:GetShopItemOnSlot(fromSlot)
    if not shop_item then return end

    local iData <const> = ScriptShared.Items:Get(shop_item.name)
    if not iData then return end

    if type(quantity) ~= "number" or quantity < 1 then quantity = 1 end
    if not iData.stackable then quantity = 1 end

    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    local finalPrice = shop_item.price * quantity

    if aPlayer.getMoney() < finalPrice then
        aPlayer.notification("warning", "Not enough money!")
        return
    end

    local addedResult = inventory:addItem({
        name = shop_item.name,
        meta = shop_item.meta,
        quantity = quantity,
        toSlot = toSlot
    })
    if addedResult.success then
        aPlayer.removeMoney(finalPrice)
    end
end)

RegisterNetEvent("avp_inv:GIVE_ITEM_TO_TARGET", function(data)
    local source <const> = source
    local itemHash <const> = data.itemHash
    local serverId <const> = data.serverId
    local quantity = data.quantity

    if source == serverId then return end

    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    local player_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = source })
    local target_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = serverId })
    if not (player_inventory and target_inventory) then return end

    local item <const> = player_inventory:getItemBy({ itemHash = itemHash })
    if not item then return end

    if type(quantity) ~= "number" or quantity > item.quantity or quantity < 1 then
        quantity = item.quantity
    end

    if not target_inventory:canCarryWeight(item.name, quantity) then
        aPlayer.notification("info", "Target player inventory does not have enough space!")
        return
    end

    local no_ref <const> = AquiverSharedLibrary.Utils.dereference(item)

    local addedResult = target_inventory:addItem({
        meta = no_ref.meta,
        name = no_ref.name,
        quantity = quantity
    })
    if addedResult.success then
        player_inventory:removeItemBy(quantity, { itemHash = itemHash })
    end
end)

RegisterNetEvent("avp_inv:DROP_ITEM_ON_GROUND", function(data)
    local source <const> = source
    local uniqueID <const> = data.uniqueID
    local itemHash <const> = data.itemHash
    local quantity = data.quantity

    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = uniqueID })
    if not inventory then return end

    local item <const> = inventory:getItemBy({ itemHash = itemHash })
    if not item then return end

    if type(quantity) ~= "number" or quantity > item.quantity or quantity < 1 then
        quantity = item.quantity
    end

    if inventory.type == "dropped_grid" then
        aPlayer.notification("error", "Where exactly do you want to drop the item?")
        return
    end

    local pX <const>, pY <const>, pZ <const> = table.unpack(GetEntityCoords(GetPlayerPed(source)))

    local close_drop_grid <const> = ScriptServer.Managers.Dropped:createOrGetGrid(pX, pY, pZ)
    if not close_drop_grid then return end

    local no_ref <const> = AquiverSharedLibrary.Utils.dereference(item)

    local addedResult <const> = close_drop_grid:addItem({
        name = no_ref.name,
        quantity = quantity,
        meta = no_ref.meta,
        coordX = pX,
        coordY = pY,
        coordZ = pZ
    })

    if addedResult.success then
        close_drop_grid:createObjectIfNotExist(addedResult.item)

        inventory:removeItemBy(quantity, { itemHash = no_ref.itemHash })

        -- Add as observer, if he is not one. (It will openup the dropped grid)
        if not close_drop_grid:hasObserver(source) then
            close_drop_grid:open(source)
        end
    end
end)

RegisterNetEvent("avp_inv:OPEN_NEAR_DROPPED_GRID", function()
    local source <const> = source
    local pX <const>, pY <const>, pZ <const> = table.unpack(GetEntityCoords(GetPlayerPed(source)))
    local close_drop_grid <const> = ScriptServer.Managers.Dropped:gridAt(pX, pY, pZ)
    if not close_drop_grid then return end
    close_drop_grid:open(source)
end)

RegisterNetEvent("avp_inv:REDUCE_WEAPON_AMMO", function()
    local source <const> = source
    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = source }) --[[@as PlayerInventory]]
    if not inventory then return end

    local usedWeapon = inventory:getItemBy({ itemHash = inventory.usedWeaponItemHash })
    if not usedWeapon then return end

    if CONFIG.AMMO_WEAPONS[usedWeapon.data.weaponHash] then
        inventory:removeItemBy(1, { name = CONFIG.AMMO_WEAPONS[usedWeapon.data.weaponHash] })
    elseif CONFIG.THROWABLE_WEAPONS[usedWeapon.data.weaponHash] then
        inventory:removeItemBy(1, { itemHash = inventory.usedWeaponItemHash })
    elseif CONFIG.MISC_WEAPONS[usedWeapon.data.weaponHash] then
        inventory:removeItemBy(math.random(3, 5), { itemHash = inventory.usedWeaponItemHash })
    end
end)

RegisterNetEvent("baseevents:onPlayerDied", function()
    local victim <const> = source
    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = victim })
    if not inventory then return end

    for i = #inventory.items, 1, -1 do
        local v = inventory.items[i]
        if v then
            if v.data.deletable then
                inventory:removeItemBy(v.quantity, { itemHash = v.itemHash })
            end
        end
    end
end)

RegisterNetEvent("avp_inv:USE_ITEM", function(data)
    local source <const> = source
    local itemHash <const> = data.itemHash
    local uniqueID <const> = data.uniqueID

    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = uniqueID })
    if not inventory then return end
    local item <const> = inventory:getItemBy({ itemHash = itemHash })
    if not item then return end

    local player_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = source }) --[[@as PlayerInventory]]
    if not player_inventory then return end

    if item.data.weaponHash then
        player_inventory:UseWeaponItem(item)
    end

    if item.data.server and type(item.data.server.export) == "string" then
        local parts <const> = {}
        for part in string.gmatch(item.data.server.export, "[^.]+") do
            table.insert(parts, part)
        end

        local resource <const> = parts[1]
        local func <const> = parts[2]

        exports[resource][func](source, item)

        if type(item.data.server.onUseDeleteAmount) == "number" and item.data.server.onUseDeleteAmount > 0 then
            inventory:removeItemBy(item.data.server.onUseDeleteAmount, { itemHash = itemHash })
        end
    end
end)

RegisterNetEvent("avp_inv:USE_SLOT", function(slot)
    local source <const> = source
    local inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = source })
    if not inventory then return end
    local item <const> = inventory:getItemBy({ slot = slot })
    if not item then return end

    local player_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = source }) --[[@as PlayerInventory]]
    if not player_inventory then return end

    if item.data.weaponHash then
        player_inventory:UseWeaponItem(item)
    end

    if item.data.server and type(item.data.server.export) == "string" then
        local parts <const> = {}
        for part in string.gmatch(item.data.server.export, "[^.]+") do
            table.insert(parts, part)
        end

        local resource <const> = parts[1]
        local func <const> = parts[2]

        exports[resource][func](source, item)

        if type(item.data.server.onUseDeleteAmount) == "number" and item.data.server.onUseDeleteAmount > 0 then
            inventory:removeItemBy(item.data.server.onUseDeleteAmount, { itemHash = itemHash })
        end
    end
end)

RegisterNetEvent("avp_inv:OPEN_STASH", function(uniqueID)
    local source <const> = source
    exports[ScriptServer.resourceName]:OpenStash(source, uniqueID)
end)

RegisterNetEvent("avp_inv:ITEM_ADD_ATTACHMENT_WEAPON", function(d)
    local source <const> = source
    local fromUniqueID <const> = d.fromUniqueID
    local toUniqueID <const> = d.toUniqueID
    local draggedItemhash <const> = d.draggedItemhash
    local toItemHash <const> = d.toItemHash

    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    local from_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = fromUniqueID })
    local to_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = toUniqueID })
    if not (from_inventory and to_inventory) then return end

    local draggedItem <const> = from_inventory:getItemBy({ itemHash = draggedItemhash })
    local to_item <const> = to_inventory:getItemBy({ itemHash = toItemHash })
    if not (draggedItem and to_item) then return end

    if to_item.data.weaponHash == nil then
        aPlayer.notification("error", "This is not a weapon!")
        return
    end

    -- Modify these lines, if you do not want the player to be able to equip a Shotgun attachment on the pistol for example.
    -- (You have to define the allowedAttachments table under the weapon item data.)
    local canAddAttachment = true
    local hasThisAttachment = false

    -- local canAddAttachment = false
    -- local hasThisAttachment = false
    -- -- if type(to_item.data.allowedAttachments) == "table" then
    -- --     for k, v in pairs(to_item.data.allowedAttachments) do
    -- --         if v == draggedItem.name then
    -- --             canAddAttachment = true
    -- --             break
    -- --         end
    -- --     end
    -- -- end

    if not canAddAttachment then
        aPlayer.notification("warning", "You can not use this attachment on this weapon!")
        return
    end

    if type(to_item.meta.attachments) ~= "table" then
        to_item.meta.attachments = {}
    end

    if #to_item.meta.attachments >= 5 then
        aPlayer.notification("info", "You can not add more attachment to this weapon!")
        return
    end

    for k, v in pairs(to_item.meta.attachments) do
        if v == draggedItem.name then
            hasThisAttachment = true
            break
        end
    end

    if hasThisAttachment then
        aPlayer.notification("warning", "You already has this kind of attachment on this weapon!")
        return
    end

    to_item.meta.attachments[#to_item.meta.attachments + 1] = draggedItem.name
    to_inventory:OnItemUpdated(to_item)
    from_inventory:removeItemBy(nil, { itemHash = draggedItemhash })

    if to_inventory.type == "player" then
        TriggerClientEvent("avp_inv:UpdateWeaponAttachments", to_inventory.source, to_item)
    end
end)

RegisterNetEvent("avp_inv:ITEM_REMOVE_ATTACHMENT_WEAPON", function(d)
    local source <const> = source
    local fromUniqueID <const> = d.fromUniqueID
    local fromItemHash <const> = d.fromItemHash
    local fromAttIndex <const> = d.fromAttIndex
    local toUniqueID <const> = d.toUniqueID
    local toSlot <const> = d.toSlot

    local from_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = fromUniqueID })
    local to_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = toUniqueID })
    if not (from_inventory and to_inventory) then return end

    local from_item <const> = from_inventory:getItemBy({ itemHash = fromItemHash })
    if not from_item then return end

    if type(from_item.meta.attachments) ~= "table" then
        from_item.meta.attachments = {}
    end

    local attachment <const> = from_item.meta.attachments[fromAttIndex]
    if not attachment then return end

    local response = to_inventory:addItem({
        name = attachment,
        toSlot = toSlot
    })
    if response.success then
        table.remove(from_item.meta.attachments, fromAttIndex)
        to_inventory:OnItemUpdated(from_item)

        if to_inventory.type == "player" then
            TriggerClientEvent("avp_inv:UpdateWeaponAttachments", to_inventory.source, from_item)
        end
    end
end)
RegisterNetEvent("avp_inv:REDUCE_WEAPON_DURABILITY", function()
    local source <const> = source
    local player_inventory <const> = ScriptServer.Managers.Inventory:GetInventory({ source = source }) --[[@as PlayerInventory]]
    if not player_inventory then return end
    player_inventory:ReduceWeaponDurability()
end)
