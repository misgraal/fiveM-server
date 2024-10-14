RegisterCommand('getw', function(source, args)


    local weaponName = args[1] or "WEAPON_CARBINERIFLE"
    local ammoCount = args[2] or 100

    local ammo = 100

    if tonumber(ammoCount) < 0 then
        ammo = 100
    else
        ammo = ammoCount
    end



    local playerPed = PlayerPedId()
    local weapon = GetHashKey(weaponName)

    GiveDelayedWeaponToPed(playerPed, weapon, ammo, true)

end)