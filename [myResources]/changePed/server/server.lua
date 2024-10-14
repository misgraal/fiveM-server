RegisterNetEvent("changePed:change", function(targetId, ped, playerId)

    TriggerClientEvent("changePed:client", targetId, ped)

end)