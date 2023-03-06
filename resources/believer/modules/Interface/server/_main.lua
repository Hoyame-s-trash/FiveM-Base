-- GM.Interface = GM.Interface or {}

-- AddEventHandler("esx:playerLoaded", function(playerSrc)
--     if (not playerSrc) then return end

--     TriggerClientEvent("Interface:updateId", playerSrc, playerSrc)
--     TriggerClientEvent('Interface:updatePlayerCount', -1, GetNumPlayerIndices())
--     TriggerClientEvent('Interface:updateTime', playerSrc, GM.Interface:GetTime(), GM.Interface:GetHours())
-- end)

-- AddEventHandler("playerDropped", function()
--     local playerSrc = source
--     if (not playerSrc) then return end

--     TriggerClientEvent('Interface:updatePlayerCount', -1, GetNumPlayerIndices())
-- end)

-- function GM.Interface:GetTime()
--     return os.date("%d.%m.%Y", os.time() + 0 * 60 * 60)
-- end

-- function GM.Interface:GetHours()
--     return os.date("%H:%M", os.time() + 0 * 60 * 60)
-- end

-- GM:newThread(function()
--     while true do
--         TriggerClientEvent('Interface:updateTime', -1, GM.Interface:GetTime(), GM.Interface:GetHours())
--         TriggerClientEvent("Interface:slots", -1, tostring(GetConvarInt('sv_maxclients', 32)))
--         Wait(30000)
--     end
-- end)

-- AddEventHandler('onResourceStart', function(resourceName)
--     if (GetCurrentResourceName() == resourceName) then
--         Wait(2500)
--         TriggerClientEvent('Interface:updatePlayerCount', -1, GetNumPlayerIndices())
--         TriggerClientEvent('Interface:updateTime', -1, GM.Interface:GetTime(), GM.Interface:GetHours())
--         TriggerClientEvent("Interface:slots", -1, tostring(GetConvarInt('sv_maxclients', 32)))
--     end
-- end)