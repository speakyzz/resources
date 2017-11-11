local weaponStealeableList = {453432689, 1593441988, 584646201, 2578377531, 324215364}

function IsAbleToSteal(targetSID, err)
	local validated = false
	for i=1, #weaponStealeableList do
		if GetCurrentPedWeapon(GetPlayerPed(-1), weaponStealeableList[i], false) then
			validated = true
			break
		end
	end

	if not(validated) then
		err("Vous devez avoir une arme pour le faire.")
	else
    	ESX.TriggerServerCallback('handsup:getValue', function(result)
      		local result = result
      		if result.value then
      			err(false)
      		else
      			err("La personne n'a pas les mains en l'air!")
      		end
      	end, targetSID)
	end
end

function OpenStealMenu(target)
	if(ESX)then
		ESX.TriggerServerCallback('esx:getOtherPlayerData', function(targeted_player)
			ESX.TriggerServerCallback('esx:itemsCanBeStolen', function(items)
				local targetName 		= GetPlayerName(target)
				local data 				= targeted_player.inventory
				local itemsCanBeStolen	= {}
				local elements	 		= {}

				local function CanSteal(item_name)
					local count = 0
					for i=1, #(items) do
						if(items[i] == item_name)then
							count = count + 1
						end
					end
					if(count > 0)then
						return true
					else
						return false
					end
				end

				table.insert(elements, {
					label     = '[Cash] $' .. targeted_player.money,
					count     = targeted_player.money,
					type      = 'item_money',
					value     = 'money'
				})

				for _, v in ipairs(data) do
					if(v.count > 0 and CanSteal(v.name))then
						table.insert(elements, {
							label     = v.label .. ' - ' .. v.count,
							realLabel = v.label,
							value     = v.name,
							count 	  = v.count
						})
					end
				end

				if(#(elements) < 1)then
					ESX.ShowNotification(targetName .. "'s inventory empty.")
					ESX.UI.Menu.CloseAll()
					return
				end

				ESX.UI.Menu.CloseAll()
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'inventory',
				{
					title  = targetName .. "'s inventory",
					elements = elements,
					align = 'top-left'
				},

				function(data, menu)

					menu.close()
					local elements = {}

					table.insert(elements, {label = "Steal", action = "steal", type = data.current.type, value = data.current.value, count = data.current.count})
					table.insert(elements, {label = "Return", action = "return"})

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'inventory_item',
						{
							title = targetName .. "'s inventory",
							align = "top-left",
							elements = elements
						},

						function(data, menu)

							local item = data.current.value
							local type = data.current.type

							if(data.current.action == 'steal')then

								ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'inventory_item_count_steal',
									{
										title = "Amount"
									},

									function(data2, menu2)

										local quantity = tonumber(data2.value)
										local _, distance = GetClosestPlayer()

										if(distance <= 5 and distance > -1)then
											if(quantity <= data.current.count)then
												TriggerServerEvent('esx:stealPlayer', target, item, type, quantity)
											elseif(quantity > data.current.count)then
												ESX.ShowNotification("La cible n'a pas assez!")
											end
										else
											ESX.ShowNotification("Le joueur est trop loin.")
										end

										menu2.close()
										menu.close()
										OpenStealMenu(target)
										return

									end,

									function(data2, menu2)
										menu2.close()
										menu.close()
									end)

						elseif(data.current.action == 'return')then
							ESX.UI.Menu.CloseAll()
							OpenStealMenu(target)
						end
					end)
				end,
				function(data, menu)
					menu.close()
				end)
			end)
		end, target)
	end
end

function GetPlayers()
    local players = {}

    for i = 0, 1000 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	return closestPlayer, closestDistance
end