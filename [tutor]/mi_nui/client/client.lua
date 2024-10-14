CreateThread(function()
    while true do
        Wait(10)

        local playerId = PlayerPedId()
        local playerCoords = GetEntityCoords(playerId)
        local playerHeading = GetEntityHeading(playerId)

        SendNUIMessage({
            type = 'position',
            x = playerCoords.x,
            y = playerCoords.y,
            z = playerCoords.z,
            heading = playerHeading,
        })
    end
end)


CreateThread(function()
    while true do
        Wait(1000)

        SendNUIMessage({
            type = 'ping',
        })
    end
end)

RegisterNUICallback('pong', function(data, cb)
    print('Got pong, foo value is', data.foo)

    cb({
        acceptedPong = true,
    })
end)

RegisterNUICallback('releaseFocus', function(data, cb)
    cb({})

    SetNuiFocus(false, false)
end)

RegisterNUICallback('teleport', function(data, cb)
    cb({})

    SetEntityCoords(PlayerPedId(), tonumber(data.x), tonumber(data.y), tonumber(data.z))
end)


--
-- Key Binding
--



RegisterCommand('+openteleporter', function()
    SetNuiFocus(true, true)
end, false)

----------------------------
-- Dont show chat message --
----------------------------

-- Add an event handler to prevent the chat message
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        TriggerEvent('chat:addSuggestion', '/-openteleporter', 'Open Teleporter')
    end
end)

-- Event to cancel chat messages for this command
AddEventHandler('chatMessage', function(source, name, message)
    if message == '/-openteleporter' then
        CancelEvent() -- Cancel the event to prevent it from going to the chat
    end
end)

----------------------------

RegisterKeyMapping('+openteleporter', 'Open Teleporter', 'keyboard', 'F5')