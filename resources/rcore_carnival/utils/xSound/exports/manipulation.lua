function Distance(name, distance_)
    SendNUIMessage({
        type = "distance",
        name = name,
        distance = distance_,
    })
    soundInfo[name].distance = distance_
end

exports('Distance', Distance)

function Position(name, pos)
    SendNUIMessage({
        type = "soundPosition",
        name = name,
        x = pos.x,
        y = pos.y,
        z = pos.z,
    })
    soundInfo[name].position = pos
    soundInfo[name].id = name
end

function Destroy(name)
    SendNUIMessage({
        type = "delete",
        name = name
    })
    soundInfo[name] = nil

    if globalOptionsCache[name] ~= nil and globalOptionsCache[name].onPlayEnd ~= nil then
        globalOptionsCache[name].onPlayEnd(getInfo(name))
    end

    globalOptionsCache[name] = nil
end

function DestroySilent(name)
    SendNUIMessage({
        type = "delete",
        name = name
    })
end

function Resume(name)
    SendNUIMessage({
        type = "resume",
        name = name
    })
    soundInfo[name].playing = true
    soundInfo[name].paused = false

    if globalOptionsCache[name] ~= nil and globalOptionsCache[name].onPlayResume ~= nil then
        globalOptionsCache[name].onPlayResume(getInfo(name))
    end
end

function Pause(name)
    SendNUIMessage({
        type = "pause",
        name = name
    })
    soundInfo[name].playing = false
    soundInfo[name].paused = true

    if globalOptionsCache[name] ~= nil and globalOptionsCache[name].onPlayPause ~= nil then
        globalOptionsCache[name].onPlayPause(getInfo(name))
    end
end

function setVolume(name, vol)
    SendNUIMessage({
        type = "volume",
        volume = vol,
        name = name,
    })
    if soundInfo[name] and soundInfo[name].volume then
        soundInfo[name].volume = vol
    end
end

function setVolumeMax(name, vol)
    SendNUIMessage({
        type = "max_volume",
        volume = vol,
        name = name,
    })
    soundInfo[name].volume = vol
end

function setTimeStamp(name, timestamp)
    if not getInfo(name) then
        return
    end
    if not getInfo(name).timeStamp then
        return
    end
    getInfo(name).timeStamp = timestamp
    SendNUIMessage({
        name = name,
        type = "timestamp",
        timestamp = timestamp,
    })
end

function destroyOnFinish(id, bool)
    soundInfo[id].destroyOnFinish = bool
end

function setSoundLoop(name, value)
    SendNUIMessage({
        type = "loop",
        name = name,
        loop = value,
    })
    soundInfo[name].loop = value
end

function repeatSound(name)
    if soundExists(name) then
        SendNUIMessage({
            type = "repeat",
            name = name,
        })
    end
end

function setSoundDynamic(name, bool)
    if soundExists(name) then
        soundInfo[name].isDynamic = bool
        SendNUIMessage({
            type = "changedynamic",
            name = name,
            bool = bool,
        })
    end
end

function setSoundURL(name, url)
    if soundExists(name) then
        soundInfo[name].url = url
        SendNUIMessage({
            type = "changeurl",
            name = name,
            url = url,
        })
    end
end