-- This file is just for dev purposes.
-- Disable it in the fxmanifest.lua file! Do not load this if you are not testing around things.

RegisterCommand("frisk", function(source, args)
    local targetID = tonumber(args[1])
    local target_inv <const> = ScriptServer.Managers.Inventory:GetInventory({ source = targetID }) --[[@as PlayerInventory]]
    if not target_inv then return end
    target_inv:open(source)
end)


RegisterCommand("inv_weapon", function(source)
    local inv = ScriptServer.Managers.Inventory:GetInventory({ source = source })
    if not inv then return end

    inv:addItem({
        name = "pistol",
        quantity = 1,
    })
    inv:addItem({
        name = "bat"
    })
    inv:addItem({
        name = "grenade",
        quantity = 5
    })
    inv:addItem({
        name = "fertilizer"
    })
    inv:addItem({
        name = "petrolcan",
        quantity = 100
    })
    inv:addItem({
        name = "9mm_rounds",
        quantity = 30
    })
end, false)

RegisterCommand("inv_random", function(source)
    local inv = ScriptServer.Managers.Inventory:GetInventory({ source = source })
    if not inv then return end

    local filteredItems = {}
    for k, v in pairs(ScriptShared.Items.Registered) do
        filteredItems[#filteredItems + 1] = k
    end

    if #filteredItems < 1 then return end

    for i = 1, 3, 1 do
        local randItem = filteredItems[math.random(1, #filteredItems)]
        local amount = math.random(1, 10)
        inv:addItem({
            name = randItem,
            quantity = amount
        })
    end
end, false)

RegisterCommand("loot_1", function(source)
    local inv = ScriptServer.Managers.Inventory:GetInventory({ uniqueID = "random-loot-1" }) --[[@as StashInventory]]
    if not inv then
        inv = ScriptServer.Classes.StashInventory.new({
            isPublic = true,
            isPermanent = true,
            inventoryName = "Loot Box",
            maxWeight = 100,
            slotsAmount = 15,
            uniqueID = "random-loot-1"
        })
    end
    print(inv)
    inv:open(source)
end, false)
