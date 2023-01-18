GM.Admin = GM.Admin or {}

GM.Admin.menu.submenus["options"] = RageUI.CreateSubMenu(GM.Admin.menu.main, "", "Options")

GM.Admin.menu.submenus["options"]:isVisible(function(Items)
    Items:Checkbox("Afficher le nom des joueurs", nil, CHECKED_GAMERTAG, {}, {
        onSelected = function(Checked)
            CHECKED_GAMERTAG = Checked
        end,
        onChecked = function()
            GM.Admin.data["gamertag_bool"] = true
            TriggerServerEvent("Admin:gamerTag", true)
        end,
        onUnChecked = function()
            GM.Admin.data["gamertag_bool"] = false
            TriggerServerEvent("Admin:gamerTag", false)
        end,
    })
    Items:Checkbox("Afficher mon nom", nil, CHECKED_GAMERTAG_MYSELF, {}, {
        onSelected = function(Checked)
            CHECKED_GAMERTAG_MYSELF = Checked
        end,
        onChecked = function()
            GM.Admin.data["gamertag_myself_bool"] = true
        end,
        onUnChecked = function()
            GM.Admin.data["gamertag_myself_bool"] = false
        end,
    })
    Items:Checkbox("Afficher les blips", nil, CHECKED_BLIPS, {}, {
        onSelected = function(Checked)
            CHECKED_BLIPS = Checked
        end,
        onChecked = function()
            GM.Admin.data["blips_bool"] = true
            TriggerServerEvent("Admin:blipsManager")
        end,
        onUnChecked = function()
            GM.Admin.data["blips_bool"] = false
            TriggerServerEvent("Admin:blipsManager")
        end,
    })
    -- Items:Checkbox("Afficher le nombre de report", nil, CHECKED_REPORT_COUNT, {}, {
    --     onSelected = function(Checked)
    --         CHECKED_REPORT_COUNT = Checked
    --     end,
    --     onChecked = function()
    --         GM.Admin.data["report_count_bool"] = true
    --     end,
    --     onUnChecked = function()
    --         GM.Admin.data["report_count_bool"] = false
    --     end,
    -- })
    -- Items:Checkbox("Notification sonore lors d'un report", nil, CHECKED_REPORT_SOUND, {}, {
    --     onSelected = function(Checked)
    --         CHECKED_REPORT_SOUND = Checked
    --     end,
    --     onChecked = function()
    --         GM.Admin.data["report_sound_bool"] = true
    --     end,
    --     onUnChecked = function()
    --         GM.Admin.data["report_sound_bool"] = false
    --     end,
    -- })
    -- Items:Checkbox("Notification actions report chat", nil, CHECKED_REPORT_CHAT, {}, {
    --     onSelected = function(Checked)
    --         CHECKED_REPORT_CHAT = Checked
    --     end,
    --     onChecked = function()
    --         GM.Admin.data["report_chat_bool"] = true
    --     end,
    --     onUnChecked = function()
    --         GM.Admin.data["report_chat_bool"] = false
    --     end,
    -- })
    Items:Checkbox("Invisible par les admins", nil, CHECKED_INVISIBLE_STAFF, {}, {
        onSelected = function(Checked)
            CHECKED_INVISIBLE_STAFF = Checked
        end,
        onChecked = function()
            GM.Admin.data["invisible_staff_bool"] = true
            TriggerServerEvent("Admin:invisibleStaff", true)
        end,
        onUnChecked = function()
            GM.Admin.data["invisible_staff_bool"] = false
            TriggerServerEvent("Admin:invisibleStaff", false)
        end,
    })
end)

local gamerTags = {}

RegisterNetEvent("Admin:gamerTag", function(BOOLEAN)
    gamerTagActive = BOOLEAN
    if gamerTagActive then
        GM:newThread(function()
            while gamerTagActive do
                local plyPed = PlayerPedId()
                for k,v in pairs(GetActivePlayers()) do
                    if #(GetEntityCoords(plyPed, false) - GetEntityCoords(GetPlayerPed(v), false)) < 5000.0 then
                        -- Todo check if player staff is invisible
                        if GM.Admin.data["players"][GetPlayerServerId(v)] ~= nil then
                            gamerTags[GetPlayerPed(v)] = CreateFakeMpGamerTag(GetPlayerPed(v), "("..GetPlayerServerId(v)..") - "..GetPlayerName(v), false, false, "", 0)
                            SetMpGamerTagAlpha(gamerTags[GetPlayerPed(v)], 0, 255)
                            SetMpGamerTagAlpha(gamerTags[GetPlayerPed(v)], 2, 255)
                            SetMpGamerTagAlpha(gamerTags[GetPlayerPed(v)], 4, 255)
                            SetMpGamerTagVisibility(gamerTags[GetPlayerPed(v)], 0, true)
                            SetMpGamerTagVisibility(gamerTags[GetPlayerPed(v)], 2, true)
                            SetMpGamerTagVisibility(gamerTags[GetPlayerPed(v)], 4, NetworkIsPlayerTalking(v))

                            if GM.Admin.data["players"][GetPlayerServerId(v)].admin == true then
                                SetMpGamerTagVisibility(gamerTags[GetPlayerPed(v)], 14, true)
                                SetMpGamerTagAlpha(gamerTags[GetPlayerPed(v)], 14, 255)
                            else
                                SetMpGamerTagVisibility(gamerTags[GetPlayerPed(v)], 14, false)
                                SetMpGamerTagAlpha(gamerTags[GetPlayerPed(v)], 14, 0)
                            end
                        end
                        if GM.Admin.data["players"][GetPlayerServerId(v)] ~= nil then
                            if GM.Admin.data["players"][GetPlayerServerId(v)].vip ~= 0 then
                                if GM.Admin.data["players"][GetPlayerServerId(v)].vip == 1 then
                                    SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 12)
                                end
                            end
                        end

                        if GM.Admin.data["players"][GetPlayerServerId(v)] ~= nil then
                            if GM.Admin.data["players"][GetPlayerServerId(v)].invisible == true then
                                RemoveMpGamerTag(gamerTags[GetPlayerPed(v)])
                            end
                        end

                        if (GM.Admin.data["gamertag_myself_bool"] == nil or GM.Admin.data["gamertag_myself_bool"] == false) and GetPlayerServerId(v) == GetPlayerServerId(PlayerId()) then
                            RemoveMpGamerTag(gamerTags[GetPlayerPed(v)])
                        end
                        
                        if GM.Admin.data["players"][GetPlayerServerId(v)] ~= nil then
                            if GM.Admin.data["players"][GetPlayerServerId(v)].rank == "Fondateur" then
                                SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 9)
                            elseif GM.Admin.data["players"][GetPlayerServerId(v)].rank == "Manager" then
                                SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 18)
                            elseif GM.Admin.data["players"][GetPlayerServerId(v)].rank == "Gérant Staff" then
                                SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 27)
                            elseif GM.Admin.data["players"][GetPlayerServerId(v)].rank == "Administrateur" then
                                SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 31)
                            elseif GM.Admin.data["players"][GetPlayerServerId(v)].rank == "Modérateur" then
                                SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 4)
                            elseif GM.Admin.data["players"][GetPlayerServerId(v)].rank == "Helpeur" then
                                SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 5)
                            elseif GM.Admin.data["players"][GetPlayerServerId(v)].rank == "Ami" then
                                SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 0, 6)
                            end
                        end
                        if NetworkIsPlayerTalking(v) then
                            SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 4, 0)
                        else
                            SetMpGamerTagColour(gamerTags[GetPlayerPed(v)], 4, 0)
                        end
                    else
                        RemoveMpGamerTag(gamerTags[GetPlayerPed(v)])
                        gamerTags[GetPlayerPed(v)] = nil
                    end
                end
                Citizen.Wait(25)
            end
            for k,v in pairs(gamerTags) do
                RemoveMpGamerTag(v)
            end
            gamerTags = {}
        end)
    end
end)

RegisterNetEvent("Admin:blipsManager", function(BLIPS_DATA)

    if (type(BLIPS_DATA) ~= "table" and BLIPS_DATA == false) then
        for _, blip in pairs(GM.Admin.data["blips_list"]) do
            RemoveBlip(blip)
        end
        return
    end

    for _, blip in pairs(GM.Admin.data["blips_list"]) do
        RemoveBlip(blip)
    end
    for blipId, blipData in pairs(BLIPS_DATA) do
        if (not DoesBlipExist(GM.Admin.data["blips_list"][blipId])) then
            GM.Admin.data["blips_list"][blipId] = AddBlipForCoord(blipData.x, blipData.y, blipData.z)
            SetBlipSprite(GM.Admin.data["blips_list"][blipId], 6)
            SetBlipScale(GM.Admin.data["blips_list"][blipId], 0.70)
            SetBlipColour(GM.Admin.data["blips_list"][blipId], 0)
            SetBlipAsShortRange(GM.Admin.data["blips_list"][blipId], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blipId.." - "..blipData.name)
            EndTextCommandSetBlipName(GM.Admin.data["blips_list"][blipId])
        end
    end
end)