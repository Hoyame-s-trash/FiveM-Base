GM.AxeOfFury = GM.AxeOfFury or {}

local PlayerGender = "male"
local ScaleformMeter = nil
local ScaleformScreen = nil
local AxeOfFuryScene = nil
local IsFocusingToHit = false
local AnimDict = ""
local IsAlreadyPlaying = false
---
local TargetStrenghtBar = nil
local TargetStrenghtScreen = nil
local DefaultRender = nil
local BarScoreSync = 1.5
---

function RemoveAxeOfFuryMachineItems(id)
    for _, entity in pairs(GM.AxeOfFury.AxeFuryMachines[id].Items or {}) do
        DeleteEntity(entity)
    end
    AxeOfFuryScreensDestroy()
end

-- Destroy screen when too far
function AxeOfFuryScreensDestroy()
	SetScaleformMovieAsNoLongerNeeded(ScaleformScreen)
    SetScaleformMovieAsNoLongerNeeded(ScaleformMeter)
	ReleaseNamedRendertarget(TargetStrenghtBar)
    ReleaseNamedRendertarget(TargetStrenghtScreen)
    ReleaseNamedRendertarget(DefaultRender)
    ReleaseNamedScriptAudioBank("DLC_SUM20/sum20_Arcade_General")
    SetStreamedTextureDictAsNoLongerNeeded("ArcadeUI_Axe_of_Fury")
    RemoveAnimDict(AnimDict)
end

GM:newThread(function()
    for id, machine in pairs(GM.AxeOfFury.AxeFuryMachines) do
        ESX.Game.SpawnObject(machine.Model, machine.Coords, function(entity)
            SetEntityHeading(entity, machine.Heading)
            SetEntityCollision(entity, true, true)
            FreezeEntityPosition(entity, true)
            GM.AxeOfFury.AxeFuryMachines[id].MachineEntity = entity

            if not GM.AxeOfFury.AxeFuryMachines[id].Items then 
                GM.AxeOfFury.AxeFuryMachines[id].Items = {} 
            end
            RemoveAxeOfFuryMachineItems(id)
            for itemId, item in pairs(GM.AxeOfFury.AxeFuryMachinesItems) do
                ESX.Streaming.RequestModel(item.Model)
                local coords = GetOffsetFromEntityInWorldCoords(entity, item.Offset.x, item.Offset.y, item.Offset.z)
                local object = CreateObject(item.Model, coords.x, coords.y, coords.z, false, false, false)
                SetEntityCoordsNoOffset(object, coords.x, coords.y, coords.z)
                FreezeEntityPosition(object, true)
                SetEntityHeading(object, machine.Heading)
                SetModelAsNoLongerNeeded(item.Model)
                if item.Rotation then
                    SetEntityRotation(object, item.Rotation.x, item.Rotation.y, item.Rotation.z, 2, true)
                end
                GM.AxeOfFury.AxeFuryMachines[id].Items[itemId] = object
            end

            DrawOnMachine(id)
        end, false)
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for id, machine in pairs(GM.AxeOfFury.AxeFuryMachines) do
            RemoveAxeOfFuryMachineItems(id)
        end
    end
end)

RegisterNetEvent("AxeOfFury:Play", function(machineId)
    IsAlreadyPlaying = true
    ESX.ShowAdvancedNotification("Videogeddon", "Prix", "Vous avez payé ~g~"..GM.AxeOfFury.Price.."$ ~s~pour jouer à ~y~Axe of Fury", "CHAR_BLANK_ENTRY")
    PlayAxeFury(machineId)
end)

function DrawOnMachine(id)

    TargetStrenghtBar = ESX.Scaleform.CreateNamedRenderTargetForModel("arc_strenght_02a", `sum_prop_arcade_str_bar_01a`)
    TargetStrenghtScreen = ESX.Scaleform.CreateNamedRenderTargetForModel("arc_strenght_01a", `sum_prop_arcade_strength_01a`)
    DefaultRender = GetDefaultScriptRendertargetRenderId()

    while not RequestScriptAudioBank("DLC_SUM20/sum20_Arcade_General", 0) do 
        Citizen.Wait(0) 
    end

    ScaleFormScreenInitAxeOfFury()
    ScaleFormMeterInitAxeOfFury()

    GM:newThread(function()
        while DoesEntityExist(GM.AxeOfFury.AxeFuryMachines[id].MachineEntity) do

            SetTextRenderId(TargetStrenghtScreen)
            SetScriptGfxDrawOrder(4)
            SetScriptGfxDrawBehindPausemenu(true)
            DrawInteractiveSprite("ArcadeUI_Axe_of_Fury", "SCORE_DISPLAY_AXE_OF_FURY", 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
            DrawScaleformMovie(ScaleformScreen, 0.4, 0.375, 0.525, 0.575, 255, 255, 255, 255, 0)
            SetTextRenderId(DefaultRender)

            SetTextRenderId(TargetStrenghtBar)
            SetScriptGfxDrawOrder(4)
            SetScriptGfxDrawBehindPausemenu(true)
            DrawRect(0.5, BarScoreSync, 1.0, 1.0, 255, 0, 0, 255, false)
            ResetScriptGfxAlign()
            SetTextRenderId(DefaultRender)

            Citizen.Wait(0)
        end
    end)

    ESX.TriggerServerCallback("AxeofFury:getHighScore", function(highScore)
        SetHighScore(highScore)
    end, id)
end


function PlayAxeFury(id)

    AxeOfFurySetGender()
    local playerPed = PlayerPedId()

    local axeOfFuryConfig = GM.AxeOfFury.AxeFuryMachines[id]

    local arcadeProp = axeOfFuryConfig.MachineEntity
    local arcadePropCoords = GetEntityCoords(arcadeProp)
    local arcadePropHeading = GetEntityHeading(arcadeProp)

    local arcadePropHammer = axeOfFuryConfig.Items[1]
    local hammerCoord = GetEntityCoords(arcadePropHammer)
    local hammerRotation = GetEntityRotation(arcadePropHammer)

    local arcadeProplight  = axeOfFuryConfig.Items[2]
    local lightCoord = GetEntityCoords(arcadeProplight)

    local barHighScore = 1.5
    local scoreMultiplier = 0.0
    local hammerHitSound = "Hit_00"
    local screenScore = 0
    local animationResult = "RESULT_BAD"
    local taskTransitionResult = "BadResult"
    local soundResult = "Result_00"
    local soundStage = "Stage_07"

    AnimDict = PlayerGender == "male" and "ANIM_HEIST@ARCADE@STRENGTH@MALE@" or "ANIM_HEIST@ARCADE@STRENGTH@FEMALE@"
    ESX.Streaming.RequestAnimDict(AnimDict)

    ScaleFormMeterInitAxeOfFury()
    SetTextRenderScreen2()

    GM:newThread(function()
        while IsAlreadyPlaying do
            SetScriptGfxDrawOrder(4)
            SetScriptGfxDrawBehindPausemenu(true);
            DrawScaleformMovieFullscreen(ScaleformMeter, 255, 255, 255, 255, 0);
            SetTextRenderId(DefaultRender)
            Citizen.Wait(0)
        end
    end)
    ShowScale()

    SetMeterBarLineVisible(true) -- true or false
	SetButtonVisible(true)  -- true or false

    FlashMeter() -- flash once
	FlashButton() -- flash once
	SetMeterBarValue(1.0) --float
    SetMeterFillValue(0.0) --float

	SetIsKeyBoardControl(true)

    GM:newThread(function()
        local meterValue = 0
        local animName = "enter"
        local startAnimCoords = GetAnimInitialOffsetPosition(AnimDict, animName, arcadePropCoords.x, arcadePropCoords.y, arcadePropCoords.z, 0.0, 0.0, arcadePropHeading, 0.01, 2)
        local initialRotation = GetAnimInitialOffsetRotation(AnimDict, animName, arcadePropCoords.x, arcadePropCoords.y, arcadePropCoords.z, 0.0, 0.0, arcadePropHeading, 0.01, 2)


        TaskGoStraightToCoord(playerPed, startAnimCoords.x, startAnimCoords.y, startAnimCoords.z, 1.0, 2000, initialRotation.z, 0.1)
        local timeout = GetGameTimer() + 2000
        while #(GetEntityCoords(playerPed) - startAnimCoords) > 0.1 and math.floor(GetEntityRotation(playerPed).z) ~= math.floor(initialRotation.z) and GetGameTimer() < timeout do
            Citizen.Wait(100)
        end
        ClearPedTasks(playerPed)

        TriggerServerEvent("AxeOfFury:startSound", arcadePropCoords, id, GetPlayerServerId(PlayerId()))

        AxeOfFuryScene = NetworkCreateSynchronisedScene(arcadePropCoords.x, arcadePropCoords.y, arcadePropCoords.z, 0.0, 0.0, arcadePropHeading, 2, 1, 0, 1.0, 0, 1.0)
        PlayFacialAnim(playerPed, "ENTER_FACIAL", AnimDict)
        NetworkAddPedToSynchronisedScene(playerPed, AxeOfFuryScene, AnimDict, animName, 2.0, -2.0, 5, 0, 1000.0, 0)
        NetworkStartSynchronisedScene(AxeOfFuryScene)

        Citizen.Wait(3000)

        SetScore(5000, 0.0, 1.0, 5.0)

        IsFocusingToHit = true
        GM:newThread(function()
            while IsFocusingToHit do
                if IsControlJustPressed(0, 201) then
                    meterValue = meterValue + 0.02
                    scoreMultiplier = meterValue
                    SetMeterFillValue(meterValue)
                    FlashButton() -- flash once
                    PlaySoundAxeOfFury("Button_Mash_Hit", arcadePropCoords)
                end
                if meterValue >= 1.0 then
                    meterValue = 1.0
                    scoreMultiplier = meterValue
                    FlashMeter() -- flash once
                    break
                end
                Citizen.Wait(0)
            end
        end)

        -- Animation FocusingToHit
        PlayAnimationAxeOfFury("STAGE_1_LOOP")
        Citizen.Wait(2000)
        PlayAnimationAxeOfFury("STAGE_2_LOOP")
        Citizen.Wait(2000)
        PlayAnimationAxeOfFury("STAGE_3_LOOP")
        Citizen.Wait(2000)
        PlayAnimationAxeOfFury("STAGE_4_LOOP")

        IsFocusingToHit = false
        Citizen.Wait(1500)

        -- Meter Bar fall and press enter at right time
        SetButtonVisible(false)
        SetMeterBarIconVisible(true)
        PlaySoundAxeOfFury("Bar_Drop", arcadePropCoords)
        GM:newThread(function()
            while true do
                meterValue = meterValue - 0.01
                SetMeterBarValue(meterValue)
                if IsControlJustPressed(0, 201) then
                    SetMeterBarValue(meterValue)
                    barHighScore, screenScore = CalculateScoreBar(meterValue, scoreMultiplier)
                    hammerHitSound = GetHammerSound(barHighScore)
                    break
                end
                if meterValue <= 0.0 then
                    meterValue = 0.0
                    SetMeterBarValue(meterValue)
                    barHighScore, screenScore = CalculateScoreBar(meterValue, scoreMultiplier)
                    hammerHitSound = GetHammerSound(barHighScore)
                    break
                end
                Citizen.Wait(0)
            end
        end)

        Citizen.Wait(1000)

        --Process and play animation and sound result
        animationResult, taskTransitionResult = ReactionScore(screenScore)
        soundStage, soundResult = ScoreSound(screenScore)
        PlayAnimationAxeOfFury(animationResult, 4000)

        Citizen.Wait(1100)
        TriggerServerEvent("AxeOfFury:updateScore", barHighScore, screenScore, arcadePropCoords, hammerHitSound, soundResult, lightCoord, id, hammerCoord, arcadePropHeading, hammerRotation)

        Citizen.Wait(1000)

        HideMeter()

        Citizen.Wait(2000)
        IsAlreadyPlaying = false
        TriggerServerEvent("AxeOfFury:leave", id)
    end)
end

RegisterNetEvent("AxeOfFury:startSound", function(coords, arcadePropHammer, targetPlayer)
    if (not GM.AxeOfFury.AxeFuryMachines[arcadePropHammer].Items or not DoesEntityExist(GM.AxeOfFury.AxeFuryMachines[arcadePropHammer].Items[1])) then
        return
    end

    PlaySoundAxeOfFury("Start_Game", coords)
    Citizen.Wait(500)

    local hammer = GM.AxeOfFury.AxeFuryMachines[arcadePropHammer].Items[1]
    local playerId = GetPlayerFromServerId(targetPlayer)
    if playerId == -1 then
        return
    end
    local playerPed = GetPlayerPed(playerId)


    AttachEntityToEntity(hammer, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true);
    Citizen.Wait(3500)

    local soundLoop = GetSoundId()
    PlaySoundFromCoord(soundLoop, "Power_Level_Loop", coords, "sum20_am_Axe_of_Fury_sounds", false, 15, false)

    local nbloop = 6
    for i = 1, nbloop do
        PlaySoundAxeOfFury("Button_Mash_Hit", coords)
        Citizen.Wait(1000)
    end

    Citizen.Wait(2000)
    StopSound(soundLoop)
    ReleaseSoundId(soundLoop)
end)

function PlaySoundAxeOfFury(audioName, coords)
    PlaySoundFromCoord(-1, audioName, coords, "sum20_am_Axe_of_Fury_sounds", false, 15, false)
end

RegisterNetEvent("AxeOfFury:updateScore", function(barHeightScore, screenScore, arcadePropCoords, hammerHitSound, soundResult, lightCoord, arcadePropHammer, hammerCoord, arcadePropHeading, hammerRotation, highScore)

    if not GM.AxeOfFury.AxeFuryMachines[arcadePropHammer].Items or not DoesEntityExist(GM.AxeOfFury.AxeFuryMachines[arcadePropHammer].Items[1]) then
        return
    end
    -- Draw score on vertical line
    BarScoreSync = barHeightScore

    PlaySoundAxeOfFury(hammerHitSound, arcadePropCoords)
    Citizen.Wait(100)

    -- Draw score on screen
    SetScore(screenScore, 1.0, 5.0, 2.0)
    -- Flash light
    GM:newThread(function()
        LightFlashEnd(lightCoord)
    end)
    PlaySoundAxeOfFury(soundResult, arcadePropCoords)

    Citizen.Wait(2500)
    -- Detach hammer

    local hammer = GM.AxeOfFury.AxeFuryMachines[arcadePropHammer].Items[1]

    DetachEntity(hammer)
    SetEntityCoords(hammer, hammerCoord.x, hammerCoord.y, hammerCoord.z)
    SetEntityHeading(hammer, arcadePropHeading)
    FreezeEntityPosition(hammer, true)
    SetEntityRotation(hammer, hammerRotation.x, hammerRotation.y, hammerRotation.z, 2, true)
    ---
    PlaySoundAxeOfFury("End_Game", arcadePropCoords)
    Citizen.Wait(2000)
    BarScoreSync = 1.5
    SetHighScore(highScore)
end)

--- STR LINE ---
function SetTextRenderLine()

	SetScriptGfxDrawOrder(4)
	SetScriptGfxDrawBehindPausemenu(true);
	DrawScaleformMovieFullscreen(ScaleformMeter, 255, 255, 255, 255, 0);
	SetTextRenderId(GetDefaultScriptRendertargetRenderId())

end

function ScaleFormMeterInitAxeOfFury()
    ScaleformMeter = RequestScaleformMovie("AXE_OF_FURY")
    while not HasScaleformMovieLoaded(ScaleformMeter) do
        Citizen.Wait(0)
    end
end

function DrawOnScaleformMeter()
    SetScriptGfxDrawOrder(4)
    SetScriptGfxDrawBehindPausemenu(true)
    DrawScaleformMovieFullscreen(ScaleformMeter, 255, 255, 255, 255, 0)
    SetTextRenderId(GetDefaultScriptRendertargetRenderId())
end

-- func_179
function SetMeterFillValue(param1)
    BeginScaleformMovieMethod(ScaleformMeter, "SET_METER_FILL_VALUE")
    ScaleformMovieMethodAddParamFloat(param1)
    EndScaleformMovieMethod()
end

-- func_185
function FlashButton()
    BeginScaleformMovieMethod(ScaleformMeter, "FLASH_BUTTON")
    EndScaleformMovieMethod()
end

-- func_201
function HideMeter()
    BeginScaleformMovieMethod(ScaleformMeter, "HIDE")
    EndScaleformMovieMethod()
end

-- func_219
function FlashMeter()
    BeginScaleformMovieMethod(ScaleformMeter, "FLASH_METER")
    EndScaleformMovieMethod()
end

-- func_221
function SetMeterBarValue(param1)
    BeginScaleformMovieMethod(ScaleformMeter, "SET_METER_BAR_VALUE")
    ScaleformMovieMethodAddParamFloat(param1)
    EndScaleformMovieMethod()
end

-- func_225
function SetButtonVisible(value)
    BeginScaleformMovieMethod(ScaleformMeter, "SET_BUTTON_VISIBLE")
    ScaleformMovieMethodAddParamBool(value)
    EndScaleformMovieMethod()
end

-- func_227
function SetMeterBarIconVisible(value)
    BeginScaleformMovieMethod(ScaleformMeter, "SET_METER_BAR_ICON_VISIBLE")
    ScaleformMovieMethodAddParamBool(value)
    EndScaleformMovieMethod()
end

-- func_237
function SetIsKeyBoardControl(value)
    BeginScaleformMovieMethod(ScaleformMeter, "SET_IS_KEYBOARD_CONTROL")
    ScaleformMovieMethodAddParamBool(value)
    EndScaleformMovieMethod()
end

-- func_238
function SetMeterBarLineVisible(value)
    BeginScaleformMovieMethod(ScaleformMeter, "SET_METER_BAR_LINE_VISIBLE")
    ScaleformMovieMethodAddParamBool(value)
    EndScaleformMovieMethod()
end

-- func_239
function ShowScale()
    BeginScaleformMovieMethod(ScaleformMeter, "SHOW")
    EndScaleformMovieMethod()
end

-- func_240
function SetScreenPosition(param1, parma2)
    BeginScaleformMovieMethod(ScaleformScreen, "SET_SCREEN_POSITION")
    ScaleformMovieMethodAddParamFloat(param1)
    ScaleformMovieMethodAddParamFloat(parma2)
    EndScaleformMovieMethod()
end


------------------------------------------------

--- SCREEN FORM ---
--Local_162.f_142 = func_36(func_41(1));
-- Local_162.f_142.f_9
function ScaleFormScreenInitAxeOfFury()
    RequestStreamedTextureDict("ArcadeUI_Axe_of_Fury", false)
    ScaleformScreen = RequestScaleformMovie("STRENGTH_TEST_SCORE")
    while not HasScaleformMovieLoaded(ScaleformScreen) do
        Citizen.Wait(0)
    end
end

-- func_21
function SetTextRenderScreen2()

    local strenghtArc2 = GetNamedRendertargetRenderId("arc_strenght_01a") --Local_162.f_142.f_1

    SetTextRenderId(strenghtArc2)
    SetScriptGfxDrawOrder(4)
    SetScriptGfxDrawBehindPausemenu(true)
    DrawInteractiveSprite("ArcadeUI_Axe_of_Fury", "SCORE_DISPLAY_AXE_OF_FURY", 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
    DrawScaleformMovie(ScaleformScreen, 0.4, 0.375, 0.525, 0.575, 255, 255, 255, 255, 0)
    SetTextRenderId(GetDefaultScriptRendertargetRenderId())

end

-- func_24 Set Score on top of the screen
function SetHighScore(value1)
    BeginScaleformMovieMethod(ScaleformScreen, "SET_INSTANT_HIGH_SCORE")
    ScaleformMovieMethodAddParamInt(math.floor(value1))
    EndScaleformMovieMethod()
end

-- func_28
function SetScore(time, countUpDuration, holdDuration, countDownDuration)
    BeginScaleformMovieMethod(ScaleformScreen, "SET_SCORE")
    ScaleformMovieMethodAddParamInt(math.floor(time))
    ScaleformMovieMethodAddParamFloat(countUpDuration)
    ScaleformMovieMethodAddParamFloat(holdDuration)
    ScaleformMovieMethodAddParamFloat(countDownDuration)
    EndScaleformMovieMethod()
end

-- func_31
function SetInstantScore(value)
    BeginScaleformMovieMethod(ScaleformScreen, "SET_INSTANT_SCORE")
    ScaleformMovieMethodAddParamInt(math.floor(value))
    EndScaleformMovieMethod()
end

function AxeOfFurySetGender()
    TriggerEvent("skinchanger:getSkin", function(skin)
      PlayerGender = skin.sex == 0 and "male" or "female"
    end)
end

function CalculateScoreBar(meterValue, scoreMultiplier)
    -- scoreBar = 1.5 (min) to 0.5 (max)
    -- meterValue 0.0 to 1.0
    -- scoreScreen 0 to 1100

    -- Check muscle value
    local muscleStatus = 0
    TriggerEvent("esx_status:getStatus", "muscle", function(status)
        muscleStatus = status.val/10000000  -- 0.0 to 0.1
    end)

    local score = (1.0-(math.abs(0.5-meterValue)*2.0))
    score = score * scoreMultiplier * (0.9 + muscleStatus) -- ScoreMultiplier is when you hit to fill the bar
    local scoreBar = (1.5 - score) + 0.05 -- 0.05 small offset to place the bar correctly
    local scoreScreen = 1100.0*score

    return scoreBar, scoreScreen
end


function GetHammerSound(barHeightScore)
    if barHeightScore <= 0.7 then
        return "Hit_02"
    elseif barHeightScore <= 0.9 then
        return "Hit_01"
    else
        return "Hit_00"
    end
end

function ReactionScore(score)
	local animationResult
    local taskTransitionResult

    if (score > 825) then
        animationResult = "RESULT_PERFECT"
        taskTransitionResult = "PerfectResult"
	elseif (score > 550 and score <= 825) then
        animationResult = "RESULT_GOOD"
        taskTransitionResult = "GoodResult"
	elseif (score > 275 and score <= 550) then
        animationResult = "RESULT_AVERAGE"
        taskTransitionResult = "AverageResult"
	elseif (score <= 275) then
        animationResult = "RESULT_BAD"
        taskTransitionResult = "BadResult"
    end

	return animationResult, taskTransitionResult
end

--Play All animation + facial
function PlayAnimationAxeOfFury(animaion, duration)
    local playerPed = PlayerPedId()
    local facialAnim = animaion .. "_FACIAL"
    local animDuration = duration or 2500

    PlayFacialAnim(playerPed, facialAnim, AnimDict)
    TaskPlayAnim(playerPed, AnimDict, animaion, 8.0, -8.0, animDuration, 1, 0, false, false, false)
end


function ScoreSound(score)

	local scorewhatisthat = nil
    local soundStage = nil
    local soundResult = nil

    if score == 1100 then
        scorewhatisthat = "STRENGTH_SCORE_1000_1100"
        soundStage = "Stage_00"
        soundResult = "Result_05"
	elseif (score >= 1000 and score < 1100) then
        scorewhatisthat = "STRENGTH_SCORE_1000_1100"
        soundStage = "Stage_01"
        soundResult = "Result_04"
	elseif (score >= 700 and score <= 999) then
        scorewhatisthat = "STRENGTH_SCORE_700_999"
        soundStage = "Stage_02"
        soundResult = "Result_03"
	elseif (score >= 500 and score <= 699) then
        scorewhatisthat = "STRENGTH_SCORE_500_699"
        soundStage = "Stage_03"
        soundResult = "Result_02"
	elseif (score >= 300 and score <= 499) then
        scorewhatisthat = "STRENGTH_SCORE_300_499"
        soundStage = "Stage_04"
        soundResult = "Result_01"
	elseif (score >= 100 and score <= 299) then
        scorewhatisthat = "STRENGTH_SCORE_100_299"
        soundStage = "Stage_05"
        soundResult = "Result_00"
	elseif (score >= 1 and score <= 99) then
        scorewhatisthat = "STRENGTH_SCORE_0_99"
        soundStage = "Stage_06"
        soundResult = "Result_00"
	else
        scorewhatisthat = "STRENGTH_SCORE_0"
        soundStage = "Stage_07"
        soundResult = "Result_00"
    end
    return soundStage, soundResult
end

function LightFlashEnd(lightCoord)

    local nbloop = 8
    local light = `sum_prop_arcade_str_lighton`

    for i = 1, nbloop do
        CreateModelHide(lightCoord, 3.0, light, true)
        Citizen.Wait(200)
        RemoveModelHide(lightCoord, 3.0, light, 0)
        Citizen.Wait(200)
        CreateModelHide(lightCoord, 3.0, light, true)
    end
end