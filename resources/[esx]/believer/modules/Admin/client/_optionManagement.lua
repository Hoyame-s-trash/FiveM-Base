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
end)