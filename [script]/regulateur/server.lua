vehStorage = {}

RegisterServerEvent("ls:check")
AddEventHandler("ls:check", function(plate, isPlayerInside, notificationParam)
	local source = source
	local identifier = GetPlayerIdentifiers(source)[1]
	Search(plate, playerIdentifier, isPlayerInside, notificationParam, source)
end)

RegisterServerEvent("ls:refreshid")
AddEventHandler("ls:refreshid", function(plate,vehicle)

	--UpdateTheTable(plate, vehicle)
end)






