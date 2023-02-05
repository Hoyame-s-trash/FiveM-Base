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

GM.Enterprise.Management.menu.submenus["manage_enterprise"] = RageUI.CreateSubMenu(GM.Enterprise.Management.menu.main, "", "Gérer les entreprises")

GM.Enterprise.Management.menu.main:isVisible(function(Items)
    Items:Button("Créer une entreprise", nil, {}, true, {}, GM.Enterprise.Management.menu.submenus["create_enterprise"])
    Items:Button("Gérer les entreprises", nil, {}, true, {
        onSelected = function()
            TriggerServerEvent("Enterprise:requestEnterprises")
        end,
    }, GM.Enterprise.Management.menu.submenus["manage_enterprise"])
end)

GM.Enterprise.Management.menu.submenus["manage_enterprise"]:isVisible(function(Items)
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
                    TriggerServerEvent("Enterprise:requestEnterprise", enterprise.id)
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
            TriggerServerEvent("Enterprise:createEnterprise", {
                type = GM.Enterprise.Management.data["create_enterprise_type"][GM.Enterprise.Management.data["create_enterprise_index"]]:lower(),
                name = GM.Enterprise.Management.data["create_enterprise_name"],
                label = GM.Enterprise.Management.data["create_enterprise_label"],
            })
        end,
    })
end)

RegisterNetEvent("Enterprise:updateValue", function(ENTERPRISE_DATA, ENTERPRISE_KEY, ENTERPRISE_VALUE)
    if (not ENTERPRISE_VALUE) then
        GM.Enterprise.Management.data[ENTERPRISE_DATA] = ENTERPRISE_KEY
    else
        GM.Enterprise.Management.data[ENTERPRISE_DATA][ENTERPRISE_KEY] = ENTERPRISE_VALUE
    end
end)

RegisterNetEvent("Enterprise:removeValue", function(ENTERPRISE_DATA, ENTERPRISE_KEY)
    if (not ENTERPRISE_KEY) then
        GM.Enterprise.Management.data[ENTERPRISE_DATA] = nil
    else
        GM.Enterprise.Management.data[ENTERPRISE_DATA][ENTERPRISE_KEY] = nil
    end
end)

RegisterNetEvent("Enterprise:createEnterprise", function()
    GM.Enterprise.Management.menu.main:toggle()
end)