ESX              = nil
local PlayerData = {}
local Vehicles   = {}
local Vehicles2  = {}




Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	ESX.TriggerServerCallback('esx_vehicleshop:getVehicles', function(vehicles)
		Vehicles = vehicles
	end)
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)




RegisterNetEvent('esx_assurance:topay')
AddEventHandler('esx_assurance:topay', function(topay, vehicule, contrat) 
ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'assurance',
	{
		title = 'Voulez vous payer : '..topay,
		align = 'top-left',
		elements = {{label = 'Oui', value = vehicule},
					{label = 'Non', value = 'non'},
				   
			  },
	  },
        function(data3, menu3) --Submit Cb
 
        if data3.current.value == 'non' then
        ESX.UI.Menu.CloseAll()
        	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'assurance')
        else
        ESX.UI.Menu.CloseAll()
        TriggerServerEvent('esx_assurance:pay', topay, data3.current.value, contrat)
        end
  
            
        end,
        
        function(data3, menu3) --Cancel Cb
                menu3.close()
        end,
        function(data3, menu3) --Change Cb
         
        end
    )
end)







function OpenAssuranceMenu(zone)



	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'assurance',
		{
			title  = 'Assurance',
			elements = {{label = 'Assurer un véhicule', value = 'Avehicule'},
			           {label = 'Retrouver sont véhicule', value = 'Fvehicule'},
					},
		},
		function(data, menu)
				if data.current.value == 'Avehicule' then
    				vehicleN = GetClosestVehicle(Config.spawnpoint.Pos.x,  Config.spawnpoint.Pos.y,  Config.spawnpoint.Pos.z,  3.0,  0,  71)
    	 			if vehicleN ~= 0 then
    	 										ESX.UI.Menu.CloseAll()

													
		
														ESX.UI.Menu.Open(
														'default', GetCurrentResourceName(), 'assurance',
														{
														title    = 'Choisiser l assurance',
														align    = 'top-left',
														elements = {{label = '-----Contrat mini :----', value = nil},
																	{label = 'Vehicule sans accesoire / prix 1% du vehicule par jour', value = 'min'},
			           												{label = '-----Contrat Maxi :----', value = nil},
			           												{label = 'Vehicule avec accesoire / prix 2% du vehicule par jour', value = 'maxi'},
																},
														},
													function(data2, menu2)
													ESX.UI.Menu.CloseAll()
													TriggerEvent('esx:showNotification', "Votre véhicule immatriculé : [" ..GetVehicleNumberPlateText(vehicleN).."] est bien assuré : "..data2.current.value)
													TriggerServerEvent('esx_assurance:Avehicule', GetVehicleNumberPlateText(vehicleN), data2.current.value)		
												end,
											function(data2, menu2)
											menu2.close()
					
											end)



    					
										else
							
						TriggerEvent('esx:showNotification', "Placer votre véhicule sur le point jaune")
						end

					end
											if data.current.value == 'Fvehicule' then
												ESX.UI.Menu.CloseAll()
													ESX.TriggerServerCallback('esx_assurance:getVehiclesAssured', function(Vehicles2)
													local elements = {}
														if Vehicles2 == nil then
																table.insert(elements, {label = 'Aucun véhicule assuré ', value = nil})

															else

																for i=1, #Vehicles2, 1 do
																	for j=1, #Vehicles, 1 do
																		if Vehicles2[i].model == GetHashKey(Vehicles[j].model) then
																			Vehicles2[i].name = Vehicles[j].name
																			Vehicles2[i].model = Vehicles[j].model
																		end
																	end
																end

															for i=1, #Vehicles2, 1 do
															
																table.insert(elements, {label = Vehicles2[i].name .. ' [' .. Vehicles2[i].plate .. ']', value = Vehicles2[i]})
															
															end
		
														ESX.UI.Menu.Open(
														'default', GetCurrentResourceName(), 'backvehicle',
														{
														title    = 'Véhicule Assuré',
														align    = 'top-left',
														elements = elements
														},
													function(data2, menu2)		
												TriggerServerEvent('esx_assurance:recover', data2.current.value)
												end,
											function(data2, menu2)
											menu2.close()
										end
										)
									end
							end)


						end

				end,
				function(data, menu)

					menu.close()

			
					CurrentAction     = 'assurance'
					CurrentActionMsg  = 'assurance'
					CurrentActionData = {zone = zone}
				end
	)		
end

RegisterNetEvent('esx_assurance:setvehicule')
AddEventHandler('esx_assurance:setvehicule', function(vehicles, contrat)
	if contrat == 'maxi' then 
		ESX.Game.SpawnVehicle(vehicles.model, {
					x = Config.spawnpoint.Pos.x,
					y = Config.spawnpoint.Pos.y,
					z = 37.661562347412
				}, 25,function(vehicle)
					ESX.Game.SetVehicleProperties(vehicle, vehicles)
					end)
	TriggerEvent('esx:showNotification', "Votre véhicule est prêt !")
	elseif contrat == 'min' then
		ESX.Game.SpawnVehicle(vehicles.model, {
					x = Config.spawnpoint.Pos.x,
					y = Config.spawnpoint.Pos.y,
					z = 37.661562347412
				}, 25,function(vehicle)


				end)
	TriggerEvent('esx:showNotification', "Votre véhicule est prêt !")

	end


end)




AddEventHandler('esx_assurance:hasEnteredMarker', function(zone)

	CurrentAction     = 'assurance'
	CurrentActionMsg  = 'assurance'
	CurrentActionData = {zone = zone}

end)

AddEventHandler('esx_assurance:hasExitedMarker', function(zone)

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

end)

-- Create Blips
Citizen.CreateThread(function()
		local blip = AddBlipForCoord(Config.Zones.place.Pos.x, Config.Zones.place.Pos.y, Config.Zones.place.Pos.z)
		SetBlipSprite (blip, 76)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, 3)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Assurance')
		EndTextCommandSetBlipName(blip)
end)

-- Display markers
Citizen.CreateThread(function()
	while true do

		Wait(0)

			local coords = GetEntityCoords(GetPlayerPed(-1))

			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end


	end
end)

Citizen.CreateThread(function()
	while true do

		Wait(0)

			local coords = GetEntityCoords(GetPlayerPed(-1))

			
				
					if(GetDistanceBetweenCoords(coords, Config.spawnpoint.Pos.x, Config.spawnpoint.Pos.y, Config.spawnpoint.Pos.z, true) < Config.DrawDistance) then
							DrawMarker(1, Config.spawnpoint.Pos.x, Config.spawnpoint.Pos.y, Config.spawnpoint.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 204, 204, 0, 100, false, true, 2, false, false, false, false)
					end
		


	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)


			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_assurance:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_assurance:hasExitedMarker', LastZone)
			end

		end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString('Press ~INPUT_CONTEXT~ to Open')
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) then

        if CurrentAction == 'assurance' then
          OpenAssuranceMenu(CurrentActionData.zone)
        end

        CurrentAction = nil

      end

    end
  end
end)