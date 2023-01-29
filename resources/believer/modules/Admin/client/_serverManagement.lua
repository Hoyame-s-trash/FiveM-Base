GM.Admin = GM.Admin or {}

GM.Admin.data.create_drugs = 1

GM.Admin.data.create_enterprises = 1

GM.Admin.menu.submenus["server"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Serveur")

GM.Admin.menu.submenus["server_ranks"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server"], "", "Ranks")
GM.Admin.menu.submenus["server_ranks_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks"], "", "Ranks management")
GM.Admin.menu.submenus["server_ranks_management_commands"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management"], "", "Ranks management - Commandes")
GM.Admin.menu.submenus["server_ranks_management_permissions"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management"], "", "Ranks management - Permissions")
GM.Admin.menu.submenus["server_ranks_management_players"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management"], "", "Ranks management - Players")
GM.Admin.menu.submenus["server_ranks_management_players_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management_players"], "", "Ranks management - Players - Management")


GM.Admin.menu.submenus["server_drugs"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server"], "", "Drogues")
GM.Admin.menu.submenus["server_drugs_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_drugs"], "", "Drogues management")

GM.Admin.menu.submenus["server_arenawars"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server"], "", "ArenaWars")
GM.Admin.menu.submenus["server_arenawars_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_arenawars"], "", "ArenaWars management")

GM.Admin.menu.submenus["server_mazebankarena"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server"], "", "Maze Bank Arena")

GM.Admin.menu.submenus["server_enterprises"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server"], "", "Entreprises")
GM.Admin.menu.submenus["server_enterprises_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises"], "", "Entreprises management")
GM.Admin.menu.submenus["server_enterprises_management_ranks"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises_management"], "", "Entreprises management - Ranks")
GM.Admin.menu.submenus["server_enterprises_management_ranks_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises_management_ranks"], "", "Entreprises management - Ranks - Management")
GM.Admin.menu.submenus["server_enterprises_management_ranks_management_permissions"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises_management_ranks_management"], "", "Entreprises management - Ranks - Management - Permissions")

GM.Admin.menu.submenus["server_enterprises_management_players"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises_management"], "", "Entreprises management - Players")
GM.Admin.menu.submenus["server_enterprises_management_players_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises_management_players"], "", "Entreprises management - Players - Management")

GM.Admin.menu.submenus["server_enterprises_management_zones"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises_management"], "", "Entreprises management - Zones")
GM.Admin.menu.submenus["server_enterprises_management_zones_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_enterprises_management_zones"], "", "Entreprises management - Zones - Management")

GM.Admin.menu.submenus["server_shop"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server"], "", "Boutique")

GM.Admin.menu.submenus["server"]:isVisible(function(Items)
    Items:Button("ArenaWars", nil, {}, true, {}, GM.Admin.menu.submenus["server_arenawars"])
    Items:Button("MBA", nil, {}, true, {}, GM.Admin.menu.submenus["server_mazebankarena"])
    Items:Button("Boutique", nil, {}, true, {
        onSelected = function()
            TriggerServerEvent("Admin:requestShop")
        end
    }, GM.Admin.menu.submenus["server_shop"])
    Items:Button("Drogues", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Admin:requestDrugs")
        end
    }, GM.Admin.menu.submenus["server_drugs"])
    Items:Button("Entreprises", nil, {}, true, {
        onSelected = function()
            TriggerServerEvent("Admin:requestEnterprises")
        end
    }, GM.Admin.menu.submenus["server_enterprises"])
    Items:Button("Ranks", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Admin:requestRanks")
        end
    }, GM.Admin.menu.submenus["server_ranks"])
end)

GM.Admin.menu.submenus["server_shop"]:isVisible(function(Items)
    Items:Button("Ajouter un véhicule", nil, {}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Ajouter un véhicule",
                submitLabel = "AJOUTER",
                placeHolders = {
                    {label = "TYPE (car/motorcycle)"},
                    {label = "SPAWNNAME"},
                    {label = "MARQUE"},
                    {label = "MODELE"},
                    {label = "CATÉGORIE"},
                    {label = "PRIX"},
                    {label = "TOP SPEED"},
                    {label = "TOP SPEED GRAPH"},
                    {label = "BREAKING POWER"},
                    {label = "ROBUSTNESS"},
                    {label = "IMAGE"}
                }
            })
            TriggerServerEvent("Admin:addVehicleBoutique", input)
        end
    })
end)

GM.Admin.menu.submenus["server_enterprises"]:isVisible(function(Items)
    Items:List("Créer une entreprise", {"NORMAL", "MÉCANO", "BOÎTE DE NUIT", "FARM"}, GM.Admin.data.create_enterprises, nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Admin.data.create_enterprises = Index
            if (GM.Admin.data.create_enterprises == 1) then
                GM.Admin.data["createdEnterprise"] = "normal"
            elseif (GM.Admin.data.create_enterprises == 2) then
                GM.Admin.data["createdEnterprise"] = "custom"
            elseif (GM.Admin.data.create_enterprises == 3) then
                GM.Admin.data["createdEnterprise"] = "nightclub"
            elseif (GM.Admin.data.create_enterprises == 4) then
                GM.Admin.data["createdEnterprise"] = "farm"
            end
        end,
        onSelected = function(index)
            if index == 1 then
                GM.Admin.data["createdEnterprise"] = "normal"
            elseif index == 2 then
                GM.Admin.data["createdDrug"] = "custom"
            elseif index == 3 then
                GM.Admin.data["createdDrug"] = "nightclub"
            elseif index == 4 then
                GM.Admin.data["createdDrug"] = "farm"
            end
            local input = exports["input"]:openInput({
                label = "Créer une entreprise",
                submitLabel = "Créer",
                placeHolders = {
                    {label = "NOM"},
                    {label = "LABEL"},
                }
            })
            TriggerServerEvent("Admin:createEnterprise", GM.Admin.data["createdEnterprise"], input["0"], input["1"])
        end
    })
    for enterpriseId, enterpriseValues in pairs(GM.Admin.data["enterprises"]) do
        Items:Button(enterpriseValues.label, nil, {RightLabel = enterpriseValues.type:upper()}, true, {
            onSelected = function()
                GM.Admin.data["selectedEnterprise"] = enterpriseId
            end
        }, GM.Admin.menu.submenus["server_enterprises_management"])
    end
end)

GM.Admin.menu.submenus["server_enterprises_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil) then
        Items:Button("Grades", nil, {}, true, {}, GM.Admin.menu.submenus["server_enterprises_management_ranks"])
        Items:Button("Joueurs", nil, {}, true, {}, GM.Admin.menu.submenus["server_enterprises_management_players"])
        Items:Button("Zones", nil, {}, true, {}, GM.Admin.menu.submenus["server_enterprises_management_zones"])
        Items:Button("~r~Supprimer l'entreprise", nil, {}, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Supprimer l'entreprise",
                    submitLabel = "Confirmer",
                    placeHolders = {
                        {label = "OUI / NON"},
                    }
                })
                TriggerServerEvent("Admin:deleteEnterprise", GM.Admin.data["selectedEnterprise"], input["0"])
            end
        })
    else
        RageUI.GoBack()
    end
end)

GM.Admin.menu.submenus["server_enterprises_management_zones"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil) then
        for zoneName, zoneValues in pairs(GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]].zones) do
            Items:Button(zoneValues.label, nil, {RightLabel = zoneName}, true, {
                onSelected = function()
                    GM.Admin.data["selectedEnterpriseZone"] = zoneName
                end
            }, GM.Admin.menu.submenus["server_enterprises_management_zones_management"])
        end
    else
        RageUI.GoBack()
    end
end)

GM.Admin.menu.submenus["server_enterprises_management_zones_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil and GM.Admin.data["selectedEnterpriseZone"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]].zones[GM.Admin.data["selectedEnterpriseZone"]] ~= nil) then
        Items:Button("Changer la position", nil, {}, true, {
            onSelected = function()
                TriggerServerEvent("Admin:changeEnterpriseZonePosition", GM.Admin.data["selectedEnterprise"], GM.Admin.data["selectedEnterpriseZone"])
            end
        })
    end
end)

GM.Admin.menu.submenus["server_enterprises_management_players"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil) then
        Items:Button("Recruter un joueur", nil, {}, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Recruter un joueur",
                    submitLabel = "Recruter",
                    placeHolders = {
                        {label = "ID / LICENSE"},
                    }
                })
                TriggerServerEvent("Admin:enterpriseRecruit", GM.Admin.data["selectedEnterprise"], input["0"])
            end
        })
        for playerIdentifier, playerValues in pairs(GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]].players) do
            Items:Button(playerValues.name, "Date d'arrivée : "..playerValues.arrival_date, {RightLabel = "Grade : "..playerValues.rank}, true, {
                onSelected = function()
                    GM.Admin.data["selectedPlayer"] = playerIdentifier
                end
            }, GM.Admin.menu.submenus["server_enterprises_management_players_management"])
        end
    end
end)

GM.Admin.menu.submenus["server_enterprises_management_players_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil and GM.Admin.data["selectedPlayer"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]].players[GM.Admin.data["selectedPlayer"]] ~= nil) then
        Items:Button("~r~Virer", nil, {}, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Virer de l'entreprise",
                    submitLabel = "Virer",
                    placeHolders = {
                        {label = "OUI / NON"},
                    }
                })
                TriggerServerEvent("Admin:enterprisePlayerKick", GM.Admin.data["selectedEnterprise"], GM.Admin.data["selectedPlayer"], input["0"])
            end
        })
    end
end)

GM.Admin.menu.submenus["server_enterprises_management_ranks"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil) then
        Items:Button("Créer un grade", nil, {}, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Créer un grade",
                    submitLabel = "Créer",
                    placeHolders = {
                        {label = "Nom"},
                        {label = "Label"},
                    }
                })
                TriggerServerEvent("Admin:enterpriseCreateRank", GM.Admin.data["selectedEnterprise"], input["0"], input["1"])
            end
        })

        for rankId, rankValues in pairs(GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]]["ranks"]) do
            Items:Button(rankValues.label, rankValues.name, {RightLabel = rankValues.id}, true, {
                onSelected = function()
                    GM.Admin.data["selectedGrade"] = rankId
                end
            }, GM.Admin.menu.submenus["server_enterprises_management_ranks_management"])
        end
    end
end)

GM.Admin.menu.submenus["server_enterprises_management_ranks_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil and GM.Admin.data["selectedGrade"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]].ranks[GM.Admin.data["selectedGrade"]] ~= nil)  then
        Items:Button("Permissions", nil, {}, true, {}, GM.Admin.menu.submenus["server_enterprises_management_ranks_management_permissions"]) 
        Items:Button("~r~Supprimer le grade", nil, {}, true, {
            onSelected = function()
                TriggerServerEvent("Admin:enterpriseDeleteRank", GM.Admin.data["selectedEnterprise"], GM.Admin.data["selectedGrade"])
            end
        })
    end
end)

GM.Admin.menu.submenus["server_enterprises_management_ranks_management_permissions"]:isVisible(function(Items)
    if (GM.Admin.data["selectedEnterprise"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]] ~= nil and GM.Admin.data["selectedGrade"] ~= nil and GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]].ranks[GM.Admin.data["selectedGrade"]] ~= nil)  then
        for permissionName, permissionValues in pairs(GM.Admin.data["enterprises"][GM.Admin.data["selectedEnterprise"]].ranks[GM.Admin.data["selectedGrade"]].permissions) do
            Items:Checkbox(permissionValues.label, permissionValues.description, permissionValues.value, {}, {
                onSelected = function(Checked)
                    permissionValues.value = Checked
                end,
                onChecked = function()
                    TriggerServerEvent("Admin:enterpriseUpdatePermissions", GM.Admin.data["selectedEnterprise"], GM.Admin.data["selectedGrade"], permissionName, true)
                end,
                onUnChecked = function()
                    TriggerServerEvent("Admin:enterpriseUpdatePermissions", GM.Admin.data["selectedEnterprise"], GM.Admin.data["selectedGrade"], permissionName, false)
                end,
            })
        end
    end
end)

GM.Admin.menu.submenus["server_arenawars"]:isVisible(function(Items)
    for categoryId, mappingList in pairs(GM.ArenaWars["list"]) do
        Items:Button(categoryId:lower(), nil, {}, true, {
            onSelected = function()
                GM.Admin.data["selectedArena"] = categoryId
            end
        }, GM.Admin.menu.submenus["server_arenawars_management"])
    end
end)

GM.Admin.menu.submenus["server_mazebankarena"]:isVisible(function(Items)
    for mappingName, _ in pairs(GM.MazeBankArena["list"]) do
        Items:Button(mappingName:upper(), nil, {}, true, {
            onSelected = function()
                TriggerServerEvent("MazeBankArena:modifyArena", mappingName)
            end
        })
    end
end)

GM.Admin.menu.submenus["server_arenawars_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedArena"] ~= nil and GM.ArenaWars["list"][GM.Admin.data["selectedArena"]] ~= nil) then
        for i = 1, #GM.ArenaWars["list"][GM.Admin.data["selectedArena"]], 1 do
            local arenaName = GM.ArenaWars["list"][GM.Admin.data["selectedArena"]][i]
            Items:Button(arenaName:lower(), nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent("ArenaWars:modifyArena", arenaName)
                end
            })
        end
    end
end)

GM.Admin.menu.submenus["server_drugs"]:isVisible(function(Items)
    Items:List("Créer une drogue", {"Récolte", "Traitement"}, GM.Admin.data.create_drugs, nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Admin.data.create_drugs = Index
            if (GM.Admin.data.create_drugs == 1) then
                GM.Admin.data["createdDrug"] = "harvest"
            elseif (GM.Admin.data.create_drugs == 2) then
                GM.Admin.data["createdDrug"] = "treatment"
            end
        end,
        onSelected = function(index)
            if index == 1 then
                GM.Admin.data["createdDrug"] = "harvest"
                local input = exports["input"]:openInput({
                    label = "Créer une drogue",
                    submitLabel = "Créer",
                    placeHolders = {
                        {label = "NOM"},
                        {label = "LABEL"},
                        {label = "QUANTITÉ A DONNÉ"},
                        {label = "ITEM A DONNÉ"},
                    }
                })
                TriggerServerEvent("Admin:createDrugs", GM.Admin.data["createdDrug"], {
                    name = input["0"],
                    label = input["1"],
                    quantityGive = input["2"],
                    itemGive = input["3"],
                })
            elseif index == 2 then
                GM.Admin.data["createdDrug"] = "treatment"
                local input = exports["input"]:openInput({
                    label = "Créer une drogue",
                    submitLabel = "Créer",
                    placeHolders = {
                        {label = "NOM"},
                        {label = "LABEL"},
                        {label = "QUANTITÉ à PRENDRE"},
                        {label = "ITEM à PRENDRE"},
                        {label = "QUANTITé à donnée"},
                        {label = "ITEM à donnée"},
                    }
                })
                TriggerServerEvent("Admin:createDrugs", GM.Admin.data["createdDrug"], {
                    name = input["0"],
                    label = input["1"],
                    quantityTake = input["2"],
                    itemTake = input["3"],
                    quantityGive = input["4"],
                    itemGive = input["5"],
                })
            end
        end
    })
    for drugId,drugValues in pairs(GM.Admin.data["drugs"]) do
        Items:Button(drugValues.label, nil, {}, true, {
            onSelected = function()
                GM.Admin.data["selectedDrug"] = drugId
            end
        }, GM.Admin.menu.submenus["server_drugs_management"])
    end
end)

GM.Admin.menu.submenus["server_drugs_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedDrug"] ~= nil and GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]] ~= nil) then
        Items:Button("~b~"..GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]].label, nil, {}, true, {})
        Items:Button("Changer la position", GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]].position, {}, true, {
            onSelected = function()
                TriggerServerEvent("Admin:drugsModifyPosition", GM.Admin.data["selectedDrug"])
            end
        })
        Items:Button("Changer la quantité reçu", nil, { RightLabel = GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]].data["quantityGive"] }, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Modifier la quantité",
                    submitLabel = "Modifier",
                    placeHolders = {
                        {label = "QUANTITÉ"},
                    }
                })
                TriggerServerEvent("Admin:drugsModifyQuantityGive", GM.Admin.data["selectedDrug"], input["0"])
            end
        })
        Items:Button("Changer l'item donné", nil, { RightLabel = GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]].data["itemGive"] }, true, {
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Modifier l'item",
                    submitLabel = "Modifier",
                    placeHolders = {
                        {label = "ITEM"},
                    }
                })
                TriggerServerEvent("Admin:drugsModifyItemGive", GM.Admin.data["selectedDrug"], input["0"])
            end
        })
        if (GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]].type == "treatment") then
            Items:Button("Changer la quantité pris", nil, { RightLabel = GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]].data["quantityTake"]}, true, {
                onSelected = function()
                    local input = exports["input"]:openInput({
                        label = "Modifier la quantité",
                        submitLabel = "Modifier",
                        placeHolders = {
                            {label = "QUANTITÉ"},
                        }
                    })
                    TriggerServerEvent("Admin:drugsModifyQuantityTake", GM.Admin.data["selectedDrug"], input["0"])
                end
            })
            Items:Button("Changer l'item pris", nil, { RightLabel = GM.Admin.data["drugs"][GM.Admin.data["selectedDrug"]].data["itemTake"] }, true, {
                onSelected = function()
                    local input = exports["input"]:openInput({
                        label = "Modifier l'item",
                        submitLabel = "Modifier",
                        placeHolders = {
                            {label = "ITEM"},
                        }
                    })
                    TriggerServerEvent("Admin:drugsModifyItemTake", GM.Admin.data["selectedDrug"], input["0"])
                end
            })
        end
        Items:Button("~r~Supprimer la drogue", nil, {}, true, {
            onSelected = function()
                TriggerServerEvent("Admin:deleteDrugs", GM.Admin.data["selectedDrug"])
            end
        })
    end
end)

GM.Admin.menu.submenus["server_ranks"]:isVisible(function(Items)
    Items:Button("Créer un rank", nil, {}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Créer un rank",
                submitLabel = "Créer un rank",
                placeHolders = {
                    {label = "NOM"},
                    {label = "LABEL"},
                }
            })
            TriggerServerEvent("Admin:createRank", input["0"], input["1"])
        end
    })
    for rankId,rankValues in pairs(GM.Admin.data["ranks"]) do
        Items:Button(rankValues.label.." - "..rankValues.name, "ID - "..rankValues.id, {}, true,{
            onSelected = function()
                GM.Admin.data["selectedRank"] = rankValues.id
            end
        }, GM.Admin.menu.submenus["server_ranks_management"])
    end
end)

GM.Admin.menu.submenus["server_ranks_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedRank"] ~= nil and GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]] ~= nil) then
        Items:Button("~b~"..GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].name.." - ID : "..GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].id, nil, {}, true,{})
        Items:Button("Gérer les joueurs", nil, {}, (GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].name ~= "user"),{}, GM.Admin.menu.submenus["server_ranks_management_players"])
        Items:Button("Gérer les commandes", nil, {}, true,{}, GM.Admin.menu.submenus["server_ranks_management_commands"])
        Items:Button("Gérer les permissions", nil, {}, true,{}, GM.Admin.menu.submenus["server_ranks_management_permissions"])
        Items:Button("~r~Supprimer le rank", nil, {}, GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].name ~= "user",{
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Supprimer un rank",
                    submitLabel = "SUPPRIMER",
                    placeHolders = {
                        {label = "CONFIRMER OUI / NON"},
                    }
                })
                if (input["0"] == "oui" or input["0"] == "OUI") then
                    TriggerServerEvent("Admin:deleteRank", GM.Admin.data["selectedRank"], input["0"])
                end
            end
        })
    end
end)

GM.Admin.menu.submenus["server_ranks_management_players"]:isVisible(function(Items)
    Items:Button("Recruter un joueur", nil, {}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Recruter un joueur",
                submitLabel = "CONFIRMER",
                placeHolders = {
                    {label = "ID / LICENSE"},
                }
            })
            TriggerServerEvent("Admin:recruitPlayerRank", GM.Admin.data["selectedRank"], input["0"])
        end
    })
    if (GM.Admin.data["selectedRank"] ~= nil and GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]] ~= nil) then
        for playerIdentifier, playerValues in pairs(GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]]["players"]) do
            Items:Button(playerValues.name, "Reports - "..playerValues.reports.."\nDate d'arrivée - "..playerValues.arrival_date, {}, true,{
                onSelected = function()
                    GM.Admin.data["selectedPlayer"] = playerIdentifier
                end
            }, GM.Admin.menu.submenus["server_ranks_management_players_management"])
        end
    end
end)

GM.Admin.menu.submenus["server_ranks_management_commands"]:isVisible(function(Items)
    if (GM.Admin.data["selectedRank"] ~= nil and GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]] ~= nil) then
        for commandName, commandValues in pairs(GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]]["commands"]) do
            Items:Checkbox(commandValues.label, commandValues.description, commandValues.value, {}, {
                onSelected = function(Checked)
                    commandValues.value = Checked
                end,
                onChecked = function()
                    TriggerServerEvent("Admin:updateRankCommands", GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].id, commandName, true)
                end,
                onUnChecked = function()
                    TriggerServerEvent("Admin:updateRankCommands", GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].id, commandName, false)
                end,
            })
        end
    end
end)

GM.Admin.menu.submenus["server_ranks_management_permissions"]:isVisible(function(Items)
    if (GM.Admin.data["selectedRank"] ~= nil and GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]] ~= nil) then
        for permissionName, permissionValues in pairs(GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]]["permissions"]) do
            Items:Checkbox(permissionValues.label, permissionValues.description, permissionValues.value, {}, {
                onSelected = function(Checked)
                    permissionValues.value = Checked
                end,
                onChecked = function()
                    TriggerServerEvent("Admin:updateRankPermissions", GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].id, permissionName, true)
                end,
                onUnChecked = function()
                    TriggerServerEvent("Admin:updateRankPermissions", GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].id, permissionName, false)
                end,
            })
        end
    end
end)

GM.Admin.menu.submenus["server_ranks_management_players_management"]:isVisible(function(Items)
    if (GM.Admin.data["selectedRank"] ~= nil and GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]] ~= nil and GM.Admin.data["selectedPlayer"] ~= nil and GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]]["players"][GM.Admin.data["selectedPlayer"]] ~= nil) then
        Items:Button("~b~"..GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]]["players"][GM.Admin.data["selectedPlayer"]].name, nil, {}, true,{})
        Items:Button("~r~Kick le joueur", nil, {}, true,{
            onSelected = function()
                TriggerServerEvent("Admin:kickPlayerRank", GM.Admin.data["ranks"][GM.Admin.data["selectedRank"]].id, GM.Admin.data["selectedPlayer"])
            end
        })
    end
end)