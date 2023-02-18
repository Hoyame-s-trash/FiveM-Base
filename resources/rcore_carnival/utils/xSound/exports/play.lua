function PlayUrl(name_, url_, volume_, loop_, options)
    SendNUIMessage({
        type = "url",
        name = name_,
        url = url_,
        x = 0,
        y = 0,
        z = 0,
        dynamic = false,
        volume = volume_,
        loop = loop_ or false,
    })

    if soundInfo[name_] == nil then
        soundInfo[name_] = getDefaultInfo()
    end

    soundInfo[name_].volume = volume_
    soundInfo[name_].url = url_
    soundInfo[name_].id = name_
    soundInfo[name_].playing = true
    soundInfo[name_].loop = loop_ or false
    soundInfo[name_].isDynamic = false

    globalOptionsCache[name_] = options or {}
end

function PlayUrlPos(name_, url_, volume_, pos, loop_, options, distance)
    if soundInfo[name_] == nil then
        soundInfo[name_] = getDefaultInfo()
    end

    if #(pos - GetEntityCoords(PlayerPedId())) < ((soundInfo[name_].distance or 10) + (Config.distanceBeforeUpdatingPos or 40)) then
        SendNUIMessage({
            type = "url",
            name = name_,
            url = url_,
            x = pos.x,
            y = pos.y,
            z = pos.z,
            dynamic = true,
            volume = volume_,
            loop = loop_ or false,
            distance = distance or 10,
        })
    end

    soundInfo[name_].volume = volume_
    soundInfo[name_].url = url_
    soundInfo[name_].position = pos
    soundInfo[name_].id = name_
    soundInfo[name_].playing = true
    soundInfo[name_].loop = loop_ or false
    soundInfo[name_].isDynamic = true

    globalOptionsCache[name_] = options or {}

    local playerPos = GetEntityCoords(PlayerPedId())
    if #(pos - playerPos) < Config.distanceBeforeUpdatingPos then
        isPlayerCloseToMusic = true
    end

    if isPlayerCloseToMusic then
        SendNUIMessage({ type = "unmuteAll" })
        SendNUIMessage({
            type = "position",
            x = playerPos.x,
            y = playerPos.y,
            z = playerPos.z
        })
    end
end