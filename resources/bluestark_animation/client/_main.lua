ESX = exports['believer']:getSharedObject()

local CurrentFlags = {
   0, 
   0,
}

local UseDefaultFlags = true
local walkStyle = 'move_m@generic'
local PlayingAnimation = false
local CanPlayAnimation = false
local PlayingWholeBody = false
local Prop = false
local Anims = {}
local Sets = {
    {},
    {},
    {},
    {},
    {},
}
local ActiveSet = 1
local IsPlayingAnimation = false
local mp_pointing = false
local AnimationPlayed = false
local isRequestAnim = false
local requestedanim = ''

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
      end
    for name, content in pairs(Config.Animations) do
        TriggerEvent("chat:removeSuggestion", "/e " .. name)
    end
    TriggerEvent("chat:removeSuggestion", "/"..Config.CancelAnimationCommand)
    TriggerEvent("chat:removeSuggestion", "/"..Config.ChangeAnimationSetCommand)
end)

CreateThread(function()
	while ESX == nil do
		Wait(100)
	end
	while ESX.GetPlayerData().job == nil do
		Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
    Wait(5000)
    if PlayerData then 
        loadAnimations()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    loadAnimations()
end)

RegisterKeyMapping("animation", 'Ouvrir le menu animation', 'keyboard', "F2")
RegisterCommand("animation", function(source, args)
    TriggerEvent("bluestark_animation:OpenMenu")
end)

RegisterKeyMapping('stopanim', "Arrêter l'animation", 'keyboard', 'X')
RegisterCommand('stopanim', function(source, args)
    StopAnimation()
end)

RegisterCommand('object', function(source, args)
    if args[1] == nil then return end
    args[1] = string.lower(args[1])
    if args[1] == 'notes' then
        notesAnim()
    elseif args[1] == 'tablet' then
        tabletAnim()
    elseif args[1] == 'tatgun' then
        tatGunAnim('random@shop_tattoo')
    elseif args[1] == 'tatgun2' then
        tatGunAnim('missfam6ig_7_tattoo')
    else
	    PlayAnim(args[1])
    end
end, false)


RegisterNetEvent('bluestark_animation:walkLoad')
AddEventHandler('bluestark_animation:walkLoad', function(style)
    SetWalkingStyle(style)
end)

RegisterNetEvent('bluestark_animation:faceLoad')
AddEventHandler('bluestark_animation:faceLoad', function(faceAnim)
    SetFaceAnim(faceAnim)
end)
RegisterNetEvent('bluestark_animation:UseWalkingStick')
AddEventHandler('bluestark_animation:UseWalkingStick', function()
    local ped = PlayerPedId()
    local style = 'move_heist_lester'
    RequestAnimSet(style)
    while not HasAnimSetLoaded(style) do
        Wait(1)
    end
    SetPedMovementClipset(ped, style, 1.0)
    walkStyle = style
    Prop = CreateObject(GetHashKey("prop_cs_walking_stick"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(Prop, ped, GetPedBoneIndex(ped, 57005), 0.16, 0.06, 0.0, 335.0, 300.0, 120.0, true, true, false, true, 5, true)
end)

RegisterNetEvent('bluestark_animation:OpenMenu')
AddEventHandler('bluestark_animation:OpenMenu', function()
    SetNuiFocus(true, true);
    SendNUIMessage({status="show", settings = CurrentFlags})
    if Config.BlurBackground then TriggerScreenblurFadeIn(0) end 
end)

RegisterNetEvent('bluestark_animation:ChangeSet')
AddEventHandler('bluestark_animation:ChangeSet', function(target, args)
    ActiveSet = args.id
end)

RegisterNetEvent('bluestark_animation:StopAnimation')
AddEventHandler('bluestark_animation:StopAnimation', function()
    StopAnimation()
end)

function mod(a, b)
    return a - (math.floor(a/b)*b)
end

function StopAnimation()
    if DoesEntityExist(Prop) then
        DeleteObject(Prop)
        Prop = nil
    end
    if IsPlayingAnimation then
        ClearPedTasks(PlayerPedId())
    end
    if Frozen then
        FreezeEntityPosition(PlayerPedId(), false)
    end
	usingTatgun = false
    IsPlayingAnimation = false
end

function GetAnimationFromSet(set, which)
    return Sets[set][which]
end

function GetAnimationFlag(flags, default)
    if UseDefaultFlags and default then
        return default
    end
    flags = flags or CurrentFlags
    return flags[1] + flags[2]
end

function GetDuration()
    return CurrentFlags[2] == 14 and 1.0 or 0
end

function loadAnimations()
    ESX.TriggerServerCallback('bluestark_animation:requestStarAnimations', function(starredAnimations)
		local ready = false
		TriggerServerEvent('bluestark_animation:load')
            
        Anims = {}
        Sets = {
            {},
            {},
            {},
            {},
            {},
        }
        for name, content in pairs(Config.Animations) do
            TriggerEvent("chat:addSuggestion", "/e " .. name, title)
        end
		RegisterNetEvent('bluestark_animation:bind')
		AddEventHandler('bluestark_animation:bind', function(list)
			Sets = list
			ready = true
		end)

        TriggerEvent("chat:addSuggestion", Config.CancelAnimationCommand, "Arrêter l'animation")
        TriggerEvent("chat:addSuggestion", Config.ChangeAnimationSetCommand, 'Set your Favorite Animations Set')
        for name, content in pairs(Config.Animations) do
            local favourite = false
            for _ , fav in pairs(starredAnimations) do
                if fav.nameanim == name then
                    favourite = true
                    break
                end
            end
            table.insert(Anims, {
                title = content.title,
                description = '/e ' .. name,
                name = name,
                likes = 0,
                liked = favourite,
                category = content.category,
            })
        end
        table.sort(Anims, function(a, b) 
            return a.name < b.name 
        end)
		while not ready do 
			Wait(100)
		end 
        SendNUIMessage({
            status = 'update',
            animations = Anims,
            sets = Sets
        })
    end)
    
    if Config.SaveWalkStyle then
        TriggerServerEvent('bluestark_animation:loadWalk')
    end

    if Config.SaveFaceExpressionStyle then 
        TriggerServerEvent('bluestark_animation:loadFace')
    end
end

function PlayScenario(anim)
	if IsPedOnFoot(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) then
		TaskStartScenarioInPlace(PlayerPedId(), anim, 0, 1)
		PlayingAnim = true
	end
end

function SetWalkingStyle(style)
    ESX.Streaming.RequestAnimSet(style)
    SetPedMovementClipset(PlayerPedId(), style, true)
    walkStyle = style
    TriggerServerEvent('bluestark_animation:saveWalk', style)
end

function SetFaceAnim(faceAnim)
    SetFacialIdleAnimOverride(PlayerPedId(), faceAnim)
    TriggerServerEvent('bluestark_animation:saveFace', faceAnim)
end

function PlayAnimationWithProp(dict, anim, prop1, bone, propPos, flag)
    if IsPedOnFoot(PlayerPedId()) then
        if IsPedCuffed(PlayerPedId()) then return end
        StopAnimation()
        IsPlayingAnimation = true
        ESX.Streaming.RequestAnimDict(dict)
        TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 1.0, -1, flag, 0, 0, 0, 0)
        AddPropToPlayer(prop1, bone, propPos)
    end
end

function AddPropToPlayer(prop, bone, propPos)
    local playerPed = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
	local off1, off2, off3, rot1, rot2, rot3 = table.unpack(propPos)
    ESX.Streaming.RequestModel(prop)
    Prop = CreateObject(GetHashKey(prop), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(Prop, playerPed, GetPedBoneIndex(playerPed, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(prop)
end

function PlayAnimation(animation, flags, name)
    local thisGenerator = math.random(0, 3000)
    AnimationPlayed = thisGenerator
    local playerPed = PlayerPedId()
    local flag = GetAnimationFlag(false, animation.animFlag)
    if flags then
        flag = GetAnimationFlag(flags, animation.animFlag)
    end
    if Config.DisableInCar then 
        if IsPedInAnyVehicle(playerPed, false) then
            ESX.ShowNotification("~r~Vous ne pouvez pas faire d'animation dans le véhicule")
            return
        end
    end
    if animation.emote then
        if IsPedDeadOrDying(PlayerPedId()) then
            return
        end
        PlayScenario(animation.emote)
    elseif animation.prop then
        PlayAnimationWithProp(animation.animDict, animation.animName, animation.prop, animation.bone, animation.propPos, animation.animFlag)
    elseif animation.category == "style" then
        SetWalkingStyle(animation.anim)
    elseif animation.category == "synced" then
        TriggerEvent("bluestark_animation:startShared", name)
    elseif animation.category == "face" then
        SetFaceAnim(animation.anim)
    else
        if IsPedSwimming(playerPed) or IsPedDeadOrDying(PlayerPedId()) then
            return
        end

        if IsPedInAnyVehicle(playerPed, false) then
            flag = GetAnimationFlag({48, CurrentFlags[2]}, false)
        end

        ESX.Streaming.RequestAnimDict(animation.animDict)
        TaskPlayAnim(playerPed, animation.animDict, animation.animName, 8.0, 1.0, -1, flag, GetDuration(), false ,false, false)

        CreateThread(function()
            if loopedThreadID then
                TerminateThread(loopedThreadID)
            end
            loopedThreadID = GetIdOfThisThread()
            if mod(flag, 2) == 1 then
                while IsPlayingAnimation and AnimationPlayed == thisGenerator do
                    if not IsEntityPlayingAnim(PlayerPedId(), animation.animDict, animation.animName, flag) then
                        TaskPlayAnim(playerPed, animation.animDict, animation.animName, 8.0, 1.0, -1, flag, GetDuration(), false ,false, false)
                    end
                    Wait(500)
                end
                ClearPedTasks(PlayerPedId())
            end
        end)
    end
end

function notesAnim()
    if DoesEntityExist(Prop) then
        DeleteObject(Prop)
        Prop = nil
    end

	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local boneIndex = GetPedBoneIndex(playerPed, 36029)

	ESX.Streaming.RequestAnimDict("amb@world_human_clipboard@male@idle_b")

	ESX.Game.SpawnObject('prop_notepad_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 2
	}, function(object)
		Prop = object
		CreateThread(function()
			AttachEntityToEntity(object, playerPed, boneIndex, 0.10, 0.08, 0.07, 155.0, 120.0, -180.0, true, true, false, true, 1, true)
			TaskPlayAnim(playerPed, "amb@world_human_clipboard@male@idle_b", "idle_d" ,3.5, -8, -1, 49, 0,false, false, false )
		end)
	end)
	IsPlayingAnimation = true
end

function tabletAnim()
    if DoesEntityExist(Prop) then
        DeleteObject(Prop)
        Prop = nil
    end
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	ESX.Streaming.RequestAnimDict("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a")
    ESX.Game.SpawnObject('prop_cs_tablet', {
        x = coords.x,
        y = coords.y,
        z = coords.z + 2
    }, function(object)
        Prop = object
        CreateThread(function()
            AttachEntityToEntity(object, playerPed, GetPedBoneIndex(playerPed, 28422), -0.03, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
            TaskPlayAnim(playerPed, "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a" ,3.5, -8, -1, 49, 0,false, false, false )
        end)
    end)
    IsPlayingAnimation = true
end

function tatGunAnim(anim)
    if DoesEntityExist(Prop) then
        DeleteObject(Prop)
        Prop = nil
    end
	IsPlayingAnimation = true
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local boneIndex = GetPedBoneIndex(playerPed, 11816)
	local boneIndex2 = GetPedBoneIndex(playerPed, 6286)

    local tatAnimDict = anim

    ESX.Streaming.RequestAnimDict(tatAnimDict)
    ESX.Game.SpawnObject('v_ilev_ta_tatgun', {
        x = coords.x,
        y = coords.y,
        z = coords.z + 2
    }, function(object)
        Prop = object
        CreateThread(function()
            AttachEntityToEntity(object, playerPed, boneIndex2, 0.09, 0.11, 0.01, -75.0, -90.0, -140.0, true, true, false, true, 1, true)
            if tatAnimDict == 'random@shop_tattoo' then
                TaskPlayAnimAdvanced(playerPed, tatAnimDict, "artist_artist_finishes_up_his_tattoo", GetEntityCoords(playerPed), 0.0, 0.0, GetEntityHeading(playerPed), 1.0, 1.0, 1.0, 15, 0.0, 0, 0)
                usingTatgun = true

                CreateThread(function()
                    while true do
                        Wait(12000)
                        if usingTatgun then
                            local playerPed = PlayerPedId()
                            TaskPlayAnimAdvanced(playerPed, "random@shop_tattoo", "artist_artist_finishes_up_his_tattoo", GetEntityCoords(playerPed), 0.0, 0.0, GetEntityHeading(playerPed), 1.0, 1.0, 1.0, 15, 0.0, 0, 0)
                        end
                    end
                end)

            elseif tatAnimDict == 'missfam6ig_7_tattoo' then
                TaskPlayAnim(playerPed, tatAnimDict, "ig_7_left_shaft_draw_michael", 8.0, 1.0, -1, 15, 0, 0, 0, 0)
            end
        end)
    end)
end

function PlayAnim(name, flags)
    if IsPedCuffed(PlayerPedId()) then return end
    StopAnimation()
    IsPlayingAnimation = true
    if Config.Animations[name] then
      if Config.Animations[name].event then
        TriggerEvent(Config.Animations[name].event)
      else
        PlayAnimation(Config.Animations[name], flags, name)
      end
    end
end

RegisterNUICallback('saveFavoris', function(data, cb)
    Sets = data.sets
    TriggerServerEvent('bluestark_animation:SaveFavoris', Sets)
end)

RegisterNUICallback('dislikeAnim', function(data, cb)
    local name = data.name
    TriggerServerEvent('bluestark_animation:UnstarAnimation', name)
end)

RegisterNUICallback('likeAnim', function(data, cb)
    local name = data.name
    TriggerServerEvent('bluestark_animation:StarAnimation', name)
end)

RegisterNUICallback('playAnim', function(data, cb)
    SetNuiFocus(false, false)
    if Config.BlurBackground then TriggerScreenblurFadeOut(0) end 
    PlaySound(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    PlayAnim(data.name)
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    if Config.BlurBackground then TriggerScreenblurFadeOut(0) end 
end)

RegisterNUICallback('stop', function(data, cb)
    if IsPlayingAnimation then
        StopAnimation()
    end
end)

RegisterNUICallback('settingsAnim', function(data, cb)
    if data.flag == 0 and data.index == 1 then
        UseDefaultFlags = true
    else
        local flag = data.flag
        UseDefaultFlags = false
        CurrentFlags[data.index] = flag
    end
end)

function SetCanPlayAnimation(value)
    CanPlayAnimation = value
end
exports('SetCanPlayAnimation', SetCanPlayAnimation)

function CanPlayAnimation()
    return CanPlayAnimation
end
exports('CanPlayAnimation', CanPlayAnimation)

function IsPlayingAnimation()
    return IsPlayingAnimation
end
exports('IsPlayingAnimation', IsPlayingAnimation)

function SetPlayAnimation(value)
    IsPlayingAnimation = value
end
exports('SetPlayAnimation', SetPlayAnimation)

RegisterNetEvent("bluestark_animation:startShared")
AddEventHandler("bluestark_animation:startShared", function(anim)
    local animname = string.lower(anim)
    while true do 
        Wait(1)
        if Config.SyncedAnimations[animname] ~= nil then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 2.5 then
                ESX.ShowHelpNotification("~INPUT_PICKUP~ Suggérer des interactions \n~INPUT_VEH_DUCK~ Annuler")

                target_id = GetPlayerPed(closestPlayer)
                playerX, playerY, playerZ = table.unpack(GetEntityCoords(target_id))
                DrawMarker(0, playerX, playerY, playerZ+1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 155, 77, 219, 70, true, true, 2, true, false, false, false)
                if IsControlJustPressed(0, 38) then
                    dict, anim, ename = table.unpack(Config.SyncedAnimations[animname])
                    TriggerServerEvent("bluestark_animation:animrequest", GetPlayerServerId(closestPlayer), animname)
                    ESX.ShowNotification("~b~Demande envoyée")
                    break
                end
                if IsControlJustPressed(0, 73) then
                    ClearPedTasks(PlayerPedId())
                    Citizen.Wait(200)
                    break
                end
            else
                ESX.ShowNotification("~g~Conseil ~w~: rapprochez-vous")
                break
            end
        else
            ESX.ShowNotification("~r~L'animation n'existe pas")
            break
        end
    end
end)

RegisterNetEvent("bluestark_animation:playshared")
AddEventHandler("bluestark_animation:playshared", function(anim, player)
    StopAnimation()
    Wait(500)
    if Config.SyncedAnimations[anim] ~= nil then
      if SyncedAnimationPlay(Config.SyncedAnimations[anim]) then end return
    end
end)

RegisterNetEvent("bluestark_animation:playsharedsource")
AddEventHandler("bluestark_animation:playsharedsource", function(anim, player)
    local pedInFront = Citizen.InvokeNative(0x43A66C31C68491C0, GetPlayerFromServerId(player))
    local heading = GetEntityHeading(pedInFront)
    local coords = GetOffsetFromEntityInWorldCoords(pedInFront, 0.0, 1.0, 0.0)
    if (Config.SyncedAnimations[anim]) and (Config.SyncedAnimations[anim].AnimationOptions) then
      local SyncOffsetFront = Config.SyncedAnimations[anim].AnimationOptions.SyncOffsetFront
      if SyncOffsetFront then
          coords = GetOffsetFromEntityInWorldCoords(pedInFront, 0.0, SyncOffsetFront, 0.0)
      end
    end
    SetEntityHeading(PlayerPedId(), heading - 180.1)
    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
    StopAnimation()
    Wait(500)
    if Config.SyncedAnimations[anim] ~= nil then
      if SyncedAnimationPlay(Config.SyncedAnimations[anim]) then end return
    end
end)

RegisterNetEvent("bluestark_animation:animationrequest")
AddEventHandler("bluestark_animation:animationrequest", function(animname, etype, revicer)
    isRequestAnim = true
    requestedanim = animname
    _,_,ranim = table.unpack(Config.SyncedAnimations[requestedanim])

    PlaySound(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 0, 0, 1)
    ESX.ShowNotification("~y~Y~w~ pour accepter, ~r~L~w~ pour refuser (~g~"..ranim.."~w~)")
    local waiting = 0 
    Citizen.CreateThreadNow(function()
        while true do
            Citizen.Wait(5)
            if isRequestAnim then
                if IsControlJustPressed(1, 246) then
                    ESX.ShowNotification("~b~Requête acceptée")
                    target, distance = ESX.Game.GetClosestPlayer()
                    if(distance ~= -1 and distance < 3) then
                        if Config.SyncedAnimations[requestedanim] ~= nil then
                            _,_,_,otheranim = table.unpack(Config.SyncedAnimations[requestedanim])
                        end
                        if otheranim == nil then otheranim = requestedanim end
                        TriggerServerEvent("bluestark_animation:animationaccepted", revicer, requestedanim, otheranim)
                        isRequestAnim = false
                    else
                        ESX.ShowNotification("~r~Personne autour de vous")
                    end
                elseif IsControlJustPressed(1, 182) then
                    ESX.ShowNotification("~r~Animation refusée")
                    isRequestAnim = false
                end
            else
                break
            end
        end
    end)
    Citizen.CreateThreadNow(function()
        while true do 
            Wait(100)
            waiting = waiting + 1
            if isRequestAnim then 
                if waiting > 100 then 
                    isRequestAnim = false 
                    ESX.ShowNotification("~r~La demande a expiré")
                end
            else 
                break 
            end
        end
    end)
end)

function SyncedAnimationPlay(animName)
    InVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
    if not DoesEntityExist(Citizen.InvokeNative(0x43A66C31C68491C0, -1)) then
      return false
    end
    ChosenDict,ChosenAnimation,ename = table.unpack(animName)
    AnimationDuration = -1
    ESX.Streaming.RequestAnimDict(ChosenDict)
    if animName.AnimationOptions then
      if animName.AnimationOptions.EmoteLoop then
        MovementType = 1
      if animName.AnimationOptions.EmoteMoving then
        MovementType = 51
    end
    elseif animName.AnimationOptions.EmoteMoving then
      MovementType = 51
    elseif animName.AnimationOptions.EmoteMoving == false then
      MovementType = 0
    end
    else
      MovementType = 0
    end
    if InVehicle == 1 then
      MovementType = 51
    end
    if animName.AnimationOptions then
      if animName.AnimationOptions.EmoteDuration == nil then 
        animName.AnimationOptions.EmoteDuration = -1
        AttachWait = 0
      else
        AnimationDuration = animName.AnimationOptions.EmoteDuration
        AttachWait = animName.AnimationOptions.EmoteDuration
      end
    end
    TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), ChosenDict, ChosenAnimation, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
    RemoveAnimDict(ChosenDict)
    IsPlayingAnimation = true
    return true
end