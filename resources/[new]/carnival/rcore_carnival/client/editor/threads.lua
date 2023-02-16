CreateThread(function()
    while true do
        Wait(0)
        if ActiveGameEditor and not RotateObjectEditor then
            local retval, hit, endCoords, surfaceNormal, entityHit = CastRayCastFromPlayer(ObjectGameEditor)

            if ActiveGameEditor == GameType.BASKET_THROW then
                endCoords = endCoords + vector3(0, 0, 1.14)
            end

            SetEntityCoords(ObjectGameEditor, endCoords)
            SetEntityHeading(ObjectGameEditor, HeadingObjectEditor)
        else
            Wait(300)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if ActiveGameEditor then
            -- SCROLLWHEEL UP
            if IsControlPressed(1, 96) then
                if RotateObjectEditor then
                    HeadingObjectEditor = HeadingObjectEditor + 1
                else
                    HeadingObjectEditor = HeadingObjectEditor + 3
                end
            end

            -- SCROLLWHEEL DOWN
            if IsControlPressed(1, 97) then
                if RotateObjectEditor then
                    HeadingObjectEditor = HeadingObjectEditor - 1
                else
                    HeadingObjectEditor = HeadingObjectEditor - 3
                end
            end

            if ObjectGameEditor then
                SetEntityHeading(ObjectGameEditor, HeadingObjectEditor)
            end
        else
            Wait(1000)
        end
    end
end)