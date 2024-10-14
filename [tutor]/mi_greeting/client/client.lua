AddEventHandler('playerSpawned', function()
    TriggerServerEvent('mi_greeting:show')
end)

RegisterCommand('testGreeting', function()
    TriggerServerEvent('mi_greeting:show')
end)