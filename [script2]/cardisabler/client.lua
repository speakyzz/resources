ESX= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)
		if isOwnedVehicle then
            local locked = GetVehicleDoorLockStatus(vehicle)
            if locked == 2 then -- if locked
                SetVehicleDoorsLocked(vehicle, 1)
                PlayVehicleDoorOpenSound(vehicle, 0)
               drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Welcome to your  ~r~Car ~w~Drive Safe! ~r~", 255, 255, 255, 255) 
            end
        else
            TriggerEvent('esx:showNotification', '~r~You need the Keys.')
        end
    end, GetVehicleNumberPlateText(vehicle))
 Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
	local playerPed = GetPlayerPed(-1) 
		if IsPedGettingIntoAVehicle(playerPed) then
			veh = GetVehiclePedIsTryingToEnter(playerPed)
			if GetVehicleClass(veh) <=14 then
				SetVehicleDoorsLocked(veh, 2)
				drawTxt(0.90, 1.40, 1.0,1.0,0.4, "You need a  ~r~Lockpick ~w~to get in this car! ~r~", 255, 255, 255, 255)
			end	
			if GetVehicleClass(veh) > 18 then	
				SetVehicleDoorsLocked(veh, 2)
				drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Lockpicking this Type of Vehicle is Against Server ~r~Rules ~w~Doing so is a Kick!~r~", 255, 255, 255, 255)
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do 
	Citizen.Wait(0)
		EnableDispatchService(3,false)
		EnableDispatchService(5,false)
	end
end)


function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
