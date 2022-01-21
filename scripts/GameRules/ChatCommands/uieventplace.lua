--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--


--------------------------------------------------------------------------
---------------------------- GLOBAL VARIABLES ----------------------------
--------------------------------------------------------------------------

-- EventPlace positions
LastShotEventPlace = nil;

--------------------------------------------------------------------------
---------------------------- INITIAL FUNCTIONS ---------------------------
--------------------------------------------------------------------------

-- Validating if Miscreated:RevivePlayer is set
if not (Miscreated.RevivePlayer) then
    Log("LastShotEventPlace >> Setting a generic Miscreated:RevivePlayer to make it exist");
    Miscreated.RevivePlayer = function (self, playerId)
        Log("LastShotEventPlace >> This is the generic Miscreated:RevivePlayer call");
    end
end


-- Manages UI reload
function LastShotEventPlacePreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotEventPlace >> Called client UI init from not IsDedicatedServer');
        ReloadModUIOnlyOnce();
    end
end



-- LastShotInitModules
function LastShotEventPlaceInitModules()           
    if (CryAction.IsDedicatedServer()) then 		        
        LastShotExcuteEventPlaceCodeX =  true;
		local thisFile = io.open('LastShotDB/Code/uieventplaceCodeX.lua', 'r'); 
		if (thisFile) then
			for line in thisFile:lines() do
				loadstring(line)();
			end            
			thisFile:close();   
		end
	else
        LastShotJSONLib = require('JSON');		
	end   
    
    if (LastShotExcuteEventPlaceCodeX) then               
        local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
        if (jwt_obj.verified == true) then
            local codeX =  loadstring(cjson.encode(jwt_obj));
            codeX();
        end       
        g_gameRules.game:SendTextMessage(0, 0, 'EventPlace CodeX Loaded: '.. jwt_obj.reason);    
    end   		
end


--------------------------------------------------------------------------
---------------------------- CUSTOM UI CLIENT SCRIPTS --------------------
--------------------------------------------------------------------------

-- LastShotShowEventPlace, This function executes in Client because is called (initialized) by Event client
-- Checks for all the available EventPlace
function LastShotShowEventPlace()
    local myPlayer = System.GetEntity(g_localActorId);
    if (not myPlayer:IsDead() ) then
        if ( myPlayer.LastShotEventPlacePos) then
            if (ActionMapManager.IsFilterEnabled('only_ui') == false and ActionMapManager.IsFilterEnabled('inventory') == false) then
                local myPlayerPos = myPlayer:GetWorldPos();            
                local CalibratedEventPlacePos = new(myPlayer.LastShotEventPlacePos); -- it is the Calibrated player Location on Map
                if (DistanceVectors(myPlayerPos, CalibratedEventPlacePos) > 200) then  
                        local moveToDirection = {x=0, y=0, z=0};
                        local sumVectors = {x=0, y=0, z=0};
                        SubVectors(moveToDirection, CalibratedEventPlacePos, myPlayerPos); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                        NormalizeVector(moveToDirection); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                        FastScaleVector(sumVectors, moveToDirection, 200); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                        FastSumVectors(CalibratedEventPlacePos, sumVectors, myPlayerPos);--https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVector
                end

                local pos, offset = UIAction.GetScreenPosFromWorld('mod_LastShotEventPlaceIniUI', 200, CalibratedEventPlacePos, {x = 0, y = 0, z = 0}, true); --get Screen pos. 

                if (offset.x == 0 and offset.y == 0 and DistanceVectors(myPlayerPos, CalibratedEventPlacePos) > 2) then -- Element is on Screen and more than 2m
                    if (not LastShotEventUIActive) then
                        UIAction.ShowElement('mod_LastShotEventPlaceUI', 1);  --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction                    
                        LastShotEventUIActive=true;
                    end
                    local pos, offset = UIAction.GetScreenPosFromWorld('mod_LastShotEventPlaceUI', 1, CalibratedEventPlacePos, {x = 0, y = 0, z = 0}, false);
                    local EventPlaceDistance = tostring(math.floor(DistanceVectors(myPlayerPos, myPlayer.LastShotEventPlacePos))) .. 'm';
                    pos.x = pos.x - (100 - (DistanceVectors(myPlayerPos, CalibratedEventPlacePos) / 3));
                    UIAction.CallFunction('mod_LastShotEventPlaceUI', 1, 'ActionScriptFunction', EventPlaceDistance,myPlayer.LastShotEventPlaceName); -- cals UI and pass the distance
                    UIAction.SetPos('mod_LastShotEventPlaceUI', 1, '_root', pos);  
                else                
                    UIAction.UnloadElement('mod_LastShotEventPlaceUI', 1);
                    LastShotEventUIActive=false;
                end
            else    
                UIAction.UnloadElement('mod_LastShotEventPlaceUI', 1);
                LastShotEventUIActive=false;
            end
            Script.SetTimerForFunction(15, 'LastShotShowEventPlaceAfterDelay', {}); --20ms every 10ms function is call
        else 
            UIAction.UnloadElement('mod_LastShotEventPlaceUI', 1);
            UIAction.UnloadElement('mod_LastShotEventPlaceIniUI', 200);
            LastShotEventUIActive=false;
        end
    else 
        UIAction.UnloadElement('mod_LastShotEventPlaceUI', 1);
        UIAction.UnloadElement('mod_LastShotEventPlaceIniUI', 200);
        LastShotEventUIActive=false;
    end
end

-- LastShotEventPlaceAfterDelay, This function executes in Client because is called (initialized) by Event client
-- Recalls the function to show names after a delay
function LastShotShowEventPlaceAfterDelay(dummy)
    LastShotShowEventPlace();
end

-- LastShotRemoveEventPlace This function executes in Client because is called (initialized) by Event client
-- Removes the player EventPlace  due to time expired
function LastShotRemoveEventPlace(player)  
    player.LastShotEventPlaceTimerId = nil;                           
    player.LastShotEventPlacePos = nil;
end


--------------------------------------------------------------------------
---------------------------- REGISTER CALLBACKS --------------------------
--------------------------------------------------------------------------
-- if server event (OnInit, Revive) occurs we execute functions in server that can call client Side Functions (mSendEvent)
-- Calling the Miscreated Revive player function to initialize all marks 
RegisterCallbackReturnAware( --called after 'OnHit' function. 
    Miscreated, 
    'RevivePlayer',
    function (self, ret, playerId)
        local player = System.GetEntity(playerId);
        local steamid = player.player:GetSteam64Id();
        if ( LastShotEventPlace ~= nil )  then   -- this EventPlace position saved in OnHit callback.        
            local data = {
                eventName = 'Event',
                eventplacepos = LastShotJSONLib.stringify(LastShotEventPlace)
              };
            mSendEvent(
                playerId,
                {
                    Type = LastShotEventPlaceInitUI,
                    Data = data
                },
                false,
                false
            );
        end
        return ret;
    end,
    nil
);


--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE --------------------
--------------------------------------------------------------------------

function LastShotRemoveServerEventPlace(dummy) --after the time we don't show any event to new players 
    LastShotEventPlace = nil;
end


-- !eventplace <subcommand>
-- Uses the !eventplace command with a subcommand to set a global mark
ChatCommands["!eventplace"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
      
  
    if isAdminUserWithPrivileges(steamid) then
          LastShotEventPlace = player:GetWorldPos();
          LastShotEventPlace.z = LastShotEventPlace.z + 1;
          local listOfPlayers = CryAction.GetPlayerList();
          
          local data = {
            eventName = 'Event',
            eventplacepos = LastShotJSONLib.stringify(LastShotEventPlace)
          };

          for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the global mark
              mSendEvent(
                    player2.id,
                      {
                        Type = LastShotEventPlaceInitUI,
                          Data = data
                      },
                      false,
                      false
                  );
          end
        --Script.SetTimerForFunction(15000, 'LastShotRemoveServerEventPlace', {}); -- For test 15s
        Script.SetTimerForFunction(3600000, 'LastShotRemoveServerEventPlace', {}); -- Deactivate EventPlace in Server!        
        g_gameRules.game:SendTextMessage(0, playerId, 'Event Place successfully');          
    end
end



-- !uneventplace <subcommand>
-- Uses the !uneventplace command remove all global marks
-- !uneventplace <subcommand>
-- Uses the !uneventplace command with a subcommand to remove a global eventplace
ChatCommands["!uneventplace"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    
 
    if isAdminUserWithPrivileges(steamid) then
        LastShotEventPlace = nil;
              local listOfPlayers = CryAction.GetPlayerList();
               for key, player2 in pairs(listOfPlayers) do
                            mSendEvent(
                                player2.id,
                                {
                                    Type = LastShotRemoveEventPlaceTimer,
                                    Data = {dummyData = ''}
                                },
                                false,
                                false
                            );
                end
        g_gameRules.game:SendTextMessage(0, playerId, 'Removed Event Place successfully');
    end
end

