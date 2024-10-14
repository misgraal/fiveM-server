RegisterNetEvent("mi_giveWeapon:givew", function(targetId, weaponName, ammoCount)

    print(targetId, weaponName, ammoCount)

    local targetPed = GetPlayerPed(targetId)
    local hash = GetHashKey(weaponName)

    TriggerClientEvent("mi_giveWeapon:givewc", targetId, hash, ammoCount)

end)