-- =========== CLIENT-SIDE =========== --

-------------------------------
-- Touches
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
myKey = Keys['N-']

Citizen.CreateThread(function()
	while(not ESX)do
		Wait(0)
		TriggerEvent('esx:getSharedObject', function(Object) 
			ESX = Object
		end)
	end
end)

Citizen.CreateThread(function()
	while(true)do
		Wait(0)
		if(IsControlJustPressed(1, myKey))then

			local target, distance = GetClosestPlayer()

			if(target ~= -1)then
				local target_id = GetPlayerServerId(target)
				if(distance <= 5 and distance > -1)then
					IsAbleToSteal(target_id, function(err)
						if(not err)then
							OpenStealMenu(target_id)
						else
							ESX.ShowNotification(err)
						end
					end)
				elseif(distance < 20 and distance > 5)then
					ESX.ShowNotification("Tu es trop loin")
				else
					ESX.ShowNotification("Il n'y a pas de joueurs")
				end
			else
				ESX.ShowNotification("Il n'y a pas de joueurs")
			end
		end
	end
end)