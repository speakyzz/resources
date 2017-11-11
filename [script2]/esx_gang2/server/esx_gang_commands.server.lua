TriggerEvent('es:addGroup', 'gangmaster', 'user', function(group) end)

TriggerEvent('es:addGroupCommand', 'setgang', 'gangmaster', function(source, args, user)
  local xPlayer = ESX.GetPlayerFromId(args[2])
  xPlayer.setGang(args[3], tonumber(args[4]))
end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {
  help = 'assigner un gang', 
  params = {
    { name = "id",       help = 'identification du joueur'            }, 
    { name = "gang",     help = 'le gang que vous souhaitez assigner' }, 
    { name = "grade_id", help = 'le niveau dans le gang'              }
  }
})
 



