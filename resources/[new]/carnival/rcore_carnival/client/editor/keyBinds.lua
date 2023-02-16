RegisterKey(function()
    if IsAceAllowed("command.carnivaleditor") then
        if ActiveGameEditor then
            if RotateObjectEditor then

                SendNUIMessage({
                    type = "display_for_copy",
                    text = Dump(GetCompleteArrayMiniGame(ActiveGameEditor), true),
                })

                SetNuiFocus(true, true)

                leaveEditor()
                return
            end
            FinalSteps()
            RotateObjectEditor = true
        end
    end
end, "carnival_editor_confirm", "enter", "RETURN")

function leaveEditor()
    if IsAceAllowed("command.carnivaleditor") then
        if RotateObjectEditor then
            DisplayEditorHelpText()
            RotateObjectEditor = false
            return
        end
        if ActiveGameEditor then
            ActiveGameEditor = nil
            RotateObjectEditor = false
            if ObjectGameEditor then
                DeleteEntity(ObjectGameEditor)
                ObjectGameEditor = nil
            end
        end
    end
end

RegisterKey(leaveEditor, "carnival_editor_exit", "exit", "back")