GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["my_player"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Mon joueur")

GM.Admin.menu.submenus["my_player"]:isVisible(function(Items)
    Items:Button("TP Waypoint", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            TriggerServerEvent("Admin:teleportWaypoint")
        end
    })
    Items:Button("NoClip", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            ExecuteCommand("noclip")
        end
    })
    Items:Checkbox("Invisible", nil, CHECKED_INVISIBLE, {}, {
        onSelected = function(Checked)
            CHECKED_INVISIBLE = Checked
        end,
        onChecked = function()
            GM.Admin.data["invisible_bool"] = true
            SetEntityVisible(PlayerPedId(), false)
        end,
        onUnChecked = function()
            GM.Admin.data["invisible_bool"] = false
            SetEntityVisible(PlayerPedId(), true)
        end,
    })
    Items:Checkbox("God mode", nil, CHECKED_GOD_MODE, {}, {
        onSelected = function(Checked)
            CHECKED_GOD_MODE = Checked
        end,
        onChecked = function()
            GM.Admin.data["god_mode_bool"] = true
            SetEntityInvincible(PlayerPedId(), true)
        end,
        onUnChecked = function()
            GM.Admin.data["god_mode_bool"] = false
            SetEntityInvincible(PlayerPedId(), false)
        end,
    })
    Items:Checkbox("Munitions illimitées", nil, CHECKED_INFINITE_AMMO, {}, {
        onSelected = function(Checked)
            CHECKED_INFINITE_AMMO = Checked
        end,
        onChecked = function()
            GM.Admin.data["infinite_ammo_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["infinite_ammo_bool"] = false
        end,
    })
    Items:Checkbox("Toutes les armes", nil, CHECKED_ALL_WEAPONS, {}, {
        onSelected = function(Checked)
            CHECKED_ALL_WEAPONS = Checked
        end,
        onChecked = function()
            GM.Admin.data["all_weapons_bool"] = true
            TriggerServerEvent("Admin:giveAllWeapons")
        end,
        onUnChecked = function()
            GM.Admin.data["all_weapons_bool"] = false
            TriggerServerEvent("Admin:removeAllWeapons")
        end,
    })
    Items:Button("Heal", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Revive", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Ped temporaire", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
end)