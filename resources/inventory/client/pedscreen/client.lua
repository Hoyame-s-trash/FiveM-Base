local PedScreen = {}
---@type number
PedScreen.ped = nil

ScriptClient.PedScreen = PedScreen

function PedScreen:Create()
    if DoesEntityExist(self.ped) then return end

    local playerPed = PlayerPedId()

    SetFrontendActive(true)
    ActivateFrontendMenu(`FE_MENU_VERSION_EMPTY_NO_BACKGROUND`, true, -1)

    while not IsFrontendReadyForControl() do
        Citizen.Wait(10)
    end

    Citizen.Wait(100)

    SetMouseCursorVisibleInMenus(false)

    ReplaceHudColourWithRgba(117, 0, 0, 0, 0)

    local PlayerPedPreview = ClonePed(playerPed, false, false, false)
    SetEntityVisible(PlayerPedPreview, false, false)
    GivePedToPauseMenu(PlayerPedPreview, 1)
    SetPauseMenuPedLighting(true)
    SetPauseMenuPedSleepState(true)
    SetEntityCollision(PlayerPedPreview, false, true)

    self.ped = PlayerPedPreview
end

function PedScreen:Delete()
    SetFrontendActive(false)
    ReplaceHudColourWithRgba(117, 0, 0, 0, 186)
    Citizen.Wait(100)
    SetMouseCursorVisibleInMenus(true)

    if DoesEntityExist(self.ped) then
        DeleteEntity(self.ped)
    end
end
