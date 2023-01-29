GM.Police = GM.Police or {}

GM.Police = {
    menu = {
        submenus = {}
    },
    data = {
        ranks = {},
    },
}

GM.Police.menu.main = RageUI.CreateMenu("", "Police", 0, 0, "banner", "bluestark")
GM.Police.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Police.menu.submenus["backup"] = RageUI.CreateSubMenu(GM.Police.menu.main, "", "Renforts")

GM.Police.menu.main:isVisible(function(Items)
    Items:Button("Renforts", nil, {}, true, {}, GM.Police.menu.submenus["backup"])
end)

GM.Police.menu.submenus["backup"]:isVisible(function(Items)
    Items:Button("Code 1", nil, {}, true, {
        onSelected = function()
            TriggerServerEvent("Police:sendBackup", 1)
        end
    })
end)

RegisterNetEvent("Police:openMenu", function()
    GM.Police.menu.main:toggle()
end)