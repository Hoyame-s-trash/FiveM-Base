---@class FactionInventory:BaseInventory
---@field faction string
---@field safeCoords vector3
---@field safeHeading number
---@field safeHandle ServerObjectClass | nil
local Module <const> = setmetatable({}, { __index = ScriptServer.Classes.BaseInventory })

ScriptServer.Classes.FactionInventory = Module

---@class FactionInventoryClassCreateInterface:BaseInventoryClassCreateInterface
---@field faction string
---@field safeCoords vector3
---@field safeHeading number

---@param data FactionInventoryClassCreateInterface
Module.new = function(data)
    data.type = "faction"

    local self = setmetatable(
        ScriptServer.Classes.BaseInventory.new(data),
        { __index = Module }
    )

    self.faction = data.faction
    self.safeCoords = data.safeCoords
    self.safeHeading = data.safeHeading

    self.safeHandle = AquiverServerLibrary.Classes.Objects({
        dimension = 0,
        model = CONFIG.FACTION_SAFE_OBJECT_MODEL,
        resource = ScriptServer.resourceName,
        rx = 0.0,
        ry = 0.0,
        rz = self.safeHeading,
        x = self.safeCoords.x,
        y = self.safeCoords.y,
        z = self.safeCoords.z
    })

    return self
end

function Module:isFactionMember(source)
    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    return aPlayer.getJobName() == self.faction
end

function Module:open(source)
    if self:hasObserver(source) then return end
    if not self:isFactionMember(source) then return end

    self:addObserver(source)

    TriggerClientEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", source, {
        event = "ADD_OPENED_INVENTORY",
        uniqueID = self.uniqueID,
        items = self.items,
        maxWeight = self.maxWeight,
        inventoryName = self.inventoryName,
        slotsAmount = self.slotsAmount
    })
end

function Module:close(source)
    if not self:hasObserver(source) then return end

    self:removeObserver(source)

    TriggerClientEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", source, {
        event = "REMOVE_OPENED_INVENTORY",
        uniqueID = self.uniqueID
    })
end
