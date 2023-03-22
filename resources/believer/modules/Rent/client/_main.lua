GM.Rent = GM.Rent or {}

GM.Rent = {
    menu = {
        submenus = {}
    },
    data = {
        currentShop = {},
    },
}

GM.Rent.Config = GM.Rent.Config or {}

GM.Rent.menu.main = RageUI.CreateMenu("", "Location", 0, 0, "banner", "bluestark")
GM.Rent.menu.main["Closed"] = function()
end

GM.Rent.menu.main:isVisible(function(Items)
    for itemId, item in pairs(GM.Rent.data["currentShop"]) do
        if (not item.vip) then
            Items:Button(item.label, item.description, {RightLabel = "~g~"..item.price.."$"}, true, {
                onSelected = function()
                    TriggerServerEvent("Shop:buyItem", GM.Rent.data["currentShopId"], itemId, item.price)
                end
            })
        else
            Items:Button("~b~VIP~s~ "..item.label, item.description, {RightLabel = "~g~"..item.price.."$"}, true, {
                onSelected = function()
                    TriggerServerEvent("Shop:buyItem", GM.Rent.data["currentShopId"], itemId, item.price)
                end
            })
        end
    end
end)

RegisterNetEvent("Rent:openShop", function(shopId, shopData)
    GM.Rent.data["currentShopId"] = shopId
    GM.Rent.data["currentShop"] = shopData
    GM.Rent.menu.main:toggle()
end)