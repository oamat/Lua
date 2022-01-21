--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------


--------------------------------------------------------------------------------------
------VEHICLES OR BASE PART SPAWN-----------------------------------------------------
--------------------------------------------------------------------------------------

--vehicles or towable parts... 
ChatCommands["!spawnv"] = function(playerId, command)
    Log(">> !spawnv - %s", command);

    local player = System.GetEntity(playerId);
  
	-- Only allow the following SteamId to invoke the command 
    local steamid = player.player:GetSteam64Id();
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
  
  -- or through faction restrictions
  -- allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction4_steamids"), steamid)
  
  -- or through actual current faction
  -- allowCommand = allowCommand or 4 == player.actor:GetFaction() -- faction 0 to 7 (same numbering as cvars)
  
    if isAdminUserWithPrivileges(steamid) then
        local vForwardOffset = {x=0,y=0,z=0}
        FastScaleVector(vForwardOffset, player:GetDirectionVector(), 2.0)

        local vSpawnPos = {x=0,y=0,z=0}
        FastSumVectors(vSpawnPos, vForwardOffset, player:GetWorldPos())
        
        local spawnParams = {}

        spawnParams.class = command
        spawnParams.name = spawnParams.class
        spawnParams.position = vSpawnPos                 

         local spawnedEntity = System.SpawnEntity(spawnParams)

         if not spawnedEntity then
            g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');
        end
    end
end


--------------------------------------------------------------------------------------
------CATEGORY AISM SPAWN--------------------------------------------------------------
--------------------------------------------------------------------------------------

ChatCommands['!aispawn'] = function(playerId, command)
    Log(">> !aispawn - %s", command);
    
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    -- Only allow the following SteamId to invoke the command
     -- admin steamid

    if isAdminUserWithPrivileges(steamid) then  
       
        local PosToSpawn = player:GetWorldPos();
        local _config = {   -- CMD Config
            CatagoryToSpawn = 'JerryCanDiesel', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        
        if (command and command ~= nil and command ~= '') then    
            AISM.SpawnCategory(PosToSpawn, command, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius);
        else        
            AISM.SpawnCategory(PosToSpawn, _config.CatagoryToSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius);
        end         
    end
end



--------------------------------------------------------------------------------------
------AIRDROPS ISM SPAWN------------------------------------------------------------------
--------------------------------------------------------------------------------------
--vehicles or towable parts... 
ChatCommands["!spawnaircrate"] = function(playerId, command)
    Log(">> !spawnaircrate - %s", command);

    local player = System.GetEntity(playerId); 
    local steamid = player.player:GetSteam64Id();  
  
    if isAdminUserWithPrivileges(steamid) then    
        if command == "1" then
            command ="PlaneCrashCrateSpawn"; --For event, without smoke
        elseif command == "2" then
            command ="UFOCrateSpawn"; --For event, without smoke
        elseif command == "3" then
            command =  "AirDropCrateSpawnMilitary"; --For event, without smoke
        elseif command == "4" then
            command = "AirDropCrateSpawnPolice";  --For event, without smoke              
        elseif command == "5" then
            command =  "AirDropCrateSpawnCivilian";  --For event, without smoke
        elseif command == "6" then
            command = "AirDropCrateSpawnExplosives";  --For event, without smoke 
        elseif command == "7" then
            command =  "AirDropCrateSpawnBaseBuilding";  --For event, without smoke
        elseif command == "8" then
            command =  "AirDropCrateSpawnRadiation"; --For event, without smoke 
        elseif command == "9" then
            command =  "AirDropSantaCrateSpawn";  -- Red For event, without smoke 
        elseif command == "10" then
            command =  "UFOSantaCrate";  -- Green For event, without smoke 
        elseif command == "11" then
            command = "UFOSantaCrateBlue";  -- Blue For event, without smoke : Random for the 6 crates type: Military, Police, Civilian, Radiation.         
        elseif command == "12" then 
             command = "PlaneCrashCrateSpawnNew";  -- Blue For event, without smoke : Random for the 6 crates type: Military, Police, Civilian, Radiation.          
        elseif command == "50" then 
            command = "AirDropCrateSpawn";  --For event, without smoke : Random for the 6 crates type: Military, Police, Civilian, Radiation.
        elseif command == "100" then
            command =  "UFOCrate"; --BETTER NOT FOR EVENT : smoke blue and mutants
        elseif command == "101" then
            command =  "PlaneCrashCrate"; --BETTER NOT FOR EVENT :  --smoke black and mutants
        elseif command == "102" then 
            command =  "AirDropCrate"; --BETTER NOT FOR EVENT :  --smoke green and mutants, Random for the 6 crates type: Military, Police, Civilian, Radiation.
        elseif command == "103" then
            command =  "AirDropSantaCrate"; --BETTER NOT FOR EVENT :  --smoke red                   
        else 
            command = "AirDropCrateSpawn";  -- this is implemented by the 6 random different crates
        end
        
        local vForwardOffset = {x=0,y=0,z=0};
        FastScaleVector(vForwardOffset, player:GetDirectionVector(), 2.0);
        local vSpawnPos = {x=0,y=0,z=0};
        FastSumVectors(vSpawnPos, vForwardOffset, player:GetWorldPos());        

        local spawnParams = {};
        spawnParams.class = command;
        spawnParams.name = spawnParams.class;
        spawnParams.position = vSpawnPos;                 
        local spawnedEntity = System.SpawnEntity(spawnParams)

        if not spawnedEntity then
            g_gameRules.game:SendTextMessage(4, playerId, 'Crate not found or something was wrong.');
        else 
           g_gameRules.game:SendTextMessage(4, playerId, command);
        end
    end
end



ChatCommands["!spawnvehicle"] = function(playerId, command)
    player = System.GetEntity(playerId);

    -- Determines if the command has a skin (it has to be a CRC32 text in order to work)
    -- If you don't know how to do this, just don't type the skin
    local vehiclename = command;  
    
    --[[ if (string.match(command, pattern)) then
        vehiclename, skin = string.match(command, '(.*) (.*)');
    else
        vehiclename = command;
        skin = '';
    end ]]
    -- Get a coordinate 5m in front of the player
    local vForwardOffset = {x=0, y=0, z=0};
    local vPointingPosition = {x=0, y=0, z=0};
    FastScaleVector(vForwardOffset, player:GetDirectionVector(), 4.0);
    FastSumVectors(vPointingPosition, vForwardOffset, player:GetWorldPos());

    -- Set the vehicle parameters
    local spawnParams = {};
    spawnParams.class = vehiclename;
    spawnParams.orientation = player:GetDirectionVector();    
    if (command == 'placeholder8' ) then
        vPointingPosition.z = vPointingPosition.z + 1;
    end
    spawnParams.position = vPointingPosition;

    -- Spawn the vehicle, it wont persist through server restarts though
    vehicle = System.SpawnEntity(spawnParams);

    -- Set oil and fuel to 100% and the skin in case one was provided
    vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":1000000,"oil":600000,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);
end
--------------------------------------------------------------------------------------
------ANIMAL SPAWN--------------------------------------------------------------------
------ EXAMPLES-----------------------------------------------------------------------
--------------------------------------------------------------------------------------

ChatCommands['!aispawnbabyspider'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'BabySpiderSingle', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end

ChatCommands['!aispawnbear'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'Bear', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end

ChatCommands['!aispawnbrute'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'BruteMutantSingle', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end


ChatCommands['!aispawndeer'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'DeerSingle', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end



ChatCommands['!aispawndog'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'twoheaddog', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end

ChatCommands['!aispawndonkey'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'Donkey', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end


ChatCommands['!aispawnram'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'Ram', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end


ChatCommands['!aispawnroach'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'GiantRoachSingle', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end


ChatCommands['!aispawnscorpion'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'GiantScorpion', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end


ChatCommands['!aispawnspider'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'HumanSpider', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end

ChatCommands['!aispawnwolf'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'lone_wolf', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end


ChatCommands['!aispawnzombie1'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'CrazySingle', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end

ChatCommands['!aispawnzombie2'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'SpikerSingle', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end

ChatCommands['!aispawnzombie3'] = function(playerId, command)
    local player = System.GetEntity(playerId)

    local steamid = player.player:GetSteam64Id()

    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    Log(' - Player used SpawnAI Command: ' .. player:GetName() .. '[' ..
            player.player:GetSteam64Id() .. ']')
    if isAdminUserWithPrivileges(steamid) then
        local _config = {
            -- CMD Config
            CatagoryToSpawn = 'HumanZombieSingle', -- Default Spawn if Not specified in ChatCommand Params
            MinSpawnRange = 5, -- minimum Distance to Spawn around the Player
            MaxSpawnRange = 10, -- maximum Distance to Spawn around the Player
            SpawnRadius = 90 -- Spawn Radius around player
            -- END Config
        }
        local AItoSpawn = nil
        if (command and command ~= '') then
            AItoSpawn = command
        else
            AItoSpawn = _config.CatagoryToSpawn
        end
        local PosToSpawn = player:GetWorldPos()
        Log(' - Spawning:' .. AItoSpawn .. ' @ ' .. 'x=' .. PosToSpawn.x ..
                ' y=' .. PosToSpawn.y .. ' z=' .. PosToSpawn.z)
        Log(' - Distance: ~' .. _config.MinSpawnRange .. ' - ' ..
                _config.MaxSpawnRange)
        Log(' - Radius: ' .. _config.SpawnRadius)
        AISM.SpawnCategory(PosToSpawn, AItoSpawn, true, _config.MinSpawnRange,
                           _config.MaxSpawnRange, _config.SpawnRadius)
    end
end




ChatCommands['!spawnhorde'] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    
    if isAdminUserWithPrivileges(steamid) then           
        local centerPos = player:GetWorldPos();
        centerPos.x = centerPos.x + 15;
        centerPos.y = centerPos.y + 15;
        local vForwardOffset = {x=0,y=0,z=0};
        local vSpawnPos = {x=0,y=0,z=0};
        FastScaleVector(vForwardOffset, player:GetDirectionVector(), 0);        
        FastSumVectors(vSpawnPos, vForwardOffset, centerPos);
    
    
        AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)

        AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0)

        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)

        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)

        AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)     
  
    end
end

ChatCommands['!spawnanimalhorde'] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    
    if isAdminUserWithPrivileges(steamid) then           
       local centerPos = player:GetWorldPos();
        centerPos.x = centerPos.x + 15;
        centerPos.y = centerPos.y + 15;
        local vForwardOffset = {x=0,y=0,z=0};
        local vSpawnPos = {x=0,y=0,z=0};
        FastScaleVector(vForwardOffset, player:GetDirectionVector(), 0);        
        FastSumVectors(vSpawnPos, vForwardOffset, centerPos);
    
    
        AISM.SpawnCategory(vSpawnPos, "Bear", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "Bear", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "Bear", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "Bear", true, 2.0, 5.0, 2.0)

        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GreyWolf", true, 2.0, 5.0, 2.0)

        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoache", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantRoach", true, 2.0, 5.0, 2.0)

        AISM.SpawnCategory(vSpawnPos, "GiantScorpion", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantScorpion", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantScorpion", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantScorpion", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantScorpion", true, 2.0, 5.0, 2.0)
        AISM.SpawnCategory(vSpawnPos, "GiantScorpion", true, 2.0, 5.0, 2.0)     
  
    end
end