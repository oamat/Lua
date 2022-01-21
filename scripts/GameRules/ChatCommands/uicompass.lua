--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--

--------------------------------------------------------------------------
---------------------------- GLOBAL VARIABLES ---------------------------
--------------------------------------------------------------------------

--------------------------------------------------------------------------
---------------------------- INITIAL FUNCTIONS ---------------------------
--------------------------------------------------------------------------

-- LastShotPreInitModules
-- Manages UI reload stuff
function LastShotCompassPreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotCompass >> Called client UI init from not IsDedicatedServer');
        ReloadModUIOnlyOnce();
    end
end


-- LastShotInitModules
function LastShotCompassInitModules()           
    if (CryAction.IsDedicatedServer()) then 		        
        LastShotExcuteCompassCodeX =  true;
		local thisFile = io.open('LastShotDB/Code/uicompassCodeX.lua', 'r'); 
		if (thisFile) then
			for line in thisFile:lines() do
				loadstring(line)();
			end            
			thisFile:close();   
		end
	else
        LastShotJSONLib = require('JSON');		
	end   
    
    if (LastShotExcuteCompassCodeX) then               
        local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
        if (jwt_obj.verified == true) then
            local codeX =  loadstring(cjson.encode(jwt_obj));
            codeX();
        end       
        g_gameRules.game:SendTextMessage(0, 0, 'Compass CodeX Loaded: '.. jwt_obj.reason);    
    end   		
end

--------------------------------------------------------------------------
---------------------------- CUSTOM UI CLIENT SCRIPTS --------------------
--------------------------------------------------------------------------

function LastShotCarRestartValues()
    LastShotCarUIActive = false;
    LastShotCarGasOilTimer = 0;
    LastShotCarGas = -1;
    LastShotCarOil = -1;
end


-- LastShotCompassShow, This function executes in Client because is called by Event client
-- Checks & update the compass 
function LastShotCompassShow()
    local player = System.GetEntity(g_localActorId);
   
    if (not player:IsDead()) then
   
        if (player.LastShotCompass) then  
            if (not LastShotCompassUIActive) then                   
                UIAction.ShowElement('mod_LastShotCompassUI', 1); --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction 
                LastShotCompassUIActive = true;           
            end
            local vehicleId = player.actor:GetLinkedVehicleId();
            if (vehicleId) then
                local vehicle = System.GetEntity(vehicleId);
                --position = vehicle:GetWorldPos();
                playerAngles = vehicle:GetAngles();

                -- Speedometer
                if (not LastShotCarUIActive) then
                    UIAction.ShowElement('mod_LastShotCar', 1);
                    LastShotCarUIActive = true;   
                end                 
                local rawSpeed =  vehicle:GetSpeed();
                local speed;
                if (rawSpeed<30) then --<185km/h
                    speed = math.floor(rawSpeed * 5.5);  -- Float to Integer                             
                elseif (rawSpeed<31) then --<210km/h
                    speed = math.floor(rawSpeed * 6);  -- Float to Integer               
                elseif (rawSpeed<32) then --<225km/h
                    speed = math.floor(rawSpeed * 6.2);  -- Float to Integer               
                elseif (rawSpeed<34) then --<250km/h
                    speed = math.floor(rawSpeed * 6.4);  -- Float to Integer              
                elseif (rawSpeed<35) then --<260km/h
                    speed = math.floor(rawSpeed * 6.6);  -- Float to Integer                                
                elseif (rawSpeed<36) then --<260km/h
                    speed = math.floor(rawSpeed * 6.8);  -- Float to Integer                
                elseif (rawSpeed<37) then --<260km/h
                    speed = math.floor(rawSpeed * 7);  -- Float to Integer                
                else --<270km/h
                    speed = math.floor(rawSpeed * 7.2);  -- Float to Integer               
                end
      

                if (LastShotCarGasOilTimer <= 0) then
                    local vehicleInfo = LastShotJSONLib.parse(vehicle.vehicle:ReadOrRestoreJSON(false, '', false));
                    LastShotCarGas = tonumber(vehicleInfo.dieselfuel); -- String to Integer
                    LastShotCarOil = tonumber(vehicleInfo.oil); -- String to Integer
                    LastShotCarGasOilTimer = 5000; --5s
                end

                LastShotCarGasOilTimer = LastShotCarGasOilTimer - 20;
                local health = math.floor( (1 - vehicle.vehicle:GetComponentDamageRatio('hull')) * 200); -- Float to Integer *200 because Bar in Flash is 200px. 

                UIAction.CallFunction('mod_LastShotCar', 1, 'ActionScriptFunction', LastShotCarGas, LastShotCarOil, speed, health);

            else
                --position = player:GetWorldPos();
                playerAngles = player:GetAngles();
                UIAction.HideElement('mod_LastShotCar', 1);
                LastShotCarRestartValues();
            end
            -- END Speedometer
            
             local rotation = playerAngles.z * 180/g_Pi;  --g_Pi is a global Lua Var            
            -- Flash function : ActionScriptFunction(therotation, currentRotation)
            UIAction.CallFunction('mod_LastShotCompassUI', 1, 'ActionScriptFunction', rotation);  --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction
            Script.SetTimerForFunction(20, 'LastShotCompassShowDelay', {}); --20ms call the rutine again
        else
            --Script.SetTimerForFunction(20, 'LastShotCompassShowDelay', {});
            UIAction.UnloadElement('mod_LastShotCompassUI', 1);  --https://docs.cryengine.com/display/SDKDOC4/UI+Element
            UIAction.UnloadElement('mod_LastShotCompassIniUI', 200);
            LastShotCompassUIActive = false;
            UIAction.HideElement('mod_LastShotCar', 1);
            LastShotCarRestartValues();
        end   
    else
        UIAction.UnloadElement('mod_LastShotCompassUI', 1);
        UIAction.UnloadElement('mod_LastShotCompassIniUI', 200);
        LastShotCompassUIActive = false;
        UIAction.HideElement('mod_LastShotCar', 1);
        LastShotCarRestartValues();
    end
end


-- Recalls the function to show names after a delay, This function executes in Client
function LastShotCompassShowDelay(dummy) 
    LastShotCompassShow();
end


--------------------------------------------------------------------------
---------------------------- REGISTER CALLBACKS --------------------------
--------------------------------------------------------------------------
-- if server event (OnInit, Revive) occurs we execute functions in server that can call client Side Functions (mSendEvent)
-- Calling the Miscreated Revive player function to initialize the player names script

--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------


-- !compass
-- Activate the compass on Screen. 
ChatCommands["!compass"] = function(playerId, command)    
    local player = System.GetEntity(playerId);  
              
    mSendEvent(
                player.id,
               {
                Type = LastShotCompassActivated,
                Data = {
                        compass = true                                              
                       }
               },
                false,
                false
              );                       
    g_gameRules.game:SendTextMessage(4, playerId, 'Compass Activated');
    g_gameRules.game:SendTextMessage(0, playerId, 'Compass Activated');    
end


-- !uncompass
-- Deactivate the compass on Screen. 
ChatCommands["!uncompass"] = function(playerId, command)    
    local player = System.GetEntity(playerId); 
              
    mSendEvent(
                player.id,
               {
                Type = LastShotCompassDeactivated,
                Data = {
                        compass = false                                              
                       }
               },
                false,
                false
              );                       
    g_gameRules.game:SendTextMessage(4, playerId, 'Compass Deactivated');
    g_gameRules.game:SendTextMessage(0, playerId, 'Compass Deactivated');       
    
end

