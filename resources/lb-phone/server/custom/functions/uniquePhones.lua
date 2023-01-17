-- ox_inventory
local function ServerOxFunctions()
    ---Function to check if a player has a phone with a specific number
    ---@param source any
    ---@param phoneNumber string
    ---@return boolean
    function HasPhoneNumber(source, phoneNumber)
        debugprint("checking if " .. source .. " has a phone item with number", phoneNumber)
        local phones = exports.ox_inventory:Search(source, "slots", Config.Item.Name)
        if not phones then
            return false
        end

        for i = 1, #phones do
            if phones[i]?.metadata?.lbPhoneNumber == phoneNumber then
                debugprint("they do")
                return true
            end
        end
        return false
    end

    ---Function to set a phone number to a player's empty phone item
    ---@param source number
    ---@param phoneNumber string
    ---@return boolean success
    function SetPhoneNumber(source, phoneNumber)
        debugprint("setting phone number to", phoneNumber, "for", source)
        local phones = exports.ox_inventory:Search(source, "slots", Config.Item.Name)
        if not phones then
            return false
        end

        for i = 1, #phones do
            local phone = phones[i]
            if phone?.metadata?.lbPhoneNumber == nil then
                phone.metadata = {
                    lbPhoneNumber = phoneNumber,
                    lbFormattedNumber = FormatNumber(phoneNumber)
                }
                exports.ox_inventory:SetMetadata(source, phone.slot, phone.metadata)
                debugprint("set phone number to", phoneNumber, "for", source)
                return true
            end
        end

        return false
    end

    function SetItemName(source, phoneNumber, name)
        local phones = exports.ox_inventory:Search(source, "slots", Config.Item.Name)
        if not phones then
            return false
        end

        for i = 1, #phones do
            local phone = phones[i]
            if phone?.metadata?.lbPhoneNumber == phoneNumber then
                phone.metadata.lbPhoneName = name
                phone.metadata.lbFormattedNumber = FormatNumber(phoneNumber)
                exports.ox_inventory:SetMetadata(source, phone.slot, phone.metadata)
                return true
            end
        end

        return false
    end
end

-- qb-inventory
local function ServerQbFunctions()
    local QB = exports["qb-core"]:GetCoreObject()

    ---Function to get all items a player has with a specific name
    ---@param source number
    ---@param name string
    ---@return table items
    local function GetItemsByName(source, name)
        local inventory = QB.Functions.GetPlayer(source).PlayerData.items
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
            if phone?.info?.lbPhoneNumber == phoneNumber then
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
        local qPlayer = QB.Functions.GetPlayer(source)
        local items = qPlayer.PlayerData.items
        for i = 1, #items do
            local item = items[i]
            if item and item.name == Config.Item.Name and item.info.lbPhoneNumber == nil then
                item.info.lbPhoneNumber = phoneNumber
                item.info.lbFormattedNumber = FormatNumber(phoneNumber)
                qPlayer.Functions.SetInventory(items, true)
                return true
            end
        end
        return false
    end

    function SetItemName(source, phoneNumber, name)
        local qPlayer = QB.Functions.GetPlayer(source)
        local items = qPlayer.PlayerData.items
        for i = 1, #items do
            local item = items[i]
            if item and item.name == Config.Item.Name and item.info.lbPhoneNumber == phoneNumber then
                item.info.lbPhoneName = name
                item.info.lbFormattedNumber = FormatNumber(phoneNumber)
                qPlayer.Functions.SetInventory(items, true)
                return true
            end
        end
    end

    QB.Functions.CreateUseableItem(Config.Item.Name, function(source, item)
        if item then
            TriggerClientEvent("lb-phone:usePhoneItem", source, item)
        end
    end)
end

CreateThread(function()
    if not Config.Item.Unique or not Config.Item.Require then
        return
    end

    if Config.Item.Inventory == "ox_inventory" then
        ServerOxFunctions()
    elseif Config.Item.Inventory == "qb-inventory" then
        ServerQbFunctions()
    else
        SpamError("Invalid inventory \"" .. Config.Item.Inventory .. "\", it does not support unique phones.")
    end
end)