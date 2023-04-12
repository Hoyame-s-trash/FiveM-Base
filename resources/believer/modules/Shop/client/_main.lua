GM.Shops = GM.Shops or {}

GM.Shops = {
    menu = {
        submenus = {}
    },
    data = {
        currentShop = {},
    },
}

GM.Shops.Config = GM.Shops.Config or {}

GM.Shops.menu.main = RageUI.CreateMenu("", "Superettes", 0, 0, "banner", "bluestark")
GM.Shops.menu.main["Closed"] = function()
end

GM.Shops.menu.main:isVisible(function(Items)
    for itemId, item in pairs(GM.Shops.data["currentShop"]) do
        if (not item.vip) then
            Items:Button(item.label, item.description, {RightLabel = "~g~"..item.price.."$"}, true, {
                onSelected = function()
                    TriggerServerEvent("Shop:buyItem", GM.Shops.data["currentShopId"], itemId, item.price)
                end
            })
        else
            Items:Button("~b~VIP~s~ "..item.label, item.description, {RightLabel = "~g~"..item.price.."$"}, true, {
                onSelected = function()
                    TriggerServerEvent("Shop:buyItem", GM.Shops.data["currentShopId"], itemId, item.price)
                end
            })
        end
    end
end)

RegisterNetEvent("Shops:openShop", function(shopId, shopData)
    GM.Shops.data["currentShopId"] = shopId
    GM.Shops.data["currentShop"] = shopData
    GM.Shops.menu.main:toggle()
end)