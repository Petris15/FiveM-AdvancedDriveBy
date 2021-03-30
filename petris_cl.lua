function PetrisAdvancedDriveBy()
    local ped = PlayerPedId()
    local inveh = IsPedSittingInAnyVehicle(ped)
    local veh = GetVehiclePedIsUsing(ped)
    local vehspeed = GetEntitySpeed(veh) * 3.6
    if inveh then
        if vehspeed >= Config.MaxSpeedForDriveBy then
          SetPlayerCanDoDriveBy(PlayerId(), false)
        else
          SetPlayerCanDoDriveBy(PlayerId(), true)
        end
    end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1500)
    if IsPedSittingInAnyVehicle(PlayerPedId()) then
        PetrisAdvancedDriveBy()
    end
  end
end)
