function GetPlayerIdFromName(playerName, callback)
    -- Get all players
    TriggerServerEvent('gameConsole:requestPlayerName', playerName)


    RegisterNetEvent('gameConsole:getTargetId', function (targetId)
        if targetId ~= "none" then
            print(targetId)
            callback(targetId)
        end
        
        callback(nil)
    end)
end


RegisterNUICallback("tpToPlayer", function(data, cb) 
    cb({ })


    local targetName = data.name

    local targetId = GetPlayerIdFromName(targetName, function (targetId)
        if not targetId then
            -- If player not found, send NUI message
            SendNUIMessage({
                type = "notfound",
                targetName = targetName,
            })
        else
            -- If player found, request teleport
            print("Target Player ID:", targetId)
            TriggerServerEvent("gameConsole:teleport:requestTeleport", targetId)
        end
end)



    
end)


RegisterNetEvent("gameConsole:teleport:teleport", function (x, y, z)
    local playerId = PlayerPedId()

    SetEntityCoords(playerId, x, y, z)
end)
