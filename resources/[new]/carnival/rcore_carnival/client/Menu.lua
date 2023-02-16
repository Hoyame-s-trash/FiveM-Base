AnimSetPlayer = nil
EatingIce = false

function ChooseDifficulty(cb, title, gameType, data)
    local difficulties = {
        [1] = { label = _U("diff_" .. DifficultyType.EASY), difficulty = DifficultyType.EASY },
        [2] = { label = _U("diff_" .. DifficultyType.MEDIUM), difficulty = DifficultyType.MEDIUM },
        [3] = { label = _U("diff_" .. DifficultyType.HARD), difficulty = DifficultyType.HARD },
    }

    local menu = CreateMenu(title)

    menu.SetMenuTitle(title)

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    for k, v in ipairs(difficulties) do
        menu.AddItem(k, v.label, nil, { difficulty = v.difficulty })
    end

    if gameType == GameType.TARGET_SHOOTER then
        menu.AddItem(4, "Guide", function()
            menu.Close()
            FreezeOpenCommandGame = false

            ShowHelpNotification(_U("target_help"), false, false, 15000)
        end)
    end

    menu.OnSelectEvent(function(index, menuData)
        if index ~= 4 then
            menu.Close()
            cb(menuData)
        end
    end)

    menu.OnExitEvent(function()
        FreezeOpenCommandGame = false
        SetActiveMinigame(GameType.NONE)
    end)

    menu.Open()
end

function GetLabelPrice(price)
    if Config.Framework.Active == Framework.STANDALONE then
        return "<FONT color='green'>Free"
    end

    if Config.GivePlayerTickets then
        return "<FONT color='green'>" .. CommaValue(price) .. " tickets"
    end

    if price <= 0 then
        return "<FONT color='green'>free</FONT>"
    end

    return "<FONT color='green'>$" .. CommaValue(price)
end

function ShopMenu(data, itemName)
    if EatingIce then
        ShowNotification(_U("holding_icecream"))
        FreezeOpenCommandGame = false
        return
    end

    if HoldingAnim then
        ShowNotification(_U("holding_gift"))
        FreezeOpenCommandGame = false
        return
    end

    FreezeOpenCommandGame = true

    local menu = CreateMenu("shopMenu")

    menu.SetMenuTitle(_U("shop_menu"))

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    for k, v in pairs(data.itemList) do
        if v.type == "item" and Config.Framework.Active ~= Framework.STANDALONE then
            menu.AddItem(k, { v.label, GetLabelPrice(v.price) }, function()
                menu.Close()
                FreezeOpenCommandGame = false
                callCallback("payItemShop", function(paid)
                    if paid then
                        ShowNotification(_U("enjoy_your_items"))
                    else
                        if Config.GivePlayerTickets then
                            ShowNotification(_U("no_tickets", CommaValue(v.price)))
                        else
                            ShowNotification(_U("no_money", CommaValue(v.price)))
                        end
                    end
                end, k, itemName, data)
            end)
        end

        if v.type == "weapon" then
            menu.AddItem(k, { v.label, GetLabelPrice(v.price) }, function()
                menu.Close()
                FreezeOpenCommandGame = false
                callCallback("payItemShop", function(paid)
                    if paid == 3 then
                        ShowNotification(_U("no_space"))
                        return
                    end
                    if paid then
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(v.weaponName), v.ammo, false, true)
                        ShowNotification(_U("enjoy_your_items"))
                    else
                        if Config.GivePlayerTickets then
                            ShowNotification(_U("no_tickets", CommaValue(v.price)))
                        else
                            ShowNotification(_U("no_money", CommaValue(v.price)))
                        end
                    end
                end, k, itemName, data)
            end)
        end

        if v.type == "animation" then
            menu.AddItem(k, { _U(v.animName), GetLabelPrice(v.price) }, function()
                menu.Close()
                FreezeOpenCommandGame = false
                callCallback("payItemShop", function(paid)
                    if paid then
                        Animation.ResetAll()
                        Animation.Play(v.animName)
                        AnimSetPlayer = v.animName

                        if itemName == "GiftShopList" then
                            HoldingAnim = true
                            ShowHelpNotification(_U("gift_info"))
                        end

                        if itemName == "icecream" then
                            EatingIce = true
                            ShowHelpNotification(_U("lick_info"))
                        end
                    else
                        if Config.GivePlayerTickets then
                            ShowNotification(_U("no_tickets", CommaValue(v.price)))
                        else
                            ShowNotification(_U("no_money", CommaValue(v.price)))
                        end
                    end
                end, k, itemName, data)
            end)
        end
    end

    menu.OnExitEvent(function()
        FreezeOpenCommandGame = false
    end)

    menu.Open()
end