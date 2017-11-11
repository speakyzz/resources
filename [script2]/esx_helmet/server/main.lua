ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_helmet:pay')
AddEventHandler('esx_helmet:pay', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(Config.Price)

	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. '$' .. Config.Price)

end)

RegisterServerEvent('esx_helmet:saveHelmet')
AddEventHandler('esx_helmet:saveHelmet', function(skin)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'user_helmet', xPlayer.identifier, function(store)
		
		store.set('hasHelmet', true)
		
		store.set('skin', {
			helmet_1 = skin.helmet_1,
			helmet_2 = skin.helmet_2
		})

	end)

end)


ESX.RegisterServerCallback('esx_helmet:checkMoney', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= Config.Price then
		cb(true)
	else
		cb(false)
	end

end)


ESX.RegisterServerCallback('esx_helmet:getHelmet', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'user_helmet', xPlayer.identifier, function(store)
		
		local hasHelmet = (store.get('hasHelmet') and store.get('hasHelmet') or false)
		local skin    = (store.get('skin')    and store.get('skin')    or {})

		cb(hasHelmet, skin)

	end)

end)
