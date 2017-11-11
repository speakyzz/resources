




Citizen.CreateThread(function()
    breakingnews()
    while true do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 200, 200, 200, 200, 0)
    end
end)


function breakingnews()
    scaleform = RequestScaleformMovie("breaking_news")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
		if i == 1000 then -- turns off after 20ish seconds
			UnloadScaleform(scaleform)
		end
    end

    PushScaleformMovieFunction(scaleform, "SET_TEXT")
    PushScaleformMovieFunctionParameterString("Météo")
    PushScaleformMovieFunctionParameterString("<b>~r~INFORMATION~d~</b>")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_SCROLL_TEXT")
    PushScaleformMovieFunctionParameterInt(0) -- top ticker
    PushScaleformMovieFunctionParameterInt(0) -- Since this is the first string, start at 0
    PushScaleformMovieFunctionParameterString("ATTENTION TEMPETE DE NEIGE PREVU POUR SAMEDI ET DIMANCHE")
    PopScaleformMovieFunctionVoid()

    
    PushScaleformMovieFunction(scaleform, "DISPLAY_SCROLL_TEXT")
    PushScaleformMovieFunctionParameterInt(0) -- Top ticker
    PushScaleformMovieFunctionParameterInt(0) -- Index of string
    PopScaleformMovieFunctionVoid()
    end

--Citizen.CreateThread(function()
    --while true do
        --Citizen.Wait(0)
        --breakingnews()
    --end
--end)

