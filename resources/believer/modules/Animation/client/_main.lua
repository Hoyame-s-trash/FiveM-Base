GM.Animation = GM.Animation or {}

local EmoteMenu = RageUI.CreateMenu("Animation",'Que veux-tu faire ?')

local emote_shared = RageUI.CreateSubMenu(EmoteMenu,"Emote paratagé", "Que veux-tu faire ?")
local emote_basic = RageUI.CreateSubMenu(EmoteMenu,"Emote", "Que veux-tu faire ?")

local emote_fav = RageUI.CreateSubMenu(EmoteMenu,"Emote favoris", "Que veux-tu faire ?")
local emote_dance = RageUI.CreateSubMenu(EmoteMenu,"Danse", "Que veux-tu faire ?")


EmoteMenu:SetSpriteBanner('emote', 'interaction_bgd2')
emote_shared:SetSpriteBanner('emote', 'interaction_bgd2')
emote_basic:SetSpriteBanner('emote', 'interaction_bgd2')
emote_fav:SetSpriteBanner('emote', 'interaction_bgd2')
emote_dance:SetSpriteBanner('emote', 'interaction_bgd2')

function input_showBox(TextEntry, ExampleText, MaxStringLenght, isValueInt)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", 50)
    local blockInput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockInput = false
        return result
    else
        Wait(500)
        blockInput = false
        return nil
    end
end


local menu_emote = false


local type = {"Visualisé 👀", "jouer 💃","Favorie ✨"}
local selectedtype = 1

local type3 = {"Visualisé 👀", "jouer 💃", "Supprimer 🗑", "Renomer 📝"}
local selectedtype3 = 1

local type2 = {"Visualisé 👀", "jouer 💃"}
local selectedtype2 = 1


_Utiles = {} 

_Utiles.animation_load = function(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
       Wait(1)
    end
end

_Utiles.process_load = function(name)
   RequestAnimSet(name)
   while not HasAnimSetLoaded(name) do
       Wait(1)
   end
end

_Utiles.TaskAnim = function(ped, animDict, animName)
   _Utiles.animation_load(animDict)
   TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, -1, 1, 1, false, false, false)
end

_Utiles.keyRegister = function(name, defaultKey, desc, callback)
    local cmd = ("gw_%s"):format(name)
    RegisterCommand(cmd, function()
        callback()
    end)
    RegisterKeyMapping(cmd, desc, "keyboard", defaultKey)
end

_Utiles.keyRegister('animation', 'f1', 'Menu Animation', function()
    Open_Menu_Animation()
end)


_Utiles.keyRegister('animation-cancel', 'x', 'Stop Animation', function()
   ClearPedTasks(GetPlayerPed(-1))
   ClearPedSecondaryTask(GetPlayerPed(-1))
end)

EmoteMenu.Closed = function()
    menu_emote = false
    DeleteEntity(peds)
    RageUI.SetAcces(true)
end


PlayAnim = function(peds, Dict, Anim, Flag)
    RequestAnimDict(Dict)
    while not HasAnimDictLoaded(Dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(peds, Dict, Anim, 8.0, -8.0, -1, Flag or 0, 0, false, false, false)
end

local type_GetClosestPed = function(coords, cb)
    local ped = GetPlayerPed(GetClosestPlayer(coords.x, coords.y, coords.z, 5.0, 0, playerPed))
    if DoesEntityExist(ped) then
        cb(ped)
    end
end


Fav_Emote = {}


Open_Menu_Animation = function()
    if not RageUI.Acces() then 
        return
    end
    RageUI.SetAcces(false)
    if menu_emote then 
        menu_emote = false 
        return 
    else 
        menu_emote = true
        RageUI.Visible(EmoteMenu, true)
        CreateThread(function()
            while menu_emote do
                RageUI.IsVisible(EmoteMenu,function()
                    RageUI.Button("Emote partagé", false, {RightLabel = "→→"}, true, {
                        onSelected = function()
                        end
                    }, emote_shared)
                    RageUI.Button("Emote basic", false, {RightLabel = "→→"}, true, {
                        onSelected = function()
                        end
                    
                    }, emote_basic)

                end)

                RageUI.IsVisible(emote_shared,function()
                    for k,v in pairs(Animation_Config_Synced) do 
                        RageUI.List(v['Label'],type2,selectedtype2,nil,{},true,{
                            onListChange = function(Index)
                                selectedtype2 = Index
                            end,
                            onSelected = function(index)
                                DeleteEntity(pedsclone2)
                                DeleteEntity(target)
                            if index == 2 then 
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestPlayer ~= -1 and closestDistance < 2.0 then
                                    TriggerServerEvent('animations:requestSynced', GetPlayerServerId(closestPlayer), v)
                                end
                            end
                            if index == 1 then 
                                pedsclone2 = ClonePed(PlayerPedId(), false, false)
                                target = ClonePed(PlayerPedId(), false, false)
                                SetBlockingOfNonTemporaryEvents(pedsclone2, true)
                                SetBlockingOfNonTemporaryEvents(target, true)
                                SetEntityAlpha(pedsclone2, 190, 0)
                                SetEntityAlpha(target, 190, 0)
                                CreateThread(function()
                                    local anim = v['Accepter']
                                    if v['Car'] then
                                        TaskWarpPedIntoVehicle(target, GetVehiclePedIsUsing(PlayerPedId()), 0)
                                    end
        
                                    if anim['Attach'] then
                                        local attach = anim['Attach']
                                        AttachEntityToEntity(target, pedsclone2, attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
                                    end
        
                                    Wait(750)
        
                                    if anim['Type'] == 'animation' then
                                        RequestAnimDict(anim['Dict'])
                                        while not HasAnimDictLoaded(anim['Dict']) do
                                            Wait(0)
                                        end
                                        TaskPlayAnim(target, anim['Dict'], anim['Anim'], 8.0, -8.0, -1, anim['Flags'] or 0, 0, false, false, false)
                                    end
        
                                    anim = v['Requester']
                                   
                                    while not IsEntityPlayingAnim(pedsclone2, anim['Dict'], anim['Anim'], 3) do
                                        Wait(0)
                                        SetEntityNoCollisionEntity(PlayerPedId(), pedsclone2, true)
                                        SetEntityNoCollisionEntity(PlayerPedId(), target, true)
                                        SetEntityNoCollisionEntity(target, pedsclone2, true)
                                    end
                                    DetachEntity(target)
                                    while IsEntityPlayingAnim(pedsclone2, anim['Dict'], anim['Anim'], 3) do
                                        Wait(0)
                                        SetEntityNoCollisionEntity(PlayerPedId(), pedsclone2, true)
                                        SetEntityNoCollisionEntity(PlayerPedId(), target, true)
                                        SetEntityNoCollisionEntity(target, pedsclone2, true)
                                    end
        
                                    ClearPedTasks(target)
                                    DeleteEntity(target)
        
                                end)
                                CreateThread(function()
                                    local anim = v['Requester']
                                    if anim['Attach'] then
                                        local attach = anim['Attach']
                                        AttachEntityToEntity(pedsclone2, target, attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
                                    end
        
                                    Wait(750)
        
                                    if anim['Type'] == 'animation' then
                                        PlayAnim(pedsclone2, anim['Dict'], anim['Anim'], anim['Flags'])
                                    end
        
                                    anim = v['Accepter']
        
                                    while not IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
                                        Wait(0)
                                        SetEntityNoCollisionEntity(pedsclone2, target, true)
                                    end
                                    DetachEntity(pedsclone2)
                                    while IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
                                        Wait(0)
                                        SetEntityNoCollisionEntity(pedsclone2, target, true)
                                    end
        
                                    ClearPedTasks(pedsclone2)
                                    DeleteEntity(pedsclone2)
                                end)
                            end
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end

-- Todo remake menu with new rage ui and make bind system