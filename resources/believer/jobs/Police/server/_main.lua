GM.Police = GM.Police or {}

RegisterServerEvent("Police:sendBackup", function(backupCode)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.job.name ~= "police") then return end

    
end)