



Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) then

        if CurrentAction == 'scaleform_menu' then
          OpenShopMenu(CurrentActionData.zone)
        end

        CurrentAction = nil

      end

    end
  end
end)





Citizen.CreateThread(function()
    function drawscaleform(scaleform)
        scaleform = RequestScaleformMovie(scaleform)
        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
        PushScaleformMovieFunctionParameterString("~b~ANNONCE")
        PushScaleformMovieFunctionParameterString("Recrutement")
        PopScaleformMovieFunctionVoid()

        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
    while true do
        Citizen.Wait(0)
        drawscaleform("mp_big_message_freemode")
    end
end)

