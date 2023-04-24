--- Export function to register an item data from another resource.
---@param name string Example: 'gold'
---@param d RegisteredItemData
exports("registerItem", function(name, d)
    ScriptShared.Items:Add(name, d)
end)

--- Export function to create a shop from another resource.
---@param id string Example: 'General'
---@param shopData ShopStaticData
exports("createShop", function(id, shopData)
    Module[id] = shopData

    -- If its server create the shop.
    if IsDuplicityVersion() then
        ScriptServer.Classes.Shop.new(id, shopData)
    end
end)
