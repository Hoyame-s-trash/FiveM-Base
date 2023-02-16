ActiveGameEditor = nil
ObjectGameEditor = nil
RotateObjectEditor = false
HeadingObjectEditor = 0.0

RegisterCommand("carnivaleditor", function(source, args, user)
    if IsAceAllowed("command.carnivaleditor") then
        local menu = CreateMenu("editor_carnival")

        local items = {
            [1] = { label = GameTypeLabel[GameType.BANG_BEAVER], GameType = GameType.BANG_BEAVER },
            [2] = { label = GameTypeLabel[GameType.FORTUNE_TELLER], GameType = GameType.FORTUNE_TELLER },
            [3] = { label = GameTypeLabel[GameType.BASKET_THROW], GameType = GameType.BASKET_THROW },
            [4] = { label = GameTypeLabel[GameType.ARCADE_CLAW], GameType = GameType.ARCADE_CLAW },

            --[5] = { label = GameTypeLabel[GameType.BALLOON_SHOOTER], GameType = GameType.BALLOON_SHOOTER },
            --[6] = { label = GameTypeLabel[GameType.TARGET_SHOOTER], GameType = GameType.TARGET_SHOOTER },
        }

        menu.SetMenuTitle("rcore_carnival editor")

        menu.SetProperties({
            float = "right",
            position = "middle",
        })

        for k, v in pairs(items) do
            menu.AddItem(k, v.label, nil, { GameType = v.GameType })
        end

        menu.OnSelectEvent(function(index, menuData)
            DisplayEditorHelpText()

            ActiveGameEditor = menuData.GameType

            if GameTypeObject[menuData.GameType] then
                ObjectGameEditor = CreateLocalObject(GameTypeObject[menuData.GameType], GetEntityCoords(PlayerPedId()))
                SetEntityCollision(ObjectGameEditor, false, true)
            else

            end

            menu.Close()
        end)

        menu.Open()
    end
end)