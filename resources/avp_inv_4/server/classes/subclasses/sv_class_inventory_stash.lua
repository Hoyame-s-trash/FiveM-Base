---@class StashInventory:BaseInventory
---@field isPublic? boolean
---@field ownerLicense? string
---@field groups? { [string]: number }
---@field isPermanent? boolean
local Module <const> = setmetatable({}, { __index = ScriptServer.Classes.BaseInventory })

ScriptServer.Classes.StashInventory = Module

---@class StashInventoryClassCreateInterface:BaseInventoryClassCreateInterface
---@field isPublic? boolean
---@field ownerLicense? string
---@field groups? { [string]: number }
---@field isPermanent? boolean

---@param data StashInventoryClassCreateInterface
Module.new = function(data)
    data.type = "stash"

    local self = setmetatable(
        ScriptServer.Classes.BaseInventory.new(data),
        { __index = Module }
    )

    self.isPublic = data.isPublic
    self.ownerLicense = data.ownerLicense
    self.groups = data.groups
    self.isPermanent = data.isPermanent

    return self --[[@as StashInventory]]
end

function Module:hasPermission(source)
    if self.isPublic then return true end

    local aPlayer <const> = AquiverServerLibrary.Managers.Players.get(source)
    if not aPlayer then return end

    if type(self.ownerLicense) == "string" then
        return aPlayer.getIdentifier() == self.ownerLicense
    end

    if type(self.groups) == "table" and #self.groups > 0 then
        local playerFaction = aPlayer.getJobName()
        local playerFactionGrade = aPlayer.getJobGrade()

        for k, v in pairs(self.groups) do
            if playerFaction == k and playerFactionGrade >= v then
                return true
            end
        end
    end

    return false
end

function Module:open(source)
    if self:hasObserver(source) then return end
    if not self:hasPermission(source) then return end

    self:addObserver(source)

    TriggerClientEvent("avp_inv:PLAYER_SEND_NUI_MESSAGE", source, {
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

    TriggerClientEvent("avp_inv:PLAYER_SEND_NUI_MESSAGE", source, {
        event = "REMOVE_OPENED_INVENTORY",
        uniqueID = self.uniqueID
    })
end

function Module:save()
    if not self.isPermanent then return end

    return self.__index.save(self)
end
