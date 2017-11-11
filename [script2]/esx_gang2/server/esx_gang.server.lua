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