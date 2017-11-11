--GeekGoggles--

local Medicalbills = 5

Citizen.CreateThread(function()
    while true do
        Wait(5)
        local ped = GetPlayerPed(-1)
        local yourplace = x,y,z
        if IsEntityDead(ped) then
            Wait(2000)
            TriggerServerEvent('mb:missionComplete', Medicalbills)
            ClearPedBloodDamage(GetPlayerPed(-1))
            ClearPedLastDamageBone(GetPlayerPed(-1))
            Wait(5000)
            TriggerEvent("esx:showNotification", "~y~(HopitalPanda)~w~ Frais de coma de ~g~$5~w~!")
            ClearPedTasks(ped)		
        end
    end
end)





