GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["server_ranks"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server"], "", "Ranks")
GM.Admin.menu.submenus["server_ranks_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks"], "", "Ranks management")
GM.Admin.menu.submenus["server_ranks_management_commands"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management"], "", "Ranks management - Commandes")
GM.Admin.menu.submenus["server_ranks_management_permissions"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management"], "", "Ranks management - Permissions")
GM.Admin.menu.submenus["server_ranks_management_players"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management"], "", "Ranks management - Players")
GM.Admin.menu.submenus["server_ranks_management_players_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["server_ranks_management_players"], "", "Ranks management - Players - Management")

GM.Admin.menu.submenus["server_ranks"]:isVisible(function(Items)
    Items:Button("Créer un rank", nil, {}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Créer un rank",
                submitLabel = "Créer un rank",
                placeHolders = {
                    {label = "NOM"},
                }
            })
            TriggerServerEvent("Admin:createRank", input["0"])
        end
    })
    for rankId,rankValues in pairs(GM.Admin.data["ranks"]) do
        Items:Button(rankValues.name, "ID - "..rankValues.id, {}, true,{
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