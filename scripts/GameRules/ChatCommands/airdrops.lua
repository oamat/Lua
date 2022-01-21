
--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------

-- !airdrop | Spawns airdrop
ChatCommands["!airdrop"] = function(playerId, command)
    -- Log the command
    Log(">> !airdrop - %s", command)
    -- Add steamids you want to allow to use this command here. This is a comma delimited string
    --local allowed = "STEAMID"
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId)
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id()
    
    

    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
      
        local eventName
        local rnd = random(1, 8)
        if ( command and command ~= '' ) then
            rnd = tonumber(command)                
        end
        g_gameRules.game:SendTextMessage(4, playerId, 'event num : ' .. tostring(rnd));	

        if rnd <= 1 then
            AirDropPlane.Properties.CrateClassName="AirDropCrate"; --Red
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 2 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateGreen"; 
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 3 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateBlue"; 
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 4 then
            AirDropPlane.Properties.CrateClassName="AirDropCratePurple"; 
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 5 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateYellow"; 
            eventName = "AirDropPlane" --53,89% +... --> 60
        elseif rnd <= 6 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateBrown"; 
            eventName = "AirDropPlane" --53,89% +... --> 60
        elseif rnd <= 7 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateOrange";
            eventName = "AirDropPlane" --53,89% +... --> 60
        elseif rnd <= 8 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateGold";
            eventName = "AirDropPlane" --53,89% +... --> 60  
        end
    
        local spawnParams = {}
        spawnParams.class = eventName
        spawnParams.name = spawnParams.class
    
    --Log("Miscreated:SpawnWorldEvent - Spawning Event")
        local spawnedEntity = System.SpawnEntity(spawnParams)
    
        if not spawnedEntity then
            g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');	          
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'The Event has Started...');	 
        end       
    end
end

ChatCommands["!aircrash"] = function(playerId, command)
    -- Log the command
    Log(">> !aircrash - %s", command)
    -- Add steamids you want to allow to use this command here. This is a comma delimited string
    --local allowed = "STEAMID"
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId)
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id()

    
    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        -- Create a table to hold spawn parameters
        local eventName
        local rnd = random(1, 3)
        if (command and command ~= '') then
            rnd = tonumber(command)                
        end
        g_gameRules.game:SendTextMessage(4, playerId, 'event num : ' .. tostring(rnd));	

    if rnd <= 1 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke_yellow";
        AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_yellowcrash";
        eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
    elseif rnd <= 2 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke_gold";
        AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_goldcrash";
        eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
    elseif rnd <= 3 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke";
        AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_crash";
        eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
    end

    local spawnParams = {}
    spawnParams.class = eventName
    spawnParams.name = spawnParams.class

    --Log("Miscreated:SpawnWorldEvent - Spawning Event")
    local spawnedEntity = System.SpawnEntity(spawnParams)
       
        -- If spawn did not happen
        if not spawnedEntity then
            -- Log the failed spawning attempt
            g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');	
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'The Event has Started...' ..  AirPlaneCrash.Properties.ParticleEffectInAir);	 
        end   
    end
end

ChatCommands["!ufo"] = function(playerId, command)
    -- Log the command
    Log(">> !ufo - %s", command)
    -- Add steamids you want to allow to use this command here. This is a comma delimited string
    -- local allowed = ""
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId)
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id()
     
    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        -- Create a table to hold spawn parameters
        local eventName
        local rnd = random(1, 3)
        if (command and command ~= '') then
            rnd = tonumber(command)                
        end
        g_gameRules.game:SendTextMessage(4, playerId, 'event num : ' .. tostring(rnd));		

    if rnd <= 1 then
        UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash_purple";
        UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_purplesmoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%   
    elseif rnd <= 2 then
        UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash_blue";
        UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_bluesmoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%
    elseif rnd <= 3 then
        UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash";
        UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_smoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%
    end

    local spawnParams = {}
    spawnParams.class = eventName      
    spawnParams.name = spawnParams.class    

    --Log("Miscreated:SpawnWorldEvent - Spawning Event")
    local spawnedEntity = System.SpawnEntity(spawnParams)
       
        -- If spawn did not happen
        if not spawnedEntity then
            -- Log the failed spawning attempt
            g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');	
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'The Event has Started...' .. UFOCrash.Properties.ParticleEffectInAir);	 
        end   
    end
end

-- For debugging
--dump(ChatCommands)


ChatCommands["!randomevent"] = function(playerId, command)
    -- Log the command
    Log(">> !airdropcolor - %s", command)
    -- Add steamids you want to allow to use this command here. This is a comma delimited string
    --local allowed = "STEAMID"
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId)
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id()
    
    

    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
      
        local eventName
        local rnd = random(1, 14)
        if (command and command ~= '') then
            rnd = tonumber(command)                
        end
        g_gameRules.game:SendTextMessage(4, playerId, 'event num : ' .. tostring(rnd));	
        g_gameRules.game:SendTextMessage(4, playerId, 'random crate : ' .. tostring(rnd));	

        if rnd <= 1 then
            AirDropPlane.Properties.CrateClassName="AirDropCrate"; --Red
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 2 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateGreen"; 
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 3 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateBlue"; 
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 4 then
            AirDropPlane.Properties.CrateClassName="AirDropCratePurple"; 
            eventName = "AirDropPlane" --53,89% +... --> 60%
        elseif rnd <= 5 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateYellow"; 
            eventName = "AirDropPlane" --53,89% +... --> 60
        elseif rnd <= 6 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateBrown"; 
            eventName = "AirDropPlane" --53,89% +... --> 60
        elseif rnd <= 7 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateOrange";
            eventName = "AirDropPlane" --53,89% +... --> 60
        elseif rnd <= 8 then
            AirDropPlane.Properties.CrateClassName="AirDropCrateGold";
            eventName = "AirDropPlane" --53,89% +... --> 60
        elseif rnd <= 9 then
            AirPlaneCrash.Properties.ParticleEffectInAir = "misc.planecrash.smoke_yellow";
            AirPlaneCrash.Properties.ParticleEffectOnGround = "misc.planecrash.plane_yellowcrash";
            eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
        elseif rnd <= 10 then
            AirPlaneCrash.Properties.ParticleEffectInAir = "misc.planecrash.smoke_gold";
            AirPlaneCrash.Properties.ParticleEffectOnGround = "misc.planecrash.plane_goldcrash";
            eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
        elseif rnd <= 11 then
            AirPlaneCrash.Properties.ParticleEffectInAir = "misc.planecrash.smoke";
            AirPlaneCrash.Properties.ParticleEffectOnGround = "misc.planecrash.plane_crash";
            eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
        elseif rnd <= 12 then
            UFOCrash.Properties.ParticleEffectInAir = "misc.UFOCrash.UFOcrash_purple";
            UFOCrash.Properties.ParticleEffectOnGround = "misc.UFOCrash.crashed_purplesmoke";
            eventName = "UFOCrash"  -- 23,07% -... --> 18%   
        elseif rnd <= 13 then
            UFOCrash.Properties.ParticleEffectInAir = "misc.UFOCrash.UFOcrash_blue";
            UFOCrash.Properties.ParticleEffectOnGround = "misc.UFOCrash.crashed_bluesmoke";
            eventName = "UFOCrash"  -- 23,07% -... --> 18%
        elseif rnd <= 14 then
            UFOCrash.Properties.ParticleEffectInAir = "misc.UFOCrash.UFOcrash";
            UFOCrash.Properties.ParticleEffectOnGround = "misc.UFOCrash.crashed_smoke";
            eventName = "UFOCrash"  -- 23,07% -... --> 18%
        end
    
        local spawnParams = {}
        spawnParams.class = eventName
        spawnParams.name = spawnParams.class
    
    --Log("Miscreated:SpawnWorldEvent - Spawning Event")
        local spawnedEntity = System.SpawnEntity(spawnParams)
    
        if not spawnedEntity then
            g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');	  
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'The Event has Started...');	 
        end         
    end
end




ChatCommands["!all8airdrops"] = function(playerId, command)
    -- Log the command
    Log(">> !10airdrops - %s", command)
    -- Add steamids you want to allow to use this command here. This is a comma delimited string
    --local allowed = "STEAMID"
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId)
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id()
    
    

    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        -- Create a table to hold spawn parameters        

        local spawnParams = {}
        -- Set class = AirDropPlane
        spawnParams.class = "AirDropPlane"
        -- Set name = class
        spawnParams.name = spawnParams.class       
        
        -- Loop through the command set 50 times
       
        AirDropPlane.Properties.CrateClassName="AirDropCrate"; --Red
        -- Log plane spawning attempt
         
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)
        
        AirDropPlane.Properties.CrateClassName="AirDropCrateBlue";
        -- Log plane spawning attempt
        
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)

        AirDropPlane.Properties.CrateClassName="AirDropCrateGreen";
        -- Log plane spawning attempt
         
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)

        AirDropPlane.Properties.CrateClassName="AirDropCrateYellow";
        -- Log plane spawning attempt
         
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)

        AirDropPlane.Properties.CrateClassName="AirDropCrateGold";
        -- Log plane spawning attempt
         
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)

        AirDropPlane.Properties.CrateClassName="AirDropCrateOrange";
        -- Log plane spawning attempt
         
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)

        AirDropPlane.Properties.CrateClassName="AirDropCrateBrown";
           -- Log plane spawning attempt
         
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)

        AirDropPlane.Properties.CrateClassName="AirDropCratePurple";
        -- Log plane spawning attempt
         
        -- Attempt to spawn the plane 
        local spawnedEntity = System.SpawnEntity(spawnParams)    
        
        if not spawnedEntity then
            g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');	  
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'The Event has Started...');	 
        end    
      
    end
end

ChatCommands["!all3aircrash"] = function(playerId, command)
    -- Log the command
    Log(">> !10airdrops - %s", command)
    -- Add steamids you want to allow to use this command here. This is a comma delimited string
    --local allowed = "STEAMID"
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId)
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id()
    
    

    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        -- Create a table to hold spawn parameters        

        local spawnParams = {}
        -- Set class = AirDropPlane
        spawnParams.class = "AirPlaneCrash"
        -- Set name = class
        spawnParams.name = spawnParams.class       
        
        -- Loop through the command set 50 times
       
        
            AirPlaneCrash.Properties.ParticleEffectInAir = "misc.planecrash.smoke_yellow";
            AirPlaneCrash.Properties.ParticleEffectOnGround = "misc.planecrash.plane_yellowcrash";
            local spawnedEntity = System.SpawnEntity(spawnParams) 
        
            AirPlaneCrash.Properties.ParticleEffectInAir = "misc.planecrash.smoke_gold";
            AirPlaneCrash.Properties.ParticleEffectOnGround = "misc.planecrash.plane_goldcrash";
            local spawnedEntity = System.SpawnEntity(spawnParams) 
       
            AirPlaneCrash.Properties.ParticleEffectInAir = "misc.planecrash.smoke";
            AirPlaneCrash.Properties.ParticleEffectOnGround = "misc.planecrash.plane_crash";
            local spawnedEntity = System.SpawnEntity(spawnParams)     
            
            if not spawnedEntity then
                g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');	  
            else
                g_gameRules.game:SendTextMessage(4, playerId, 'The Event has Started...');	 
            end  
         
      
    end
end

ChatCommands["!all3ufocrash"] = function(playerId, command)
    -- Log the command
    Log(">> !10airdrops - %s", command)
    -- Add steamids you want to allow to use this command here. This is a comma delimited string
    --local allowed = "STEAMID"
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId)
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id()
    
    

    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        -- Create a table to hold spawn parameters        

        local spawnParams = {}
        -- Set class = AirDropPlane
        spawnParams.class = "UFOCrash"
        -- Set name = class
        spawnParams.name = spawnParams.class       
        
        
            UFOCrash.Properties.ParticleEffectInAir = "misc.UFOCrash.UFOcrash_purple";
            UFOCrash.Properties.ParticleEffectOnGround = "misc.UFOCrash.crashed_purplesmoke";
            local spawnedEntity = System.SpawnEntity(spawnParams)
        
            UFOCrash.Properties.ParticleEffectInAir = "misc.UFOCrash.UFOcrash_blue";
            UFOCrash.Properties.ParticleEffectOnGround = "misc.UFOCrash.crashed_bluesmoke";
            local spawnedEntity = System.SpawnEntity(spawnParams)
        
            UFOCrash.Properties.ParticleEffectInAir = "misc.UFOCrash.UFOcrash";
            UFOCrash.Properties.ParticleEffectOnGround = "misc.UFOCrash.crashed_smoke";
            local spawnedEntity = System.SpawnEntity(spawnParams)     

            if not spawnedEntity then
                g_gameRules.game:SendTextMessage(4, playerId, 'Miscreated:SpawnWorldEvent - entity could not be spawned.');	  
            else
                g_gameRules.game:SendTextMessage(4, playerId, 'The Event has Started...');	 
            end  
      
    end
end

ChatCommands["!getairdroppos"] = function(playerId, command)
    local player = System.GetEntity(playerId)    
    local steamid = player.player:GetSteam64Id()
    if isAdminUserWithPrivileges(steamid) then        
        local totalCrates = table.getn(LastArrayAirDropPlane);
        local index = totalCrates;
        if (command and command ~= '') then
            index = tonumber(command);        
        end
        if (totalCrates ~= 0 and index<=totalCrates) then
          g_gameRules.game:SendTextMessage(4, playerId, LastArrayAirDropPlane[index]);	       
        end
          g_gameRules.game:SendTextMessage(4, playerId, 'Total : ' .. totalCrates);			       
    end
end

ChatCommands["!getaircrashpos"] = function(playerId, command)
    local player = System.GetEntity(playerId)    
    local steamid = player.player:GetSteam64Id()
    if isAdminUserWithPrivileges(steamid) then        
        local totalCrates = table.getn(LastArrayAirPlaneCrash);
        local index = totalCrates;
        if (command and command ~= '') then
            index = tonumber(command);        
        end
        if (totalCrates ~= 0 and index<=totalCrates) then
          g_gameRules.game:SendTextMessage(4, playerId, LastArrayAirPlaneCrash[index]);	  
        end     
          g_gameRules.game:SendTextMessage(4, playerId, 'Total : ' .. totalCrates);		     
    end
end

ChatCommands["!getufopos"] = function(playerId, command)
    local player = System.GetEntity(playerId)    
    local steamid = player.player:GetSteam64Id()    
    if isAdminUserWithPrivileges(steamid) then  
        local totalCrates = table.getn(LastArrayUFOCrash);
        local index = totalCrates;
        if (command and command ~= '') then
            index = tonumber(command);        
        end
        if (totalCrates ~= 0 and index<=totalCrates) then
          g_gameRules.game:SendTextMessage(4, playerId, LastArrayUFOCrash[index]);
        end	       
          g_gameRules.game:SendTextMessage(4, playerId, 'Total : ' .. totalCrates);	 
    end
end



