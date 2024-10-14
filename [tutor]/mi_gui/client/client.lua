-- Notifications

function showNotification(message, color, flash, saveToBrief) 
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

RegisterCommand('testnotification', function(_, _, rawCommand)
    showNotification(
        rawCommand,
        130,
        true,
        true
    )
end)

-- advanced notifications

function showAdvancedNotification(message, color, flash, saveToBrief, textureDict, iconType, sender, subject) 
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

RegisterCommand('testAdvancedNotification', function(_, _, rawCommand)
    showAdvancedNotification(
        rawCommand,
        130,
        true,
        true,
        'CHAR_AMMUNATION',
        8,
        'This is sender',
        'This is subject'
    )
end)


-- alerts

function showAlert(message, beep, duration)
    AddTextEntry("MI_ALERT", message)

    BeginTextCommandDisplayHelp('MI_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

RegisterCommand("testAlert", function(_, _, rawCommand)
    showAlert(
        rawCommand,
        true,
        10000
    )
end)


-- marks

RegisterCommand('testMarker', function()

    CreateThread(function()
        local start = GetGameTimer()

        while GetGameTimer() < (start + 10000) do
            Wait(0)

            local playerCoords = GetEntityCoords(PlayerPedId())

            DrawMarker(
                6,
                playerCoords.x,
                playerCoords.y,
                playerCoords.z,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                1.0,
                1.0,
                0,
                0,
                220,
                180,
                true,
                true,
                2
            )
        end
    end)

end)



-- subtitls

function showSubtitles(message, duration)
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(duration, true)
end

RegisterCommand('testSubtitles', function(_, _, rawCommand)
    showSubtitles('Иди ~r~нахуй', 10000)
end)


-- Busyspinners

function showBusyspinner(message) 
    BeginTextCommandBusyspinnerOn('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandBusyspinnerOn(5)
end

function hideBusyspinner()
    BusyspinnerOff()
end

RegisterCommand('testSpinner', function(_, _, rawCommand)
    if rawCommand == 'testSpinner' then
        hideBusyspinner()
    else
        showBusyspinner(rawCommand)
    end
end)


-- text input

function getTextInput(title, inputLength)
    AddTextEntry('MI_INPUT', title)
    DisplayOnscreenKeyboard(1, 'MI_INPUT', '', '', '', '', '', inputLength)

    while UpdateOnscreenKeyboard() == 0 do
        Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()

        Wait(0)

        return result1
    else
        Wait(0)

        return nil
    end


end


RegisterCommand('testInput', function(_, _, rawCommand)
    local result = getTextInput(rawCommand, 30)

    showNotification(result, 180, false, false)
end)