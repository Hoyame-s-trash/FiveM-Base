GM.Admin = GM.Admin or {}

GM.Admin = {
    menu = {
        submenus = {}
    },
    data = {
        ranks = {},
        reports = {},
        players = {},
        blips = {},
        blips_list = {},
    },
    inAdmin = false
}

GM.Admin.menu.main = RageUI.CreateMenu("", "Administration", 0, 0, "banner", "bluestark")
GM.Admin.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Admin.menu.submenus["server"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Serveur")

GM.Admin.menu.main:isVisible(function(Items)
    if (GM.Admin.inAdmin == true) then
        GM.Admin.CheckboxActivate = "Désactiver le mode admin"
    else
        GM.Admin.CheckboxActivate = "Activer le mode admin"
    end

    Items:Checkbox(GM.Admin.CheckboxActivate, nil, adminCheckbox, {}, {
        onSelected = function(Checked)
            adminCheckbox = Checked
        end,
        onChecked = function()
            GM.Admin.inAdmin = true
            TriggerServerEvent("Admin:updatePlayerStaff", true)
        end,
        onUnChecked = function()
            GM.Admin.inAdmin = false
            TriggerServerEvent("Admin:updatePlayerStaff", false)
            if (GM.Admin.data["all_weapons_bool"] == true) then
                GM.Admin.data["all_weapons_bool"] = false
                TriggerServerEvent("Admin:removeAllWeapons")
            end
            if (GM.Admin.data["gamertag_bool"] == true) then
                GM.Admin.data["gamertag_bool"] = false
                CHECKED_GAMERTAG = false
                TriggerEvent("Admin:gamerTag", false)
            end
            if (GM.Admin.data["blips_bool"] == true) then
                GM.Admin.data["blips_bool"] = false
                CHECKED_BLIPS = false
                TriggerEvent("Admin:blipsManager", false)
            end
            if (GM.Admin.data["gamertag_myself_bool"] == true) then
                CHECKED_GAMERTAG_MYSELF = false
                GM.Admin.data["gamertag_myself_bool"] = false
            end
        end,
    })
    Items:Button("Joueurs", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["players"])
    Items:Button("Mon joueur", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["my_player"])
    Items:Button("Report", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            TriggerServerEvent("Admin:requestReports")
        end
    }, GM.Admin.menu.submenus["report"])
    Items:Button("Serveur", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["server"])
    Items:Button("Options", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["options"])
end)

GM.Admin.menu.submenus["server"]:isVisible(function(Items)
    Items:Button("Ranks", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Admin:requestRanks")
        end
    }, GM.Admin.menu.submenus["server_ranks"])
end)

RegisterNetEvent("Admin:openMenu", function()
    GM.Admin.menu.main:toggle()
end)

RegisterNetEvent("Admin:updateValue", function(ADMIN_DATA, ADMIN_KEY, ADMIN_VALUE)
    if (not ADMIN_VALUE) then
        GM.Admin.data[ADMIN_DATA] = ADMIN_KEY
    else
        GM.Admin.data[ADMIN_DATA][ADMIN_KEY] = ADMIN_VALUE
    end
end)

RegisterNetEvent("Admin:removeValue", function(ADMIN_DATA, ADMIN_KEY)
    if (not ADMIN_KEY) then
        GM.Admin.data[ADMIN_DATA] = nil
    else
        GM.Admin.data[ADMIN_DATA][ADMIN_KEY] = nil
    end
end)

RegisterNetEvent("Admin:playSound", function(SOUND_NAME)
    if (SOUND_NAME == "new_report") then
        PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
    end
end)