-- ====================================================================================================================
-- Local function
-- ====================================================================================================================
function OpenActionsMenu(gangName)
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_actions', {
      title = gangName,
      align = 'top-left',
      elements = {
        { label = _U('citizen_interaction'), value = 'citizen_interaction' },
        { label = _U('vehicle_interaction'), value = 'vehicle_interaction '}
      }
    }, function(data, menu)
      if data.current.value == 'citizen_interaction' then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
            title = _U('citizen_interaction'),
            align = 'top-left',
            elements = {
              { label = _U('id_card'),         value = 'identity_card'   },
              { label = _U('search'),          value = 'body_search'     },
              { label = _U('handcuff'),        value = 'handcuff'        },
              { label = _U('put_in_vehicle'),  value = 'put_in_vehicle'  },
              { label = _U('out_the_vehicle'), value = 'out_the_vehicle' }
            }
          }, function(data2, menu2)
            local player, distance = ESX.Game.GetClosestPlayer()
            if distance ~= nil and distance <= 3 then
              if data2.current.value == 'identity_card' then
                OpenIdentityCardMenu(player)
              end
              if data2.current.value == 'body_search' then
                OpenBodySearchMenu(player)
              end
							if data2.current.value == 'handcuff' then
								TriggerServerEvent('esx_gang:handcuff', GetPlayerServerId(player))
							end
							if data2.current.value == 'put_in_vehicle' then
								TriggerServerEvent('esx_gang:putInVehicle', GetPlayerServerId(player))
							end
							if data2.current.value == 'out_the_vehicle' then
							    TriggerServerEvent('esx_gang:outVehicle', GetPlayerServerId(player))
							end
            else
              ESX.ShowNotification(_U('no_players_nearby'))
            end
          end, function(data2, menu2)
            menu2.close()
          end
        )
      end

      if data.current.value == 'vehicle_interaction' then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
            title = _U('vehicle_interaction'),
            align = 'top-left',
            elements = {
              { label = _U('pick_lock'), value = 'hijack_vehicle' }
            }
          }, function(data2, menu2)
            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)
            local vehicle   = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)

            if DoesEntityExist(vehicle) then
              local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
              if data2.current.value == 'hijack_vehicle' then
                local playerPed = GetPlayerPed(-1)
                local coords    = GetEntityCoords(playerPed)
                if IsAnyVehiclesNearPoint(coords.x, coords.y, coords.z, 3.0) then
                  local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
                  if DoesEntityExist(vehicle) then
                    Citizen.CreateThread(function()
                      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                      Wait(20000)
                      ClearPedTasksImmediately(playerPed)
                      SetVehicleDoorsLocked(vehicle, 1)
                      SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                      ESX.ShowNotification(_U('vehicle_unlocked'))
                    end)
                  end
                end
              end
            else
              ESX.ShowNotification(_U('no_vehicles_nearby'))
            end
          end, function(data2, menu2)
            menu2.close()
          end
        )
      end
    end, function(data, menu)
      menu.close()
    end
  )
end

function OpenIdentityCardMenu(player)
  ESX.TriggerServerCallback('esx_gang:getOtherPlayerData', function(data)
    local jobLabel = nil
    if data.job.grade_label ~= nil and data.job.grade_label ~= '' then
      jobLabel = 'Job: ' .. data.job.label .. ' - ' .. data.job.grade_label
    else
      jobLabel = 'Job: ' .. data.job.label
    end
    local elements = {
      { label = _U('name') .. data.name, value = nil },
      { label = jobLabel,                value = nil }
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
        title    = _U('citizen_interaction'),
        align    = 'top-left',
        elements = elements
      }, function(data, menu) end, function(data, menu) menu.close() end
    )
  end, GetPlayerServerId(player))
end

function OpenBodySearchMenu(player)
  ESX.TriggerServerCallback('esx_gang:getOtherPlayerData', function(data)
    local elements   = {}
    local blackMoney = 0

    for i = 1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    table.insert(elements, {
      label    = _U('confisque_argent_sale') .. blackMoney,
      value    = 'black_money',
      itemType = 'item_account',
      amount   = blackMoney
    })

    table.insert(elements, { label = _U('guns_label'), value = nil })

    for i = 1, #data.weapons, 1 do
      table.insert(elements, {
        label    = _U('confisque') .. ESX.GetWeaponLabel(data.weapons[i].name),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.ammo,
      })
    end

    table.insert(elements, { label = _U('inventory_label'), value = nil })

    for i = 1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label    = _U('confisque_inventory') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
          value    = data.inventory[i].name,
          itemType = 'item_standard',
          amount   = data.inventory[i].count
        })
      end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
        title    = _U('search'),
        align    = 'top-left',
        elements = elements
      }, function(data, menu)
        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = data.current.amount

        if data.current.value ~= nil then
          TriggerServerEvent(
            'esx_gang:confisquePlayerItem',
            GetPlayerServerId(player),
            itemType,
            itemName,
            amount
          )

          OpenBodySearchMenu(player)
        end
      end, function(data, menu)
        menu.close()
      end
    )
  end, GetPlayerServerId(player))
end