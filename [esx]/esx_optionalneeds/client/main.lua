ESX                  = nil
local IsAlreadyDrunk = false
local IsAlreadySmoking = true
local DrunkLevel     = -1
local SmokingLevel    = -1

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function Drunk(level, start)
  
  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    if start then
      DoScreenFadeOut(800)
      Wait(1000)
    end

    if level == 0 then

      RequestAnimSet("move_m@drunk@slightlydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)

    elseif level == 1 then

      RequestAnimSet("move_m@drunk@moderatedrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)

    elseif level == 2 then

      RequestAnimSet("move_m@drunk@verydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)

    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrunk(playerPed, true)

    if start then
      DoScreenFadeIn(800)
    end

  end)

end


  
  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    if start then
      DoScreenFadeOut(0)
      Wait(1000)
    end

    if level == 0 then

      RequestAnimSet("menuperso_actions_Others_fumeruneclope")
      
      while not HasAnimSetLoaded("menuperso_actions_Others_fumeruneclope") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "menuperso_actions_Others_fumeruneclope", true)

    elseif level == 1 then

      RequestAnimSet("menuperso_actions_Others_fumeruneclope")
      
      while not HasAnimSetLoaded("menuperso_actions_Others_fumeruneclope") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "menuperso_actions_Others_fumeruneclope", true)

    elseif level == 2 then

      RequestAnimSet("menuperso_actions_Others_fumeruneclope")
      
      while not HasAnimSetLoaded("menuperso_actions_Others_fumeruneclope") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "menuperso_actions_Others_fumeruneclope", true)

    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, false)
    SetPedIsSmoking(playerPed, true)

    if start then
      DoScreenFadeIn(0)
    end

  end)



function Reality()

  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    DoScreenFadeOut(800)
    Wait(1000)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)

    DoScreenFadeIn(800)

  end)

end



  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    DoScreenFadeOut(0)
    Wait(1000)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsSmoking(playerPed, false)
    SetPedMotionBlur(playerPed, false)

    DoScreenFadeIn(0)

  end)

end

AddEventHandler('esx_status:loaded', function(status)


  TriggerEvent('esx_status:registerStatus', 'drunk', 0, '#8F15A5', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )

	Citizen.CreateThread(function()

		while true do

			Wait(1000)

			TriggerEvent('esx_status:getStatus', 'drunk', function(status)
				
				if status.val > 0 then
					
          local start = true

          if IsAlreadyDrunk then
            start = false
          end

          local level = 0

          if status.val <= 250000 then
            level = 0
          elseif status.val <= 500000 then
            level = 1
          else
            level = 2
          end

          if level ~= DrunkLevel then
            Drunk(level, start)
          end

          IsAlreadyDrunk = true
          DrunkLevel     = level
				end

				if status.val == 0 then
          
          if IsAlreadyDrunk then
            Reality()
          end

          IsAlreadyDrunk = false
          DrunkLevel     = -1

				end

			end)

		end

	end)

end)


AddEventHandler('esx_status:loaded', function(status)

  TriggerEvent('esx_status:registerStatus', 'smoking', 0, '#1C1C1C', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )

	Citizen.CreateThread(function()

		while true do

			Wait(1000)

			TriggerEvent('esx_status:getStatus', 'smoking', function(status)
				
				if status.val > 0 then
					
          local start = true

          if IsAlreadySmoking then
            start = false
          end

          local level = 0

          if status.val <= 250000 then
            level = 0
          elseif status.val <= 500000 then
            level = 1
          else
            level = 2
          end

          if level ~= SmokingLevel then
            Drunk(level, start)
          end

          IsAlreadySmoking = true
          DrunkLevel     = level
				end

				if status.val == 0 then
          
          if IsAlreadySmoking then
            Reality()
          end

          IsAlreadySmoking = false
          DrunkLevel     = -1

				end

			end)

		end

	end)

end)




RegisterNetEvent('esx_optionalneeds:onDrink')
AddEventHandler('esx_optionalneeds:onDrink', function()
  
  local playerPed = GetPlayerPed(-1)
  
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Citizen.Wait(1000)
  ClearPedTasksImmediately(playerPed)

end)

RegisterNetEvent('esx_optionalneeds:clipappistol')
AddEventHandler('esx_optionalneeds:clipappistol', function()
  AddAmmoToPed(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'),25)
end)



