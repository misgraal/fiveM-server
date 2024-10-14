RegisterNUICallback("tpToPlayer", function(data, cb) 
    local targetName = data.playerName
    local playerId = PlayerId()

    local found = false
    local notfound = false

    while not found or not notfound do
        local i = 0
        if GetPlayerName(i) == targetName then
            found = true
        elseif GetPlayerName(i) ~= targetName then
            i += 1
        elseif GetPlayerName(i) == "Invalid" then
            notfound = true
        end
    end

    if notfound == true then
        SendNUIMessage({
            type = "notfound",
            targetName = targetName,
        })
        return
    end

    TriggerServerEvent("gameConsole:teleport:requestTeleport", playerId, i)

    cb({ })
end)


RegisterClientEvent("gameConsole:teleport:teleportPlayer", function (x, y, z)
    local playerId = PlayerPedId()

    SetEntityCoords(playerId, x, y, z)
end)