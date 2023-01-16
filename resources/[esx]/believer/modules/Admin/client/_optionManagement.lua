GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["options"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Options")

GM.Admin.menu.submenus["options"]:isVisible(function(Items)
    Items:Checkbox("Afficher le nom des joueurs", nil, CHECKED_GAMERTAG, {}, {
        onSelected = function(Checked)
            CHECKED_GAMERTAG = Checked
        end,
        onChecked = function()
            GM.Admin.data["gamertag_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["gamertag_bool"] = false
        end,
    })
    Items:Checkbox("Afficher mon nom", nil, CHECKED_GAMERTAG_MYSELF, {}, {
        onSelected = function(Checked)
            CHECKED_GAMERTAG_MYSELF = Checked
        end,
        onChecked = function()
            GM.Admin.data["gamertag_myself_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["gamertag_myself_bool"] = false
        end,
    })
    Items:Checkbox("Afficher le nombre de report", nil, CHECKED_REPORT_COUNT, {}, {
        onSelected = function(Checked)
            CHECKED_REPORT_COUNT = Checked
        end,
        onChecked = function()
            GM.Admin.data["report_count_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["report_count_bool"] = false
        end,
    }
    Items:Checkbox("Notification sonore lors d'un report", nil, CHECKED_REPORT_SOUND, {}, {
        onSelected = function(Checked)
            CHECKED_REPORT_SOUND = Checked
        end,
        onChecked = function()
            GM.Admin.data["report_sound_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["report_sound_bool"] = false
        end,
    }
    Items:Checkbox("Notification actions report chat", nil, CHECKED_REPORT_CHAT, {}, {
        onSelected = function(Checked)
            CHECKED_REPORT_CHAT = Checked
        end,
        onChecked = function()
            GM.Admin.data["report_chat_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["report_chat_bool"] = false
        end,
    }
    Items:Checkbox("Invisible par les admins", nil, CHECKED_INVISIBLE_STAFF, {}, {
        onSelected = function(Checked)
            CHECKED_INVISIBLE_STAFF = Checked
        end,
        onChecked = function()
            GM.Admin.data["invisible_staff_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["invisible_staff_bool"] = false
        end,
    }
end)