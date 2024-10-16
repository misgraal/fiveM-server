RegisterNetEvent("gameConsole:userName:changeUserName", function (newUserName)
    
    id = source
    local userIdentifier = GetPlayerIdentifierByType(source, 'license')

    MySQL.insert('INSERT INTO PlayerNames (PlayerId, PlayerName) VALUES (?, ?) ON DUPLICATE KEY UPDATE PlayerName = ?', {
        userIdentifier,
        newUserName,
        newUserName,
    }, function()
        print(id)
        TriggerClientEvent('gameConsole:userName:confirmChangeUserName', id, newUserName, id)
    end)


end)

RegisterNetEvent('gameConsole:userName:checkUserInBase', function()
    
    id2 = source
    local userIdentifier = GetPlayerIdentifierByType(source, "license")

    MySQL.scalar('SELECT PlayerName FROM PlayerNames WHERE PlayerId = ?', {
        userIdentifier,
    }, function (userName)
        if userName then
            TriggerClientEvent('gameConsole:userName:userInBase', id2, true, userName, id2)
            
        else
            TriggerClientEvent('gameConsole:userName:userInBase', id2, false, nil, id2)
        end
    end)

    ---------------------------
    -- Enter user dynamic id --
    ---------------------------

    MySQL.insert('UPDATE PlayerNames SET playerDynamicId = ? WHERE PlayerId = ?', {
        id2,
        userIdentifier,
    })
end)