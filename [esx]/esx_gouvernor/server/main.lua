ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'gouvernor', 'Gouverneur', 'society_gouvernor', 'society_gouvernor', 'society_gouvernor', {type = 'private'})

AddEventHandler('esx_phone:ready', function()

	TriggerEvent('esx_phone:registerCallback', function(source, phoneNumber, message, anon)
		
		local xPlayer  = ESX.GetPlayerFromId(source)
		local xPlayers = ESX.GetPlayers()
		local job      = 'Citoyen'

		if phoneNumber == "gouvernor" then

			for i=1, #xPlayers, 1 do

				local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
				
				if xPlayer2.job.name == 'gouvernor' then
					TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, job, false)
				end
			end

		end
		
	end)

end)


TriggerEvent('esx_phone:registerCallback', function(source, phoneNumber, message, anon)

	local xPlayer  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	if phoneNumber == 'gouvernor' then
		for i=1, #xPlayers, 1 do

			local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
			
			if xPlayer2.job.name == 'gouvernor' then
				TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, 'player')
			end
		end
	end
	
end)

RegisterServerEvent('esx_gouvernorjob:putStockItems')
AddEventHandler('esx_gouvernorjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouvernor', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_gouvernor:success')
AddEventHandler('esx_gouvernor:success', function()

  math.randomseed(os.time())

  local xPlayer        = ESX.GetPlayerFromId(source)
  local total          = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);
  local societyAccount = nil

  if xPlayer.job.grade >= 3 then
    total = total * 2
  end

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouvernor', function(account)
    societyAccount = account
  end)

  if societyAccount ~= nil then

    local playerMoney  = math.floor(total / 100 * 30)
    local societyMoney = math.floor(total / 100 * 70)

    xPlayer.addMoney(playerMoney)
    societyAccount.addMoney(societyMoney)

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. societyMoney)

  else

    xPlayer.addMoney(total)
    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)

  end

end)

