local xPlayer = PlayerPedId();

Citizen.CreateThread(function()
    while true do
        -- variables local

        local markerX = -1037.91;
        local markerY = -2737.73;
        local markerZ = 19.67;

        local pedPos = GetEntityCoords(xPlayer);
        local dist = vector3(markerX, markerY, markerZ);
        local distance = GetDistanceBetweenCoords(pedPos, dist, true)


        if distance < 10 then
            -- Marker

            DrawMarker(
                20 --[[ integer ]],
                markerX --[[ number ]],
                markerY --[[ number ]],
                markerZ --[[ number ]],
                0.0 --[[ number ]],
                0.0 --[[ number ]],
                0.0 --[[ number ]],
                0.0 --[[ number ]],
                0.0 --[[ number ]],
                0.0 --[[ number ]],
                0.4 --[[ number ]],
                0.4 --[[ number ]],
                0.4 --[[ number ]],
                113 --[[ integer ]],
                14 --[[ integer ]],
                14 --[[ integer ]],
                170 --[[ integer ]],
                1 --[[ boolean ]],
                1 --[[ boolean ]],
                2 --[[ integer ]],
                0 --[[ boolean ]],
                nil --[[ string ]],
                nil --[[ string ]],
                0 --[[ boolean ]]
            );
            if distance < 1 then
                AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour demander un Kalahari.");
                DisplayHelpTextThisFrame("HELP", false)
                if IsControlJustPressed(1, 51) then
                    spawnCar("kalahari")
                end
            end
        end

        -- ----
        Citizen.Wait(10)
    end
end)

function spawnCar(car)
    local car = GetHashKey(car);
    local posVehicleX = -1032.04;
    local posVehicleY = -2729.18;
    local posVehicleZ = 20.16;
    local posVehicleH = 245.43;

    RequestModel(car);
    while not HasModelLoaded(car) do
        RequestModel(car);
        Citizen.Wait(50);
    end
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, posVehicleX, posVehicleY, posVehicleZ, posVehicleH, true, false);
    SetPedIntoVehicle(xPlayer, vehicle, -1);

    SetEntityAsNoLongerNeeded(vehicle);
end
