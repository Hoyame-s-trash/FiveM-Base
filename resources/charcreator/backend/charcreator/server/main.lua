ESX = exports['believer']:getSharedObject()

RegisterNetEvent('charcreator:save')
AddEventHandler('charcreator:save', function(firstname, lastname, dateofbirth, sex, height)
    local s = source
	local x = ESX.GetPlayerFromId(s)

    MySQL.update.await(
        'UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?, height = ? WHERE identifier = ?',
        {
            firstname, 
            lastname, 
            dateofbirth, 
            sex, 
            height, 
            x.getIdentifier()
        }
    )
end)