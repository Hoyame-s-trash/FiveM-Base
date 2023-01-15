GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["report"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Report")
GM.Admin.menu.submenus["report_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["report"], "", "Report management")

GM.Admin.menu.submenus["report"]:isVisible(function(Items)
    Items:Checkbox("Afficher seulement les reports non pris en charge", nil, CHECKED_REPORT, {}, {
        onSelected = function(Checked)
            CHECKED_REPORT = Checked
        end,
        onChecked = function()
            GM.Admin.data["reports_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["reports_bool"] = false
        end,
    })
    if (json.encode(GM.Admin.data["reports"]) == "[]") then
        Items:Button("Aucun report (vide)", nil, {}, true,{})
    end
    
    for reportId, reportValues in pairs(GM.Admin.data["reports"]) do
        if (reportValues.taken == false) then
            reportValues.taken_label = "en attente"
            reportValues.taken_name = "personne"
            Items:Button("("..reportValues.id..") - "..reportValues.name.." - "..reportValues.taken_label, "Raison : "..reportValues.reason.."\nPris par : "..reportValues.taken_name, {RightLabel = reportValues.creation_date}, true,{
                onSelected = function()
                    GM.Admin.data["selectedReport"] = reportId
                end
            }, GM.Admin.menu.submenus["report_management"])
        else
            reportValues.taken_label = "pris en charge"
            if (not GM.Admin.data["reports_bool"]) then
                Items:Button("("..reportValues.id..") - "..reportValues.name.." - "..reportValues.taken_label, "Raison : "..reportValues.reason.."\nPris par : "..reportValues.taken_name, {RightLabel = reportValues.creation_date}, true,{
                    onSelected = function()
                        GM.Admin.data["selectedReport"] = reportId
                    end
                }, GM.Admin.menu.submenus["report_management"])
            end
        end
    end
end)

GM.Admin.menu.submenus["report_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedReport"] ~= nil and GM.Admin.data["reports"][GM.Admin.data["selectedReport"]] ~= nil) then
        Items:Button("Prendre en charge", nil, {}, not GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].taken,{
            onSelected = function()
                TriggerServerEvent("Admin:takeReport", GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].id)
            end
        })
        Items:Button("Clôturer le report", nil, {}, GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].taken,{
            onSelected = function()
                TriggerServerEvent("Admin:closeReport", GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].id)
                RageUI.GoBack()
            end
        })
        Items:Info("Report information", {
            "ID :","Nom :", "Raison :",'Date :', 'Pris par :'
        },{
            GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].id,
            GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].name,
            GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].reason,
            GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].creation_date,
            GM.Admin.data["reports"][GM.Admin.data["selectedReport"]].taken_name
        })
    end
end)