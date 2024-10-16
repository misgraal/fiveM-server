AddEventHandler('playerSpawned', function()
    TriggerServerEvent('gameConsole:userName:checkUserInBase')
end)

AddEventHandler('onResourceStart', function()
    TriggerServerEvent('gameConsole:userName:checkUserInBase')
end)

RegisterNetEvent('gameConsole:userName:userInBase', function (isPlayerInBase, userName, userDId)
    if isPlayerInBase then
        SendNUIMessage({
            type = 'userName',
            userName = userName,
            userDId = userDId,
        })
    else
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "playerIsNotInBase",
        })
    end
end)


RegisterNUICallback("changeName", function(data, cb)
    cb({ })

    local newUserName = data.newName
    TriggerServerEvent('gameConsole:userName:changeUserName', newUserName)


end)


RegisterNetEvent('gameConsole:userName:confirmChangeUserName', function(newUserName, userDId)
    print("test")
    SendNUIMessage({
        type = 'confirmNewUserName',
        newName = newUserName,
    })

    SendNUIMessage({
        type = 'userName',
        userName = newUserName,
        userDId = userDId,
    })
end)