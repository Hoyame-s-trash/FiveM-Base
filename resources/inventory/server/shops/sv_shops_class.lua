---@class ShopClass:ShopConstructor
---@field blips API_Server_BlipBase[]
---@field peds API_Server_PedBase[]
local Module <const> = {}
Module.__index = Module

ScriptServer.Classes.Shop = Module

---@class ShopConstructor
---@field shopId string
---@field items ShopItem[]
---@field shopName string

---@param allData ShopStaticData
Module.new = function(id, allData)
    local self = setmetatable({}, Module)

    self.shopName = allData.shopName
    self.shopId = id
    self.items = {}
    self.blips = {}
    self.peds = {}

    for i = 1, #allData.locations do
        self.blips[#self.blips + 1] = _G.APIServer.Managers.BlipManager:createBlip({
            pos = allData.locations[i],
            color = allData.blip.colour,
            sprite = allData.blip.sprite,
            scale = allData.blip.scale,
            display = 4,
            name = self.shopName,
            shortRange = false
        })
    end

    for i = 1, #allData.peds do
        self.peds[#self.peds + 1] = _G.APIServer.Managers.PedManager:createPed({
            pos = allData.peds[i].coords,
            heading = allData.peds[i].heading,
            model = allData.peds[i].modelName,
            name = self.shopName,
            questionMark = true,
            dimension = 0,
            scenario = allData.peds[i].scenario
        })
    end

    for i = 1, #allData.items do
        local v = allData.items[i]
        local iData = ScriptShared.Items:Get(v.name)
        if iData then
            self.items[#self.items + 1] = {
                data = iData,
                meta = type(v.meta) == "table" and v.meta or type(iData.defaultMeta) == "table" and iData.defaultMeta or
                    {},
                name = v.name,
                price = v.price
            }
        end
    end

    ScriptServer.Managers.Shops.Shops[self.shopId] = self

    print(string.format("Created new shop: %s", self.shopId))

    return self
end

function Module:openShop(source)
    TriggerClientEvent("avp_inv:PLAYER_SEND_NUI_MESSAGE", source, {
        event = "OPEN_SHOP",
        items = self.items,
        shopId = self.shopId,
        shopName = self.shopName
    })
end

function Module:GetShopItemOnSlot(slot)
    return self.items[slot] or nil
end

for k, v in pairs(ScriptShared.Shops) do
    ScriptServer.Classes.Shop.new(k, v)
end
