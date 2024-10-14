-- comand to go to other player

RegisterCommand('tp', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { "Please provide a target ID.", },
        })

        return
    end

    TriggerServerEvent('mi_teleporter:goto', targetId)
end)



-- command to bring a player to us

RegisterCommand('gh', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { "Please provide a target ID.", },
        })

        return
    end

    TriggerServerEvent('mi_teleporter:bring', targetId)
end)