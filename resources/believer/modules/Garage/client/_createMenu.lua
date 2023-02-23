GM.Garage = GM.Garage or {}

GM.Garage = {
    menu = {
        submenus = {}
    },
    data = {
        garage = {},
    },
}

GM.Garage.menu.main = RageUI.CreateMenu("", "Gestion des garages", 0, 0, "banner", "bluestark")
GM.Garage.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Garage.menu.submenus["garage_create"] = RageUI.CreateSubMenu(GM.Garage.menu.main, "", "Garage - Create")
GM.Garage.menu.submenus["garage_management"] = RageUI.CreateSubMenu(GM.Garage.menu.main, "", "Garage - Management")

GM.Garage.menu.main:isVisible(function(Items)
    Items:Button("Créer un garage", nil, {}, true,{}, GM.Garage.menu.submenus["garage_create"])
    Items:Button("Gérer les garages", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Garage:requestGarage")
        end
    }, GM.Garage.menu.submenus["garage_management"])
end)

GM.Garage.menu.submenus["garage_create"]:isVisible(function(Items)

end)


RegisterNetEvent("Garage:updateValue", function(GARAGE_DATA, GARAGE_KEY, GARAGE_VALUE)
    if (not GARAGE_VALUE) then
        GM.Garage.data[GARAGE_DATA] = GARAGE_KEY
    else
        GM.Garage.data[GARAGE_DATA][GARAGE_KEY] = GARAGE_VALUE
    end
end)

RegisterNetEvent("Garage:removeValue", function(GARAGE_DATA, GARAGE_KEY)
    if (not GARAGE_KEY) then
        GM.Garage.data[GARAGE_DATA] = nil
    else
        GM.Garage.data[GARAGE_DATA][GARAGE_KEY] = nil
    end
end)

RegisterNetEvent("Garage:openMenu", function()
    GM.Garage.menu.main:toggle()
end)