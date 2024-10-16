RegisterNetEvent("gameConsole:userName:changeUserName", function (newUserName)
    
    id = source
    local userIdentifier = GetPlayerIdentifierByType(source, 'license')

    MySQL.insert('INSERT INTO PlayerNames (PlayerId, PlayerName) VALUES (?, ?) ON DUPLICATE KEY UPDATE PlayerName = ?', {
        userIdentifier,
        newUserName,
        newUserName,
    }, function()
        print(id)
        TriggerClientEvent('gameConsole:userName:confirmChangeUserName', id, newUserName)
    end)


end)

RegisterNetEvent('gameConsole:userName:checkUserInBase', function()
    
    id2 = source
    local userIdentifier = GetPlayerIdentifierByType(source, "license")

    MySQL.scalar('SELECT PlayerName FROM PlayerNames WHERE PlayerId = ?', {
        userIdentifier,
    }, function (userName)
        if userName then
            TriggerClientEvent('gameConsole:userName:userInBase', id2, true, userName)
            
        else
            TriggerClientEvent('gameConsole:userName:userInBase', id2, false, nil)
        end
    end)
end)