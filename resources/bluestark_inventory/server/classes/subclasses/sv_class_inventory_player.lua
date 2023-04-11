---@class PlayerInventory:BaseInventory
---@field source number
---@field usedWeaponItemHash string
local Module <const> = setmetatable({}, { __index = ScriptServer.Classes.BaseInventory })

ScriptServer.Classes.PlayerInventory = Module

---@class PlayerInventoryClassCreateInterface:BaseInventoryClassCreateInterface
---@field source number

---@param data PlayerInventoryClassCreateInterface
Module.new = function(data)
    data.type = "player"

    local self = setmetatable(
        ScriptServer.Classes.BaseInventory.new(data),
        { __index = Module }
    ) --[[@as PlayerInventory]]

    self.source = data.source
    self.usedWeaponItemHash = nil

    local aPlayer = AquiverServerLibrary.Managers.Players.get(self.source)
    if aPlayer then
        TriggerClientEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", self.source, {
            event = "SET_PLAYER_HEADER",
            playerHeader = string.format("%s (%d)", aPlayer.getName(), self.source)
        })
    end

    TriggerClientEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", self.source, {
        event = "ADD_OPENED_INVENTORY",
        uniqueID = self.uniqueID,
        items = self.items,
        maxWeight = self.maxWeight,
        inventoryName = self.inventoryName,
        slotsAmount = self.slotsAmount,
        isLocal = true
    })

    self:addObserver(self.source)
    TriggerClientEvent("bluestark_inventory:setPlayerInventoryItems", self.source, self.items)

    return self
end

---@param item InventoryItem
function Module:OnItemUpdated(item)
    self.__index.OnItemUpdated(self, item)

    TriggerClientEvent("bluestark_inventory:onPlayerItemUpdated", self.source, item)

    if self.usedWeaponItemHash == item.itemHash then
        TriggerClientEvent("bluestark_inventory:updateCurrentWeapon", self.source, item)
    end
end

---@param item InventoryItem
function Module:OnItemAdded(item)
    self.__index.OnItemAdded(self, item)

    TriggerClientEvent("bluestark_inventory:onPlayerItemAdded", self.source, item)
end

---@param item InventoryItem
function Module:OnItemRemoved(item)
    self.__index.OnItemRemoved(self, item)

    TriggerClientEvent("bluestark_inventory:onPlayerItemRemoved", self.source, item)

    if self.usedWeaponItemHash == item.itemHash then
        self:DisarmWeapon()
    end
end

-- This is for frisking the inventory.
function Module:open(source)
    if self:hasObserver(source) then return end

    self:addObserver(source)

    TriggerClientEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", source, {
        event = "ADD_OPENED_INVENTORY",
        uniqueID = self.uniqueID,
        items = self.items,
        maxWeight = self.maxWeight,
        inventoryName = self.inventoryName,
        slotsAmount = self.slotsAmount,
        isLocal = false
    })
end

-- Closing the frisking.
function Module:close(source)
    if not self:hasObserver(source) then return end

    self:removeObserver(source)

    TriggerClientEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", source, {
        event = "REMOVE_OPENED_INVENTORY",
        uniqueID = self.uniqueID
    })
end

---@param item InventoryItem
function Module:UseWeaponItem(item)
    if self.usedWeaponItemHash == item.itemHash then
        self:DisarmWeapon()
    else
        self:EquipWeapon(item)
    end
end

---@param item InventoryItem
function Module:EquipWeapon(item)
    if type(item.meta.durability) == "number" and item.meta.durability < 1 then return end

    self.usedWeaponItemHash = item.itemHash
    TriggerClientEvent("bluestark_inventory:equipWeapon", self.source, item)
end

function Module:DisarmWeapon()
    self.usedWeaponItemHash = nil
    TriggerClientEvent("bluestark_inventory:disarmWeapon", self.source)
end

function Module:ReduceWeaponDurability()
    if not self.usedWeaponItemHash then return end

    local usedWeapon <const> = self:getItemBy({ itemHash = self.usedWeaponItemHash })
    if not usedWeapon then return end

    if CONFIG.AMMO_WEAPONS[usedWeapon.data.weaponHash] or CONFIG.MELEE_WEAPONS[usedWeapon.data.weaponHash] then
        local chance <const> = math.random(0, 100)
        if chance < CONFIG.REDUCE_WEAPON_DURABILITY_CHANCE then
            local reduceBy <const> = math.random(
                    CONFIG.REDUCE_WEAPON_DURABILITY_AMOUNT.MIN,
                    CONFIG.REDUCE_WEAPON_DURABILITY_AMOUNT.MAX
                ) / 100

            usedWeapon.meta.durability = (usedWeapon.meta.durability or 100) - reduceBy
        end
    end

    if usedWeapon.meta.durability < 0 then
        usedWeapon.meta.durability = 0
    end

    if usedWeapon.meta.durability <= 0 then
        self:DisarmWeapon()

        if CONFIG.DELETE_WEAPON_ON_DURABILITY_ZERO then
            -- Delete weapon if durability reached zero.
            self:removeItemBy(nil, { itemHash = usedWeapon.itemHash })
            return -- Important return here!!
        end
    end

    self:OnItemUpdated(usedWeapon)
end
