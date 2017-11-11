ESX = nil
local topay = nil
local Vehicles   = {}
local contrat = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onMySQLReady', function()

	Categories       = MySQL.Sync.fetchAll('SELECT * FROM vehicle_categories')
	local vehicles   = MySQL.Sync.fetchAll('SELECT * FROM vehicles')

	for i=1, #vehicles, 1 do

		local vehicle = vehicles[i]

		for j=1, #Categories, 1 do
			if Categories[j].name == vehicle.category then
				vehicle.categoryLabel = Categories[j].label
			end
		end

		table.insert(Vehicles, vehicle)

	end

end)


function getcontrat(source ,plate)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
			MySQL.Async.fetchAll(
					'SELECT * FROM owned_vehicles WHERE owner = @owner',
					{
						['@owner'] = xPlayer.identifier
					},
					function(result)
					

						for i=1, #result, 1 do
							 vehicleProps = json.decode(result[i].vehicle)

							if vehicleProps.plate == plate then
							

								contrat = result[i].assured
		
								
								break	
							end

						end
					
				end)
				
	return contrat
end


ESX.RegisterServerCallback('esx_assurance:getVehicles', function(source, cb)
	cb(Vehicles)
end)


RegisterServerEvent('esx_assurance:pay')
AddEventHandler('esx_assurance:pay', function(topay, vehicule, contrat)
local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.get('money') >= topay then
		xPlayer.removeMoney(topay)
		TriggerClientEvent('esx_assurance:setvehicule', source, vehicule, contrat)


	else
		TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez pour payer")
	-- body
	end
end)

RegisterServerEvent('esx_assurance:recover')
AddEventHandler('esx_assurance:recover', function(data)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
				MySQL.Async.fetchAll(
					'SELECT * FROM owned_vehicles WHERE owner = @owner',
					{
						['@owner'] = xPlayer.identifier
					},
					function(result)
					local vehicle = nil
					local value = nil
					local contrat = nil
					local valuels = nil

						for i=1, #result, 1 do
							vehicledb = result[i].vehicle
							 vehicleProps = json.decode(result[i].vehicle)

							if vehicleProps.plate == data.plate then
							

								contrat = result[i].assured
								value	= result[i].value
								valuels	= result[i].valuels
								vehicle = vehicleProps
								
								break	
							end

					end
	if value == 0 then
		for i=1, #Vehicles, 1 do
			if Vehicles[i].model == data.model then
				vehicleData2 = Vehicles[i]
				
				break
			end
		end
		value = vehicleData2.price
		MySQL.Async.execute(
				'UPDATE owned_vehicles SET value = @value WHERE vehicle = @vehicule',
						{
										['@value']  = value,
										['@vehicule'] = vehicledb
									}
								)
	end
		if vehicle ~= nil then 
			if contrat == 'min'	then
				topay = value * 0.10
				TriggerClientEvent('esx_assurance:topay', _source, topay, vehicle, contrat)
			elseif contrat == 'maxi' then
				topay = (value + valuels) * 0.10
				TriggerClientEvent('esx_assurance:topay', _source, topay, vehicle, contrat)
			end
		end
	end)
		

end)





RegisterServerEvent('esx_assurance:Avehicule')
AddEventHandler('esx_assurance:Avehicule', function(plate, contrat)


local xPlayer = ESX.GetPlayerFromId(source)

				MySQL.Async.fetchAll(
					'SELECT * FROM owned_vehicles WHERE owner = @owner',
					{
						['@owner'] = xPlayer.identifier
					},
					function(result)
					local found = {}

						for i=1, #result, 1 do
							found = result[i].vehicle
							local vehicleProps = json.decode(result[i].vehicle)

							if vehicleProps.plate == plate then
						
								break
							end

					end
	
		if found ~= nil then 


			MySQL.Async.execute(
				'UPDATE owned_vehicles SET assured = @contrat WHERE vehicle = @vehicule',
						{
										['@contrat']  = contrat,
										['@vehicule'] = found
									}
								)
		end
	end)
end)


ESX.RegisterServerCallback('esx_assurance:getVehiclesAssured', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE owner = @owner AND assured != @status',
		{
			['@owner'] = xPlayer.identifier,
			['@status'] = 'false'
		},
		function(result)
				local vehicles = {}
					for i=1, #result, 1 do
						local vehicleData = json.decode(result[i].vehicle)
						table.insert(vehicles, vehicleData)
					end
						
			cb(vehicles)
		
			end
	)

end)


function PayRent(d, h, m)

	MySQL.Async.fetchAll(
		'SELECT * FROM users',
		{},
		function(_users)

			local prevMoney = {}
			local newMoney  = {}

			for i=1, #_users, 1 do
				prevMoney[_users[i].identifier] = _users[i].money
				newMoney[_users[i].identifier]  = _users[i].money
			end

			MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE assured != @status',
		{
			['@status'] = 'false'
		},
				function(result)

					local xPlayers = ESX.GetPlayers()
					local renttopay = nil

					for i=1, #result, 1 do

						local foundPlayer = false
						local xPlayer     = nil

						for i=1, #xPlayers, 1 do
            				local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
							if xPlayer2.identifier == result[i].owner then
								foundPlayer = true
								xPlayer     = xPlayer2
							end
						end

						if result[i].assured == 'min' then
							renttopay = result[i].value * 0.01
						else
							renttopay = result[i].value * 0.02
						end
						if foundPlayer then
							xPlayer.removeMoney(renttopay)
							TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ~g~payé~s~ votre assurance de véhicule : ~g~$' .. renttopay)
						
						else
							newMoney[result[i].owner] = newMoney[result[i].owner] - renttopay
						end


					end

					for k,v in pairs(prevMoney) do
						if v ~= newMoney[k] then

							MySQL.Async.execute(
								'UPDATE users SET money = @money WHERE identifier = @identifier',
								{
									['@money']      = newMoney[k],
									['@identifier'] = k
								}
							)

						end
					end

				end
			)

		end
	)

end

TriggerEvent('cron:runAt', 20, 00, PayRent)