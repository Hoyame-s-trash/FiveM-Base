ScriptClient = {}
ScriptClient.resourceName = GetCurrentResourceName()
ScriptClient.resourceStarted = false
ScriptClient.playerReady = false
ScriptClient.cefLoaded = false
ScriptClient.Player = {}
ScriptClient.Player.State = LocalPlayer.state
ScriptClient.Player.State.inventoryOpened = false
ScriptClient.Player.State.shortkeys = true

SetNuiFocusKeepInput(true)

AddEventHandler("onClientResourceStart", function(resourceName)
    if ScriptClient.resourceName ~= resourceName then return end

    ScriptClient.resourceStarted = true
end)

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(100)
    end

    ScriptClient.playerReady = true

    while not (ScriptClient.playerReady and ScriptClient.resourceStarted and ScriptClient.cefLoaded) do
        Citizen.Wait(100)
    end

    Citizen.Wait(4000)

    TriggerServerEvent("bluestark_inventory:CLIENT_LOADED")
end)

function SEND_NUI_MESSAGE(d)
    while not ScriptClient.cefLoaded do
        Citizen.Wait(100)
    end

    SendNUIMessage(d)
end

RegisterNetEvent("bluestark_inventory:PLAYER_SEND_NUI_MESSAGE", SEND_NUI_MESSAGE)

RegisterNUICallback("CEF_LOADED", function(_, cb)
    ScriptClient.cefLoaded = true
    cb({})
end)

---@type number | nil
local inventoryOpenedThreadId = nil

RegisterNUICallback("CLIENT_SET_INTERFACE_STATE", function(d, cb)
    local state = d.state

    ScriptClient.Player.State.inventoryOpened = state
    SetNuiFocus(state, state)

    if state then
        TriggerEvent("bluestark_inventory:onInventoryOpen")
        TriggerServerEvent("bluestark_inventory:OPEN_NEAR_DROPPED_GRID")

        if inventoryOpenedThreadId == nil then
            Citizen.CreateThreadNow(function(id)
                inventoryOpenedThreadId = id

                while inventoryOpenedThreadId ~= nil do
                    DisableAllControlActions(0)
                    EnableControlAction(0, 30, true)
                    EnableControlAction(0, 31, true)
                    Citizen.Wait(0)
                end
            end)
        end
    else
        TriggerEvent("bluestark_inventory:onInventoryClose")

        if inventoryOpenedThreadId ~= nil then
            inventoryOpenedThreadId = nil
        end
    end

    cb({})
end)

RegisterCommand('OPEN_INVENTORY', function()
    SEND_NUI_MESSAGE({
        event = "SET_INTERFACE_OPEN",
        state = not ScriptClient.Player.State.inventoryOpened
    })
end)
RegisterKeyMapping('OPEN_INVENTORY', 'Open Inventory', 'keyboard', 'f2')

local shortkeysOpened = false
RegisterCommand("+SHOW_HIDE_SHORTKEY_ITEMS", function()
    shortkeysOpened = true

    Citizen.CreateThreadNow(function(id)
        while shortkeysOpened do
            DisableControlAction(0, 37, true)
            Citizen.Wait(1)
        end
    end)

    SEND_NUI_MESSAGE({
        event = "SHORTKEYS_STATE",
        state = true
    })
end, false)
RegisterCommand("-SHOW_HIDE_SHORTKEY_ITEMS", function()
    shortkeysOpened = false

    SEND_NUI_MESSAGE({
        event = "SHORTKEYS_STATE",
        state = false
    })
end, false)
RegisterKeyMapping('+SHOW_HIDE_SHORTKEY_ITEMS', 'Show/Hide Shortkey Items', 'keyboard', "tab")
