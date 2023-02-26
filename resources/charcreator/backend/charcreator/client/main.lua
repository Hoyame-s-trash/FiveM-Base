ESX = exports['believer']:getSharedObject()

if not IsDuplicityVersion() then -- Only register this event for the client
    AddEventHandler('esx:setPlayerData', function(key, val, last)
        if GetInvokingResource() == 'believer' then
            ESX.PlayerData[key] = val
            if OnPlayerData then
                OnPlayerData(key, val, last)
            end
        end
    end)

    RegisterNetEvent('esx:playerLoaded', function(xPlayer, isNew, skin)
        ESX.PlayerData = xPlayer
        ESX.PlayerLoaded = true
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        ESX.PlayerLoaded = false
        ESX.PlayerData = {}
    end)
end

local new = false

AddEventHandler('esx:onPlayerSpawn', function()
    if ESX.PlayerData.firstName == 'John' and ESX.PlayerData.lastName == 'Doe' then
        new = true

        createCharcreator(new)
    end
end)

function createCharcreator(new)
    local ped = PlayerPedId()

    TriggerServerEvent("main:owndimension", true)

    if new then
        SetEntityCoordsNoOffset(ped, Config_charcreator.location.x, Config_charcreator.location.y, Config_charcreator.location.z)
        SetEntityHeading(ped, Config_charcreator.location.h)
    end

    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local offset = offsetPosition(coords.x, coords.y, GetEntityHeading(ped), 2.4)
    local targetPositionFly = vector3(offset.x, offset.y, coords.z + 0.2)
    local targetPositionPoint = vector3(coords.x, coords.y, coords.z + 0.2)

    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')

    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 500, true, true)

    SetNuiFocus(true, true)

    SendNUIMessage({
        action = 'pushpages',
    })

    SendNUIMessage({
        action = 'setCategories',
        categories = json.encode(Config_charcreator.categories, {indent = true})
    })

    SendNUIMessage({
        action = 'setdata',
        data = json.encode(getCharacter())
    })
end

RegisterNUICallback('charcreator:change', function(data)
    if Config_charcreator.refreshComponent[data.key] then
        for k,v in pairs(Config_charcreator.refreshComponent[data.key]) do
            SendNUIMessage({
                action = 'refreshComponent',
                component = v,
                data = json.encode(getCharacter()[v])
            })    
        end
    end

    TriggerEvent('skinchanger:change', data.key, tonumber(data.value))
end)

function getCharacter()
    local Character = {}

    TriggerEvent('skinchanger:getData', function(components, maxVals)
        for k,v in pairs(components) do
            Character[v.name] = {}
            Character[v.name].min = tostring(v.min)
            Character[v.name].value = tostring(v.value)
            Character[v.name].label = v.label
        end

        for k,v in pairs(maxVals) do
            Character[k].max = v
        end

        TriggerEvent('skinchanger:getSkin', function(skin)
            for k,v in pairs(skin) do
                Character[k].value = tostring(v)
            end
        end)    
    end)

    return Character
end

RegisterCommand('aaa', function()
    new = true

    createCharcreator(new)
end)

RegisterNUICallback("charcreator:submit", function(data)
    local ped = PlayerPedId()

    SendNUIMessage({
        action = "close",
    })

    if new then
        SetEntityCoordsNoOffset(ped, Config_charcreator.spawnpoint.x, Config_charcreator.spawnpoint.y, Config_charcreator.spawnpoint.z)
        SetEntityHeading(ped, Config_charcreator.spawnpoint.h)
        RenderScriptCams(false, false, 750, true, true)
        TriggerEvent('hud:notification', 'success', 'Erfolgreich', 'Willkommen auf gta5sanity.de, '..data.firstname..' '.. data.lastname.. '. Du hast deinen Charakter erfolgreich erstellt.', 10000)
    end

    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('skinchanger:save', skin)
    end)

    TriggerServerEvent('charcreator:save', data.firstname, data.lastname, data.date, data.sex, data.height)

    TriggerServerEvent("main:owndimension", false)
end)

RegisterNUICallback("charcreator:moveCam", function(data)
    local coords = GetEntityCoords(PlayerPedId())

    local get = getMovementData(data.slot)
    local offset = offsetPosition(coords.x, coords.y, get.heading + data.offset, get.distance)
    local targetPositionFly = vector3(offset.x, offset.y, get.camPos.z)
    local targetPositionPoint = vector3(coords.x, coords.y, get.pointPos.z)
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
end)

RegisterNUICallback('charcreator:zoom', function(data)
    zoomToSlot(data.slot)
end)

function zoomToSlot(slot)
    local coords = GetEntityCoords(PlayerPedId())

    local data = getMovementData(slot)
    local offset = offsetPosition(coords.x, coords.y, data.heading, data.distance)
    local targetPositionFly = vector3(offset.x, offset.y, data.camPos.z)
    local targetPositionPoint = vector3(coords.x, coords.y, data.pointPos.z)
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
end

function getMovementData(slot)
    local data = {
        heading = GetEntityHeading(PlayerPedId()),
        distance = 1,
        camPos = {
            z = GetEntityCoords(PlayerPedId()).z,
            y = GetEntityCoords(PlayerPedId()).y
        },
        pointPos = {
            z = GetEntityCoords(PlayerPedId()).z,
            y = GetEntityCoords(PlayerPedId()).y
        }
    }

    if slot == "identity" then
        data.distance = 2.4
        data.camPos.z = data.camPos.z + 0.2
        data.pointPos.z = data.pointPos.z + 0.2
    else
        data.camPos.z = data.camPos.z + 0.5
        data.pointPos.z = data.pointPos.z + 0.5
    end
    
    return data
end

function offsetPosition(x, y, rot, distance)
    local obj = {
        x = x + math.sin(-rot * math.pi / 180) * distance,
        y = y + math.cos(-rot * math.pi / 180) * distance
    }
    return obj
end