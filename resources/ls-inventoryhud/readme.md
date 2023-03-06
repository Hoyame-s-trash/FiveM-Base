How to install for QB,

qb-core > server > player.lua

Find the "AddItem" and replace with that,
function self.Functions.AddItem(item, amount, slot, info)
	exports["ls-inventoryhud"]:AddItem(self.PlayerData.source, item, amount, info)
end

Find the "RemoveItem" and replace with that,
function self.Functions.RemoveItem(item, amount, id)
	return exports["ls-inventoryhud"]:RemoveItem(self.PlayerData.source, id, amount)
end


After that find your clothing script (qb-clothing),

Find the "SaveSkin" and replace with that,
function SaveSkin()
    local model = GetEntityModel(PlayerPedId())
    local clothing = json.encode(skinData)
    TriggerServerEvent("qb-clothing:saveSkin", model, clothing)
    TriggerEvent("ls-inventoryhud:c:refreshClothes")

    TriggerEvent("ls-inventoryhud:c:giveClothesAsItem", skinData, previousSkinData, firstCreation)

    if firstCreation then
        firstCreation = false
    end
end

Add variable top of clothing script,
firstCreation = false


Find the "resetOutfit" and replace with that,
RegisterNUICallback('resetOutfit', function(_, cb)
    resetClothing(json.decode(previousSkinData))
    skinData = json.decode(previousSkinData)
    previousSkinData = {}
    firstCreation = false
    cb('ok')
end)

Find the "qb-clothes:client:CreateFirstCharacter" and replace with that,
RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
AddEventHandler('qb-clothes:client:CreateFirstCharacter', function()
    QBCore.Functions.GetPlayerData(function(pData)
        local skin = "mp_m_freemode_01"
        openMenu({
            {menu = "character", label = "Character", selected = true},
            {menu = "clothing", label = "Features", selected = false},
            {menu = "accessoires", label = "Accessories", selected = false}
        })

        if pData.charinfo.gender == 1 then
            skin = "mp_f_freemode_01"
        end

        ChangeToSkinNoUpdate(skin)
        SendNUIMessage({
            action = "ResetValues",
        })

        firstCreation = true
    end)
end)


And done, review the classes.lua and implement your server!


How to install for ESX,

esx_extended > server > classes> player.lua

Find the "AddItem" and replace with that,
function self.addInventoryItem(name, count, metadata, slot)
	exports["ls-inventoryhud"]:AddItem(self.source, name, count, metadata)
end

Find the "RemoveItem" and replace with that,
function self.removeInventoryItem(name, count, metadata, slot)
	exports["ls-inventoryhud"]:RemoveItem(self.source, name, count)
end
	
	
After that find your clothing script (esx-skin),

Find the "OpenSaveableMenu" and replace with that,
function OpenSaveableMenu(submitCb, cancelCb, restrict)
    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)

    OpenMenu(function(data, menu)
        menu.close()
        DeleteSkinCam()

        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)

            if submitCb ~= nil then
                submitCb(data, menu)
            end
			
			TriggerEvent("ls-inventoryhud:c:giveClothesAsItem", skin, lastSkin, false)
        end)

    end, cancelCb, restrict)
end

And done, review the classes.lua and implement your server!