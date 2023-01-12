ESX.Connexion = ESX.Connexion or {}

ESX.Connexion["Identifiers"] = ESX.Connexion["Identifiers"] or {}

ESX.Connexion["Identifiers"].List = {}
ESX.Connexion["Identifiers"].List["users"] = {}
ESX.Connexion["Identifiers"].List["identifiers"] = {}

CreateThread(function()
    MySQL.query("SELECT * FROM user_identifiers", {
    }, function(results)
        for i = 1, #results do
            local selectedResult = results[i]
            
            selectedResult.data = json.decode(selectedResult.data)

            if (not ESX.Connexion["Identifiers"].List["users"][selectedResult.owner]) then
                ESX.Connexion["Identifiers"].List["users"][selectedResult.owner] = {
                    identifier = selectedResult.owner,
                    isBanned = json.decode(selectedResult.currentBan),
                    identifiers = {}
                }
            end

            for i = 1, #selectedResult.data do
                local currentIdentifier = selectedResult.data[i]
                ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier] = {
                    owner = selectedResult.owner
                }
                ESX.Connexion["Identifiers"].List["users"][selectedResult.owner].identifiers[currentIdentifier] = true
            end
        end
    end)
end)

function ESX.Connexion:getIdentifiers(playerSrc)
    if (playerSrc == nil) then return end

    local playerNumIdentifiers = GetNumPlayerIdentifiers(playerSrc)
    local playerIdentifiers = {}

    for identifierIndex = 0, playerNumIdentifiers do
        if (identifierIndex ~= nil) then
            table.insert(playerIdentifiers, GetPlayerIdentifier(playerSrc, identifierIndex))
        end
    end

    return playerIdentifiers
end

function ESX.Connexion:getIdentifier(playerSrc, nameToSearch)
    if (playerSrc == nil) then return end

    local playerIdentifiers = self:getIdentifiers(playerSrc)

    if (nameToSearch == "main" or nameToSearch == nil) then
        nameToSearch = Config.Identifier
    end

    for _, identifier in pairs(playerIdentifiers) do
        if (string.find(identifier, nameToSearch..":")) then
            return identifier
        end
    end
end

function ESX.Connexion:getTokens(playerSrc)
    if (playerSrc == nil) then return end

    local playerNumTokens = GetNumPlayerTokens(playerSrc)
    local playerTokens = {}

    for tokenIndex = 0, playerNumTokens do
        if (tokenIndex ~= nil) then
            table.insert(playerTokens, GetPlayerToken(playerSrc, tokenIndex))
        end
    end

    return playerTokens
end

function ESX.Connexion:ban(playerIdentifier, banData)
    if (not banData or not banData.reason or not banData.expiration or type(banData.expiration) ~= "number") then
        return
    end
    
    local playerSelected = ESX.GetPlayerFromIdentifier(playerIdentifier)

    local currentBan = {
        reason = banData.reason,
        expiration = banData.expiration,
        author = banData.author,
        type = banData.type or "normal"
    }

    if (ESX.Connexion["Identifiers"].List["users"][playerIdentifier] ~= nil) then
        MySQL.update("UPDATE user_identifiers set currentBan = ? WHERE owner = ?", {
            json.encode(currentBan),
            playerIdentifier
        }, function()
            ESX.Connexion["Identifiers"].List["users"][playerIdentifier].isBanned = currentBan
            if (playerSelected ~= nil) then
                DropPlayer(playerSelected.source, "Vous êtes banni de BlueStark !\nRaison : "..banData.reason..".")
            end
        end)
    end
end

function ESX.Connexion:unban(author, playerIdentifier)
    if (ESX.Connexion["Identifiers"].List["users"][playerIdentifier].isBanned == nil) then
        -- Todo mettre un vrai print ici
        return
    end

    -- Todo check if player got banned by anticheat system later

    if (author == 0) then
        author = "Console"
    else
        author = GetPlayerName(author)
    end

    if (ESX.Connexion["Identifiers"].List["users"][playerIdentifier] ~= nil) then
        MySQL.update("UPDATE user_identifiers set currentBan = ? WHERE owner = ?", {
            nil,
            playerIdentifier
        }, function()
            ESX.Connexion["Identifiers"].List["users"][playerIdentifier].isBanned = nil
        end)
    end
end

AddEventHandler("playerConnecting", function(_, _, deferrals)
    local playerSrc = source
    if (not playerSrc) then return end

    deferrals.defer()
    Wait(0)

    local playerIdentifier = ESX.Connexion:getIdentifier(playerSrc, "main")
    if (playerIdentifier == nil) then
        deferrals.done("Votre identifiant qui permet de vous enregistrer n'est pas valide.")
        CancelEvent()
        return
    end
    
    if (ESX.Whitelist.Enable == true) then
        if (ESX.Whitelist.List[playerIdentifier] == nil) then
            local WHITELIST_CARD = {
                type = "AdaptiveCard",
                ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                version = "1.5",
                body = {
                    {
                        type = "Container",
                        items = {
                            {
                                type = "ColumnSet",
                                columns = {
                                    {
                                        type = "Column",
                                        width = "auto",
                                        items = {
                                            {
                                                type = "Image",
                                                url = "https://media.discordapp.net/attachments/1028726669554499644/1060615573656055858/STATIC.png?width=671&height=671",
                                                spacing = "None",
                                                size = "Small",
                                                style = "Person"
                                            }
                                        },
                                        spacing = "None"
                                    },
                                    {
                                        type = "Column",
                                        width = "stretch",
                                        items = {
                                            {
                                                type = "TextBlock",
                                                text = "BlueStark",
                                                wrap = true,
                                                spacing = "None",
                                                horizontalAlignment = "Left"
                                            },
                                            {
                                                type = "TextBlock",
                                                text = "discord.gg/bluestark",
                                                spacing = "None",
                                                wrap = true,
                                                isSubtle = true
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        spacing = "None",
                        horizontalAlignment = "Left",
                        verticalContentAlignment = "Top"
                    },
                    {
                        type = "Container",
                        items = {
                            {
                                type = "TextBlock",
                                wrap = true,
                                text = "La whitelist est activée sur le serveur, vous devez être whitelist pour pouvoir jouer.",
                            }
                        }
                    },
                }
            }

            deferrals.presentCard(WHITELIST_CARD)
            return
            CancelEvent()
        end
    end 

    if (ESX.Maintenance.Enable == true) then
        -- Todo check with admin system if player is admin
        --if (ESX.Whitelist.List[playerIdentifier] == nil) then
            local MAINTENANCE_CARD = {
                type = "AdaptiveCard",
                ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                version = "1.5",
                body = {
                    {
                        type = "Container",
                        items = {
                            {
                                type = "ColumnSet",
                                columns = {
                                    {
                                        type = "Column",
                                        width = "auto",
                                        items = {
                                            {
                                                type = "Image",
                                                url = "https://media.discordapp.net/attachments/1028726669554499644/1060615573656055858/STATIC.png?width=671&height=671",
                                                spacing = "None",
                                                size = "Small",
                                                style = "Person"
                                            }
                                        },
                                        spacing = "None"
                                    },
                                    {
                                        type = "Column",
                                        width = "stretch",
                                        items = {
                                            {
                                                type = "TextBlock",
                                                text = "BlueStark",
                                                wrap = true,
                                                spacing = "None",
                                                horizontalAlignment = "Left"
                                            },
                                            {
                                                type = "TextBlock",
                                                text = "discord.gg/bluestark",
                                                spacing = "None",
                                                wrap = true,
                                                isSubtle = true
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        spacing = "None",
                        horizontalAlignment = "Left",
                        verticalContentAlignment = "Top"
                    },
                    {
                        type = "Container",
                        items = {
                            {
                                type = "TextBlock",
                                wrap = true,
                                text = "Le serveur est en maintenance, vous ne pouvez pas vous connecter.",
                            }
                        }
                    },
                }
            }

            deferrals.presentCard(MAINTENANCE_CARD)
            return
            CancelEvent()
        --end
    end

    local playerIdentifiers = ESX.Connexion:getIdentifiers(playerSrc)
    local playerTokens = ESX.Connexion:getTokens(playerSrc)

    if (ESX.Connexion["Identifiers"].List["users"][playerIdentifier] == nil) then
        MySQL.insert("INSERT INTO user_identifiers (owner, currentBan, data) VALUES (?, ?, ?)", {
            playerIdentifier,
            nil,
            json.encode({})
        }, function()
            ESX.Connexion["Identifiers"].List["users"][playerIdentifier] = {
                identifier = playerIdentifier,
                isBanned = nil,
                identifiers = {}
            }
        end)
    end

    for i = 1, #playerIdentifiers do
        local currentIdentifier = playerIdentifiers[i]
        if (currentIdentifier ~= nil and ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier] ~= nil) then
            local ownerData = ESX.Connexion["Identifiers"].List["users"][ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier].owner]
            if ((ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier].owner ~= playerIdentifier) or (ownerData.isConnected == true)) then
                deferrals.done("Désolé, un de vos identifiants est déjà utilisé par une autre personne.")
                return
                CancelEvent()
            elseif (ownerData.isBanned ~= nil) then
                local expiration
                if (ownerData.isBanned["expiration"] ~= nil and ownerData.isBanned["expiration"] ~= -1) then
                    if (os.time() >= (ownerData.isBanned["expiration"]/1000)) then
                        expiration = "passed"
                    else
                        expiration = os.date('%d-%m-%Y - %H:%M:%S', (ownerData.isBanned["expiration"]/1000))
                    end
                end
                
                if (expiration ~= "passed") then
                    local BAN_CARD = {
                        type = "AdaptiveCard",
                        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                        version = "1.5",
                        body = {
                            {
                                type = "Container",
                                items = {
                                    {
                                        type = "ColumnSet",
                                        columns = {
                                            {
                                                type = "Column",
                                                width = "auto",
                                                items = {
                                                    {
                                                        type = "Image",
                                                        url = "https://media.discordapp.net/attachments/1028726669554499644/1028726694577701004/bluestark_sans_fond.png",
                                                        spacing = "None",
                                                        size = "Small",
                                                        style = "Person"
                                                    }
                                                },
                                                spacing = "None"
                                            },
                                            {
                                                type = "Column",
                                                width = "stretch",
                                                items = {
                                                    {
                                                        type = "TextBlock",
                                                        text = "BlueStark",
                                                        wrap = true,
                                                        spacing = "None",
                                                        horizontalAlignment = "Left"
                                                    },
                                                    {
                                                        type = "TextBlock",
                                                        text = "discord.gg/bluestark",
                                                        spacing = "None",
                                                        wrap = true,
                                                        isSubtle = true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                },
                                spacing = "None",
                                horizontalAlignment = "Left",
                                verticalContentAlignment = "Top"
                            },
                            {
                                type = "Container",
                                items = {
                                    {
                                        type = "TextBlock",
                                        wrap = true,
                                        text = "Vous êtes banni de ce serveur."
                                    }
                                }
                            },
                            {
                                type = "ColumnSet",
                                columns = {
                                    {
                                        type = "Column",
                                        width = "stretch",
                                        items = {
                                            {
                                                type = "ActionSet",
                                                actions = {
                                                    {
                                                        type = "Action.ShowCard",
                                                        card = {
                                                            type = "AdaptiveCard",
                                                            ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                                                            version = "1.5",
                                                            body = {
                                                                {
                                                                    type = "TextBlock",
                                                                    wrap = true,
                                                                    text = "**Identifiant** : "..(ownerData["identifier"] or "Non trouvable"),
                                                                    spacing = "None"
                                                                },
                                                                {
                                                                    type = "TextBlock",
                                                                    text = "**Raison** : "..(ownerData.isBanned["reason"] or "Aucune raison à été fourni."),
                                                                    wrap = true,
                                                                    spacing = "None"
                                                                },
                                                                {
                                                                    type = "TextBlock",
                                                                    text = "**Auteur** : "..(ownerData.isBanned["author"] or "Aucun auteur à été fourni."),
                                                                    wrap = true,
                                                                    spacing = "None"
                                                                },
                                                                {
                                                                    type = "TextBlock",
                                                                    wrap = true,
                                                                    text = "**Date d'expiration** : "..(expiration or "Permanent"),
                                                                    spacing = "None"
                                                                },
                                                                {
                                                                    type = "TextBlock",
                                                                    wrap = true,
                                                                    text = "Si vous n'êtes pas d'accord avec votre bannissement veuillez ouvrir un ticket sur notre discord.",
                                                                    color = "warning",
                                                                    isMultiline = true
                                                                }
                                                            }
                                                        },
                                                        title = "Afficher votre bannisement"
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    {
                                        type = "Column",
                                        width = "stretch",
                                        items = {
                                            {
                                                type = "ActionSet",
                                                actions = {
                                                    {
                                                        type = "Action.OpenUrl",
                                                        title = "Rejoindre notre discord",
                                                        url = "https://discord.gg/bluestark"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    deferrals.presentCard(BAN_CARD)
                    return
                    CancelEvent()
                else
                    MySQL.update("UPDATE user_identifiers SET currentBan = ? WHERE owner = ?", {
                        nil,
                        ownerData.identifier
                    }, function()
                        ESX.Connexion["Identifiers"].List["users"][ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier].owner].isBanned = nil
                    end)
                end
            end
        else
            while (not ESX.Connexion["Identifiers"].List["users"][playerIdentifier]) do
                Wait(150)
            end

            ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier] = {
                owner = playerIdentifier
            }
            ESX.Connexion["Identifiers"].List["users"][playerIdentifier].identifiers[currentIdentifier] = true
            
            local newIdentifiers = {}

            for currentIdentifier, _ in pairs(ESX.Connexion["Identifiers"].List["users"][playerIdentifier].identifiers) do
                table.insert(newIdentifiers, currentIdentifier)
            end

            MySQL.update("UPDATE user_identifiers SET data = ? WHERE owner = ?", {
                json.encode(newIdentifiers),
                playerIdentifier
            })        
        end
    end

    for i = 1, #playerTokens do
        local currentIdentifier = playerIdentifiers[i]
        if (currentIdentifier ~= nil and ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier] ~= nil) then
            local ownerData = ESX.Connexion["Identifiers"].List["users"][ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier].owner]
            if ((ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier].owner ~= playerIdentifier) or (ownerData.isConnected == true)) then
                deferrals.done("Désolé, un de vos identifiants est déjà utilisé par une autre personne.")
                return
                CancelEvent()
            elseif (ownerData.isBanned ~= nil) then
                local expiration
                if (ownerData.isBanned["expiration"] ~= nil and ownerData.isBanned["expiration"] ~= -1) then
                    if (os.time() >= (ownerData.isBanned["expiration"]/1000)) then
                        expiration = "passed"
                    else
                        expiration = os.date('%d-%m-%Y - %H:%M:%S', (ownerData.isBanned["expiration"]/1000))
                    end
                end
                
                if (expiration ~= "passed") then
                    local BAN_CARD = {
                        type = "AdaptiveCard",
                        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                        version = "1.5",
                        body = {
                            {
                                type = "Container",
                                items = {
                                    {
                                        type = "ColumnSet",
                                        columns = {
                                            {
                                                type = "Column",
                                                width = "auto",
                                                items = {
                                                    {
                                                        type = "Image",
                                                        url = "https://media.discordapp.net/attachments/1028726669554499644/1028726694577701004/bluestark_sans_fond.png",
                                                        spacing = "None",
                                                        size = "Small",
                                                        style = "Person"
                                                    }
                                                },
                                                spacing = "None"
                                            },
                                            {
                                                type = "Column",
                                                width = "stretch",
                                                items = {
                                                    {
                                                        type = "TextBlock",
                                                        text = "BlueStark",
                                                        wrap = true,
                                                        spacing = "None",
                                                        horizontalAlignment = "Left"
                                                    },
                                                    {
                                                        type = "TextBlock",
                                                        text = "discord.gg/bluestark",
                                                        spacing = "None",
                                                        wrap = true,
                                                        isSubtle = true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                },
                                spacing = "None",
                                horizontalAlignment = "Left",
                                verticalContentAlignment = "Top"
                            },
                            {
                                type = "Container",
                                items = {
                                    {
                                        type = "TextBlock",
                                        wrap = true,
                                        text = "Vous êtes banni de ce serveur."
                                    }
                                }
                            },
                            {
                                type = "ColumnSet",
                                columns = {
                                    {
                                        type = "Column",
                                        width = "stretch",
                                        items = {
                                            {
                                                type = "ActionSet",
                                                actions = {
                                                    {
                                                        type = "Action.ShowCard",
                                                        card = {
                                                            type = "AdaptiveCard",
                                                            ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                                                            version = "1.5",
                                                            body = {
                                                                {
                                                                    type = "TextBlock",
                                                                    wrap = true,
                                                                    text = "**Identifiant** : "..(ownerData["identifier"] or "Non trouvable"),
                                                                    spacing = "None"
                                                                },
                                                                {
                                                                    type = "TextBlock",
                                                                    text = "**Raison** : "..(ownerData.isBanned["reason"] or "Aucune raison à été fourni."),
                                                                    wrap = true,
                                                                    spacing = "None"
                                                                },
                                                                {
                                                                    type = "TextBlock",
                                                                    wrap = true,
                                                                    text = "**Date d'expiration** : "..(expiration or "Permanent"),
                                                                    spacing = "None"
                                                                },
                                                                {
                                                                    type = "TextBlock",
                                                                    wrap = true,
                                                                    text = "Si vous n'êtes pas d'accord avec votre bannissement veuillez ouvrir un ticket sur notre discord.",
                                                                    color = "warning",
                                                                    isMultiline = true
                                                                }
                                                            }
                                                        },
                                                        title = "Afficher votre bannisement"
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    {
                                        type = "Column",
                                        width = "stretch",
                                        items = {
                                            {
                                                type = "ActionSet",
                                                actions = {
                                                    {
                                                        type = "Action.OpenUrl",
                                                        title = "Rejoindre notre discord",
                                                        url = "https://discord.gg/bluestark"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    deferrals.presentCard(BAN_CARD)
                    return
                    CancelEvent()
                else
                    MySQL.update("UPDATE user_identifiers SET currentBan = ? WHERE owner = ?", {
                        nil,
                        ownerData.identifier
                    }, function()
                        ESX.Connexion["Identifiers"].List["users"][ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier].owner].isBanned = nil
                    end)
                end
            end
        else
            while (not ESX.Connexion["Identifiers"].List["users"][playerIdentifier]) do
                Wait(150)
            end

            ESX.Connexion["Identifiers"].List["identifiers"][currentIdentifier] = {
                owner = playerIdentifier
            }
            
            ESX.Connexion["Identifiers"].List["users"][playerIdentifier].identifiers[currentIdentifier] = true
            
            local newIdentifiers = {}

            for currentIdentifier, _ in pairs(ESX.Connexion["Identifiers"].List["users"][playerIdentifier].identifiers) do
                table.insert(newIdentifiers, currentIdentifier)
            end

            MySQL.update("UPDATE user_identifiers SET data = ? WHERE owner = ?", {
                json.encode(newIdentifiers),
                playerIdentifier
            })        
        end    
    end

    if ESX.GetPlayerFromIdentifier(playerIdentifier) then
        deferrals.done("Vous êtes déjà connecté sur le serveur\nCode d'erreur : 1.")
        CancelEvent()
        return
    end

    deferrals.done();
end)

-- RegisterCommand("believer_ban", function(source, args)
--     if (source == 0) then
--         if (not args[1] or not args[2] or not args[3]) then
--             return
--         end
    
--         local targetPlayer = tonumber(args[1]) or args[1]
--         local reason = table.concat(args, " ", 3)
      
--         local finishTimer
--         if (tonumber(args[2]) == 0) then
--             finishTimer = -1
--         else
--             finishTimer = (os.time() + (tonumber(args[2]) * 60)) * 1000
--         end
    
--         if (type(targetPlayer) == "number") then
--             local selectedPlayer = ESX.Connexion:getFromSource(targetPlayer)
--             if (not selectedPlayer) then
--                 return
--             end

--             selectedPlayer:ban(reason, finishTimer, "Anticheat")
--         else
--             ESX.Connexion:ban(targetPlayer, {
--                 reason = reason,
--                 expiration = finishTimer or -1,
--                 author = "Console"
--             })
--         end
--     else
--         -- Todo check if player is admin or with the command module

--         if (not args[1] or not args[2] or not args[3]) then
--             return
--         end
    
--         local targetPlayer = tonumber(args[1]) or args[1]
--         local reason = table.concat(args, " ", 3)
      
--         local finishTimer
--         if (tonumber(args[2]) == 0) then
--             finishTimer = -1
--         else
--             finishTimer = (os.time() + (tonumber(args[2]) * 60)) * 1000
--         end
    
--         if (type(targetPlayer) == "number") then
--             local selectedPlayer = ESX.Connexion:getFromSource(targetPlayer)
--             if (not selectedPlayer) then
--                 return
--             end
            
--             selectedPlayer:ban(reason, finishTimer, GetPlayerName(playerSrc))
--         else
--             ESX.Connexion:ban(targetPlayer, {
--                 reason = reason,
--                 expiration = finishTimer or -1,
--                 author = GetPlayerName(playerSrc)
--             })
--         end
--     end
-- end)

-- RegisterCommand("believer_unban", function(source, args)
--     if (source == 0) then
--         if (not args[1]) then
--             return
--         end
    
--         ESX.Connexion:unban(source, args[1])
--     else
--         -- Todo check if player is admin or with the command module

--         if (not args[1]) then
--             return
--         end
    
--         ESX.Connexion:unban(source, args[1])
--     end
-- end)