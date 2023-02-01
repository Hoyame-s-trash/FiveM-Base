GM.Ambulance = GM.Ambulance or {}

GM.Ambulance = {
    menu = {
        submenus = {}
    },
    data = {
        calls = {},
    },
}

GM.Ambulance.menu.main = RageUI.CreateMenu("", "Ambulance", 0, 0, "banner", "bluestark")
GM.Ambulance.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Ambulance.menu.submenus["calls"] = RageUI.CreateSubMenu(GM.Ambulance.menu.main, "", "Historique des appels", 0, 0, "banner", "bluestark")
GM.Ambulance.menu.submenus["calls_management"] = RageUI.CreateSubMenu(GM.Ambulance.menu.submenus["calls"], "", "Détails de l'appels", 0, 0, "banner", "bluestark")

GM.Ambulance.menu.main:isVisible(function(Items)
    Items:Checkbox("Prendre son service", nil, SERVICE_CHECKED, {}, {
        onSelected = function(Checked)
            SERVICE_CHECKED = Checked
        end,
        onChecked = function()
            GM.Ambulance.data.onService = true
            TriggerServerEvent("Service:interact", true)
            
        end,
        onUnChecked = function()
            GM.Ambulance.data.onService = false
            TriggerServerEvent("Service:interact", false)
        end,
    })
    Items:Button("Historique des appels", nil, {}, GM.Ambulance.data.onService, {
        onSelected = function()
            TriggerServerEvent("Ambulance:requestCalls")
        end
    }, GM.Ambulance.menu.submenus["calls"])
    Items:Button("Réanimer", nil, {}, GM.Ambulance.data.onService, {
        onSelected = function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer(GetEntityCoords(PlayerPedId()))
            if (closestPlayer == -1 or closestDistance > 3.0) then
                return ESX.ShowNotification("~r~Aucun joueur à proximité.")
            else
                TriggerServerEvent("Ambulance:revivePlayer", GetPlayerServerId(closestPlayer))
            end
        end
    })
end)

GM.Ambulance.menu.submenus["calls"]:isVisible(function(Items)
    for callSrc, call in pairs(GM.Ambulance.data.calls) do
        if (call.taken == false) then
            Items:Button("Appel N°"..call.id, call.reason, {RightLabel = call.date}, true, {
                onSelected = function()
                    GM.Ambulance.data["selectedCall"] = callSrc
                end
            }, GM.Ambulance.menu.submenus["calls_management"])
        else
            Items:Button("~y~Appel N°"..call.id, call.reason.."\nPris par : "..call.taken_name, {RightLabel = call.date}, true, {
                onSelected = function()
                    GM.Ambulance.data["selectedCall"] = callSrc
                end
            }, GM.Ambulance.menu.submenus["calls_management"])
        end
    end
end)

GM.Ambulance.menu.submenus["calls_management"]:isVisible(function(Items)
    if (GM.Ambulance.data["selectedCall"] ~= nil and GM.Ambulance.data["calls"][GM.Ambulance.data["selectedCall"]] ~= nil) then
        Items:Button("S'occuper de cet appel", nil, {}, not GM.Ambulance.data["calls"][GM.Ambulance.data["selectedCall"]].taken,{
            onSelected = function()
                TriggerServerEvent("Ambulance:takeCall", GM.Ambulance.data["selectedCall"])
            end
        })
        Items:Button("Informer le patient de votre arrivée", nil, {}, GM.Ambulance.data["calls"][GM.Ambulance.data["selectedCall"]].taken,{
            onSelected = function()
                TriggerServerEvent("Ambulance:informPatient", GM.Ambulance.data["selectedCall"])
            end
        })
        Items:Button("Terminer l'appel", nil, {}, GM.Ambulance.data["calls"][GM.Ambulance.data["selectedCall"]].taken,{
            onSelected = function()
                TriggerServerEvent("Ambulance:closeCall", GM.Ambulance.data["selectedCall"])
            end
        })
    end
end)

RegisterNetEvent("Ambulance:openMenu", function()
    GM.Ambulance.menu.main:toggle()
end)

RegisterNetEvent("Ambulance:updateValue", function(AMBULANCE_DATA, AMBULANCE_KEY, AMBULANCE_VALUE)
    if (not AMBULANCE_VALUE) then
        GM.Ambulance.data[AMBULANCE_DATA] = AMBULANCE_KEY
    else
        GM.Ambulance.data[AMBULANCE_DATA][AMBULANCE_KEY] = AMBULANCE_VALUE
    end
end)

RegisterNetEvent("Ambulance:removeValue", function(AMBULANCE_DATA, AMBULANCE_KEY)
    if (not AMBULANCE_KEY) then
        GM.Ambulance.data[AMBULANCE_DATA] = nil
    else
        GM.Ambulance.data[AMBULANCE_DATA][AMBULANCE_KEY] = nil
    end
end)