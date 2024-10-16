-- Global variable to store the callback function for later use
local playerIdCallback = nil

-- Register the event handler globally so it listens once
RegisterNetEvent('gameConsole:getPlayerIds')
AddEventHandler('gameConsole:getPlayerIds', function(targetId)
    -- Check if the callback exists
    if playerIdCallback then
        -- If targetId is valid, call the callback with the targetId
        if targetId then
            playerIdCallback(targetId)
        else
            -- If not found, call the callback with nil
            playerIdCallback(nil)
        end
        -- Clear the callback after it is used
        playerIdCallback = nil
    end
end)

-- Function to request player ID by player name
function GetPlayerIdFromName(playerName, callback)
    -- Store the callback for use later when the server responds
    playerIdCallback = callback
    
    -- Trigger server event to request the player's ID by name
    TriggerServerEvent('gameConsole:requestTargetId', playerName)
end

-- NUI callback for teleporting to player
RegisterNUICallback("tpToPlayer", function(data, cb)
    cb({ }) -- Callback response to NUI

    print("test1")

    local targetName = data.name

    -- Call GetPlayerIdFromName and wait for the callback to return the target ID
    GetPlayerIdFromName(targetName, function(targetId)
        if not targetId then
            -- If player not found, send NUI message
            SendNUIMessage({
                type = "notfound",
                targetName = targetName,
            })
        else
            -- If player found, request teleport
            print("Found targetId:", targetId)
            TriggerServerEvent("gameConsole:teleport:requestTeleport", targetId)
        end
    end)
end)



RegisterNetEvent("gameConsole:teleport:teleport", function (x, y, z)
    local playerId = PlayerPedId()

    SetEntityCoords(playerId, x, y, z)
end)
