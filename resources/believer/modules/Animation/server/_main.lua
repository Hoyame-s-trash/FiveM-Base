GM.Animation = GM.Animation or {}

GM.Animation.Favorite = {}

RegisterServerEvent('Animation:saveEmote')
AddEventHandler('Animation:saveEmote', function(dict, anim,name, param)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    MySQL.query('SELECT * FROM fav_emote WHERE licence = ? AND dict = ? AND anim = ?', {playerSelected.identifier, dict, anim}, function(result)
        if (result[1] ~= nil) then
            playerSelected.showNotification("~r~Vous avez déjà cet emote enregistré sous le nom de "..anim..".")
            return
        else
            MySQL.insert('INSERT INTO fav_emote (licence, dict, anim, param, name) VALUES (@licence, @dict, @anim, @param, @name)', {
                ['@licence'] = playerSelected.identifier, 
                ['@dict'] = dict, 
                ['@anim'] = anim, 
                ['@param'] = json.encode(param), 
                ['@name'] = name
            }, function(emoteId)
                GM.Animation.Favorite[playerSelected.source][emoteId] = {
                    ['id'] = emoteId, 
                    ['name'] = name, 
                    ['dict'] = dict, 
                    ['anim'] = anim, 
                    ['param'] = param
                }
                playerSelected.showNotification("~g~Vous avez bien enregistré votre emote sous le nom de "..GM.Animation.Favorite[playerSelected.source][emoteId].name..".")
                TriggerClientEvent("Animation:updateValue", playerSelected.source, "favorite", emoteId, GM.Animation.Favorite[playerSelected.source][emoteId])
            end)
        end
    end)
end)

AddEventHandler("esx:playerLoaded", function(playerSrc)
    local playerSrc = playerSrc
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    GM.Animation.Favorite[playerSelected.source] = {}

    MySQL.query("SELECT * FROM fav_emote WHERE licence = @licence", {
        ['@licence'] = playerSelected.identifier,
    }, function(animations)

        animationsCount = 0

        for _,v in pairs(animations) do
            animationsCount = animationsCount + 1
            GM.Animation.Favorite[playerSelected.source][v['id']] = {
                ['id'] = v['id'], 
                ['name'] = v['name'], 
                ['dict'] = v['dict'], 
                ['anim'] = v['anim'], 
                ['param'] = v['param']
            }
        end

        TriggerClientEvent("Animation:updateValue", playerSelected.source, "favorite", GM.Animation.Favorite[playerSelected.source])
        print(('[^2INFO^0] Player ^5"%s"^0 animation modules has load ^5%s^7 animations to the server'):format(playerSelected.getName(), animationsCount))
    end)
end)

RegisterServerEvent("Animations:removeFavorite", function(emoteId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Animation.Favorite[playerSelected.source][emoteId] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas cet emote enregistré.")
        return
    end

    MySQL.Async.execute("DELETE FROM fav_emote WHERE licence = @licence AND id = @id", {
        ['@licence'] = playerSelected.identifier,
        ['@id'] = emoteId
    }, function()
        GM.Animation.Favorite[playerSelected.source][emoteId] = nil
        playerSelected.showNotification("~r~Vous avez bien supprimé votre emote enregistré ("..emoteId..").")
        TriggerClientEvent("Animation:removeValue", playerSelected.source, "favorite", emoteId)
    end)
end)

RegisterServerEvent("Animation:renameFavorite", function(emoteId, newName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (GM.Animation.Favorite[playerSelected.source][emoteId] == nil) then
        playerSelected.showNotification("~r~Vous n'avez pas cet emote enregistré.")
        return
    end

    GM.Animation.Favorite[playerSelected.source][emoteId].name = newName

    MySQL.Async.execute("UPDATE fav_emote SET name = @name WHERE licence = @licence AND id = @id", {
        ['@licence'] = playerSelected.identifier,
        ['@id'] = emoteId,
        ['@name'] = GM.Animation.Favorite[playerSelected.source][emoteId].name
    }, function()
        playerSelected.showNotification("~g~Vous avez bien renommé votre emote enregistré ("..emoteId..") en "..newName..".")
        TriggerClientEvent("Animation:updateValue", playerSelected.source, "favorite", emoteId, GM.Animation.Favorite[playerSelected.source][emoteId])
    end)
end)

RegisterServerEvent('animations:syncAccepted')
AddEventHandler('animations:syncAccepted', function(requester, id)
    local accepted = source
    TriggerClientEvent('animations:playSynced', accepted, requester, id, 'Accepter')
    TriggerClientEvent('animations:playSynced', requester, accepted, id, 'Requester')
end)

RegisterServerEvent('animations:requestSynced')
AddEventHandler('animations:requestSynced', function(target, id)
    local requester = source
    local xPlayer = ESX['GetPlayerFromId'](requester)
    MySQL['Async']['fetchScalar']("SELECT firstname FROM users WHERE identifier=@identifier", {['@identifier'] = xPlayer['identifier']}, function(firstname)
        TriggerClientEvent('animations:syncRequest', target, requester, id, firstname)
    end)
end)
     
RegisterServerEvent('animations:renameAnimation')
AddEventHandler('animations:renameAnimation', function(id, name)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    MySQL['Async']['execute']("UPDATE fav_emote SET name=@name WHERE id=@id", {
        ['@id'] = id, 
        ['@name'] = name
    })
    TriggerClientEvent('esx:showNotification', playerSelected.source, "~g~Vous avez bien renommé votre emote en "..name..".")
end)

-- Todo faire secu server distance et animation name

-- Todo faire system with table and stop query every time