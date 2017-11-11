local PlayersWorking = {}
local Players = {}

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.set('caution', 0)
end)

AddEventHandler('esx:playerDropped', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local caution = xPlayer.get('caution')
	TriggerEvent('esx_addonaccount:getAccount', 'caution', xPlayer.identifier, function(account)
		account.addMoney(caution)
	end)
end)

RegisterServerEvent('esx_gang:setCautionInCaseOfDrop')
AddEventHandler('esx_gang:setCautionInCaseOfDrop', function(caution)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.set('caution', caution)
end)

RegisterServerEvent('esx_gang:giveBackCautionInCaseOfDrop')
AddEventHandler('esx_gang:giveBackCautionInCaseOfDrop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addonaccount:getAccount', 'caution', xPlayer.identifier, function(account)
		local caution = account.money
		account.removeMoney(caution)
		if caution > 0 then
			xPlayer.addAccountMoney('bank', caution)
			TriggerClientEvent('esx:showNotification', _source, _U('bank_deposit_g').. caution .. _U('bank_deposit2'))
		else
			TriggerClientEvent('esx:showNotification', _source, _U('bank_nodeposit'))
		end
	end)
end)

local function Work(source, item)
	SetTimeout(item[1].time, function()

		if PlayersWorking[source] == true then

			local xPlayer = ESX.GetPlayerFromId(source)

			for i=1, #item, 1 do
				local itemQtty = 0
				if item[i].name ~= _U('delivery') then
					itemQtty = xPlayer.getInventoryItem(item[i].db_name).count
				end

				local requiredItemQtty = 0
				if item[1].requires ~= "nothing" then
					requiredItemQtty = xPlayer.getInventoryItem(item[1].requires).count
				end

				if item[i].name ~= _U('delivery') and itemQtty >= item[i].max then
					TriggerClientEvent('esx:showNotification', source, _U('max_limit') .. item[i].name)
				elseif item[i].requires ~= "nothing" and requiredItemQtty <= 0 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough') .. item[1].requires_name .. _U('not_enough2'))
				else
					if item[i].name ~= _U('delivery') then
						-- Chances to drop the item
						if item[i].drop == 100 then
							xPlayer.addInventoryItem(item[i].db_name, item[i].add)
						else
							local chanceToDrop = math.random(100)
							if chanceToDrop <= item[i].drop then
								xPlayer.addInventoryItem(item[i].db_name, item[i].add)
							end
						end
					else
						xPlayer.addMoney(item[i].price)
					end

				end
			end

			if item[1].requires ~= "nothing" then
				local itemToRemoveQtty = xPlayer.getInventoryItem(item[1].requires).count
				if itemToRemoveQtty > 0 then
					xPlayer.removeInventoryItem(item[1].requires, item[1].remove)
				end
			end
			Work(source, item)

		end
	end)
end

RegisterServerEvent('esx_gang:startWork')
AddEventHandler('esx_gang:startWork', function(item)
	local source = source
	PlayersWorking[source] = true
	Work(source, item)
end)

RegisterServerEvent('esx_gang:stopWork')
AddEventHandler('esx_gang:stopWork', function()
	local source = source
	PlayersWorking[source] = false
end)

RegisterServerEvent('esx_gang:caution')
AddEventHandler('esx_gang:caution', function(cautionType, cautionAmount, spawnPoint, vehicle)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if cautionType == "take" then
		xPlayer.removeAccountMoney('bank', cautionAmount)
		xPlayer.set('caution', cautionAmount)
		TriggerClientEvent('esx:showNotification', source, _U('bank_deposit_r') .. cautionAmount .. _U('caution_taken'))
		TriggerClientEvent('esx_gang:spawnJobVehicle', source, spawnPoint, vehicle)
	elseif cautionType == "give_back" then
		xPlayer.addAccountMoney('bank', cautionAmount)
		xPlayer.set('caution', 0)
		TriggerClientEvent('esx:showNotification', source, _U('bank_deposit_g') .. cautionAmount .. _U('caution_returned'))
	end
end)

ESX = nil


-- ====================================================================================================================
-- Basic event handler
-- ====================================================================================================================
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- ====================================================================================================================
-- Event handler
-- ====================================================================================================================
RegisterServerEvent('esx_gang:confisquePlayerItem')
AddEventHandler('esx_gang:confisquePlayerItem', function(target, itemType, itemName, amount)
  local xPlayer = ESX.GetPlayerFromId(source)
  local yPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then
    local label = xPlayer.getInventoryItem(itemName).label

    yPlayer.removeInventoryItem(itemName, amount)
    xPlayer.addInventoryItem(itemName, amount)

    TriggerClientEvent(
      'esx:showNotification',
      xPlayer.source,
      _U('confisque_inventaire_x') .. amount .. ' ' .. label .. _U('from') .. yPlayer.name
    )
    TriggerClientEvent(
      'esx:showNotification',
      yPlayer.source,
      '~b~' .. yPlayer.name .. _U('confisque_inventaire_y') .. amount .. ' ' .. label
    )
  end

  if itemType == 'item_account' then
    yPlayer.removeMoney(amount)
    xPlayer.addMoney(amount)

    TriggerClientEvent(
      'esx:showNotification',
      xPlayer.source,
      _U('confisque_argent_x') .. amount .. _U('from') .. yPlayer.name
    )
    TriggerClientEvent(
      'esx:showNotification',
      yPlayer.source,
      '~b~' .. yPlayer.name .. _U('confisque_argent_y') .. amount
    )
  end

  if itemType == 'item_weapon' then
    yPlayer.removeWeapon(itemName)
    xPlayer.addWeapon(itemName, amount)

    TriggerClientEvent(
      'esx:showNotification',
      xPlayer.source,
      _U('confisque_arme_x') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. yPlayer.name
    )
    TriggerClientEvent(
      'esx:showNotification',
      yPlayer.source,
      '~b~' .. yPlayer.name .. _U('confisque_arme_y') .. ESX.GetWeaponLabel(itemName)
    )
  end
end)

RegisterServerEvent('esx_gang:handcuff')
AddEventHandler('esx_gang:handcuff', function(target)
  TriggerClientEvent('esx_gang:handcuff', target)
end)

RegisterServerEvent('esx_gang:putInVehicle')
AddEventHandler('esx_gang:putInVehicle', function(target)
  TriggerClientEvent('esx_gang:putInVehicle', target)
end)

RegisterServerEvent('esx_gang:outVehicle')
AddEventHandler('esx_gang:outVehicle', function(target)
  TriggerClientEvent('esx_gang:outVehicle', target)
end)


-- ====================================================================================================================
-- Server callback
-- ====================================================================================================================
ESX.RegisterServerCallback('esx_gang:getOtherPlayerData', function(source, cb, target)
  local xPlayer = ESX.GetPlayerFromId(target)

  local data = {
    name      = GetPlayerName(target),
    job       = xPlayer.job,
    inventory = xPlayer.inventory,
    accounts  = xPlayer.accounts,
    weapons   = xPlayer.loadout
  }

  cb(data)
end)
