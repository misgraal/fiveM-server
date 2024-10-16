RegisterNetEvent("gameConsole:teleport:requestTeleport", function(targetId)
    local targetPedId = GetPlayerPed(targetId)
    local targetPos = GetEntityCoords(targetPedId)
    print(targetPos)

    TriggerClientEvent("gameConsole:teleport:teleport", source, targetPos.x, targetPos.y, targetPos.z)
end)