RegisterNetEvent('mi_teleporter:goto', function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)


    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then 
        TriggerClientEvent('chat:addMessage', playerId, {
            args = {"Sorry, " .. targetId .. " doesn/'t seem to exist.", },
        })
        return
    end

    local targetPos = GetEntityCoords(targetPed)

    SetEntityCoords(playerPed, targetPos)
end)

RegisterNetEvent("mi_teleporter:bring", function(targetId)
    local playerId = source

    local playerPed = GetPlayerPed(playerId)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then 
        TriggerClientEvent('chat:addMessage', playerId, {
            args = {"Sorry, " .. targetId .. " doesn/'t seem to exist.", },
        })
        return
    end

    local playerPos = GetEntityCoords(playerPed)

    SetEntityCoords(targetPed, playerPos)
end)