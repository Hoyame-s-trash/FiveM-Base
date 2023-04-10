GM.Blip = GM.Blip or {}

GM.Blip.Create = function(params)
    if params.type == nil then return end
    if params.scale == nil then return end
    if params.pos == nil then return end
    if params.name == nil then return end
    if params.color == nil then return end
    local addBlip = AddBlipForCoord(params.pos)
    SetBlipSprite(addBlip, params.type)
    SetBlipScale(addBlip, params.scale)
    SetBlipColour(addBlip, params.color)
    SetBlipAsShortRange(addBlip, true)
    if params.display ~= nil then
        SetBlipDisplay(addBlip, params.display)
    else
        SetBlipDisplay(addBlip, 6)
    end
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(params.name)
    EndTextCommandSetBlipName(addBlip)

    return addBlip
end

GM.Blip.SetName = function(blip, newName)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(newName)
    EndTextCommandSetBlipName(blip)
end

GM.Blip.SetColor = function(blip, newcolor)
    SetBlipColour(blip, newcolor)
end

GM.Blip.Remove = function(blip)
    if DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
end

local BlipsList = {
    [1] = {
        pos = vector3(-602.12493896484,-925.86907958984,36.834575653076),
        type = 184, 
        scale = 0.70, 
        name = "Weazel News", 
        color = 0,
        display = 6,
    },
}

local CreatedBlips = {}

GM:newThread(function()
    while (GM.Blip == nil) do
        Wait(50)
    end

    for id, value in pairs(BlipsList) do
        CreatedBlips[id] = GM.Blip.Create({
            type = value.type,
            scale = value.scale,
            pos = value.pos,
            display = value.display,
            name = value.name,
            color = value.color
        })
    end
end)