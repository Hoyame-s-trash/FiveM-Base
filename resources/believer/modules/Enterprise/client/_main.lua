GM.Enterprise = GM.Enterprise or {}

GM.Enterprise.Management = {}

GM.Enterprise.Management = {
    menu = {
        submenus = {}
    },
    data = {
        enterprises = {}
    },
}

GM.Enterprise.Management.menu.main = RageUI.CreateMenu("", "Entreprise", 0, 0, "banner", "bluestark")
GM.Enterprise.Management.menu.main["Closed"] = function()
end

GM.Enterprise.Management.menu.submenus["create_enterprise"] = RageUI.CreateSubMenu(GM.Enterprise.Management.menu.main, "", "Créer une entreprise")

GM.Enterprise.Management.menu.submenus["enterprise"] = RageUI.CreateSubMenu(GM.Enterprise.Management.menu.main, "", "Gérer les entreprises")
GM.Enterprise.Management.menu.submenus["enterprise_management"] = RageUI.CreateSubMenu(GM.Enterprise.Management.menu.submenus["enterprise"], "", "Management de l'entreprise")
GM.Enterprise.Management.menu.submenus["enterprise_management_grades"] = RageUI.CreateSubMenu(GM.Enterprise.Management.menu.submenus["enterprise_management"], "", "Grade de l'entreprise")

GM.Enterprise.Management.menu.submenus["enterprise_management_grades_management"] = RageUI.CreateSubMenu(GM.Enterprise.Management.menu.submenus["enterprise_management_grades"], "", "Grade management")
GM.Enterprise.Management.menu.submenus["enterprise_management_grades_management_permissions"] = RageUI.CreateSubMenu(GM.Enterprise.Management.menu.submenus["enterprise_management_grades_management"], "", "Grade management - permissions")

GM.Enterprise.Management.menu.main:isVisible(function(Items)
    Items:Button("Créer une entreprise", nil, {}, true, {}, GM.Enterprise.Management.menu.submenus["create_enterprise"])
    Items:Button("Gérer les entreprises", nil, {}, true, {
        onSelected = function()
            TriggerServerEvent("EnterpriseManagement:requestEnterprises")
        end,
    }, GM.Enterprise.Management.menu.submenus["enterprise"])
end)

GM.Enterprise.Management.menu.submenus["enterprise"]:isVisible(function(Items)
    if (GM.Enterprise.Management.data["manage_filter_index"] == nil) then
        GM.Enterprise.Management.data["manage_filter_index"] = 1
    end
    if (GM.Enterprise.Management.data["manage_filter_type"] == nil) then
        GM.Enterprise.Management.data["manage_filter_type"] = {"Entreprise", "Mécano"}
    end
    Items:List("Filtrer", GM.Enterprise.Management.data["manage_filter_type"], GM.Enterprise.Management.data["manage_filter_index"], nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Enterprise.Management.data["manage_filter_index"] = Index
        end,
    })
    for _, enterprise in pairs(GM.Enterprise.Management.data["enterprises"]) do
        if (GM.Enterprise.Management.data["manage_filter_type"][GM.Enterprise.Management.data["manage_filter_index"]]:lower() == enterprise.type) then
            Items:Button(enterprise.name, nil, {}, true, {
                onSelected = function()
                    GM.Enterprise.Management.data["currentEnterprise"] = enterprise.id
                end,
            }, GM.Enterprise.Management.menu.submenus["enterprise_management"])
        end
    end
end)

GM.Enterprise.Management.menu.submenus["enterprise_management"]:isVisible(function(Items)
    if (GM.Enterprise.Management.data["currentEnterprise"] ~= nil and GM.Enterprise.Management.data["enterprises"][GM.Enterprise.Management.data["currentEnterprise"]] ~= nil) then
        Items:Button("Grades", nil, {}, true, {}, GM.Enterprise.Management.menu.submenus["enterprise_management_grades"])
        Items:Button("Employés", nil, {}, true, {})
        Items:Button("~r~Supprimer l'entreprise", nil, {}, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Supprimer l'entreprise",
                    submitLabel = "Confirmer",
                    placeHolders = {
                        {label = "OUI / NON"},
                    }
                })
                
                if (input["0"] == nil or input["0"] == "nil") then
                    ESX.ShowNotification("~r~La réponse n'est pas valide.")
                    return 
                end

                TriggerServerEvent("EnterpriseManagement:deleteEnterprise", GM.Enterprise.Management.data["currentEnterprise"], input["0"])
            end
        })
    end
end)

GM.Enterprise.Management.menu.submenus["enterprise_management_grades"]:isVisible(function(Items)
    Items:Button("Créer un grade", nil, {} , true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Créer un grade",
                submitLabel = "Confirmer",
                placeHolders = {
                    {label = "Nom"},
                    {label = "Label"}
                }
            })
            
            if (input["0"] == nil or input["0"] == "nil") then
                ESX.ShowNotification("~r~Le nom du grade n'est pas valide.")
                return 
            end

            if (input["1"] == nil or input["1"] == "nil") then
                ESX.ShowNotification("~r~Le label du grade n'est pas valide.")
                return 
            end

            TriggerServerEvent("EnterpriseManagement:createGrade", GM.Enterprise.Management.data["currentEnterprise"], input["0"], input["1"])
        end
    })
    if (GM.Enterprise.Management.data["currentEnterprise"] ~= nil and GM.Enterprise.Management.data["enterprises"][GM.Enterprise.Management.data["currentEnterprise"]] ~= nil) then
        for _, grade in pairs(GM.Enterprise.Management.data["enterprises"][GM.Enterprise.Management.data["currentEnterprise"]].grades) do
            Items:Button(grade.label.." - "..grade.name, nil, {}, true, {
                onSelected = function()
                    GM.Enterprise.Management.data["currentGrade"] = grade.id
                end,
            }, GM.Enterprise.Management.menu.submenus["enterprise_management_grades_management"])
        end
    end
end)

GM.Enterprise.Management.menu.submenus["enterprise_management_grades_management"]:isVisible(function(Items)
    if (GM.Enterprise.Management.data["currentGrade"] ~= nil and GM.Enterprise.Management.data["enterprises"][GM.Enterprise.Management.data["currentEnterprise"]] ~= nil and GM.Enterprise.Management.data["enterprises"][GM.Enterprise.Management.data["currentEnterprise"]].grades[GM.Enterprise.Management.data["currentGrade"]] ~= nil) then
        Items:Button("Permissions", nil, {}, true, {}, GM.Enterprise.Management.menu.submenus["enterprise_management_grades_management_permissions"]) 
        Items:Button("~r~Supprimer le grade", nil, {}, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Supprimer le grade",
                    submitLabel = "Confirmer",
                    placeHolders = {
                        {label = "OUI / NON"},
                    }
                })
                
                if (input["0"] == nil or input["0"] == "nil") then
                    ESX.ShowNotification("~r~La réponse n'est pas valide.")
                    return 
                end

                TriggerServerEvent("EnterpriseManagement:deleteGrade", GM.Enterprise.Management.data["currentEnterprise"], GM.Enterprise.Management.data["currentGrade"], input["0"])
            end
        })
    else
        RageUI.GoBack()
    end
end)

GM.Enterprise.Management.menu.submenus["enterprise_management_grades_management_permissions"]:isVisible(function(Items)
    if (GM.Enterprise.Management.data["currentGrade"] ~= nil and GM.Enterprise.Management.data["enterprises"][GM.Enterprise.Management.data["currentEnterprise"]] ~= nil) then
        for permissionName, permissionValues in pairs(GM.Enterprise.Management.data["enterprises"][GM.Enterprise.Management.data["currentEnterprise"]].grades[GM.Enterprise.Management.data["currentGrade"]].permissions) do
            Items:Checkbox(permissionValues.label, permissionValues.description, permissionValues.value, {}, {
                onSelected = function(Checked)
                    permissionValues.value = Checked
                end,
                onChecked = function()
                    TriggerServerEvent("EntrepriseManagement:updatePermissions", GM.Enterprise.Management.data["currentEnterprise"], GM.Enterprise.Management.data["currentGrade"], permissionName, true)
                end,
                onUnChecked = function()
                    TriggerServerEvent("EntrepriseManagement:updatePermissions", GM.Enterprise.Management.data["currentEnterprise"], GM.Enterprise.Management.data["currentGrade"], permissionName, false)
                end,
            })
        end
    end
end)

GM.Enterprise.Management.menu.submenus["create_enterprise"]:isVisible(function(Items)
    if (GM.Enterprise.Management.data["create_enterprise_index"] == nil) then
        GM.Enterprise.Management.data["create_enterprise_index"] = 1
    end
    if (GM.Enterprise.Management.data["create_enterprise_type"] == nil) then
        GM.Enterprise.Management.data["create_enterprise_type"] = {"Entreprise", "Mécano"}
    end
    Items:List("Type d'entreprise", GM.Enterprise.Management.data["create_enterprise_type"], GM.Enterprise.Management.data["create_enterprise_index"], nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Enterprise.Management.data["create_enterprise_index"] = Index
        end,
    })
    Items:Button("Nom de l'entreprise", nil, {RightLabel = GM.Enterprise.Management.data["create_enterprise_name"]}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Nom de l'entreprise",
                submitLabel = "VALIDER",
                placeHolders = {
                    {label = "Nom"},
                }
            })

            if (input["0"] == nil or input["0"] == "nil") then
                ESX.ShowNotification("~r~Le nom n'est pas valide.")
                return 
            end

            GM.Enterprise.Management.data["create_enterprise_name"] = input["0"]
        end,
    })
    Items:Button("Label de l'entreprise", nil, {RightLabel = GM.Enterprise.Management.data["create_enterprise_label"]}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Label de l'entreprise",
                submitLabel = "VALIDER",
                placeHolders = {
                    {label = "Label"},
                }
            })

            if (input["0"] == nil or input["0"] == "nil") then
                ESX.ShowNotification("~r~Le label n'est pas valide.")
                return 
            end

            GM.Enterprise.Management.data["create_enterprise_label"] = input["0"]
        end,
    })
    Items:Button("Créer l'entreprise", nil, {}, true, {
        onSelected = function()
            TriggerServerEvent("EnterpriseManagement:createEnterprise", {
                type = GM.Enterprise.Management.data["create_enterprise_type"][GM.Enterprise.Management.data["create_enterprise_index"]]:lower(),
                name = GM.Enterprise.Management.data["create_enterprise_name"],
                label = GM.Enterprise.Management.data["create_enterprise_label"],
            })
        end,
    })
end)

RegisterNetEvent("EnterpriseManagement:updateValue", function(ENTERPRISE_DATA, ENTERPRISE_KEY, ENTERPRISE_VALUE)
    if (not ENTERPRISE_VALUE) then
        GM.Enterprise.Management.data[ENTERPRISE_DATA] = ENTERPRISE_KEY
    else
        GM.Enterprise.Management.data[ENTERPRISE_DATA][ENTERPRISE_KEY] = ENTERPRISE_VALUE
    end
end)

RegisterNetEvent("EnterpriseManagement:removeValue", function(ENTERPRISE_DATA, ENTERPRISE_KEY)
    if (not ENTERPRISE_KEY) then
        GM.Enterprise.Management.data[ENTERPRISE_DATA] = nil
    else
        GM.Enterprise.Management.data[ENTERPRISE_DATA][ENTERPRISE_KEY] = nil
    end
end)

RegisterNetEvent("EnterpriseManagement:openMenu", function()
    GM.Enterprise.Management.menu.main:toggle()
end)