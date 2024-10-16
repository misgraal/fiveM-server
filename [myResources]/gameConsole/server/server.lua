RegisterNetEvent('gameConsole:requestPlayerName', function(targetName)
    local players = GetPlayers()

    for _, targetId in ipairs(players) do
        
        local name = GetPlayerName(targetId)
        -- Compare it with the target name
        if name == targetName then
            print(targetId)
            TriggerClientEvent('gameConsole:getTargetId', source, targetId)
        end
    end





    print(source)
    TriggerClientEvent('gameConsole:getPlayerIds', source, "none")
end)