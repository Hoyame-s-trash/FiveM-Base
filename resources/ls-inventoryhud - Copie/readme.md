How to install for ESX,

esx_extended > server > classes> player.lua

Find the "AddItem" and replace with that,
function self.addInventoryItem(name, count, metadata, slot)
	AddItem(self.source, name, count, metadata)
end

Find the "RemoveItem" and replace with that,
function self.removeInventoryItem(name, count, metadata, slot)
	RemoveItem(self.source, name, count)
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
			
			TriggerEvent("Inventory:giveClothesAsItem", skin, lastSkin, false)
        end)

    end, cancelCb, restrict)
end

And done, review the classes.lua and implement your server!