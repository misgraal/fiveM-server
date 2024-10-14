RegisterCommand("givew", function(_, args)
    local targetId = args[1]
    local weaponName = args[2] or "WEAPON_CARBINERIFLE"
    local ammoCount = args[3] or 100

    print(1)

    TriggerServerEvent("mi_giveWeapon:givew", targetId, weaponName, ammoCount)

end)

RegisterNetEvent("mi_giveWeapon:givewc", function(hash, ammoCount)
    print(playerPed, hash, ammoCount)
    print(PlayerPedId())

    playerPed = PlayerPedId()

    GiveDelayedWeaponToPed(playerPed, hash, ammoCount, true)
end)