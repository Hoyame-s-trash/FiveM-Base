local CurrentWeight = 0
local currentLoopWeight = false

RegisterNUICallback("WeightChanged", function(data, cb)
    CurrentWeight = tonumber(data.weightData)
    if type(CurrentWeight) ~= "number" then return end
    if CurrentWeight >= Config.Weight.MaxPlayerWeight then
        if not currentLoopWeight then
            LoopMoveSpeed()
        end
    else
        currentLoopWeight = false
    end
    cb( "ok" )
end)

function LoopMoveSpeed()
    currentLoopWeight = true
    Citizen.CreateThread(function()
        while currentLoopWeight do
            SetPedMoveRateOverride(PlayerPedId(), Config.Weight.MaxPlayerWeight/(CurrentWeight*Config.Weight.OverweightMultiplier))
			
			if CurrentWeight >= Config.Weight.MaxPlayerWeight*Config.Weight.OverweightDisableJump then
				DisableControlAction(0, 22, true)
			end
			
            Citizen.Wait(0)
        end
    end)
end






RegisterNetEvent("ls-inventory:c:addItem", function(item)
    SendNUIMessage({
        action = "AddItem",
        itemData = item,
    })
end)

RegisterNetEvent("ls-inventory:c:removeItem", function(itemID, Amount)
    SendNUIMessage({
        action = "RemoveItem",
        itemID = itemID,
        amount = Amount
    })
end)

RegisterNetEvent("ls-inventory:c:updateItem", function(itemID, inventoryId, newData)
    SendNUIMessage({
        action = "UpdateItem",
        itemID = itemID,
        inventoryID = inventoryId,
        newD = newData
    })
end)

RegisterNUICallback("AddItemFromAttachment", function(data, cb)
    TriggerServerEvent("ls-inventory:s:AddItemFromAttachment", data)
end)

RegisterNUICallback("ItemChanged", function(data, cb)
    CheckAndRefreshPlayer(data)

    data.itemD.loc.x = splitText(data.toLocation, "-")[1]
    data.itemD.loc.y = splitText(data.toLocation, "-")[2]
    data.itemD.loc.r = data.toRotate
    data.itemD.slotId = data.toSlot
    data.itemD._parent = data.toParent

    TriggerServerEvent("ls-inventory:s:ItemChanged", data)
end)

RegisterNUICallback("FastUseChanged", function(data, cb)
    TriggerServerEvent("ls-inventory:s:FastUseChanged", data)
end)

RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("ls-inventory:s:UseItem", data)
end)

RegisterNUICallback("UseItemContext", function(data, cb)
    TriggerServerEvent("ls-inventory:s:UseItemContext", data)
end)

RegisterNUICallback("RemoveItem", function(data, cb)
    TriggerServerEvent("ls-inventory:s:RemoveItem", data)
end)


RegisterNUICallback("UpdateItem", function(data, cb)
    TriggerServerEvent("ls-inventory:s:UpdateItem", data)
end)

function splitText(s, sep)
    local fields = {}
    
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    
    return fields
end



--------------------------------------------------
--------------                      --------------
----------     ATTACHMENT FUNCTIONS     ----------
--------------                      --------------
--------------------------------------------------


WeaponObject = nil
cam = nil
local EditingWeapon = false

function getWeaponFOV(hash)
    local ped = GetPlayerPed(-1)

    if GetWeapontypeGroup(hash) == -957766203 then
        return 30.0
    end
    if GetWeapontypeGroup(hash) == 416676503 then
        return 20.0
    end
    if GetWeapontypeGroup(hash) == 860033945 then
        return 35.0
    end
    if GetWeapontypeGroup(hash) == 970310034 then
        return 27.0
    end
    if GetWeapontypeGroup(hash) == 1159398588 then
        return 30.0
    end
    if GetWeapontypeGroup(hash) == -1212426201 then
        return 40.0
    end
    if GetWeapontypeGroup(hash) == -1569042529 then
        return 40.0
    end

    return 35.0
end

RegisterNUICallback("attachmentOpen", function(data, cb)
    if EditingWeapon then return end

    CreateWeaponAttachmentMenu(data)
    
    if Config.Blur then
        TriggerScreenblurFadeOut(250)
    end

    cb( "ok" )
    
end)

function CreateWeaponAttachmentMenu(data)
    local weaponAttachment = {}

    local coords = vector3(14.7363, -1091.3844, 29.7970)
    local x, y, z = table.unpack(coords)

    local lastRotation = vector3(0.0, 0.0, 0.0)

    RequestWeaponAsset(GetHashKey(data.weapon), 31, 0)

    while not HasWeaponAssetLoaded(GetHashKey(data.weapon)) do Citizen.Wait(10) end

    WeaponObject = CreateWeaponObject(GetHashKey(data.weapon),  120, x, y, z , true, 1.0, 0)
    SetEntityHeading(WeaponObject, 337.0456)

    SetEntityRotation(WeaponObject, lastRotation)
    FreezeEntityPosition(WeaponObject, true)
     
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 14.1498, -1092.9255, 29.7970, 0.0 ,0.0, 0, 60.00, false, 0)
    PointCamAtEntity(cam, WeaponObject, 0,0,0, true)
       
    SetCamFov(cam, getWeaponFOV(GetHashKey(data.weapon)))
    SetCamActive(cam, true)
    RenderScriptCams(cam, false, 1, true, true)

    Citizen.Wait(100)

    offset = true

    for k,v in pairs(Config.WeaponAttachment.Bones) do

        local bi = GetEntityBoneIndexByName(WeaponObject, k)
        if bi ~= -1 then
            local cord = GetWorldPositionOfEntityBone(entity, bi)
            local ok, xx, yy = GetScreenCoordFromWorldCoord(cord[1], cord[2], cord[3])
            if offset then
                xx = xx * 100
                yy = yy * 100
                
                if (yy > 45) then
                    yy = yy + 10.0
                else
                    yy = yy - 10.0
                end
                if (xx > 50) then
                    xx = xx + 10.0
                else
                    xx = xx - 10.0
                end
            end
            weaponAttachment[k] = { x = xx, y = yy, label = v.label, attach_component = v.attach_component, slot = v.slot, global_name= v.global_name } 
        end
    end

    SendNUIMessage({
        action = "attachment",
        attachmentList = weaponAttachment
    })
    Citizen.Wait(50)
    EditingWeapon = true
    SetupAttachment()
end

function SetupAttachment()
    Citizen.CreateThread(function ()
        while EditingWeapon do
            local weaponAttachment = {}

            x,y,z = table.unpack(GetEntityCoords(weaponObject, true))
   
            NetworkOverrideClockTime(1, 00, 00)
            DrawSpotLight(x , y + 10.0, z + 10.2, 10, -10.0, -15.0, 255, 255, 255, 25.0, 4.0, 2.0, 20.0, 0.0)
            DisplayRadar(false)

            local offset = false
            for k,v in pairs(Config.WeaponAttachment.Bones) do
                local bi = GetEntityBoneIndexByName(WeaponObject, k)
                if bi ~= -1 then
                    local cord = GetWorldPositionOfEntityBone(WeaponObject, bi)
                    local _, xx, yy = GetScreenCoordFromWorldCoord(cord[1], cord[2], cord[3])
                    if offset then
                        xx = xx * 100
                        yy = yy * 100
                        
                        if (yy > 45) then
                            yy = yy + 10.0
                        else
                            yy = yy - 10.0
                        end
                        if (xx > 50) then
                            xx = xx + 10.0
                        else
                            xx = xx - 10.0
                        end
                    end
                    weaponAttachment[k] = { x = xx, y = yy, label = v.label, attach_component = v.attach_component, slot = v.slot, add_left=v.add_left, add_top=v.add_top, global_name= v.global_name } 
                end 
            end

            SendNUIMessage({
                action = "updateAttachment",
                attachmentList = weaponAttachment
            })

            Citizen.Wait(0)
        end
    end)
end

RegisterNUICallback("updateAttachRotate", function(data, cb)

    SetEntityRotation(WeaponObject, GetEntityRotation(WeaponObject).x, GetEntityRotation(WeaponObject).y+data.y, GetEntityRotation(WeaponObject).z+data.x)

    cb( "ok" )
end)

RegisterNUICallback("addAttachment", function(data, cb)

    local result = GetItemComponent(data.name, data.component)

    local model = GetWeaponComponentTypeModel(result)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(10) end
    if data.attach_component ~= "tint" then
        GiveWeaponComponentToWeaponObject(WeaponObject, GetHashKey(result))
    else
        SetPedWeaponTintIndex(WeaponObject, result)
    end

    SetModelAsNoLongerNeeded(model)

    cb( "ok" )
end)

RegisterNUICallback("removeAttachment", function(data, cb)

    local result = GetItemComponent(data.name, data.component)

    local model = GetWeaponComponentTypeModel(result)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(10) end

    if data.attach_component ~= "tint" then
        RemoveWeaponComponentFromWeaponObject(WeaponObject, GetHashKey(result))
    else
        SetPedWeaponTintIndex(WeaponObject, 0)
    end

    SetModelAsNoLongerNeeded(model)

    if data.attach_component == "clip" then
        local result = GetItemComponent(data.name, "clip_default")
    
        local model = GetWeaponComponentTypeModel(result)
        RequestModel(model)
        while not HasModelLoaded(model) do Citizen.Wait(10) end
        GiveWeaponComponentToWeaponObject(WeaponObject, GetHashKey(result))
        SetModelAsNoLongerNeeded(model)
    end

    cb( "ok" )
end)

RegisterNUICallback("closeNUI", function()
    SetTimecycleModifier('default')

    DeleteObject(WeaponObject)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    RenderScriptCams(false, false, 1, true, true)
    EditingWeapon = false
end)





--------------------------------------------------
--------------                      --------------
----------      CLOTHING FUNCTIONS      ----------
--------------                      --------------
--------------------------------------------------

if not Config.FivemAppeareance then
    skinData = {}

    function SetupSkin()
        Callback.Functions.TriggerCallback("ls-inventoryhud:s:getSkin", function(_, skin)
            skinData = json.decode(skin)
            Wait(1500)
            TriggerEvent("ls-inventoryhud:c:refreshClothes")

            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(5000)
                    SendNUIMessage({
                        action = "refreshClothes"
                    })
                end
            end)
        end)

        CreateClothLoop()
    end

    function DeleteSkin()
        skinData = {}
    end

    RegisterNetEvent("ls-inventoryhud:c:refreshClothes")
    AddEventHandler("ls-inventoryhud:c:refreshClothes", function()
        SendNUIMessage({action = "refreshClothesFully"})
    end)
	
	RegisterNetEvent("ls-inventoryhud:c:resetupSkin")
    AddEventHandler("ls-inventoryhud:c:resetupSkin", function()
		Callback.Functions.TriggerCallback("ls-inventoryhud:s:getSkin", function(_, skin)
            skinData = json.decode(skin)
            Wait(1500)
            TriggerEvent("ls-inventoryhud:c:refreshClothes")

            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(5000)
                    SendNUIMessage({
                        action = "refreshClothes"
                    })
                end
            end)
        end)
    end)

    function IncurCooldown(ms)
        Citizen.CreateThread(function()
            Cooldown = true Wait(ms) Cooldown = false
        end)
    end

    function PlayToggleEmote(e, cb)
        local Ped = PlayerPedId()
        while not HasAnimDictLoaded(e.Dict) do RequestAnimDict(e.Dict) Wait(100) end
        if IsPedInAnyVehicle(Ped) then e.Move = 51 end
        TaskPlayAnim(Ped, e.Dict, e.Anim, 3.0, 3.0, e.Dur, e.Move, 0, false, false, false)
        local Pause = e.Dur-500 if Pause < 500 then Pause = 500 end
        IncurCooldown(Pause)
        Wait(Pause) -- Lets wait for the emote to play for a bit then do the callback.
        cb()
    end

    function IsMpPed(ped)
        local Male = GetHashKey("mp_m_freemode_01") local Female = GetHashKey("mp_f_freemode_01")
        local CurrentModel = GetEntityModel(ped)
        if CurrentModel == Male then return "Male" elseif CurrentModel == Female then return "Female" else return false end
    end

    RegisterNUICallback("changeClothes", function(data, cb)
        local Ped = PlayerPedId()
        local Gender = IsMpPed(Ped)

        if skinData == nil then return end

        if isInventoryPlayer(data.inventoryid) then
            if not data.dress then
                if not data.animation then
                    local Clothe = Config.ClothingWear[data.clothingname]
                    if (Clothe.Drawable ~= nil) then
                        if type(Clothe.Table[Gender]) == "table" then
                            if Clothe.DrawableCheck ~= nil then
                                local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                if variations == nil then variations = 15 end
                                local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                if skinData[Clothe.DatabaseName].item ~= variations then
                                    skinData[Clothe.DatabaseName].item = variations
                                    skinData[Clothe.DatabaseName].texture = Texture
                                end
                            end
                        else
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Table[Gender] then
                                skinData[Clothe.DatabaseName].item = Clothe.Table[Gender]
                                skinData[Clothe.DatabaseName].texture = 0
                            end
                        end

                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                            skinData[Clothe.DatabaseName].item = 0
                            skinData[Clothe.DatabaseName].texture = 0
                        end
                    end
                    CheckData()
                else
                    local Clothe = Config.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        if (Clothe.Drawable ~= nil) then
                            local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], Texture, 0)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Table[Gender] then
                                skinData[Clothe.DatabaseName].item = Clothe.Table[Gender]
                                skinData[Clothe.DatabaseName].texture = Texture
                            end
                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName].item = 0
                                skinData[Clothe.DatabaseName].texture = 0
                            end
                        end
                        CheckData()
                    end)
                end
            else
                if not data.animation then
                    local info = data.clothedata
                    local Clothe = Config.ClothingWear[data.clothingname]
                    if info ~= nil then
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        end
                    else
                        if (Clothe.Drawable ~= nil) then
                            if type(Clothe.Table[Gender]) == "table" then
                                if Clothe.DrawableCheck ~= nil then
                                    local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                    if variations == nil then variations = 15 end
                                    local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                    SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                    if skinData[Clothe.DatabaseName].item ~= variations then
                                        skinData[Clothe.DatabaseName].item = variations
                                        skinData[Clothe.DatabaseName].texture = Texture
                                    end
                                end
                            else
                                SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                                if skinData[Clothe.DatabaseName].item ~= Clothe.Table[Gender] then
                                    skinData[Clothe.DatabaseName].item = Clothe.Table[Gender]
                                    skinData[Clothe.DatabaseName].texture = 0
                                end
                            end

                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName].item = 0
                                skinData[Clothe.DatabaseName].texture = 0
                            end
                        end
                    end
                else
                    local Clothe = Config.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        local info = data.clothedata
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        end
                        CheckData()
                    end)
                end
            end
        else
            TriggerServerEvent("ls-inventoryhud:s:changeClothes", data)
        end
    end)

    RegisterNetEvent("ls-inventoryhud:c:changeClothes", function(data)
        SendNUIMessage({
            action = "undressSecondChar",
            animation = data.animation,
            dress = data.dress,
            inventoryid = data.inventoryid,
            clothingname = data.clothingname,
            clothedata = data.clothedata,
            itemdata = data.itemdata,
        })
    end)

    function CheckData()
        Callback.Functions.TriggerCallback("ls-inventoryhud:s:getSkin", function(model, skin)
            model = GetEntityModel(PlayerPedId())
            
            local secondData = json.decode(skin)
            if secondData ~= nil then
                local realClothing = skinData or {}
                
                local anyChanges = false
                for k,v in pairs(secondData) do
                    if not FindAndCheck(k) then
                        realClothing[k] = v
                        anyChanges = true
                    end
                end

                if anyChanges then
                    TriggerEvent('qb-clothing:client:loadPlayerClothing', realClothing)
                    TriggerServerEvent("qb-clothing:saveSkin", model, json.encode(realClothing))
					
					skinData = realClothing
                end
            end
        end)
    end

    function FindAndCheck(key)
        for _,v in pairs(Config.ClothingWear)do
            if v.DatabaseName == key then
                return true
            end
        end
        return false
    end
    function CreateClothLoop()
        Citizen.CreateThread(function()
            while true do
                local tempValue = skinData
                Wait(5000)
                if skinData ~= nil then
                    local anyDiffrence = false
                    for k,v in pairs(skinData) do
                        if tempValue[k] ~= nil then
                            if tempValue[k].item ~= nil then
                                if type(tempValue) ~= "table" then
                                    anyDiffrence = true
                                    break
                                end
                                if tempValue[k] == nil then
                                    anyDiffrence = true
                                    break
                                end
                                if tempValue[k].item == nil or tempValue[k].texture == nil then
                                    anyDiffrence = true
                                    break
                                end
                                if tempValue[k].item ~= v.item or tempValue[k].texture ~= v.texture then
                                    anyDiffrence = true
                                    break
                                end
                            end
                        end
                    end

                    if anyDiffrence then
                        CheckData()
                    end
                end
            end
        end)
    end

    RegisterNetEvent("ls-inventoryhud:c:giveClothesAsItem")
    AddEventHandler("ls-inventoryhud:c:giveClothesAsItem", function(data, previousSkinData, isFirst)
        if isFirst then
            for key,v in pairs(Config.ClothingWear) do
                if data[v.DatabaseName] ~= nil and data[v.DatabaseName].item >= 0 then
                    local itemData = data[v.DatabaseName]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.item == 40 or itemData.item == 41 or itemData.item == 44 or itemData.item == 45 or itemData.item == 81 or itemData.item == 82 or itemData.item == 85 or itemData.item == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.item == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        else
            for key,v in pairs(Config.ClothingWear) do
                local pre = json.decode(previousSkinData)
                if (data[v.DatabaseName].item ~= pre[v.DatabaseName].item or data[v.DatabaseName].texture ~= pre[v.DatabaseName].texture) then
                    local itemData = data[v.DatabaseName]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.item == 40 or itemData.item == 41 or itemData.item == 44 or itemData.item == 45 or itemData.item == 81 or itemData.item == 82 or itemData.item == 85 or itemData.item == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.item == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        end
    end)
else
    skinData = {}

    function SetupSkin() 
        skinData = exports["fivem-appearance"]:getPedAppearance(PlayerPedId())
        Wait(1500)
        TriggerEvent("ls-inventoryhud:c:refreshClothes")

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5000)
                SendNUIMessage({
                    action = "refreshClothes"
                })
            end
        end)

        CreateClothLoop()
    end

    function DeleteSkin()
        skinData = {}
    end
	
	RegisterNetEvent("ls-inventoryhud:c:resetupSkin")
    AddEventHandler("ls-inventoryhud:c:resetupSkin", function()
		SetupSkin()
    end)

    RegisterNetEvent("ls-inventoryhud:c:refreshClothes")
    AddEventHandler("ls-inventoryhud:c:refreshClothes", function()
		skinData = exports["fivem-appearance"]:getPedAppearance(PlayerPedId())
        Wait(1500)
        TriggerEvent("ls-inventoryhud:c:refreshClothes")
    end)

    function IncurCooldown(ms)
        Citizen.CreateThread(function()
            Cooldown = true Wait(ms) Cooldown = false
        end)
    end

    function PlayToggleEmote(e, cb)
        local Ped = PlayerPedId()
        while not HasAnimDictLoaded(e.Dict) do RequestAnimDict(e.Dict) Wait(100) end
        if IsPedInAnyVehicle(Ped) then e.Move = 51 end
        TaskPlayAnim(Ped, e.Dict, e.Anim, 3.0, 3.0, e.Dur, e.Move, 0, false, false, false)
        local Pause = e.Dur-500 if Pause < 500 then Pause = 500 end
        IncurCooldown(Pause)
        Wait(Pause) -- Lets wait for the emote to play for a bit then do the callback.
        cb()
    end

    function IsMpPed(ped)
        local Male = GetHashKey("mp_m_freemode_01") local Female = GetHashKey("mp_f_freemode_01")
        local CurrentModel = GetEntityModel(ped)
        if CurrentModel == Male then return "Male" elseif CurrentModel == Female then return "Female" else return false end
    end

    RegisterNUICallback("changeClothes", function(data, cb)
        local Ped = PlayerPedId()
        local Gender = IsMpPed(Ped)

        if skinData == nil then return end
		
		print(json.encode(data))

        if isInventoryPlayer(data.inventoryid) then
            if not data.dress then
                if not data.animation then
                    local Clothe = Config.ClothingWear[data.clothingname]
                    if (Clothe.Drawable ~= nil) then
                        if type(Clothe.Table[Gender]) == "table" then
                            if Clothe.DrawableCheck ~= nil then
                                local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                if variations == nil then variations = 15 end
                                local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= variations then
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = variations
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = Texture
                                end

                                --data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]
                            end
                        else
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Table[Gender] then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = Clothe.Table[Gender]
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                            end
                        end

                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Prop then
                            skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = 0
                            skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                        end
                    end
                    CheckData()
                else
                    local Clothe = Config.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        if (Clothe.Drawable ~= nil) then
                            local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], Texture, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Table[Gender] then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = Clothe.Table[Gender]
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = Texture
                            end
                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Prop then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = 0
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                            end
                        end
                        CheckData()
                    end)
                end
            else
                if not data.animation then
                    local info = data.clothedata
                    local Clothe = Config.ClothingWear[data.clothingname]
                    if info ~= nil then
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        end
                    else
                        if (Clothe.Drawable ~= nil) then
                            if type(Clothe.Table[Gender]) == "table" then
                                if Clothe.DrawableCheck ~= nil then
                                    local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                    if variations == nil then variations = 15 end
                                    local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                    SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                    if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= variations then
                                        skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = variations
                                        skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = Texture
                                    end
                                end
                            else
                                SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                                if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Table[Gender] then
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = Clothe.Table[Gender]
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                                end
                            end

                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Prop then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = 0
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                            end
                        end
                    end
                else
                    local Clothe = Config.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        local info = data.clothedata
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        end
                        CheckData()
                    end)
                end
            end
        else
            TriggerServerEvent("ls-inventoryhud:s:changeClothes", data)
        end
    end)

    RegisterNetEvent("ls-inventoryhud:c:changeClothes", function(data)
        SendNUIMessage({
            action = "undressSecondChar",
            animation = data.animation,
            dress = data.dress,
            inventoryid = data.inventoryid,
            clothingname = data.clothingname,
            clothedata = data.clothedata,
            itemdata = data.itemdata,
        })
    end)

    function CheckData()
        local secondData = exports["fivem-appearance"]:getPedAppearance(PlayerPedId())
        if secondData ~= nil then
            local realClothing = skinData
            
            local anyChanges = false
            for k,v in pairs(secondData) do
                if k ~= "components" or k ~= "props" then
					if type(v) == "table" then
						for key,value in pairs(v) do
							if not FindAndCheck(value) then
								realClothing[k][key] = value
								anyChanges = true
							end
						end
					end
                end
            end
			
			Citizen.Wait(250)
            if anyChanges then
                TriggerServerEvent('fivem-appearance:server:saveAppearance', realClothing)
                for k,v in pairs(realClothing) do
                    if k == "components" then
                        exports["fivem-appearance"]:setPedComponents(v)
                    elseif k == "props" then
                        exports["fivem-appearance"]:setPedProps(v)
                    end
                end
                
            end
        end
    end

    function FindAndCheck(key)
        for _,v in pairs(Config.ClothingWear)do
            if v.DatabaseName == key then
                return true
            end
        end
        return false
    end
    function CreateClothLoop()
        Citizen.CreateThread(function()
            while true do
                local tempValue = skinData
                Wait(5000)
                if skinData ~= nil then
                    local anyDiffrence = false
                    for k,v in pairs(skinData) do
                        if k == "components" or k == "props" then 
                            if tempValue[k] ~= nil then
                                for key,value in pairs(v) do
                                    if value.drawable ~= nil then
                                        if type(tempValue) ~= "table" then
                                            anyDiffrence = true
                                            break
                                        end
                                        if value == nil then
                                            anyDiffrence = true
                                            break
                                        end
                                        if value.drawable == nil or value.texture == nil then
                                            anyDiffrence = true
                                            break
                                        end
                                        if tempValue[k][key].drawable ~= value.drawable or tempValue[k][key].texture ~= value.texture then
                                            anyDiffrence = true
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if anyDiffrence then
                        CheckData()
                    end
                end
            end
        end)
    end

    RegisterNetEvent("ls-inventoryhud:c:giveClothesAsItem")
    AddEventHandler("ls-inventoryhud:c:giveClothesAsItem", function(data, previousSkinData, isFirst)
        if isFirst then
            for key,v in pairs(Config.ClothingWear) do
                if data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)] ~= nil and data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)].drawable >= 0 then
                    local itemData = data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData.drawable, texture=itemData.texture},
                            ["Female"] = {id= itemData.drawable, texture=itemData.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData.drawable, texture=itemData.texture},
                            ["Female"] = {id= itemData.drawable, texture=itemData.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.drawable == 40 or itemData.drawable == 41 or itemData.drawable == 44 or itemData.drawable == 45 or itemData.drawable == 81 or itemData.drawable == 82 or itemData.drawable == 85 or itemData.drawable == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.drawable == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        else
            for key,v in pairs(Config.ClothingWear) do
                local pre = previousSkinData
                local newItem = data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]
                local oldItem = pre[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]
                if (newItem.drawable ~= oldItem.drawable or newItem.texture ~= oldItem.texture) then
                    local itemData = newItem

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= newItem.drawable, texture=newItem.texture},
                            ["Female"] = {id= newItem.drawable, texture=newItem.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= newItem.drawable, texture=newItem.texture},
                            ["Female"] = {id= newItem.drawable, texture=newItem.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.drawable == 40 or itemData.drawable == 41 or itemData.drawable == 44 or itemData.drawable == 45 or itemData.drawable == 81 or itemData.drawable == 82 or itemData.drawable == 85 or itemData.drawable == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.drawable == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        end
    end)

    function CheckAndGetDrawable(item)
        if item.TypeItem == "props" then
            return item.Prop
        else
            return item.Drawable
        end
    end

    function FFSI(table, id, type)
        if type == "props" then
            for k,v in pairs(table[type]) do
                if id == v.prop_id then
                    return k
                end 
            end
        else
            for k,v in pairs(table[type]) do
                if id == v.component_id then
                    return k
                end 
            end
        end
    end
end

RegisterNUICallback("checkPrice", function(data, cb)
    Callback.Functions.TriggerCallback("ls-inventoryhud:s:checkPrice", function(value)
        if (value) then
            Config.Notify("You bought an item!", "success")
        else
            Config.Notify("You not enough money to bought!", "error")
        end
        cb(value)
    end, data)
end)