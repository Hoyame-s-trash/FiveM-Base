local CurrentWeight = 0
local currentLoopWeight = false

RegisterNUICallback("WeightChanged", function(data, cb)
    CurrentWeight = tonumber(data.weightData)
    if type(CurrentWeight) ~= "number" then return end
    if CurrentWeight >= BlueStarkInventory.Weight.MaxPlayerWeight then
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
            SetPedMoveRateOverride(PlayerPedId(), BlueStarkInventory.Weight.MaxPlayerWeight/(CurrentWeight*BlueStarkInventory.Weight.OverweightMultiplier))
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
    
    if BlueStarkInventory.Blur then
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

    for k,v in pairs(BlueStarkInventory.WeaponAttachment.Bones) do

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
            for k,v in pairs(BlueStarkInventory.WeaponAttachment.Bones) do
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

skinData = {}

function SetupSkin() 
    BlueStarkInventory.ServerFramework.TriggerServerCallback("esx_skin:getPlayerSkin", function(_, skin)
        
        if type(skin) ~= "table" then
            skinData = json.decode(skin)
        else
            skinData = skin
        end
        
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
                local Clothe = BlueStarkInventory.ClothingWear[data.clothingname]
                if (Clothe.Drawable ~= nil) then
                    if type(Clothe.Table[Gender]) == "table" then
                        if Clothe.DrawableCheck ~= nil then
                            local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                            if variations == nil then variations = 15 end
                            SetPedComponentVariation(Ped, Clothe.Drawable, variations, 0, 0)

                            if skinData[Clothe.DatabaseName] ~= variations then
                                skinData[Clothe.DatabaseName] = variations
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = 0
                            end
                        end
                    else
                        SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                        if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                            skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = 0
                        end
                    end

                elseif (Clothe.Prop ~= nil) then
                    ClearPedProp(Ped, Clothe.Prop)

                    if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                        skinData[Clothe.DatabaseName] = 0
                        local test = (Clothe.DatabaseName):gsub("_1", "_2")
                        skinData[test] = 0
                    end
                end
                CheckData()
            else
                local Clothe = BlueStarkInventory.ClothingWear[data.clothingname]
                PlayToggleEmote(Clothe.Emote, function()
                    if (Clothe.Drawable ~= nil) then
                        local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                        SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], Texture, 0)

                        if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                            skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = Texture
                        end
                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = 0
                        end
                    end
                    CheckData()
                end)
            end
        else
            if not data.animation then
                local info = data.clothedata
                local Clothe = BlueStarkInventory.ClothingWear[data.clothingname]
                if info ~= nil then
                    if Clothe.Drawable then
                        SetPedComponentVariation(Ped, Clothe.Drawable, info[Gender].id, 0, 2)
                        SetPedComponentVariation(Ped, Clothe.Drawable, info[Gender].id, info[Gender].texture, 0)
    
                        if skinData[Clothe.DatabaseName] ~= info[Gender].id then
                            skinData[Clothe.DatabaseName] = info[Gender].id
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = info[Gender].texture
                        end
                    else
                        SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)
    
                        if skinData[Clothe.DatabaseName] ~= info[Gender].id then
                            skinData[Clothe.DatabaseName] = info[Gender].id
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = info[Gender].texture
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

                                if skinData[Clothe.DatabaseName] ~= variations then
                                    skinData[Clothe.DatabaseName] = variations
                                    local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                    skinData[test] = Texture
                                end
                            end
                        else
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                            if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                                skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = 0
                            end
                        end

                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                            skinData[Clothe.DatabaseName].item = 0
                            skinData[Clothe.DatabaseName].texture = 0
                        end

                        if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                            skinData[Clothe.DatabaseName] = 0
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = 0
                        end
                    end
                end
            else
                local Clothe = BlueStarkInventory.ClothingWear[data.clothingname]
                PlayToggleEmote(Clothe.Emote, function()
                    local info = data.clothedata
                    if info ~= nil then
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)
    
                            if skinData[Clothe.DatabaseName] ~= info[Gender].id then
                                skinData[Clothe.DatabaseName] = info[Gender].id
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)
    
                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = info[Gender].texture
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
    
                                    if skinData[Clothe.DatabaseName] ~= variations then
                                        skinData[Clothe.DatabaseName] = variations
                                        local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                        skinData[test] = Texture
                                    end
                                end
                            else
                                SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)
    
                                if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                                    skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                                    local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                    skinData[test] = 0
                                end
                            end
    
                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)
    
                            if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName].item = 0
                                skinData[Clothe.DatabaseName].texture = 0
                            end
    
                            if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName] = 0
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = 0
                            end
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
    BlueStarkInventory.ServerFramework.TriggerServerCallback("esx_skin:getPlayerSkin", function(model, skin)
        model = GetEntityModel(PlayerPedId())
        
        local secondData = nil
        if type(skin) ~= "table" then
            secondData = json.decode(skin)
        else
            secondData = skin
        end
        
        if secondData ~= nil then
            local realClothing = skinData
            
            local anyChanges = false
            for k,v in pairs(secondData) do
                if not FindAndCheck(k) then
                    realClothing[k] = v
                    anyChanges = true
                end
            end

            if anyChanges then
                --TriggerServerEvent('esx_skin:save', realClothing)
            end
        end
    end)
end

function FindAndCheck(key)
    for _,v in pairs(BlueStarkInventory.ClothingWear)do
        if v.DatabaseName == key then
            return true
        end
    end
    return false
end
function CreateClothLoop()
    Citizen.CreateThread(function()
        while inventoryCreated do
            local tempValue = skinData
            Wait(5000)
            if skinData ~= nil then
                local anyDiffrence = false
                for k,v in pairs(skinData) do
                    if FindAndCheck(k) then
                        if tempValue[k] ~= v then
                            anyDiffrence = true
                            break
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

RegisterNetEvent("Inventory:giveClothesAsItem")
AddEventHandler("Inventory:giveClothesAsItem", function(data, previousSkinData, isFirst)
    if isFirst then
        for key,v in pairs(BlueStarkInventory.ClothingWear) do
            if data[v.DatabaseName] ~= nil then
                if data[v.DatabaseName] >= 0 then
                    local itemData = data[v.DatabaseName]
                    local itm = v.DatabaseName:gsub("_1", "_2")
                    local secItemdata = data[itm]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData, texture=secItemdata},
                            ["Female"] = {id= itemData, texture=secItemdata},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData, texture=secItemdata},
                            ["Female"] = {id= itemData, texture=secItemdata},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData == 40 or itemData == 41 or itemData == 44 or itemData == 45 or itemData == 81 or itemData == 82 or itemData == 85 or itemData == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        end
    else
        for key,v in pairs(BlueStarkInventory.ClothingWear) do
            local pre = previousSkinData
            local itm = v.DatabaseName:gsub("_1", "_2")
            local secItemdata = data[itm]
            if (data[v.DatabaseName] ~= pre[v.DatabaseName] or data[itm] ~= pre[itm]) then
                local itemData = data[v.DatabaseName]

                local info = {}
                if v.Drawable ~= nil then
                    info.clothData = {
                        ["drawable"] = v.Drawable,
                        ["Male"] = {id= itemData, texture=secItemdata},
                        ["Female"] = {id= itemData, texture=secItemdata},
                    }
                else
                    info.clothData = {
                        ["prop"] = v.Prop,
                        ["Male"] = {id= itemData, texture=secItemdata},
                        ["Female"] = {id= itemData, texture=secItemdata},
                    }
                end

                local givinItem = key
                if givinItem == "backpack" then
                    if (itemData == 40 or itemData == 41 or itemData == 44 or itemData == 45 or itemData == 81 or itemData == 82 or itemData == 85 or itemData == 86) then
                        givinItem = "bag1"
                    end
                elseif givinItem == "rig" then
                    if (itemData == 16) then
                        givinItem = "rig1"
                    end
                end

                TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
            end
        end
    end
end)


RegisterNUICallback("checkPrice", function(data, cb)
    Callback.Functions.TriggerCallback("ls-inventoryhud:s:checkPrice", function(value)
        if (value) then
            BlueStarkInventory.Notify("You bought an item!", "success")
        else
            BlueStarkInventory.Notify("You not enough money to bought!", "error")
        end
        cb(value)
    end, data)
end)