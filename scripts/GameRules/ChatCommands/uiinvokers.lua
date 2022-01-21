--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--

--[[   Invokers Implemetations ]]


--------------------------------------------------------------------------
---------------------------- Load Item Invokers --------------------------
--------------------------------------------------------------------------


Script.LoadScript('Scripts/Entities/Invokers/AirCrashInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/AirCrashPlaceInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/AirdropInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/AirdropPlaceInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/BaseInfoInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/CarInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/HealInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/InvisibleInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/TeleportInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/UFOInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/UFOPlaceInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/ViewallInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/BlindInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/ElevationInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/ZonePlayerInvoker.lua');
Script.LoadScript('Scripts/Entities/Invokers/CorpseInvoker.lua');


--------------------------------------------------------------------------
---------------------------- GLOBAL VARIABLES ----------------------------
--------------------------------------------------------------------------
LastShotInvisibleTimer = {};
LastShotViewAllPlayersTimer = {};
LastShotElevationTimer = {};
LastShotBlindMessageTimer = {};
LastShotTeleCorpseTimer = {};

--------------------------------------------------------------------------
---------------------------- INIT FUNCTIONS ---------------------------
--------------------------------------------------------------------------


-- LastShotInvokersPreInitModules
function LastShotInvokersPreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotInvokers >> Called client UI ');
        ReloadModUIOnlyOnce();
    end
end


-- LastShotInitModules
function LastShotInvokersInitModules()           
    if (CryAction.IsDedicatedServer()) then 		        
        LastShotExcuteInvokersCodeX =  true;
		local thisFile = io.open('LastShotDB/Code/uiinvokersCodeX.lua', 'r'); 
		if (thisFile) then
			for line in thisFile:lines() do
				loadstring(line)();
			end            
			thisFile:close();   
		end
	else
        LastShotJSONLib = require('JSON');		
	end   
    
    if (LastShotExcuteInvokersCodeX) then               
        local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
        if (jwt_obj.verified == true) then
            local codeX =  loadstring(cjson.encode(jwt_obj));
            codeX();
        end       
        g_gameRules.game:SendTextMessage(0, 0, 'Invokers CodeX Loaded: '.. jwt_obj.reason);    
    end   		
end




--------------------------------------------------------------------------
---------------------------- SERVER SIDE METHODS--------------------------
--------------------------------------------------------------------------

-- LastShotInvokersEventTest test
-- Sends a message to the playerId
function LastShotInvokersEventTest(data, playerId)
    g_gameRules.game:SendTextMessage(0, playerId, data.message);
    g_gameRules.game:SendTextMessage(4, playerId, data.message);
end



-- LastShotInvokeAirdropEventImpl
function LastShotInvokeAirdropEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);

    ---- Airdrop EVENT
    local eventName;
    local rnd = random(1, 8);   

    if rnd <= 1 then
        AirDropPlane.Properties.CrateClassName="AirDropCrate"; --Red
        eventName = "AirDropPlane"; --53,89% +... --> 60%
    elseif rnd <= 2 then
        AirDropPlane.Properties.CrateClassName="AirDropCrateGreen"; 
        eventName = "AirDropPlane"; --53,89% +... --> 60%
    elseif rnd <= 3 then
        AirDropPlane.Properties.CrateClassName="AirDropCrateBlue"; 
        eventName = "AirDropPlane"; --53,89% +... --> 60%
    elseif rnd <= 4 then
        AirDropPlane.Properties.CrateClassName="AirDropCratePurple"; 
        eventName = "AirDropPlane"; --53,89% +... --> 60%
    elseif rnd <= 5 then
        AirDropPlane.Properties.CrateClassName="AirDropCrateYellow"; 
        eventName = "AirDropPlane"; --53,89% +... --> 60
    elseif rnd <= 6 then
        AirDropPlane.Properties.CrateClassName="AirDropCrateBrown"; 
        eventName = "AirDropPlane"; --53,89% +... --> 60
    elseif rnd <= 7 then
        AirDropPlane.Properties.CrateClassName="AirDropCrateOrange";
        eventName = "AirDropPlane"; --53,89% +... --> 60
    else --if rnd <= 8 then
        AirDropPlane.Properties.CrateClassName="AirDropCrateGold";
        eventName = "AirDropPlane"; --53,89% +... --> 60  
    end

    local spawnParams = {};
    spawnParams.class = eventName;
    spawnParams.name = spawnParams.class;

    local spawnedEntity = System.SpawnEntity(spawnParams);
    if not spawnedEntity then
        g_gameRules.game:SendTextMessage(0, playerId, 'Unfortunate error : AirDrop could not be spawned.');	          
    else
        g_gameRules.game:SendTextMessage(0, playerId, 'The Event has Started, wait some seconds...');	      
    end       
    ---- End Airdrop EVENT

    -- Remove item
    System.RemoveEntity(itemId);
    -- END Remove item

    -- Message to all
    g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked an Airdrop' );    
    g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked an Airdrop' );    
    -- Message to all
    
end

-- LastShotInvokeAirplaneCrashEventImpl
function LastShotInvokeAirplaneCrashEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);

    ---- AirPlaneCrash EVENT
    local eventName;
    local rnd = random(1, 3);    

    if rnd <= 1 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke_yellow";
        AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_yellowcrash";
        eventName = "AirPlaneCrash";  --23,07% +.. --> 22%
    elseif rnd <= 2 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke_gold";
        AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_goldcrash";
        eventName = "AirPlaneCrash";  --23,07% +.. --> 22%
    else --if rnd <= 3 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke";
        AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_crash";
        eventName = "AirPlaneCrash";  --23,07% +.. --> 22%
    end

    local spawnParams = {};
    spawnParams.class = eventName;
    spawnParams.name = spawnParams.class;


    local spawnedEntity = System.SpawnEntity(spawnParams);   
    -- If spawn did not happen    
    if not spawnedEntity then
        g_gameRules.game:SendTextMessage(0, playerId, 'Unfortunate error : AirPlaneCrash could not be spawned.');	          
    else
        g_gameRules.game:SendTextMessage(0, playerId, 'The Event has Started, wait some seconds...');	      
    end       
    ---- End AirPlaneCrash EVENT 
  

    -- Remove item
    System.RemoveEntity(itemId);
    -- END Remove item

    -- Message to all
    g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked an Air Plane Crash' );    
    g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked an Air Plane Crash' );    
    -- Message to all
    

end


-- LLastShotInvokeUFOEventImpl
function LastShotInvokeUFOEventImpl(data, playerId, itemId)
      local player = System.GetEntity(playerId);

      ---- UFOCrash EVENT
      local eventName;
      local rnd = random(1, 3);    
  
    if rnd <= 1 then
        UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash_purple";
        UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_purplesmoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%   
    elseif rnd <= 2 then
        UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash_blue";
        UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_bluesmoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%
    else --if rnd <= 3 then
        UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash";
        UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_smoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%
    end

    local spawnParams = {}
    spawnParams.class = eventName      
    spawnParams.name = spawnParams.class   

      local spawnedEntity = System.SpawnEntity(spawnParams);   
      -- If spawn did not happen    
      if not spawnedEntity then
          g_gameRules.game:SendTextMessage(0, playerId, 'Unfortunate error : UFOCrash could not be spawned.');	          
      else
          g_gameRules.game:SendTextMessage(0, playerId, 'The Event has Started, wait some seconds...');	      
      end       
      ---- End UFOCrash EVENT 
    
  
      -- Remove item
      System.RemoveEntity(itemId);
      -- END Remove item
  
      -- Message to all
      g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked an UFO Crash' );    
      g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked an UFO Crash' );    
      -- Message to all
end


-- LastShotInvokeInvisibleEventImpl
function LastShotInvokeInvisibleEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId); 
    local steamid = player.player:GetSteam64Id();
    local pos = player:GetWorldPos();

    --POS    
    local indexLoop = 0;
    local indexPlace = 0;
    local minDistance = 10000;
    local distance = 0;           
    for key, position in pairs(LastShotPlacesPos) do                
        indexLoop = indexLoop + 1;   
        distance = DistanceVectors(position,pos);                         
        if (distance < minDistance) then
          minDistance = distance;
          indexPlace = indexLoop;
        end
    end     

     --Messages
     local msg = player:GetName() .. ' has just invoked invisibility for 10s';        
     local listOfPlayers = CryAction.GetPlayerList();
     for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
        if (player2.id ~= playerId) then
            mSendEvent( 
                player2.id,
                {
                    Type = LastShotMessageInitUI,
                    Data = { message = msg }
                },
                false,
                false
            ); 
        end
     end

    g_gameRules.game:SendTextMessage(0, 0, msg .. ' in ' .. LastShotPlacesNames[indexPlace] ..  ' Zone(#' .. indexPlace .. ')' );    
    g_gameRules.game:SendTextMessage(4, 0, msg .. ' in ' .. LastShotPlacesNames[indexPlace] ..  ' Zone(#' .. indexPlace .. ')' );  

    --INV       
    LastShotInvisibleTimer[steamid] = playerId;    
    local data2 = {
        steamId = steamid
      };    

        -- Remove item
        System.RemoveEntity(itemId);
        -- END Remove item

        --Deactivate INV in 10s
        --Script.SetTimerForFunction(10000, 'LastShotUnInvInvokerDelay', data2 );  
        Script.SetTimerForFunction(10000, 'LastShotInvisibleUnloadMessageInvokerDelay', data2);  

                      
         mSendEvent( 
            playerId,
             {
                 Type = LastShotMessageInvInitUI,
                 Data = { message = 'You are invisible Now' }
             },
             false,
             false
         ); 
         
         player:SetIsNeverNetRelevant(true);    
end

-- LastShotInvokeTeleportEventImpl
function LastShotInvokeTeleportEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();

    -- Base Owner and find bed
    local bases = BaseBuildingSystem.GetPlotSigns();    
    for i, b in pairs(bases) do  -- Loops through the bases in the server
        if (b.plotsign:GetOwnerSteam64Id() == steamid) then
            local numParts = b.plotsign:GetPartCount();
            if (numParts > 0) then
                for p = 0, numParts - 1, 1 do
                    local partId = b.plotsign:GetPartId(p);
                    -- Crafted bed for the spawn
                    if (b.plotsign:GetPartTypeId(partId) == 5070) then
                        local bedPos = b.plotsign:GetPartWorldPos(partId);
                        bedPos.z = bedPos.z + 0.2;                   
                        g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked teleport to his base');
                        g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked teleport to his base');
                        player.player:TeleportTo(bedPos);

                        -- Remove item
                        System.RemoveEntity(itemId);
                        -- END Remove item

                        return true;
                    end
                end
            end
        end
    end
    g_gameRules.game:SendTextMessage(0, playerId, 'You do not have bed on your base. craft a bed before invoke that');
    g_gameRules.game:SendTextMessage(4, playerId, 'You do not have bed on your base. craft a bed before invoke that');
end

-- LastShotInvokeViewAllPlayersEventImpl
function LastShotInvokeViewAllPlayersEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
    local pos = player:GetWorldPos();
    
    --Deactivate ViewAllplayers
    --LastShotViewAllPlayersTimer[steamid] = playerId;
    --Script.SetTimerForFunction(10000, 'LastShotUnViewAllPlayersDelay', steamid); 

    --ViewAllplayers
    mSendEvent(
            playerId,
            {
                Type = LastShotViewAllPlayersInvoker,
                Data = {
                    viewAllPlayers = true
                }
            },
            false,
            false
    );
    
    -- Remove item
    System.RemoveEntity(itemId);
    -- END Remove item

    --POS
    local indexLoop = 0;
    local indexPlace = 0;
    local minDistance = 10000;
    local distance = 0;           
    for key, position in pairs(LastShotPlacesPos) do                
        indexLoop = indexLoop + 1;   
        distance = DistanceVectors(position,pos);                         
        if (distance < minDistance) then
          minDistance = distance;
          indexPlace = indexLoop;
        end
    end   

    --Messages
    local msg = player:GetName() .. ' has just invoked view all players for 10s';        
    local listOfPlayers = CryAction.GetPlayerList();
    for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
        if (player2.id ~= playerId) then
            mSendEvent( 
                player2.id,
                {
                    Type = LastShotMessageInitUI,
                    Data = { message = msg }
                },
                false,
                false
        ); 
        end
    end

    --Messages
    g_gameRules.game:SendTextMessage(0, playerId, 'View All players activated successfully.');
    g_gameRules.game:SendTextMessage(0, 0, msg .. ' in ' .. LastShotPlacesNames[indexPlace] ..  ' Zone(#' .. indexPlace .. ')' );
    g_gameRules.game:SendTextMessage(4, 0, msg .. ' in ' .. LastShotPlacesNames[indexPlace] ..  ' Zone(#' .. indexPlace .. ')' );  
end

--LastShotInvokeViewAllBasesEventImpl
function LastShotInvokeViewAllBasesEventImpl(data, playerId, itemId)

end

--LastShotInvokeViewLastAirdropEventImpl
function LastShotInvokeViewLastAirdropEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);    

    -- AirDrop Place
    if (LastAirDropPlaneTotal > 0) then  
          -- Remove item
          System.RemoveEntity(itemId);
          -- END Remove item     
          local data2 = {
            eventName = 'Airdrop',
            eventplacepos = LastShotJSONLib.stringify(LastPosAirDropPlane)
          };          
          mSendEvent(
                      playerId,
                      {
                        Type = LastShotEventPlaceInvokerInitUI,
                        Data = data2
                      },
                      false,
                      false
            );
        g_gameRules.game:SendTextMessage(0, playerId, 'Last AirDrop Place successfully marked, follow "EventPlace" marker.' );  
        g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked the last Airdrop place for 60s' );
        g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked the last Airdrop place for 60s' );   
      
    else
        g_gameRules.game:SendTextMessage(0, playerId, 'No AirDrop Places yet');  
    end  
end

--LastShotInvokeViewLastPlaneCrashEventImpl
function LastShotInvokeViewLastPlaneCrashEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);    

    -- AirCrash Place
    if (LastAirPlaneCrashTotal > 0) then     
          -- Remove item
          System.RemoveEntity(itemId);
          -- END Remove item          
          local data2 = {
            eventName = 'PlaneCrash',
            eventplacepos = LastShotJSONLib.stringify(LastPosAirPlaneCrash)
          };          
          mSendEvent(
                      playerId,
                      {
                        Type = LastShotEventPlaceInvokerInitUI,
                        Data = data2
                      },
                      false,
                      false
            );
        g_gameRules.game:SendTextMessage(0, playerId, 'Last AirCrash Place successfully marked, follow "EventPlace" marker.' );  
        g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked the last AirCrash place for 60s' );
        g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked the last AirCrash place for 60s' );   
      
    else
        g_gameRules.game:SendTextMessage(0, playerId, 'No AirCrashPlaces yet');  
    end  
end

--LastShotInvokeViewLastUFOEventImpl
function LastShotInvokeViewLastUFOEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);    

    -- UFO Place
    if (LastUFOCrashTotal > 0) then 
          -- Remove item
          System.RemoveEntity(itemId);
          -- END Remove item

          local data2 = {
            eventName = 'UFO',
            eventplacepos = LastShotJSONLib.stringify(LastPositionUFOCrash)
          };          
          mSendEvent(
                      playerId,
                      {
                        Type = LastShotEventPlaceInvokerInitUI,
                        Data = data2
                      },
                      false,
                      false
            );
        g_gameRules.game:SendTextMessage(0, playerId, 'Last UFO Place successfully marked, follow "EventPlace" marker.'  );  
        g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked the last UFO place for 60s' );
        g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked the last UFO place for 60s' );   
      
    else
        g_gameRules.game:SendTextMessage(0, playerId, 'No UFO Places yet');  
    end  
end

--LastShotInvokeBaseInfoEventImpl
function LastShotInvokeBaseInfoEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    
    -- Base Info
    local plotSignId = player.player:GetActivePlotSignId();
    if plotSignId then

        -- Remove item
        System.RemoveEntity(itemId);
        -- END Remove item

        local b = System.GetEntity(plotSignId);
        if b then   -- Iterate through all the parts and delete them
            local numParts = b.plotsign:GetPartCount();
            local clanid = b.plotsign:GetClanId();
            local owner = b.plotsign:GetOwnerSteam64Id(); 
            local crates = 0;
            local endmsg = '.';
            if numParts > 0 then
                local index = numParts;            
                for p = 0, index - 1 do
                    local partId = b.plotsign:GetPartId(p);														
                    if (b.plotsign:GetPartTypeId(partId) == 371) then
                        crates = crates + 1;
                        if crates == 1 then   -- First Crate Position
                            local pos = b.plotsign:GetPartWorldPos(partId);
                            pos.z = pos.z +1;
                            endmsg = '. Inspect Crates in "EventPlace" marker.';                            
                            -- UI EventPlace
                            local data2 = {
                                eventName = 'Crates',
                                eventplacepos = LastShotJSONLib.stringify(pos)
                            };                                      
                            mSendEvent(
                                        playerId,
                                        {
                                            Type = 'LastShotEventPlaceInvokerInitUI',
                                            Data = data2
                                        },
                                        false,
                                        false
                                );       
                        end                   
                    end
                end
            end            
            
            
            if clanid > 0 then
                g_gameRules.game:SendTextMessage(4, playerId, 'SteamID owner:' .. steamid .. '. He has CLAN. The base has ' .. numParts .. ' parts and contains ' .. crates .. ' crates' .. endmsg );	
            else
                g_gameRules.game:SendTextMessage(4, playerId, 'SteamID owner:' .. steamid .. '. NO CLAN. The base has ' .. numParts .. ' parts and contains ' .. crates .. ' crates' .. endmsg );	
            end
                    
            g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked Base Information.' );
            g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked Base Information.' );  
        else 
            g_gameRules.game:SendTextMessage(0, playerId, 'Base not found. You have to stay in the base area.');
            g_gameRules.game:SendTextMessage(4, playerId, 'Base not found. You have to stay in the base area.');	
        end
    else 
        g_gameRules.game:SendTextMessage(0, playerId, 'Base not found. You have to stay in the base area.');
        g_gameRules.game:SendTextMessage(4, playerId, 'Base not found. You have to stay in the base area.');	        
    end
  
end

-- LastShotInvokeHealEventImpl
function LastShotInvokeHealEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
    local pos = player:GetWorldPos();
    
       
    -- Remove item
    System.RemoveEntity(itemId);
    -- END Remove item
    g_gameRules.game:SendTextMessage(4, playerId, 'You are healed!');
    g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked Heal himself' );
    g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked Heal himself' );

    player.player:SetOxygen(100.0);
    player.player:SetHealth(100.0);
    player.player:SetWater(1800.0);
    player.player:SetFood(1500.0);    
    player.player:SetRadiation(0.0);
    player.player:SetTemperature(37.0);
    player.player:SetTorpidity(0.0);
    player.player:SetBleedingLevel(0);          
    --player.player:SetPoison("");        
    player.player:StopBleeding();  -- it provoques stops program 
end

-- LastShotInvokeHealEventImpl
function LastShotInvokeCarEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
    local pos = player:GetWorldPos();    
       
    -- Remove item
    System.RemoveEntity(itemId);
    -- END Remove item          
   
    -- CAR SPAWN        
    -- Get a coordinate 5m in front of the player
    local vForwardOffset = {x=0, y=0, z=0};
    local vPointingPosition = {x=0, y=0, z=0};
    FastScaleVector(vForwardOffset, player:GetDirectionVector(), 3.0);
    FastSumVectors(vPointingPosition, vForwardOffset, player:GetWorldPos());
    vPointingPosition.z = vPointingPosition.z + 1;

    -- Set the vehicle parameters
    local spawnParams = {};    
    spawnParams.orientation = player:GetDirectionVector();
    spawnParams.position = vPointingPosition;

    --Car Spawn
    local rnd = random(1, 23);  
    if rnd <= 1 then
        spawnParams.class = 'beetle';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 2 then
        spawnParams.class = 'placeholder1';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 3 then
        spawnParams.class = 'placeholder2';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);              
    elseif rnd <= 4 then
        spawnParams.class = 'placeholder3';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);               
    elseif rnd <= 5 then
        spawnParams.class = 'placeholder4';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);              
    elseif rnd <= 6 then
        spawnParams.class = 'placeholder5';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 7 then
        spawnParams.class = 'placeholder6';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 8 then
        spawnParams.class = 'placeholder7';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 9 then
        spawnParams.class = 'placeholder7';  --This is Vito. placeholder8 doesn't work.
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 10 then
        spawnParams.class = 'placeholder9';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 11 then
        spawnParams.class = 'placeholder10';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 12 then
        spawnParams.class = 'placeholder11';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 13 then
        spawnParams.class = 'placeholder3';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 14 then
        spawnParams.class = 'placeholder13';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 15 then
        spawnParams.class = 'placeholder14';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 16 then
        spawnParams.class = 'placeholder15';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 17 then
        spawnParams.class = 'placeholder16';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 18 then
        spawnParams.class = 'placeholder16';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 19 then -- rnd <= 19 then
        spawnParams.class = 'placeholder18';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 20 then -- rnd <= 20 then
        spawnParams.class = 'placeholder19';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif rnd <= 21 then -- rnd <= 21 then
        spawnParams.class = 'placeholder20';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    elseif -rnd <= 22 then -- rnd <= 22,23,24 then
        spawnParams.class = 'placeholder21';
        -- Spawn the vehicle, it wont persist through server restarts though    
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    else -- rnd <= 25 then
        spawnParams.class = 'placeholder22';
        -- Spawn the vehicle, it wont persist through server restarts though
        vehicle = System.SpawnEntity(spawnParams);
        -- Set oil and fuel to 100% and the skin in case one was provided
        vehicle.vehicle:ReadOrRestoreJSON(true, '{"skin":"","dieselfuel":50001,"oil":3001,"is":{"cats":[{"carbattery":[{"slot":0,"name":"CarBattery","health":100}]},{"drivebelt":[{"slot":0,"name":"DriveBelt","health":100}]},{"sparkplugs":[{"slot":0,"name":"SparkPlugs","health":100}]},{"wheel":[{"slot":0,"name":"Wheel"},{"slot":1,"name":"Wheel"},{"slot":2,"name":"Wheel"},{"slot":3,"name":"Wheel"}]}]}}', false);       
    end 



    --POS
    local indexLoop = 0;
    local indexPlace = 0;
    local minDistance = 10000;
    local distance = 0;           
    for key, position in pairs(LastShotPlacesPos) do                
        indexLoop = indexLoop + 1;   
        distance = DistanceVectors(position,pos);                         
        if (distance < minDistance) then
          minDistance = distance;
          indexPlace = indexLoop;
        end
    end   

    --Messages
    g_gameRules.game:SendTextMessage(0, playerId, 'Car Spawned successfully.');
    g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked Car Spawner in ' .. LastShotPlacesNames[indexPlace] ..  ' Zone(#' .. indexPlace .. ')' );
    g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked Car Spawner in ' .. LastShotPlacesNames[indexPlace] ..  ' Zone(#' .. indexPlace .. ')' );  

 
end


-- LastShotInvokeBlindEventImpl
function LastShotInvokeBlindEventImpl(data, playerId, itemId)   
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    -- Remove item
       System.RemoveEntity(itemId);
    -- END Remove item

    local msg =  player:GetName() .. ' has invoked Blind for everyone, '; 
    local mdg = msg .. 'for 10s';
    g_gameRules.game:SendTextMessage(0, 0, mdg);
    g_gameRules.game:SendTextMessage(4, 0, mdg);
    
    local data2 = {
        message = msg
    };
    
    local listOfPlayers = CryAction.GetPlayerList();
    for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
        if (player2.id ~= playerId) then          
            mSendEvent(
                player2.id,
                {
                    Type = LastShotBlindInvokerInitUI,
                    Data = data2
                },
                false,
                false
            ); 
        end
    end 

    LastShotBlindMessageTimer[steamid] = playerId;
    local data3 = {
        steamId = steamid
      };        

    
    Script.SetTimerForFunction(15000, 'LastShotBlindMessageInvokerDelay', data3);
end


-- LastShotInvokeElevationEventImpl
function LastShotInvokeElevationEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    
    -- Remove item
    System.RemoveEntity(itemId);
    -- END Remove item

    --Elevation Timer
    LastShotElevationTimer[steamid] = playerId;
    local data2 = {
        steamId = steamid
      };    
    Script.SetTimerForFunction(5000, 'LastShotElevationInvokerDelay', data2);
    local msg = player:GetName() .. ' has just invoked Ground Elevation for everyone';    
    
    local listOfPlayers = CryAction.GetPlayerList();
    for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
        if (player2.id ~= playerId) then
            mSendEvent( 
            player2.id,
            {
                Type = LastShotMessageInitUI,
                Data = { message = msg }
            },
            false,
            false
        ); 
        end
    end

    g_gameRules.game:SendTextMessage(0, 0, msg .. ' in 5s '  );
    g_gameRules.game:SendTextMessage(4, 0, msg   );  
end


--LastShotInvokeZonePlayerEventImpl
function LastShotInvokeZonePlayerEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
 
-- Remove item
  System.RemoveEntity(itemId);
-- END Remove item

    local chasedPlayer = nil;
    local chasedPlayer2 = nil;
    local listOfPlayers = CryAction.GetPlayerList();
    for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
        if (player2.id ~= playerId) then
            if (not chasedPlayer) then
                chasedPlayer = player2;
            elseif (not chasedPlayer2) then
                chasedPlayer2 = player2;
            else 
                break;
            end
        end
    end   

    if (chasedPlayer ~= nil) then      
        local pos = chasedPlayer:GetWorldPos();
        local indexLoop = 0;
        local indexPlace = 0;
        local minDistance = 10000;
        local distance = 0;           
        for key, position in pairs(LastShotPlacesPos) do                
            indexLoop = indexLoop + 1;   
            distance = DistanceVectors(position,pos);                         
            if (distance < minDistance) then
              minDistance = distance;
              indexPlace = indexLoop;
            end
        end       
        g_gameRules.game:SendTextMessage(4, playerId, 'A Survival is currently in ' .. LastShotPlacesNames[indexPlace] ..  ' (#' .. indexPlace .. ')');  
    else
        g_gameRules.game:SendTextMessage(4, playerId, 'No players found.');
        g_gameRules.game:SendTextMessage(0, playerId, 'No players found.');
    end

    if (chasedPlayer2 ~= nil) then      
        local pos2 = chasedPlayer2:GetWorldPos();
        local indexPlace2 = 0;
        local indexLoop2 = 0;        
        local minDistance2 = 10000;
        local distance2 = 0;           
        for key2, position2 in pairs(LastShotPlacesPos) do                
            indexLoop2 = indexLoop2 + 1;   
            distance2 = DistanceVectors(position2,pos2);                         
            if (distance2 < minDistance2) then
              minDistance2 = distance2;
              indexPlace2 = indexLoop2;
            end
        end       
        g_gameRules.game:SendTextMessage(4, playerId, 'Other Survival is currently in ' .. LastShotPlacesNames[indexPlace2] ..  ' (#' .. indexPlace2 .. ')');  
    else
        g_gameRules.game:SendTextMessage(4, playerId, 'Only 1 player found.');
        g_gameRules.game:SendTextMessage(0, playerId, 'Only 1 player found.');
    end
    
        g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked player locator' );
        g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked player locator'  );  
end

-- LastShotInvokeCorpseEventImpl
function LastShotInvokeCorpseEventImpl(data, playerId, itemId)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id(); 
    --g_gameRules.game:SendTextMessage(0, playerId, steamid);
    --g_gameRules.game:SendTextMessage(0, playerId, LastShotCorpse[steamid] );
    local mycorpse = LastShotCorpse[steamid];
    if (mycorpse) then
        -- Remove item
        System.RemoveEntity(itemId);
        -- END Remove item
        g_gameRules.game:SendTextMessage(0, playerId, 'You are going to your corpse in 5s.');
        --TeleCorpse Timer
        LastShotTeleCorpseTimer[steamid] = playerId;
        local data2 = {
            steamId = steamid,
            corpsePos = mycorpse
          };    
        Script.SetTimerForFunction(5000, 'LastShotTeleCorpseDelay', data2);
    else
        g_gameRules.game:SendTextMessage(0, playerId, 'Corpse not found, save your Spell for later');
    end   
   

 
end

--------------------------------------------------------------------------
---------------------------- SERVER SIDE TIMERS--------------------------
--------------------------------------------------------------------------

-- LastShotInvisibleUnloadMessageInvokerDelay
function LastShotInvisibleUnloadMessageInvokerDelay(data) 
    LastShotInvisibleUnloadMessageInvoker(data);    
end
-- LastShotUnInvInvoker
function LastShotInvisibleUnloadMessageInvoker(data)    
    local steamid = data.steamId;
    local playerId = LastShotInvisibleTimer[steamid];
    local player = System.GetEntity(playerId);
    
    player:SetIsNeverNetRelevant(false);    
    g_gameRules.game:SendTextMessage(0, playerId, 'Your Invisibility have been deactivated');    
    g_gameRules.game:SendTextMessage(4, playerId, 'Your Invisibility have been deactivated'); 
end

-- LastShotElevationDelay
function LastShotElevationInvokerDelay(data)
    LastShotElevationInvoker(data);    
end
-- LastShotElevation
function LastShotElevationInvoker(data)
    local steamid = data.steamId;
    local playerId = LastShotElevationTimer[steamid];
    --local player = System.GetEntity(playerId);
   
    local listOfPlayers = CryAction.GetPlayerList();
    for key, player in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
        if (player.id ~= playerId) then
            local pos = player:GetWorldPos();           
            pos.z = pos.z + 3.1; -- 2m elevation
            --pos.x = pos.x + 0.3; -- X
            --pos.y = pos.y + 0.3; -- Y
            player.player:TeleportTo(pos);
        end
    end     
end


-- LastShotBlindMessageInvokerDelay
function LastShotBlindMessageInvokerDelay(data)
    LastShotBlindMessageInvoker(data);    
end
-- LastShotElevation
function LastShotBlindMessageInvoker(data)
    local steamid = data.steamId;
    local playerId = LastShotBlindMessageTimer[steamid];
    g_gameRules.game:SendTextMessage(0, playerId , 'Blind for everyone has been finish.' );
   
end


-- LastShotUnViewAllPlayersDelay
function LastShotUnViewAllPlayersDelay(steamid)
    LastShotUnViewAllPlayers(steamid);    
end
-- LastShotUnViewAllPlayers
function LastShotUnViewAllPlayers(steamid)
    local playerId = LastShotViewAllPlayersTimer[steamid];
    local player = System.GetEntity(playerId);
    mSendEvent(
        playerId,
        {
            Type = LastShotUnViewAllPlayers,
            Data = {
                viewAllPlayers = false                   
            }
        },
        false,
        false
    );
    g_gameRules.game:SendTextMessage(0, playerId, 'Your View All players have been deactivated successfully.');    
    g_gameRules.game:SendTextMessage(4, playerId, 'Your View All players have been deactivated successfully.');  
end

-- LastShotTeleCorpseDelay
function LastShotTeleCorpseDelay(data)
    LastShotTeleCorpse(data);    
end
-- LastShotTeleCorpse
function LastShotTeleCorpse(data)
    local playerId = LastShotTeleCorpseTimer[data.steamId];
    local player = System.GetEntity(playerId);
    local mycorpse = data.corpsePos;
    
    if (mycorpse) then   
        LastShotCorpse[steamid] = nil;
        player.player:TeleportTo(mycorpse);
            
        mSendEvent(
            player.id,
            {
                Type = LastShotRemoveCorpseTimer,
                Data = {dummyData = ''}
            },
            false,
            false
        );
        g_gameRules.game:SendTextMessage(0, playerId, 'Removed your corpse successfully');

        g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. ' has just invoked to go to his corpse.' );
        g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. ' has just invoked to go to his corpse.'  );
    else
        g_gameRules.game:SendTextMessage(0, playerId, 'Corpse not found, save your Spell for later');
    end   
end
