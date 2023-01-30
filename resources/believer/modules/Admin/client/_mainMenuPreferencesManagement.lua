GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["preferences"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Préférences")

GM.Admin.menu.submenus["preferences"]:isVisible(function(Items)
    local ADMIN_SHOW_GAMERTAGS = GM.Preferences:loadPreferences("admin_show_gamertags")
    Items:Checkbox("Afficher le nom des joueurs", nil, ADMIN_SHOW_GAMERTAGS, {}, {
        onSelected = function(Checked)
            ADMIN_SHOW_GAMERTAGS = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_show_gamertags", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_show_gamertags", false)
            -- Todo event this
        end,
    })
    local ADMIN_SHOW_MYSELF = GM.Preferences:loadPreferences("admin_show_myself")
    Items:Checkbox("Afficher mon nom", nil, ADMIN_SHOW_MYSELF, {}, {
        onSelected = function(Checked)
            ADMIN_SHOW_MYSELF = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_show_myself", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_show_myself", false)
            -- Todo event this
        end,
    })
    local ADMIN_SHOW_BLIPS = GM.Preferences:loadPreferences("admin_show_blips")
    Items:Checkbox("Afficher les blips", nil, ADMIN_SHOW_BLIPS, {}, {
        onSelected = function(Checked)
            ADMIN_SHOW_BLIPS = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_show_blips", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_show_blips", false)
            -- Todo event this
        end,
    })
    local ADMIN_USE_VMENU_NOCLIP = GM.Preferences:loadPreferences("admin_use_vmenu_noclip")
    Items:Checkbox("Utiliser le NoClip 'VMenu'", nil, ADMIN_USE_VMENU_NOCLIP, {}, {
        onSelected = function(Checked)
            ADMIN_USE_VMENU_NOCLIP = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_use_vmenu_noclip", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_use_vmenu_noclip", false)
            -- Todo event this
        end,
    })
    local ADMIN_SHOW_REPORTS = GM.Preferences:loadPreferences("admin_show_reports")
    Items:Checkbox("Afficher le nombre de reports", nil, ADMIN_SHOW_REPORTS, {}, {
        onSelected = function(Checked)
            ADMIN_SHOW_REPORTS = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_show_reports", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_show_reports", false)
            -- Todo event this
        end,
    })
    local ADMIN_SOUND_REPORTS = GM.Preferences:loadPreferences("admin_sound_reports")
    Items:Checkbox("Notification sonore lors d'un report", nil, ADMIN_SOUND_REPORTS, {}, {
        onSelected = function(Checked)
            ADMIN_SOUND_REPORTS = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_sound_reports", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_sound_reports", false)
            -- Todo event this
        end,
    })
    local ADMIN_MASK_LOGS_REPORTS = GM.Preferences:loadPreferences("admin_mask_logs_reports")
    Items:Checkbox("Masquer les logs des reports (chat)", nil, ADMIN_MASK_LOGS_REPORTS, {}, {
        onSelected = function(Checked)
            ADMIN_MASK_LOGS_REPORTS = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_mask_logs_reports", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_mask_logs_reports", false)
            -- Todo event this
        end,
    })
    local ADMIN_MASK_MSG_STAFF = GM.Preferences:loadPreferences("admin_mask_msg_staff")
    Items:Checkbox("Masquer les messages entre modérateurs (chat)", nil, ADMIN_MASK_MSG_STAFF, {}, {
        onSelected = function(Checked)
            ADMIN_MASK_MSG_STAFF = Checked
        end,
        onChecked = function()
            GM.Preferences:Save("admin_mask_msg_staff", true)
            -- Todo event this
        end,
        onUnChecked = function()
            GM.Preferences:Save("admin_mask_msg_staff", false)
            -- Todo event this
        end,
    })
    Items:Checkbox("Afficher toutes les propriétés", nil, ADMIN_SHOW_PROPERTIES, {}, {
        onSelected = function(Checked)
            ADMIN_SHOW_PROPERTIES = Checked
        end,
        onChecked = function()
            -- Todo event this
        end,
        onUnChecked = function()
            -- Todo event this
        end,
    })
end)