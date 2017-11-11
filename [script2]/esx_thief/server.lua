local Users = {}

ESX 				= nil
itemsCanBeStolen 	= {}

Citizen.CreateThread(function()
	while(not ESX)do
		Wait(0)
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
			MySQL.Async.fetchAll("SELECT * FROM items WHERE can_steal = '1'", {}, function(result) 
				for _, v in ipairs(result) do
					table.insert(itemsCanBeStolen, v.name)
				end
			end)
			ESX.RegisterServerCallback('esx:itemsCanBeStolen', function(source, cb)
				cb(itemsCanBeStolen)
			end)
			ESX.RegisterServerCallback('handsup:getValue', function(source, cb, targetSID)
				if Users[targetSID] then
					cb(Users[targetSID])
				else
					cb({value = false, time = 0})
				end
			end)
		end)
	end
end)

RegisterServerEvent('esx:stealPlayer')
AddEventHandler('esx:stealPlayer', function(target, item, type, quantity)
	local src = source
	TriggerEvent('esx:stealInventoryItem', src, target, type, item, quantity)
end)

RegisterServerEvent('esx:stealInventoryItem')
AddEventHandler('esx:stealInventoryItem', function(source, target, typei, itemName, quantity)
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	if typei == 'default' then

		local sourceItem    = sourceXPlayer.getInventoryItem(itemName)
		local targetItem    = targetXPlayer.getInventoryItem(itemName)
		if quantity > 0 and targetItem.count >= quantity then
			if sourceItem.limit ~= -1 and (targetItem.count + sourceItem.count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, "Your inventory is full")
			else
				targetXPlayer.removeInventoryItem(itemName, quantity)
				sourceXPlayer.addInventoryItem   (itemName, quantity)

				TriggerClientEvent('esx:showNotification', _source, 'You stole' .. ' ~g~x' .. quantity  .. ' ' .. ESX.Items[itemName].label .. '~w~  to '   .. targetXPlayer.name)
				TriggerClientEvent('esx:showNotification', target, sourceXPlayer.name .. ' has stolen you ' .. ' ~g~x'  .. quantity .. ' ' .. ESX.Items[itemName].label)
			end

		else
			TriggerClientEvent('esx:showNotification', _source, "Invalid quantity")
		end

	elseif typei == 'item_money' then

  		quantity = math.ceil(quantity)

		if quantity > 0 and targetXPlayer.player.get('money') >= quantity then

			targetXPlayer.removeMoney(quantity)
			sourceXPlayer.addMoney(quantity)

			TriggerClientEvent('esx:showNotification', _source, 'You stole' .. ' ~g~$' .. quantity .. ' to '   .. targetXPlayer.name)
			TriggerClientEvent('esx:showNotification', target,  sourceXPlayer.name .. ' has stolen you ' .. ' ~g~$'  .. quantity)

		else
			TriggerClientEvent('esx:showNotification', _source, "Invalid amount")
		end	

  	elseif typei == 'item_black_money' then

  		quantity = math.ceil(quantity)

  		if quantity > 0 and targetXPlayer.getAccounts('black_money') >= quantity then

			targetXPlayer.removeAccountMoney('black_money', quantity)
			sourceXPlayer.addAccountMoney('black_money', quantity)

			TriggerClientEvent('esx:showNotification', _source, 'You stole' .. ' ~r~$' .. quantity .. ' to '   .. targetXPlayer.name)
			TriggerClientEvent('esx:showNotification', target,  sourceXPlayer.name .. ' has stolen you ' .. ' ~r~$'  .. quantity)

		else
			TriggerClientEvent('esx:showNotification', _source, "Invalid amount")
		end

	elseif typei == 'item_account' then

		if quantity > 0 and targetXPlayer.getAccount(itemName).money >= quantity then

			targetXPlayer.removeAccountMoney(itemName, quantity)
			sourceXPlayer.addAccountMoney(itemName, quantity)

			TriggerClientEvent('esx:showNotification', _source, 'You stole' .. ' [' .. Config.AccountLabels[itemName] .. '] ~g~$' .. quantity .. ' to '   .. targetXPlayer.name)
			TriggerClientEvent('esx:showNotification', target,  sourceXPlayer.name .. 'has stolen you ['  .. Config.AccountLabels[itemName] .. '] ~g~$' .. quantity)

		else
			TriggerClientEvent('esx:showNotification', _source, "Invalid amount")
		end	

	elseif typei == 'item_weapon' then
		
		targetXPlayer.removeWeapon(itemName)
		sourceXPlayer.addWeapon(itemName, quantity)

		local weaponLabel = itemName

		for i=1, #Config.Weapons, 1 do
			if Config.Weapons[i].name == itemName then
				weaponLabel = Config.Weapons[i].label
				break
			end
		end

		TriggerClientEvent('esx:showNotification', _source, 'You stole x1 ~g~' .. weaponLabel .. ' to '   .. targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', target,  sourceXPlayer.name .. ' has stolen you x1 ~g~' .. weaponLabel)		
	end
end)

RegisterServerEvent("handsup:update")
AddEventHandler("handsup:update", function(bool)
	local source = source
	Users[source] = {value = bool, time = os.time()}
end)

RegisterServerEvent("handsup:getValue")
AddEventHandler("handsup:getValue", function(targetSID)
	local source = source
	if Users[targetSID] then
		TriggerClientEvent("handsup:returnValue", source, Users[targetSID])
	else
		TriggerClientEvent("handsup:returnValue", source, Users[targetSID])
	end
end)