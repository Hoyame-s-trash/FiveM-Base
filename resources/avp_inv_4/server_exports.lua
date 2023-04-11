local function getInventory(inv)
    if type(inv) == "number" then
        return ScriptServer.Managers.Inventory:GetInventory({ source = inv })
    elseif type(inv) == "string" then
        return ScriptServer.Managers.Inventory:GetInventory({ uniqueID = inv })
    end
end

exports("GetInventoryItems", function(inv)
    local inventory = getInventory(inv)
    if inventory then
        return inventory.items
    end
end)

exports("Clear", function(inv)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:clear()
    end
end)

exports("AddItem", function(inv, itemName, quantity, meta)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:addItem({
            name = itemName,
            quantity = quantity,
            meta = meta
        })
    end
end)

exports("SetItemQuantity", function(inv, itemName, quantity)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:setItemQuantity(itemName, quantity)
    end
end)

exports("GetItemBy", function(inv, findBy)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:getItemBy(findBy)
    end
end)

exports("GetItemsBy", function(inv, findBy)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:getItemsBy(findBy)
    end
end)

exports("GetItemQuantityBy", function(inv, findBy)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:getItemQuantityBy(findBy)
    end
end)

exports("GetWeight", function(inv)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:getWeight()
    end
end)

exports("CanCarryItem", function(inv, itemName, quantity)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:canCarryItem(itemName, quantity)
    end
end)

exports("RemoveItemBy", function(inv, quantity, findBy)
    local inventory <const> = getInventory(inv)
    if inventory then
        return inventory:removeItemBy(quantity, findBy)
    end
end)

exports("SetDurability", function(inv, findBy, durability)
    local inventory <const> = getInventory(inv)
    if not inventory then return end
    local item <const> = inventory:getItemBy(findBy)
    if not item then return end

    item.meta.durability = durability
    inventory:OnItemUpdated(item)

    return item
end)

exports("SetMetaData", function(inv, findBy, metaData)
    local inventory <const> = getInventory(inv)
    if not inventory then return end
    local item <const> = inventory:getItemBy(findBy)
    if not item then return end

    item.meta = metaData
    inventory:OnItemUpdated(item)
    return item
end)

exports("Save", function(inv)
    local inventory = getInventory(inv)
    if inventory then
        return inventory:save()
    end
end)

exports("SaveAll", function()
    ScriptServer.Managers.Inventory:SaveInventories()
    ScriptServer.Managers.Dropped:SaveDroppeds()
end)

exports("RegisterStash", function(createData)
    return ScriptServer.Classes.StashInventory.new(createData)
end)

exports("OpenStash", function(source, uniqueID)
    local stash <const> = getInventory(uniqueID) --[[@as StashInventory]]
    if stash then
        stash:open(source)
    end
end)

--- This will not delete the items, only deletes the inventory on the server so it can not be opened if its not created again.
exports("DestroyStash", function(uniqueID)
    local inv <const> = getInventory(uniqueID) --[[@as StashInventory]]
    if inv and inv.type == "dropped_grid" then
        inv:triggerObservers(function(source)
            inv:close(source)
        end)
        ScriptServer.Managers.Inventory.Inventories[uniqueID] = nil
    end
end)

exports("FriskTarget", function(source, targetID)
    local target_inv = ScriptServer.Managers.Inventory:GetInventory({ source = targetID }) --[[@as PlayerInventory]]
    if target_inv then
        target_inv:open(source)
    end
end)

exports("GetRegisteredItem", function(itemName)
    return ScriptShared.Items:Get(itemName)
end)
exports("GetRegisteredItems", function()
    return ScriptShared.Items.Registered
end)
