ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_slotmachine:sv:1')
AddEventHandler('esx_slotmachine:sv:1', function(amount,a,b,c)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = tonumber(amount)
		if (xPlayer.getMoney() >= tonumber(amount)) then
		xPlayer.removeMoney(amount)
		-- xPlayer.removeAccountMoney('black_money', (amount))
		TriggerClientEvent("esx_slotmachine:1",source,tonumber(amount),tostring(a),tostring(b),tostring(c))
	else
		TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Not enough money in wallet!^0")
	end
end)

RegisterServerEvent('esx_slotmachine:sv:2')
AddEventHandler('esx_slotmachine:sv:2', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	    xPlayer.addMoney(amount)
	    -- xPlayer.addAccountMoney('black_money', (amount))
	    TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "YOU WON!: " .. amount .. "$.")
	end)
