-- Server-side event to handle requesting player ID by name
RegisterNetEvent('gameConsole:requestTargetId', function(targetName)
    local sourceId = source -- The player who triggered this event

    -- Query the database to get the player's dynamic ID by their name
    MySQL.scalar('SELECT playerDynamicId FROM playerNames WHERE playerName = ?', {
        targetName,
    }, function (targetDId)
        if targetDId then
            -- If found, send the target ID back to the client
            TriggerClientEvent('gameConsole:getPlayerIds', sourceId, targetDId)
        else
            -- If not found, send nil to the client
            TriggerClientEvent('gameConsole:getPlayerIds', sourceId, nil)
        end
    end)
end)