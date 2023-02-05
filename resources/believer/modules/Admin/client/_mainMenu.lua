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
        drugs = {},
        enterprises = {},
    },
    inAdmin = false
}

GM.Admin.menu.main = RageUI.CreateMenu("", "Administration", 0, 0, "banner", "bluestark")
GM.Admin.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

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

    if (GM.Admin.inAdmin == true) then
        Items:Button("Mon joueur", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["my_player"])
        Items:Button("Autour de moi", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["around_me"])
        Items:Button("Véhicules", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["vehicles"])
        Items:Button("Listes des joueurs", nil, {}, GM.Admin.inAdmin, {
            onSelected = function()
                TriggerServerEvent("Admin:requestPlayers")
            end
        }, GM.Admin.menu.submenus["players"])
        Items:Button("Reports", nil, {}, GM.Admin.inAdmin, {
            onSelected = function()
                TriggerServerEvent("Admin:requestReports")
            end
        }, GM.Admin.menu.submenus["report"])
        Items:Button("Préférences", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["preferences"])
        Items:Button("Ouvrir le wiki", nil, {}, GM.Admin.inAdmin, {
            onSelected = function()
                TriggerEvent("Interface:openUrl", "https://trello.com/b/ZUuvDFEy/bluestark-v2")
            end
        })
        --Items:Button("Serveur", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["server"])
        --Items:Button("Options", nil, {}, GM.Admin.inAdmin, {}, GM.Admin.menu.submenus["options"])
    else
        local ADMIN_SHOW_REPORTS = GM.Preferences:loadPreferences("admin_show_reports")
        Items:Checkbox("Afficher le nombre de reports", nil, ADMIN_SHOW_REPORTS, {}, {
            onSelected = function(Checked)
                ADMIN_SHOW_REPORTS = Checked
            end,
            onChecked = function()
                GM.Preferences:Save("admin_show_reports", true)
            end,
            onUnChecked = function()
                GM.Preferences:Save("admin_show_reports", false)
            end,
        })
        local ADMIN_SOUND_REPORTS = GM.Preferences:loadPreferences("admin_sound_reports")
        Items:Checkbox("Notification sonore lors d'un report", nil, ADMIN_SOUND_REPORTS, {}, {
            onSelected = function(Checked)
                ADMIN_SOUND_REPORTS = Checked
            end,
            onChecked = function()
                GM.Preferences:Save("admin_sound_reports", true)
            end,
            onUnChecked = function()
                GM.Preferences:Save("admin_sound_reports", false)
            end,
        })
    end
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
        if (GM.Preferences:loadPreferences("admin_sound_reports")) then
            PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
        end
    end
end)