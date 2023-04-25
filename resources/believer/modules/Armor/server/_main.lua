GM.Armor["player"] = {}

AddEventHandler("Armor:item:use", function(source, item)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    print(json.encode(item))

    if (GM.Armor["player"][playerSelected.source] == nil) then
        -- Todo get the durability from the item source and give armor to ped
        print(item.meta.durability)
        GM.Armor["player"][playerSelected.source] = true
    else
        playerSelected.showInventoryNotification("warning", "Vous avez déjà un gilet par balle équipé, votre ancien gilet par balle a été retiré.")
        local Item = exports["believer"]:GetItemBy({ name = "armor" })
        if not Item then return end

        Item.meta.durability = playerSelected.getArmor()

        exports["believer"]:SetMetaData(playerSelected.source, { itemHash = Item.itemHash }, Item.meta)
    end
end)