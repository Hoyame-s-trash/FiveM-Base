-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateLocalObject(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local obj = CreateObject(model, pos.x, pos.y, pos.z, false, false, false)
    SetModelAsNoLongerNeeded(model)
    return obj
end

-- This is just simple label to get Player server ID
--- @param ped entity
function GetPlayerServerIDFromPed(ped)
    return GetPlayerServerId(NetworkGetEntityOwner(ped))
end

-- return random value between 0.0 - 1.0
function GetRandomPercentage()
    return math.random(0, 100) / 100
end

-- Will return length of the table
--- @param table_ table
function GetLengthOfTable(table_)
    local length = 0
    for k, v in pairs(table_) do
        length = length + 1
    end
    return length
end

-- Will create a new blip on minimap
--- @param name string
--- @param blip int
--- @param coords vector3
--- @param options table
function CreateBlip(name, blip, coords, options)
    if options.type and options.type == -1 then
        return
    end

    local x, y, z = table.unpack(coords)
    local ourBlip = AddBlipForCoord(x, y, z)
    SetBlipSprite(ourBlip, options.blip or blip)
    if options.type then
        SetBlipDisplay(ourBlip, options.type)
    end
    if options.scale then
        SetBlipScale(ourBlip, options.scale)
    end
    if options.color then
        SetBlipColour(ourBlip, options.color)
    end
    if options.shortRange then
        SetBlipAsShortRange(ourBlip, options.shortRange)
    end
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(ourBlip)
    return ourBlip
end

-- Will create a networked object
--- @param hash string/integer
--- @param pos vector3
function CreateNetworkObject(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local obj = CreateObject(model, pos.x, pos.y, pos.z, true, false, false)
    SetModelAsNoLongerNeeded(model)
    return obj
end

-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateLocalPed(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local obj = CreatePed(4, model, pos.x, pos.y, pos.z, 0, false, true)
    SetModelAsNoLongerNeeded(model)
    return obj
end

-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateNetworkedPed(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local obj = CreatePed(4, model, pos.x, pos.y, pos.z, 0, true, false)
    SetModelAsNoLongerNeeded(model)
    return obj
end

--- Will register key action
--- @param fc function
--- @param uniqid string
--- @param description string
--- @param key string
--- @param inputDevice string
function RegisterKey(fc, uniqid, description, key, inputDevice)
    if inputDevice == nil then
        inputDevice = "keyboard"
    end
    RegisterCommand(uniqid .. key, fc, false)
    RegisterKeyMapping(uniqid .. key, description, inputDevice, key)
end

--- @param amount integer
--- add comma to separate thousands
--- stolen from: http://lua-users.org/wiki/FormattingNumbers
function CommaValue(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

--- Will display help notification
--- @param msg string
--- @param thisFrame boolean
--- @param beep boolean
--- @param duration int
function ShowHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry('rcore_carnival_help_msg', msg)

    if thisFrame then
        DisplayHelpTextThisFrame('rcore_carnival_help_msg', false)
    else
        if beep == nil then
            beep = false
        end
        BeginTextCommandDisplayHelp('rcore_carnival_help_msg')
        EndTextCommandDisplayHelp(0, false, beep, duration)
    end
end


-- subtitles
function ShowSubtitle(message)
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(1000, 1)
end

function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(0, 1)
end

function CreateTargetZone(entity, options)
    local resourceName = TargetTypeResourceName[Config.TargetZoneType]

    local sameExports = {
        [TargetType.Q_TARGET] = true,
        [TargetType.BT_TARGET] = true,
        [TargetType.QB_TARGET] = true,
    }

    if Config.TargetZoneType == TargetType.OX_TARGET then
        exports[resourceName]:addLocalEntity(entity, options)
    end

    if sameExports[Config.TargetZoneType] then
        exports[resourceName]:AddEntityZone("carnival_entity_" .. entity, entity, {
            name = "carnival_entity_" .. entity,
            heading = GetEntityHeading(entity) - (options.heading or 0),
            debugPoly = Config.Debug,
        }, {
            options = options,
            distance = 3.5,
        })
    end
end

-- Will show display float text in frame
--- @param text string
--- @param coords vector3
function DisplayFloatTextThisFrame(text, coords)
    AddTextEntry('rcore_carnivalfloatText', text)
    SetFloatingHelpTextWorldPosition(0, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('rcore_carnivalfloatText')
    EndTextCommandDisplayHelp(1, 0, 0, 0)
end

-- This is just simple label to get Player server ID
--- @param ped entity
function GetPedServerID(ped)
    return GetPlayerServerId(NetworkGetEntityOwner(ped))
end

-- Will slowly change value to the defined one
--- @param a object
--- @param b object
--- @param t object
function lerp(a, b, t)
    return a + (b - a) * 0.5 * t
end

function PlayAsyncAnimation(ped, animDictionary, animationName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate)
    RequestAnimDict(animDictionary)
    while not HasAnimDictLoaded(animDictionary) do
        Wait(10)
    end

    TaskPlayAnim(ped, animDictionary, animationName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate)

    if breakTime then
        Wait(breakTime)
    end

    RemoveAnimDict(animDictionary)
end

function PlaySyncAnimation(ped, animDictionary, animationName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate)
    RequestAnimDict(animDictionary)
    while not HasAnimDictLoaded(animDictionary) do
        Wait(10)
    end

    TaskPlayAnim(ped, animDictionary, animationName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate)
    Wait((GetAnimDuration(dict, anim) * 1000))
    RemoveAnimDict(animDictionary)
end