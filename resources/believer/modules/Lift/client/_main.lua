GM.Lift = GM.Lift or {}

GM.Lift = {
    menu = {},
    data = {},
}

GM.Lift.menu.main = RageUI.CreateMenu("", "Ascenseur", 0, 0, "banner", "bluestark")
GM.Lift.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Lift.menu.main:isVisible(function(Items)
    for stairSelected, stair in pairs(GM.Lift["list"][GM.Lift.data["currentLift"]]) do 
        Items:Button(stair.name, nil, {}, true, {
            onSelected = function()
                DoScreenFadeOut(200)
                Wait(500)
                SetEntityCoordsNoOffset(PlayerPedId(), stair.pos)
                DoScreenFadeIn(200)
                GM.Lift.menu.main:close()
                if (stair.callback) then
                    stair.callback(stairSelected)
                end
            end
        })
    end
end)

local function getClosestLift(pos)
    local dist, currentName = -1, nil
    while (GM.Lift["list"] == nil) do
        Wait(150)
    end
    for name, _ in pairs(GM.Lift["list"]) do 
        for _, v in pairs(GM.Lift["list"][name]) do 
            calculatedDist = #(pos - v.pos)
            if calculatedDist < dist or dist == -1 then 
                dist, currentName = calculatedDist, name
            end 
        end
    end 
    return dist, currentName
end

GM:newThread(function()
    local waiting = 1250
    while true do 
        local pPos = GetEntityCoords(PlayerPedId())
        local dist, currentName = getClosestLift(pPos)
      
        if dist < 3 and not RageUI.Visible(mainMenu) then 
            waiting = 1
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour prendre ~b~l'ascenseur~s~.")
            if (IsControlJustPressed(0, 51)) then
                GM.Lift.data["currentLift"] = currentName
                GM.Lift.menu.main:open()
            end
        else
            waiting = 1250
        end 
        Wait(waiting)
    end 
end)