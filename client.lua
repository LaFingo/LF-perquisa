ESX = exports.es_extended:getSharedObject()



RegisterNetEvent('vivalabulgaria')
AddEventHandler('vivalabulgaria', function(data)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
    TriggerEvent('ox_inventory:openInventory', 'player', GetPlayerServerId(closestPlayer))

    end
 end)




Citizen.CreateThread(function()
    while true do
        local aspetta = math.random(760, 1400)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityPlayingAnim(GetPlayerPed(closestPlayer), "missarmenian2", "corpse_search_exit_ped", 1) then
            aspetta = 3
            ESX.Game.Utils.DrawText3D(GetEntityCoords(GetPlayerPed(closestPlayer)), "[~b~E~s~] Per Perquisire ", 0.65)
            if IsControlJustReleased(0, 38) then 
                if not IsEntityPlayingAnim(GetPlayerPed(-1), "missarmenian2", "corpse_search_exit_ped", 1) then
                    TriggerEvent("vivalabulgaria")
                end
            end
        else
            aspetta = math.random(760, 1400)
        end
        Citizen.Wait(aspetta)
    end
end)
