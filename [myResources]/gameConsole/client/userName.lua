AddEventHandler('playerSpawned', function()
    TriggerServerEvent('gameConsole:userName:checkUserInBase')
end)

RegisterNetEvent('gameConsole:userName:userInBase', function (isPlayerInBase, userName)
    if isPlayerInBase then
        SendNUIMessage({
            type = 'userName',
            userName = userName,
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
    print(newUserName)
    TriggerServerEvent('gameConsole:userName:changeUserName', newUserName)


end)


RegisterNetEvent('gameConsole:userName:confirmChangeUserName', function(newUserName)
    print("test")
    SendNUIMessage({
        type = 'confirmNewUserName',
        newName = newUserName,
    })

    SendNUIMessage({
        type = 'userName',
        userName = newUserName,
    })
end)