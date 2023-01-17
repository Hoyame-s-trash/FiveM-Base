local lib = exports.loaf_lib:GetLib()

local function ClientOxFunctions()
    exports.ox_inventory:displayMetadata({
        lbPhoneNumber = "Phone number",
        lbFormattedNumber = "Formatted number",
        lbPhoneName = "Phone name",
    })

    function GetFirstNumber()
        local phones = exports.ox_inventory:Search("slots", Config.Item.Name)
        for i = 1, #phones do
            local phone = phones[i]
            if phone?.metadata?.lbPhoneNumber then
                return phone.metadata.lbPhoneNumber
            end
        end
    end

    function HasPhoneNumber(number)
        local phones = exports.ox_inventory:Search("slots", Config.Item.Name)
        if not phones then
            return false
        end

        for i = 1, #phones do
            local phone = phones[i]
            if phone?.metadata?.lbPhoneNumber == number then
                return true
            end
        end

        return false
    end

    exports("UsePhoneItem", function(_, slot)
        local number = slot.metadata?.lbPhoneNumber
        if number ~= currentPhone or number == nil then
            SetPhone(number, true)
        end

        ToggleOpen(not phoneOpen)
    end)

    RegisterNetEvent("lb-phone:itemRemoved", function()
        Wait(500)
        if currentPhone and not HasPhoneItem(currentPhone) and Config.Item.Unique then
            SetPhone()
        end
    end)

    local waitingAdded = false
    RegisterNetEvent("lb-phone:itemAdded", function()
        Wait(500)
        if currentPhone or waitingAdded then
            return
        end

        waitingAdded = true
        local firstNumber = GetFirstNumber()
        SetPhone(firstNumber, true)
        waitingAdded = false
    end)
end

local function ClientQbFunctions()
    local QB = exports["qb-core"]:GetCoreObject()

    local function GetItemsByName(name)
        local items = {}
        local inventory = QB.Functions.GetPlayerData().items
        for _, item in pairs(inventory) do
            if item?.name == name then
                items[#items+1] = item
            end
        end
        return items
    end

    function GetFirstNumber()
        local phones = GetItemsByName(Config.Item.Name)
        for i = 1, #phones do
            local phone = phones[i]
            if phone?.info?.lbPhoneNumber then
                return phone.info.lbPhoneNumber
            end
        end
    end

    function HasPhoneNumber(number)
        local phones = GetItemsByName(Config.Item.Name)
        for i = 1, #phones do
            local phone = phones[i]
            if phone?.info?.lbPhoneNumber == number then
                return true
            end
        end
        return false
    end

    RegisterNetEvent("lb-phone:usePhoneItem", function(data)
        local number = data.info?.lbPhoneNumber
        if number ~= currentPhone or number == nil then
            SetPhone(number, true)
        end

        ToggleOpen(not phoneOpen)
    end)
    RegisterNetEvent("lb-phone:itemRemoved", function()
        Wait(500)
        if currentPhone and not HasPhoneItem(currentPhone) and Config.Item.Unique then
            SetPhone()
        end
    end)

    local waitingAdded = false
    RegisterNetEvent("lb-phone:itemAdded", function()
        Wait(500)
        if currentPhone or waitingAdded then
            return
        end

        waitingAdded = true
        local firstNumber = GetFirstNumber()
        SetPhone(firstNumber, true)
        waitingAdded = false
    end)
end

CreateThread(function()
    if not Config.Item.Unique or not Config.Item.Require then
        return
    end

    if Config.Item.Inventory == "ox_inventory" then
        ClientOxFunctions()
    elseif Config.Item.Inventory == "qb-inventory" then
        ClientQbFunctions()
    else
        SpamError("Invalid inventory \"" .. Config.Item.Inventory .. "\", it does not support unique phones.")
    end

    if Config.Item.Inventory == "ox_inventory" or Config.Item.Inventory == "qb-inventory" then
        function SetPhone(number, used)
            OnDeath()

            lib.TriggerCallbackSync("phone:setLastPhone", number)

            ResetSecurity()
            phoneData = nil
            currentPhone = nil
            settings = nil

            if number or used then
                FetchPhone()
            end

            if number == nil and not used then -- when dropping phone, check if the player has another phone
                local firstNumber = GetFirstNumber()
                if firstNumber then
                    SetPhone(firstNumber)
                end
            end
        end
    end
end)