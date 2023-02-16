soundInfo = {}

function getLink(name_)
    return soundInfo[name_].url
end

function getPosition(name_)
    return soundInfo[name_].position
end

function isLooped(name_)
    return soundInfo[name_].loop
end

function getInfo(name_)
    return soundInfo[name_]
end

function soundExists(name_)
    return soundInfo[name_] ~= nil
end

function isPlaying(name_)
    return soundInfo[name_].playing
end

function isPaused(name_)
    return soundInfo[name_].paused
end

function getDistance(name_)
    return soundInfo[name_].distance
end

function getVolume(name_)
    if not soundInfo[name_] then
        return 0
    end
    return soundInfo[name_].volume
end

function isDynamic(name_)
    if not soundInfo[name_] then
        return false
    end
    if not soundInfo[name_].isDynamic then
        return false
    end
    return soundInfo[name_].isDynamic
end

function getTimeStamp(name_)
    return soundInfo[name_].timeStamp or -1
end

function getMaxDuration(name_)
    return soundInfo[name_].maxDuration or -1
end

function isPlayerInStreamerMode()
    return disableMusic
end

function getAllAudioInfo()
    return soundInfo
end

function isPlayerCloseToAnySound()
    return isPlayerCloseToMusic
end