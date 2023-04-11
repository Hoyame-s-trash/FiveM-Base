---@class ShopClass:ShopConstructor
---@field blips ServerBlipClass[]
---@field peds ServerPedClass[]
---@field actionshapes ServerActionshapeClass[]
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
    self.actionshapes = {}

    for i = 1, #allData.locations do
        self.blips[#self.blips + 1] = AquiverServerLibrary.Classes.Blips({
            x = allData.locations[i].x,
            y = allData.locations[i].y,
            z = allData.locations[i].z,
            color = allData.blip.colour,
            sprite = allData.blip.sprite,
            scale = allData.blip.scale,
            display = 4,
            name = self.shopName,
            shortRange = false,
            resource = GetCurrentResourceName()
        })

        self.actionshapes[#self.actionshapes + 1] = AquiverServerLibrary.Classes.Actionshapes({
            color = { r = 50, g = 155, b = 155, a = 155 },
            range = 2.0,
            sprite = 1,
            x = allData.locations[i].x,
            y = allData.locations[i].y,
            z = allData.locations[i].z,
            variables = {
                shopId = self.shopId
            },
            resource = GetCurrentResourceName()
        })
    end

    for i = 1, #allData.peds do
        self.peds[#self.peds + 1] = AquiverServerLibrary.Classes.Peds({
            x = allData.peds[i].coords.x,
            y = allData.peds[i].coords.y,
            z = allData.peds[i].coords.z,
            heading = allData.peds[i].heading,
            model = allData.peds[i].modelName,
            name = "~y~Shop",
            questionMark = true,
            dimension = 0,
            resource = GetCurrentResourceName()
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
    TriggerClientEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", source, {
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
