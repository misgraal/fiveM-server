RegisterCommand('changeped', function(source, args)
    ped = args[1] or "a_f_m_fatwhite_01"
    targetId = args[2]
    playerId = source

    if targetId == nil then
        if IsModelInCdimage(ped) and IsModelValid(ped) then 
            RequestModel(ped)
            while not HasModelLoaded(ped) do 
                Wait(0)
            end
            SetPlayerModel(playerId, ped)
            SetModelAsNoLongerNeeded(ped)
        end
        return
    end

    TriggerServerEvent("changePed:change", targetId, ped, playerId)
end)

RegisterNetEvent("changePed:client", function(ped)
    if IsModelInCdimage(ped) and IsModelValid(ped) then 
        RequestModel(ped)
        while not HasModelLoaded(ped) do 
            Wait(0)
        end
        SetPlayerModel(PlayerId(), ped)
        SetModelAsNoLongerNeeded(ped)
    end
end)


