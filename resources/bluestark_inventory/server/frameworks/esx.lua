local ESX = nil
local accountsAsItems = {
    ["money"] = true
}

local function Init()
    while GetResourceState("believer") == "starting" do
        Citizen.Wait(500)
    end

    if GetResourceState("believer") ~= "started" then return end

    print("^1ESX framework recognized.")

    ESX = exports['believer']:getSharedObject()

    local function loadEsxPlayerInventory(xPlayer)
        ScriptServer.Classes.PlayerInventory.new({
            inventoryName = "Player Stash",
            maxWeight = CONFIG.PLAYER_INVENTORY_DEFAULTS.MAX_WEIGHT,
            slotsAmount = CONFIG.PLAYER_INVENTORY_DEFAULTS.SLOTS,
            source = xPlayer.source,
            type = "player",
            uniqueID = xPlayer.getIdentifier()
        })
    end

    AddEventHandler("onServerResourceStart", function(resourceName)
        if GetCurrentResourceName() ~= ScriptServer.resourceName then return end

        Citizen.Wait(2000)

        local onlinePlayers = GetPlayers()
        for k, v in pairs(onlinePlayers) do
            local xPlayer = ESX.GetPlayerFromId(v)
            if xPlayer then
                loadEsxPlayerInventory(xPlayer)
            end
        end
    end)

    RegisterNetEvent("esx:playerLoaded", function(playerId, xPlayer, isNew)
        loadEsxPlayerInventory(xPlayer)
    end)

    local convertStarted = false
    local function Converter()
        if convertStarted then
            print("Convert already started.. Please wait...")
            return
        end

        convertStarted = true

        print("Started converting User inventories...")

        local users <const> = exports["oxmysql"]:query_async(
            "SELECT identifier, inventory, loadout, accounts FROM users")
        if not users then return end

        local usersTotal <const> = #users

        print(string.format("Converting %d ESX User inventories...", usersTotal))

        for i = 1, usersTotal do
            local value <const> = users[i]
            local items <const> = value.inventory and json.decode(value.inventory) or {}
            local accounts <const> = value.accounts and json.decode(value.accounts) or {}
            local identifier <const> = value.identifier

            local baseInventory <const> = ScriptServer.Classes.BaseInventory.new(
                {
                    inventoryName = "Temporary",
                    maxWeight = CONFIG.PLAYER_INVENTORY_DEFAULTS.MAX_WEIGHT,
                    slotsAmount = CONFIG.PLAYER_INVENTORY_DEFAULTS.SLOTS,
                    uniqueID = identifier
                }
            )

            for k, v in pairs(items) do
                local iData <const> = ScriptShared.Items:Get(k)
                if iData then
                    baseInventory:addItem({
                        name = k,
                        quantity = v
                    })
                end
            end

            for k, v in pairs(accounts) do
                if accountsAsItems[k] then
                    local iData = ScriptShared.Items:Get(k)
                    if iData then
                        baseInventory:addItem({
                            name = k,
                            quantity = v
                        })
                    end
                end
            end

            baseInventory:save()

            -- Delete it from the cache.
            ScriptServer.Managers.Inventory.Inventories[identifier] = nil
        end

        print("Successfully converted User inventories.")
        convertStarted = false
    end

    RegisterCommand("Convert_ESX", Converter, true)
end

Init()
