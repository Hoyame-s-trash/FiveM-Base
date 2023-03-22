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

RegisterNetEvent("Rent:confirmRent", function()
    GM:newThread(function()
		while true do
			if (GM.Jail.current.time == nil) then break end
			if GM.Jail.current.time ~= 0 then
				GM.Jail.current.time = GM.Jail.current.time - 1
			elseif (GM.Jail.current.time == 0) then
				TriggerServerEvent("Jail:isJailFinish")
			else
				break
			end
			Wait(1000)
		end
	end)
	GM:newThread(function()
		while true do
			if (GM.Jail.current.time == nil) then break end
			if GM.Jail.current.time ~= 0 then
				local currentTime = GM.PlayTime:SecondsToClock(GM.Jail.current.time)
                ESX.ShowDrawNotification("~r~Vous êtes actuellement en prison !\nTemps restant : "..currentTime, 1)
                if (#(GetEntityCoords(GetPlayerPed(-1)) - vector3(1728.492, 2532.91, 43.58)) > 1000) then
                    SetEntityCoords(GetPlayerPed(-1), 1728.492, 2532.91, 43.58, false, false, false, true)
                end
			else
				break
			end
			Wait(0)
		end
	end)
end)