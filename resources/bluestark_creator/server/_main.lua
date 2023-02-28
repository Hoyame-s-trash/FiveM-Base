ESX = exports['believer']:getSharedObject()

RegisterServerEvent("Creator:save", function(firstName, lastName, dateOfBirth, sexe, height)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    MySQL.update.await('UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?, height = ? WHERE identifier = ?',
        {
            firstName, 
            lastname, 
            dateOfBirth, 
            sexe, 
            height, 
            playerSelected.getIdentifier()
        }
    )
end)