RegisterNetEvent('gameConsole:requestTargetId', function(targetName)

    MySQL.scalar('SELECT playerDynamicId FROM playerNames WHERE playerName = ?', {
        targetName,
    }, function (targetDId)
        if targetDId then
            TriggerClientEvent('gameConsole:getPlayerIds', source, targetDId)
        else
            TriggerClientEvent('gameConsole:getPlayerIds', source, "none")
        end

    end)
end)