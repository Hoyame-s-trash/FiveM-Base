function onPlayStart(name, delegate)
    if globalOptionsCache[name] then
        globalOptionsCache[name].onPlayStart = delegate
    end
end

function onPlayEnd(name, delegate)
    globalOptionsCache[name].onPlayEnd = delegate
end

function onLoading(name, delegate)
    globalOptionsCache[name].onLoading = delegate
end

function onPlayPause(name, delegate)
    globalOptionsCache[name].onPlayPause = delegate
end

function onPlayResume(name, delegate)
    globalOptionsCache[name].onPlayResume = delegate
end