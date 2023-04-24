if GetResourceState("es_extended") == "missing" then
    RegisterNetEvent("avp_inv:CLIENT_LOADED", function()
        local source <const> = source
        local player <const> = _G.APIServer.Managers.PlayerManager:getPlayer(source)
        if not player then return end

        local identifier <const> = player:getIdentifier()
        if type(identifier) ~= "string" then return end

        if not ScriptServer.Managers.Inventory:GetInventory({ source = source }) then
            ScriptServer.Classes.PlayerInventory.new({
                inventoryName = "Player Stash",
                maxWeight = CONFIG.PLAYER_INVENTORY_DEFAULTS.MAX_WEIGHT,
                slotsAmount = CONFIG.PLAYER_INVENTORY_DEFAULTS.SLOTS,
                source = source,
                type = "player",
                uniqueID = identifier
            })
        end
    end)
end
