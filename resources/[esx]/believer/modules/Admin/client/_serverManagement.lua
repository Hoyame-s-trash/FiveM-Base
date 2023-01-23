GM.Admin = GM.Admin or {}

GM.Admin.data.create_drugs = 1

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

GM.Admin.menu.submenus["server"]:isVisible(function(Items)
    Items:Button("ArenaWars", nil, {}, true, {}, GM.Admin.menu.submenus["server_arenawars"])
    Items:Button("Drogues", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Admin:requestDrugs")
        end
    }, GM.Admin.menu.submenus["server_drugs"])
    Items:Button("Ranks", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Admin:requestRanks")
        end
    }, GM.Admin.menu.submenus["server_ranks"])
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