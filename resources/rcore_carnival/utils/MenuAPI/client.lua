CachedMenu = {}
--------------
-- Sending info about changing item in menu
--------------
RegisterKey(function()
    SendNUIMessage({ type_menu = "up" })
end, "menuapiup_rcore_carnival", "menu go up", "UP")

RegisterKey(function()
    SendNUIMessage({ type_menu = "down" })
end, "menuapidown_rcore_carnival", "menu go down", "DOWN")

-----

RegisterKey(function()
    SendNUIMessage({ type_menu = "up" })
end, "menuapiup_rcore_carnivalmouse.", "menu go up", "IOM_WHEEL_UP", "MOUSE_WHEEL")

RegisterKey(function()
    SendNUIMessage({ type_menu = "down" })
end, "menuapidown_rcore_carnivalmouse.", "menu go down", "IOM_WHEEL_DOWN", "MOUSE_WHEEL")
--------------
-- Sending info about selecting item
--------------
RegisterKey(function()
    SendNUIMessage({ type_menu = "enter" })
end, "menuapie_rcore_carnival_mouseaa", "Mouse right", "MOUSE_LEFT", "MOUSE_BUTTON")

RegisterKey(function()
    SendNUIMessage({ type_menu = "enter" })
end, "menuapie_rcore_carnival", "Key E", "E")

RegisterKey(function()
    SendNUIMessage({ type_menu = "enter" })
end, "menuapienter_rcore_carnival", "Key ENTER", "RETURN")
--------------
-- closing menu keys
--------------
RegisterKey(function()
    ExitAllOpenedMenu()
end, "menuapiesc_rcore_carnival", "Key ESC", "escape")

RegisterKey(function()
    ExitAllOpenedMenu()
end, "menuapiescaper_rcore_carnival", "Key backspace", "back")
--------------