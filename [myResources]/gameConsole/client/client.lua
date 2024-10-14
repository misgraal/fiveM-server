









RegisterCommand('+openconsole', function()
    SetNuiFocus(true, true)
end, false)

-- Add an event handler to prevent the chat message
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        TriggerEvent('chat:addSuggestion', '/-openteleporter', 'Open Teleporter')
    end
end)

-- Event to cancel chat messages for this command
AddEventHandler('chatMessage', function(source, name, message)
    if message == '/-openconsole' then
        CancelEvent() -- Cancel the event to prevent it from going to the chat
    end
end)

RegisterKeyMapping('+openconsole', 'Open Console', 'keyboard', 'F5')