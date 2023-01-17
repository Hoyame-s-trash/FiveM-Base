GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["players"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Joueurs")

GM.Admin.menu.submenus["players_online"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["players"], "", "Joueurs en ligne")

GM.Admin.menu.submenus["players_online_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["players_online"], "", "Joueurs en ligne - Management")

GM.Admin.menu.submenus["players"]:isVisible(function(Items)
    Items:Button("Joueurs en ligne", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            TriggerServerEvent("Admin:requestPlayers")
        end
    }, GM.Admin.menu.submenus["players_online"])
end)

GM.Admin.menu.submenus["players_online"]:isVisible(function(Items)
    for playerSrc, playersValues in pairs(GM.Admin.data["players"]) do
        Items:Button("("..playersValues.id..") - "..playersValues.name, nil, { RightLabel = playersValues.rank}, GM.Admin.inAdmin, {
            onSelected = function()
                GM.Admin.data["selectedPlayer"] = playerValues.id
            end
        }, GM.Admin.menu.submenus["players_online_management"])
    end
end)

GM.Admin.menu.submenus["players_online_management"]:isVisible(function(Items)
    Items:Button("Kick", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            TriggerServerEvent("Admin:kickPlayer", GM.Admin.data["selectedPlayer"])
        end
    })
end)