CreateThread(function()
    local w = 1000
    while true do
        Wait(w)
        w = 1000
        local pPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.MiniGameList) do
            if #(pPos - v.Position) < 15 and not v.IsBusy then
                if v.DrawMarker then
                    w = 1
                    local o = v.MarkerOptions
                    DrawMarker(o.type, v.Position.x, v.Position.y, v.Position.z + (v.DrawMarkerHeight or 0), o.dir.x or 0, o.dir.y or 0, o.dir.z or 0, o.rot.x or 0, o.rot.y or 0, o.rot.z or 0, o.scale.x or 1.0, o.scale.y or 1.0, o.scale.z or 1.0, o.color.r or 255, o.color.g or 255, o.color.b or 255, o.color.a or 125, o.bobUpAndDown or false, o.faceCamera or false, 0, o.rotate or false)
                end
            end
        end
    end
end)
