RegisterNetEvent("gameConsole:teleport:requestTeleport", function (playerId, targetId)
    local targetPedId = GetPlayerPed(targetId)
    local targetPos = GetEntityCoords(targetPedId)

    TriggerClientEvent("gameConsole:teleport:teleport", playerId, targetPos.x, targetPos.y, targetPos.z)
end)