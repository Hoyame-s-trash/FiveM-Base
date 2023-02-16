HoldingAnim = false

RegisterKey(function()
    if FreezeOpenCommandGame or not HoldingAnim then
        return
    end
    HoldingAnim = false
    Animation.ResetAll()
    Wait(500)
    Animation.ResetAll()
end, "throw_away_item", "Will throw away item", "G")

RegisterKey(function()
    if FreezeOpenCommandGame or not HoldingAnim then
        return
    end
    DisplayClosestPlayers()
end, "open_gift_modal", "Will open gift modal with player nearby", "E")


RegisterKey(function()
    if FreezeOpenCommandGame or not EatingIce then
        return
    end
    EatingIce = false
    Animation.ResetAll()
    Wait(500)
    Animation.ResetAll()
end, "throw_away_icecream", "Will throw away ice cream", "G")

RegisterKey(function()
    if FreezeOpenCommandGame or not EatingIce then
        return
    end
    Animation.Play("drink")
    Wait(2600)
    Animation.Play("hold_icecream")
end, "lick_icecream", "Will lick the ice cream!", "E")