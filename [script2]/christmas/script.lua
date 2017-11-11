Citizen.CreateThread(function()
    while true 
    	do
		
		SetWeatherTypePersist("XMAS")
        SetWeatherTypeNowPersist("XMAS")
        SetWeatherTypeNow("XMAS")
        SetOverrideWeather("XMAS")
    	
		Citizen.Wait(1)
	end

end)