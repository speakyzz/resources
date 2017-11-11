ESX                             = nil
local PlayerData                = {}
local GUI                       = {}
GUI.Time                        = 0
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local OnJob                     = false
local TargetCoords              = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenDiscoActionsMenu()

	local elements = {
		{label = 'Sortir Véhicule', value = 'vehicle_list'},
		{label = 'Tenue de travail', value = 'cloakroom'},
		{label = 'Tenue civile', value = 'cloakroom2'},
		{label = 'Deposer Stock', value = 'put_stock'},
		{label = 'Prendre Stock', value = 'get_stock'}
	}

	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
  		table.insert(elements, {label = 'Retirer argent société', value = 'withdraw_society_money'})
  		table.insert(elements, {label = 'Déposer argent ',        value = 'deposit_money'})
  		--table.insert(elements, {label = 'Blanchir argent',        value = 'wash_money'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'disco_actions',
		{
			title    = 'Disco',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'vehicle_list' then
				local elements = {
					{label = 'Limousine', value = 'stretch'},
					{label = 'Dépaneuse', value = 'benson'}					
				}

				if Config.EnablePlayerManagement and PlayerData.job ~= nil and 
					(PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'gerant' or PlayerData.job.grade_name == 'dj') then
					table.insert(elements, {label = 'Dubsta6x6', value = 'dubsta3'})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'spawn_vehicle',
					{
						title    = 'Véhicule de service',
						elements = elements
					},
					function(data, menu)
						for i=1, #elements, 1 do							
							if Config.MaxInService == -1 then
								local playerPed = GetPlayerPed(-1)
								local coords    = Config.Zones.VehicleSpawnPoint.Pos
								ESX.Game.SpawnVehicle(data.current.value, coords, 90.0, function(vehicle)
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								end)
								break
							else
								ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
									if canTakeService then
										local playerPed = GetPlayerPed(-1)
										local coords    = Config.Zones.VehicleSpawnPoint.Pos
										ESX.Game.SpawnVehicle(data.current.value, coords, 90.0, function(vehicle)
											TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
										end)
									else
										ESX.ShowNotification('Service complet : ' .. inServiceCount .. '/' .. maxInService)
									end
								end, 'disco')
								break
							end
						end						
						menu.close()
					end,
					function(data, menu)
						menu.close()
						OpenDiscoActionsMenu()
					end
				)
			end

			if data.current.value == 'cloakroom' then
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

    				if skin.sex == 0 then
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
    				else
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
    				end
    
				end)
			end

			if data.current.value == 'cloakroom2' then
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

    				TriggerEvent('skinchanger:loadSkin', skin)
    
				end)
			end

			if data.current.value == 'put_stock' then
        	  OpenPutStocksMenu()
      		end

      		if data.current.value == 'get_stock' then
        	  OpenGetStocksMenu()
      		end

			if data.current.value == 'withdraw_society_money' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'withdraw_society_money_amount',
					{
						title = 'Montant du retrait'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:withdrawMoney', 'disco', amount)
						end
					end,
					function(data, menu)
						menu.close()
					end
				)
			end

			if data.current.value == 'deposit_money' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'deposit_money_amount',
					{
						title = 'Montant du dépôt'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:depositMoney', 'disco', amount)
						end
					end,
					function(data, menu)
						menu.close()
					end
				)
			end

			if data.current.value == 'wash_money' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'wash_money_amount',
					{
						title = 'Montant à blanchir'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:washMoney', 'disco', amount)
						end
					end,
					function(data, menu)
						menu.close()
					end
				)
			end
		end,
		function(data, menu)
			menu.close()
			CurrentAction     = 'disco_actions_menu'
			CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu.'
			CurrentActionData = {}
		end
	)
end

function OpenDiscoHarvestMenu()

	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name ~= 'barman' then
		local elements = {
			{label = 'Menthe', value = 'menthe'},
			{label = 'Pomme de terre', value = 'pommedeterre'},
			{label = 'Raisin', value = 'raisin'},
			{label = 'Steack haché', value = 'steackhache'},
			{label = 'Feuille de Coca', value = 'feuilledecoca'},
			{label = 'Thé froid', value = 'thefroid'},
			{label = 'Orange', value = 'orange'},
			{label = 'Céréales Maltées', value = 'cerealesmaltees'},
			{label = 'Sirop', value = 'sirop'},
			{label = 'Cacao', value = 'cacao'},
			{label = 'Eau Gazifiée', value = 'eaugazifie'},
			{label = 'Agrume', value = 'agrume'},
			{label = 'Caféine', value = 'cafeine'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'disco_harvest',
			{
				title    = 'Récolte',
				elements = elements
			},
			function(data, menu)
				if data.current.value == 'menthe' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest')
				end

				if data.current.value == 'pommedeterre' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest2')
				end

				if data.current.value == 'raisin' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest3')
				end

				if data.current.value == 'steackhache' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest4')
				end

				if data.current.value == 'feuilledecoca' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest5')
				end

				if data.current.value == 'thefroid' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest6')
				end

				if data.current.value == 'orange' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest7')
				end

				if data.current.value == 'cerealesmaltees' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest8')
				end

				if data.current.value == 'sirop' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest9')
				end

				if data.current.value == 'cacao' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest10')
				end

				if data.current.value == 'eaugazifie' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest11')
				end

				if data.current.value == 'agrume' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest12')
				end

				if data.current.value == 'cafeine' then
					menu.close()
					TriggerServerEvent('esx_discojob:startHarvest13')
				end

			end,
			function(data, menu)
				menu.close()
				CurrentAction     = 'disco_harvest_menu'
				CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu de récolte.'
				CurrentActionData = {}
			end
		)
	else
		ESX.ShowNotification("Vous n'êtes ~r~pas assez expérimenté~s~ pour effectuer cette action.")
	end
end

function OpenDiscoCraftMenu()
	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name ~= 'barman' then

		local elements = {
			{label = 'Mojito', value = 'mojito'},
			{label = 'Vodka', value = 'vodka'},
			{label = 'champagne', value = 'champagne'},
			{label = 'Hamburger', value = 'hamburger'},
			{label = 'Coca', value = 'coca'},
			{label = 'Ice-Tea', value = 'icetea'},
			{label = 'Orangina', value = 'orangina'},
			{label = 'Wisky', value = 'wisky'},
			{label = 'Diabolo', value = 'diabolo'},
			{label = 'Chocolat Chaud', value = 'chocolatchaud'},
			{label = 'Perrier', value = 'perrier'},
			{label = 'Schweppes', value = 'schweppes'},
			{label = 'Café', value = 'cafe'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'disco_craft',
			{
				title    = 'Preparation boisson',
				elements = elements
			},
			function(data, menu)
				if data.current.value == 'mojito' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft')
				end

				if data.current.value == 'vodka' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft2')
				end

				if data.current.value == 'champagne' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft3')
				end

				if data.current.value == 'hamburger' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft4')
				end

				if data.current.value == 'coca' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft5')
				end

				if data.current.value == 'icetea' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft6')
				end

				if data.current.value == 'orangina' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft7')
				end

				if data.current.value == 'wisky' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft8')
				end

				if data.current.value == 'diabolo' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft9')
				end

				if data.current.value == 'chocolatchaud' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft10')
				end

				if data.current.value == 'perrier' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft11')
				end

				if data.current.value == 'schweppes' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft12')
				end

				if data.current.value == 'cafe' then
					menu.close()
					TriggerServerEvent('esx_discojob:startCraft13')
				end

			end,
			function(data, menu)
				menu.close()
				CurrentAction     = 'disco_craft_menu'
				CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu établi.'
				CurrentActionData = {}
			end
		)
	else
		ESX.ShowNotification("Vous n'êtes ~r~pas assez expérimenté~s~ pour effectuer cette action.")
	end
end

function OpenMobileDiscoActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'mobile_disco_actions',
		{
			title    = 'Disco',
			elements = {
				{label = 'Facuration', value = 'billing'},
				--{label = 'Crocheter', value = 'hijack_vehicle'},
				--{label = 'Réparer', value = 'fix_vehicle'},
				{label = 'Nettoyer', value = 'clean_vehicle'},
				--{label = 'Fourrière', value = 'del_vehicle'},
				--{label = 'Plateau', value = 'dep_vehicle'},
				{label = 'Placer objets', value = 'object_spawner'}
			}
		},
		function(data, menu)
			if data.current.value == 'billing' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'billing',
					{
						title = 'Montant de la facture'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else							
							menu.close()							
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification('Aucun joueur à proximité')
							else
								TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_disco', 'Disco', amount)
							end
						end
					end,
				function(data, menu)
					menu.close()
				end
				)
			end

			if data.current.value == 'hijack_vehicle' then

				local playerPed = GetPlayerPed(-1)
				local coords    = GetEntityCoords(playerPed)

				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

					local vehicle = nil

					if IsPedInAnyVehicle(playerPed, false) then
						vehicle = GetVehiclePedIsIn(playerPed, false)
					else
						vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
					end

					if DoesEntityExist(vehicle) then
						TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
						Citizen.CreateThread(function()
							Citizen.Wait(10000)
							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ClearPedTasksImmediately(playerPed)
							TriggerEvent('esx:showNotification', 'Véhicule ~g~déverouillé')
						end)
					end

				end

			end

			if data.current.value == 'fix_vehicle' then
			
				local playerPed = GetPlayerPed(-1)
				local coords    = GetEntityCoords(playerPed)
				
				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					
					local vehicle = nil

					if IsPedInAnyVehicle(playerPed, false) then
						vehicle = GetVehiclePedIsIn(playerPed, false)
					else
						vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
					end
					
					if DoesEntityExist(vehicle) then
						TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
						Citizen.CreateThread(function()
							Citizen.Wait(20000)
							SetVehicleFixed(vehicle)
							SetVehicleDeformationFixed(vehicle)
							SetVehicleUndriveable(vehicle, false)
							ClearPedTasksImmediately(playerPed)
							TriggerEvent('esx:showNotification', 'Véhicule ~g~réparé')
						end)
					end
				end
			end

			if data.current.value == 'clean_vehicle' then
			
				local playerPed = GetPlayerPed(-1)
				local coords    = GetEntityCoords(playerPed)
				
				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					
					local vehicle = nil

					if IsPedInAnyVehicle(playerPed, false) then
						vehicle = GetVehiclePedIsIn(playerPed, false)
					else
						vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
					end
					
					if DoesEntityExist(vehicle) then
						TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
						Citizen.CreateThread(function()
							Citizen.Wait(10000)
							SetVehicleDirtLevel(vehicle, 0)
							ClearPedTasksImmediately(playerPed)
							TriggerEvent('esx:showNotification', 'Véhicule ~g~néttoyé')
						end)
					end
				end
			end
			
			if data.current.value == 'del_vehicle' then
			
				local ped = GetPlayerPed( -1 )

				if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
					local pos = GetEntityCoords( ped )

					if ( IsPedSittingInAnyVehicle( ped ) ) then 
						local vehicle = GetVehiclePedIsIn( ped, false )

						if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
							TriggerEvent('esx:showNotification', 'Vehicule ~r~mis en fourrière')
							SetEntityAsMissionEntity( vehicle, true, true )
							deleteCar( vehicle )
						else 
							TriggerEvent('esx:showNotification', 'Vous devez être assis du ~r~côté conducteur!')
						end 
					else
						local playerPos = GetEntityCoords( ped, 1 )
						local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
						local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

						if ( DoesEntityExist( vehicle ) ) then
							TriggerEvent('esx:showNotification', 'Vehicule ~r~mis en fourrière')
							SetEntityAsMissionEntity( vehicle, true, true )
							deleteCar( vehicle )
						else 
							TriggerEvent('esx:showNotification', 'Vous devez être ~r~près d\'un véhicule~s~ pour le mettre en fourrière')
						end 
					end 
				end
			end
			
			if data.current.value == 'dep_vehicle' then
			
				local playerped = GetPlayerPed(-1)
				local vehicle = GetVehiclePedIsIn(playerped, true)
	
				local towmodel = GetHashKey('flatbed')
				local isVehicleTow = IsVehicleModel(vehicle, towmodel)

				if isVehicleTow then

					local coordA = GetEntityCoords(playerped, 1)
					local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
					local targetVehicle = getVehicleInDirection(coordA, coordB)
		
					if currentlyTowedVehicle == nil then
						if targetVehicle ~= 0 then
							if not IsPedInAnyVehicle(playerped, true) then
								if vehicle ~= targetVehicle then
									AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
									currentlyTowedVehicle = targetVehicle
									TriggerEvent('esx:showNotification', 'Vehicule ~b~attaché~s~ avec succès!')
								else
									TriggerEvent('esx:showNotification', '~r~Impossible~s~ d\'attacher votre propre dépanneuse')
								end
							end
						else
							TriggerEvent('esx:showNotification', 'Il n\'y a ~r~pas de véhicule~s~ à attacher')
						end
					else
						AttachEntityToEntity(currentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
						DetachEntity(currentlyTowedVehicle, true, true)
						currentlyTowedVehicle = nil
						TriggerEvent('esx:showNotification', 'Vehicule ~b~détattaché~s~ avec succès!')
					end
				else
					TriggerEvent('esx:showNotification', '~r~Impossible! ~s~Vous devez avoir un ~b~Flatbed ~s~pour ça')
				end
			end

			if data.current.value == 'object_spawner' then

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'mobile_disco_actions_spawn',
					{
						title    = 'Objets',
						align    = 'top-left',
						elements = {
					    {label = 'Plot',     value = 'prop_roadcone02a'},
					    {label = 'Boîte à outils', value = 'prop_toolchest_01'},
						},
					},
					function(data2, menu2)


						local model     = data2.current.value
						local playerPed = GetPlayerPed(-1)
						local coords    = GetEntityCoords(playerPed)
						local forward   = GetEntityForwardVector(playerPed)
						local x, y, z   = table.unpack(coords + forward * 1.0)

						if model == 'prop_roadcone02a' then
							z = z - 2.0
						elseif model == 'prop_toolchest_01' then
							z = z - 2.0
						end

						ESX.Game.SpawnObject(model, {
							x = x,
							y = y,
							z = z
						}, function(obj)
							SetEntityHeading(obj, GetEntityHeading(playerPed))
							PlaceObjectOnGroundProperly(obj)
						end)

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

			end

		end,
	function(data, menu)
		menu.close()
	end
	)
end

RegisterNetEvent('esx_discojob:onHijack')
AddEventHandler('esx_discojob:onHijack', function()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

		local vehicle = nil

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		local crochete = math.random(100)
		local alarm    = math.random(100)

		if DoesEntityExist(vehicle) then
			if alarm <= 33 then
				SetVehicleAlarm(vehicle, true)
				StartVehicleAlarm(vehicle)
			end
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)
				if crochete <= 66 then
					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)
					TriggerEvent('esx:showNotification', '~g~Véhicule déverouillé')
				else
					TriggerEvent('esx:showNotification', '~r~Crochetage raté')
					ClearPedTasksImmediately(playerPed)
				end
			end)
		end

	end
end)

RegisterNetEvent('esx_discojob:onCarokit')
AddEventHandler('esx_discojob:onCarokit', function()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
				
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					
		local vehicle = nil

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end
					
		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				ClearPedTasksImmediately(playerPed)
				TriggerEvent('esx:showNotification', '~g~Carosserie réparée')
			end)
		end
	end
end)

RegisterNetEvent('esx_discojob:onFixkit')
AddEventHandler('esx_discojob:onFixkit', function()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
				
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					
		local vehicle = nil

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end
					
		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(20000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleUndriveable(vehicle, false)
				ClearPedTasksImmediately(playerPed)
				TriggerEvent('esx:showNotification', '~g~Véhicule réparé')
			end)
		end
	end
end)

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_discojob:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = 'Disco Stock',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = 'Quantité'
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification('Quantité invalide')
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_discojob:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

  ESX.TriggerServerCallback('esx_discojob:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = 'Inventaire',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = 'Quantité'
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification('Quantité invalide')
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_discojob:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end


function setEntityHeadingFromEntity ( vehicle, playerPed )
    local heading = GetEntityHeading(vehicle)
    SetEntityHeading( playerPed, heading )
end

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

AddEventHandler('esx_discojob:hasEnteredMarker', function(zone)
	if zone == 'DiscoActions' then
		CurrentAction     = 'disco_actions_menu'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu.'
		CurrentActionData = {}
	end
	if zone == 'Garage' then
		CurrentAction     = 'disco_harvest_menu'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu de récolte.'
		CurrentActionData = {}
	end
	if zone == 'Craft' then
		CurrentAction     = 'disco_craft_menu'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu établi.'
		CurrentActionData = {}
	end
	if zone == 'VehicleDeleter' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule.'
			CurrentActionData = {}
		end
	end
end)

AddEventHandler('esx_discojob:hasExitedMarker', function(zone)

	if zone == 'Craft' then
		TriggerServerEvent('esx_discojob:stopCraft')
		TriggerServerEvent('esx_discojob:stopCraft2')
		TriggerServerEvent('esx_discojob:stopCraft3')
		TriggerServerEvent('esx_discojob:stopCraft4')
		TriggerServerEvent('esx_discojob:stopCraft5')
		TriggerServerEvent('esx_discojob:stopCraft6')
		TriggerServerEvent('esx_discojob:stopCraft7')
		TriggerServerEvent('esx_discojob:stopCraft8')
		TriggerServerEvent('esx_discojob:stopCraft9')
		TriggerServerEvent('esx_discojob:stopCraft10')
		TriggerServerEvent('esx_discojob:stopCraft11')
		TriggerServerEvent('esx_discojob:stopCraft12')
		TriggerServerEvent('esx_discojob:stopCraft13')
	end

	if zone == 'Garage' then
		TriggerServerEvent('esx_discojob:stopHarvest')
		TriggerServerEvent('esx_discojob:stopHarvest2')
		TriggerServerEvent('esx_discojob:stopHarvest3')
		TriggerServerEvent('esx_discojob:stopHarvest4')
		TriggerServerEvent('esx_discojob:stopHarvest5')
		TriggerServerEvent('esx_discojob:stopHarvest6')
		TriggerServerEvent('esx_discojob:stopHarvest7')
		TriggerServerEvent('esx_discojob:stopHarvest8')
		TriggerServerEvent('esx_discojob:stopHarvest9')
		TriggerServerEvent('esx_discojob:stopHarvest10')
		TriggerServerEvent('esx_discojob:stopHarvest11')
		TriggerServerEvent('esx_discojob:stopHarvest12')
		TriggerServerEvent('esx_discojob:stopHarvest13')
	end

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

AddEventHandler('esx_discojob:hasEnteredEntityZone', function(entity)

	local playerPed = GetPlayerPed(-1)

	if PlayerData.job ~= nil and PlayerData.job.name == 'disco' and not IsPedInAnyVehicle(playerPed, false) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour enlever l\'objet'
		CurrentActionData = {entity = entity}
	end

end)

AddEventHandler('esx_discojob:hasExitedEntityZone', function(entity)

	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end

end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'Vanilla Club',
		number     = 'disco',
		base64Icon = 'data:image/png;base64,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'
	}
	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)



Citizen.CreateThread(function()		
	local blip = AddBlipForCoord(Config.Zones.DiscoActions.Pos.x, Config.Zones.DiscoActions.Pos.y, Config.Zones.DiscoActions.Pos.z)
	SetBlipSprite (blip, 93)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, 83)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Bar Vanilla")
	EndTextCommandSetBlipName(blip)
end)

-- Display markers
Citizen.CreateThread(function()
	while true do		
		Wait(0)		
		if PlayerData.job ~= nil and PlayerData.job.name == 'disco' then

			local coords = GetEntityCoords(GetPlayerPed(-1))
			
			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'disco' then
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
				TriggerEvent('esx_discojob:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_discojob:hasExitedMarker', LastZone)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)

		local entity, distance = ESX.Game.GetClosestObject({
			'prop_roadcone02a',
			'prop_toolchest_01'
		})

		if distance ~= -1 and distance <= 3.0 then

 			if LastEntity ~= entity then
				TriggerEvent('esx_discojob:hasEnteredEntityZone', entity)
				LastEntity = entity
			end

		else

			if LastEntity ~= nil then
				TriggerEvent('esx_discojob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end

		end

	end
end)


-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'disco' then                
                if CurrentAction == 'disco_actions_menu' then
                    OpenDiscoActionsMenu()
                end
                if CurrentAction == 'disco_harvest_menu' then
                    OpenDiscoHarvestMenu()
                end
                if CurrentAction == 'disco_craft_menu' then
                    OpenDiscoCraftMenu()
                end
                if CurrentAction == 'delete_vehicle' then
                    local playerPed = GetPlayerPed(-1)
                    local vehicle   = GetVehiclePedIsIn(playerPed,  false)
                    local hash      = GetEntityModel(vehicle)
                    if hash == GetHashKey('stretch') or hash == GetHashKey('benson') or hash == GetHashKey('dubsta3') then
                        if Config.MaxInService ~= -1 then
                            TriggerServerEvent('esx_service:disableService', 'disco')
                        end                        
                        DeleteVehicle(vehicle)
                    else
                        ESX.ShowNotification('Vous ne pouvez ranger que des ~b~véhicules de Vanilla Unicorn~s~.')
                    end
                end
                if CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end
                CurrentAction = nil               
            end
        end

        if IsControlJustReleased(0, 167) and PlayerData.job ~= nil and PlayerData.job.name == 'disco' then
            OpenMobileDiscoActionsMenu()
        end
    end
end)

-- wisky Effect
RegisterNetEvent('esx_disco:drinkwisky')
AddEventHandler('esx_disco:drinkwisky', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING", 0, true)
       	Citizen.Wait(5000)
       	DoScreenFadeOut(1000)
       	Citizen.Wait(1000)
       	ClearPedTasksImmediately(GetPlayerPed(-1))
       	SetTimecycleModifier("spectator5")
       	SetPedMotionBlur(GetPlayerPed(-1), true)
       	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
       	SetPedIsDrunk(GetPlayerPed(-1), true)
       	DoScreenFadeIn(1000)
       	Citizen.Wait(600000)
       	DoScreenFadeOut(1000)
       	Citizen.Wait(1000)
       	DoScreenFadeIn(1000)
       	ClearTimecycleModifier()
       	ResetScenarioTypesEnabled()
       	ResetPedMovementClipset(GetPlayerPed(-1), 0)
       	SetPedIsDrunk(GetPlayerPed(-1), false)
       	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- vodka Effect
RegisterNetEvent('esx_disco:drinkvodka')
AddEventHandler('esx_disco:drinkvodka', function()
	RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING", 0, true)
       	Citizen.Wait(5000)
       	DoScreenFadeOut(1000)
       	Citizen.Wait(1000)
       	ClearPedTasksImmediately(GetPlayerPed(-1))
       	SetTimecycleModifier("spectator5")
       	SetPedMotionBlur(GetPlayerPed(-1), true)
       	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
       	SetPedIsDrunk(GetPlayerPed(-1), true)
       	DoScreenFadeIn(1000)
       	Citizen.Wait(600000)
       	DoScreenFadeOut(1000)
       	Citizen.Wait(1000)
       	DoScreenFadeIn(1000)
       	ClearTimecycleModifier()
       	ResetScenarioTypesEnabled()
       	ResetPedMovementClipset(GetPlayerPed(-1), 0)
       	SetPedIsDrunk(GetPlayerPed(-1), false)
       	SetPedMotionBlur(GetPlayerPed(-1), false)
end)