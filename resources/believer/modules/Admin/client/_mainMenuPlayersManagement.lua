GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["players"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Liste des joueurs")

GM.Admin.menu.submenus["players_management"] = RageUI.CreateSubMenu(GM.Admin.menu.submenus["players"], "", "Détails du joueur")

GM.Admin.menu.submenus["players"]:isVisible(function(Items)
    -- Todo when pressed keys F open filter menu
    Items:Button("Filtre", nil, {RightLabel = GM.Admin.data["filterValue"] or "Aucun"}, GM.Admin.inAdmin, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Rechercher",
                submitLabel = "CONFIRMER",
                placeHolders = {
                    {label = "ID / UNIQUE ID / NOM / RANK"},
                }
            })
            if (not input["0"]) then return end
            GM.Admin.data["filterValue"] = input["0"]
        end
    })
    for playerSrc, playersValues in pairs(GM.Admin.data["players"]) do
        if (playersValues.invisible == false) then
            if GM.Admin.data["filterValue"] == nil or string.find(playersValues.id, GM.Admin.data["filterValue"]) or string.find(playersValues.name, GM.Admin.data["filterValue"]) or string.find(playersValues.rank, GM.Admin.data["filterValue"]) or string.find(playersValues.uniqueId, GM.Admin.data["filterValue"]) then
                Items:Button(playersValues.name, nil, { RightLabel = playersValues.id}, GM.Admin.inAdmin, {
                    onSelected = function()
                        GM.Admin.data["selectedPlayer"] = playersValues.id
                    end
                }, GM.Admin.menu.submenus["players_management"])
            end
        end
    end
end)

GM.Admin.menu.submenus["players_management"]:isVisible(function(Items)
    Items:Button("Spectate", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            TriggerServerEvent("Admin:spectatePlayer", GM.Admin.data["selectedPlayer"])
        end
    })
    Items:Button("Goto", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            ExecuteCommand("goto "..GM.Admin.data["selectedPlayer"])
        end
    })
    Items:Button("Bring", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            ExecuteCommand("bring "..GM.Admin.data["selectedPlayer"])
        end
    })
    Items:Button("Bring back", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            ExecuteCommand("bringback "..GM.Admin.data["selectedPlayer"])
        end
    })
    Items:Button("Message", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Message",
                submitLabel = "ENVOYER",
                placeHolders = {
                    {label = "Message"},
                }
            })
            if (not input["0"]) then return end
            ExecuteCommand("msg "..GM.Admin.data["selectedPlayer"].." "..input["0"])
        end
    })
    Items:Button("Informations", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Liste des véhicules", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Inventaire", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("~y~Kick", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Kick",
                submitLabel = "KICK",
                placeHolders = {
                    {label = "Raison"},
                }
            })
            if (not input["0"]) then return end
            ExecuteCommand("kick "..GM.Admin.data["selectedPlayer"].." "..input["0"])
        end
    })
    Items:Button("~y~Envoyer dans l'instance trolleurs", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("~y~Retirer de l'instance trolleurs", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("~y~Avertissement", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("~r~Ban", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Ban",
                submitLabel = "CONFIRMER",
                placeHolders = {
                    {label = "Temps (0 pour perm)"},
                    {label = "Raison"},
                }
            })
            if (not input["0"]) then return end
            ExecuteCommand("ban "..GM.Admin.data["selectedPlayer"].." "..tonumber(input["0"]).." "..input["1"])
        end
    })
    Items:Button("Historique des sanctions", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Freeze", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Unfreeze", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Heal", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Revive", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Screenshot", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("~r~Reset identité", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("~r~Wipe", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
    Items:Button("Tuer la personne", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
        end
    })
end)