ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_glasses:pay')
AddEventHandler('esx_glasses:pay', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(Config.Price)

	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. '$' .. Config.Price)

end)

RegisterServerEvent('esx_glasses:saveGlasses')
AddEventHandler('esx_glasses:saveGlasses', function(skin)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'user_glasses', xPlayer.identifier, function(store)
		
		store.set('hasGlasses', true)
		
		store.set('skin', {
			glasses_1 = skin.glasses_1,
			glasses_2 = skin.glasses_2
		})

	end)

end)


ESX.RegisterServerCallback('esx_glasses:checkMoney', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= Config.Price then
		cb(true)
	else
		cb(false)
	end

end)


ESX.RegisterServerCallback('esx_glasses:getGlasses', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'user_glasses', xPlayer.identifier, function(store)
		
		local hasGlasses = (store.get('hasGlasses') and store.get('hasGlasses') or false)
		local skin    = (store.get('skin')    and store.get('skin')    or {})

		cb(hasGlasses, skin)

	end)

end)
