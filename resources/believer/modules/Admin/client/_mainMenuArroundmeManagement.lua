GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["around_me"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Autour de moi")

GM.Admin.menu.submenus["around_me"]:isVisible(function(Items)
    Items:Button("Supprimer les véhicules", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Supprimer les véhicules",
                submitLabel = "SUPPRIMER",
                placeHolders = {
                    {label = "RADIUS"},
                }
            })
            if (input ~= nil) then
                TriggerServerEvent("Admin:deleteVehicles", input["1"])
            end
        end
    })
    Items:Button("Supprimer les PNJs", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            -- Todo event this button
        end
    })
    Items:Button("Supprimer les props", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            -- Todo event this button
        end
    })
    Items:Button("Revive zone", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            -- Todo event this button
        end
    })
    Items:Button("Heal zone", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            -- Todo event this button
        end
    })
    Items:Button("Give arme event", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            -- Todo event this button
        end
    })
    Items:Button("Supprimer arme event", nil, {}, GM.Admin.inAdmin, {
        onSelected = function()
            -- Todo event this button
        end
    })
end)