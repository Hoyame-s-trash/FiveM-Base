ScriptServer = {}
ScriptServer.Classes = {}
ScriptServer.Managers = {}
ScriptServer.resourceName = GetCurrentResourceName()
ScriptServer.isLoaded = false

AddEventHandler("onServerResourceStart", function(resourceName)
    if ScriptServer.resourceName ~= resourceName then return end

    ScriptServer.Managers.Dropped:onServerResourceStart()
    ScriptServer.isLoaded = true

    for k, v in pairs(CONFIG.FACTION_INVENTORIES) do
        ScriptServer.Classes.FactionInventory.new({
            faction = k,
            inventoryName = v.header,
            maxWeight = v.maxWeight,
            slotsAmount = v.slotsAmount,
            uniqueID = k,
            safeCoords = vector3(v.x, v.y, v.z),
            safeHeading = v.heading
        })
    end
end)

RegisterNetEvent('playerDropped', function()
    local source <const> = source
    local inventory = ScriptServer.Managers.Inventory:GetInventory({ source = source })
    if not inventory then return end

    inventory:save()
    inventory:destroy()
end)

AddEventHandler("onResourceStop", function(resourceName)
    if ScriptServer.resourceName ~= resourceName then return end

    ScriptServer.Managers.Dropped:onResourceStop()
end)

local function SaveInventoriesInterval()
    ScriptServer.Managers.Inventory:SaveInventories()
    Citizen.SetTimeout(CONFIG.SAVE_INVENTORIES_MS, SaveInventoriesInterval)
end

Citizen.SetTimeout(CONFIG.SAVE_INVENTORIES_MS, SaveInventoriesInterval)
