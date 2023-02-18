CreateThread(function()
    if Config.Item.Inventory ~= "core_inventory" or not Config.Item.Unique or not Config.Item.Require then
        return
    end

    local ESX
    local QB

    --TODO: REDO THIS
    if Config.Framework == 'qb' then
        QB = exports['qb-core']:GetCoreObject()
    elseif Config.Framework == 'esx' then
        export, ESX = pcall(function()
            return exports.es_extended:getSharedObject()
        end)
        if not export then
            while not ESX do
                TriggerEvent("esx:getSharedObject", function(obj)
                    ESX = obj
                end)
                Wait(500)
            end
        end
    end

    local function GetItemsByName(source, name)
        local Player = ''
        local inventoryName = ''
        if Config.Framework == 'qb' then
            Player = QB.Functions.GetPlayer(source)
            inventoryName = 'content-' .. Player.PlayerData.citizenid
        elseif Config.Framework == 'esx' then
            Player = ESX.GetPlayerFromId(source)
            inventoryName = 'content-' ..  Player.identifier:gsub(":", "")
        end

        local inventory = exports['core_inventory']:getInventory(inventoryName)
        local items = {}
        for _, item in pairs(inventory) do
            if item?.name == name then
                items[#items+1] = item
            end
        end
        return items
    end

    ---Function to check if a player has a phone with a specific number
    ---@param source any
    ---@param phoneNumber string
    ---@return boolean
    function HasPhoneNumber(source, phoneNumber)
        debugprint("checking if " .. source .. " has a phone item with number", phoneNumber)
        local phones = GetItemsByName(source, Config.Item.Name)
        for i = 1, #phones do
            local phone = phones[i]
            if phone?.metadata?.lbPhoneNumber == phoneNumber then
                debugprint("they do")
                return true
            end
        end
        debugprint("they do not")
        return false
    end

    ---Function to set a phone number to a player's empty phone item
    ---@param source number
    ---@param phoneNumber string
    ---@return boolean success
    function SetPhoneNumber(source, phoneNumber)
        debugprint("setting phone number to", phoneNumber, "for", source)
        local Player = ''
        local inventoryName = ''
        if Config.Framework == 'qb' then
            Player = QB.Functions.GetPlayer(source)
            inventoryName = 'content-' .. Player.PlayerData.citizenid
        elseif Config.Framework == 'esx' then
            Player = ESX.GetPlayerFromId(source)
            inventoryName = 'content-' ..  Player.identifier:gsub(":", "")
        end
        local inventory = exports['core_inventory']:getInventory(inventoryName)

        for i = 1, #inventory do
            local item = inventory[i]
            if item and item.name == Config.Item.Name then
                item.metadata.lbPhoneNumber = phoneNumber
                item.metadata.lbFormattedNumber = FormatNumber(phoneNumber)
                exports['core_inventory']:updateMetadata(inventoryName, item.id, item.metadata)
                return true
            end
        end
        return false
    end

    function SetItemName(source, phoneNumber, name)
        local Player = ''
        local inventoryName = ''

        if Config.Framework == 'qb' then
            Player = QB.Functions.GetPlayer(source)
            inventoryName = 'content-' .. Player.PlayerData.citizenid
        elseif Config.Framework == 'esx' then
            Player = ESX.GetPlayerFromId(source)
            inventoryName = 'content-' ..  Player.identifier:gsub(":", "")
        end

        local items = exports['core_inventory']:getInventory(inventoryName)
        for i = 1, #items do
            local item = items[i]
            if item and item.name == Config.Item.Name and item.metadate.lbPhoneNumber == phoneNumber then
                local metadata = item.metadate
                metadata.lbPhoneName = name
                metadata.lbFormattedNumber = FormatNumber(phoneNumber)
                exports['core_inventory']:updateMetadata(inventoryName, item.id, metadata)
                return true
            end
        end
    end
end)