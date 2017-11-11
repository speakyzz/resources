ESX                = nil
local PlayerData   = {}
local GUI          = {}
GUI.Time           = 0
local IsHandcuffed = false



-- ====================================================================================================================
-- Citizen thread
-- ====================================================================================================================
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Handcuff
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsHandCuffed then
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
    end
  end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(0,  168) and PlayerData.gang ~= nil and PlayerData.gang.name ~= 'nogang' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'menu_actions') and (GetGameTimer() - GUI.Time) > 150 then
			OpenActionsMenu(PlayerData.gang.label)
			GUI.Time = GetGameTimer()
		end
	end
end)


-- ====================================================================================================================
-- Event handler
-- ====================================================================================================================
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setGang')
AddEventHandler('esx:setGang', function(gang)
  PlayerData.gang = gang
end)

RegisterNetEvent('esx_gang:outVehicle')
AddEventHandler('esx_gang:outVehicle', function(target)
  local ped = GetPlayerPed(target)
  ClearPedTasksImmediately(ped)
  pedPosition = GetEntityCoords(GetPlayerPed(-1), true)
  local target_x = pedPosition.x + 2
  local target_y = pedPosition.y + 2
  SetEntityCoords(GetPlayerPed(-1), target_x, target_y, pedPosition.z)
end)

RegisterNetEvent('esx_gang:handcuff')
AddEventHandler('esx_gang:handcuff', function()
  IsHandCuffed    = not IsHandCuffed
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()
    if IsHandCuffed then
      RequestAnimDict('mp_arresting')

      while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
      end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed, true)
    else
      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed, true)
      FreezeEntityPosition(playerPed, false)
    end
  end)
end)

RegisterNetEvent('esx_gang:putInVehicle')
AddEventHandler('esx_gang:putInVehicle', function()
  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    if DoesEntityExist(vehicle) then
      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
      local freeSeat = nil

      for i = maxSeats - 1, 0, -1 do
        if IsVehicleSeatFree(vehicle, i) then
          freeSeat = i
          break
        end
      end

      if freeSeat ~= nil then
        TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
      end
    end
  end
end)