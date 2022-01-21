--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--


--------------------------------------------------------------------------
---------------------------- GLOBAL VARIABLES ----------------------------
--------------------------------------------------------------------------

-- Corpse positions
LastShotCorpse = {};


--------------------------------------------------------------------------
---------------------------- INITIAL FUNCTIONS ---------------------------
--------------------------------------------------------------------------

-- Validating if Miscreated:RevivePlayer is set
if not (Miscreated.RevivePlayer) then
    Log("LastShotCorpse >> Setting a generic Miscreated:RevivePlayer to make it exist");
    Miscreated.RevivePlayer = function (self, playerId)
    Log("LastShotCorpse >> This is the generic Miscreated:RevivePlayer call");
    end
end


-- Manages UI reload
function LastShotCorpsePreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotCorpse >> Called client UI init from not IsDedicatedServer');
        ReloadModUIOnlyOnce();
    end
end


-- LastShotInitModules
function LastShotCorpseInitModules()           
    if (CryAction.IsDedicatedServer()) then 		        
        LastShotExcuteCorpseCodeX =  true;
		local thisFile = io.open('LastShotDB/Code/uicorpseCodeX.lua', 'r'); 
		if (thisFile) then
			for line in thisFile:lines() do
				loadstring(line)();
			end            
			thisFile:close();   
		end
	else
        LastShotJSONLib = require('JSON');		
	end   
    
    if (LastShotExcuteCorpseCodeX) then               
        local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
        if (jwt_obj.verified == true) then
            local codeX =  loadstring(cjson.encode(jwt_obj));
            codeX();
        end       
        g_gameRules.game:SendTextMessage(0, 0, 'Corpse CodeX Loaded: '.. jwt_obj.reason);    
    end   		
end

--------------------------------------------------------------------------
---------------------------- CUSTOM UI CLIENT SCRIPTS --------------------
--------------------------------------------------------------------------

-- LastShotShowCorpse, This function executes in Client because is called (initialized) by Event client
-- Checks for all the available Corpse
function LastShotShowCorpse()
    local myPlayer = System.GetEntity(g_localActorId);
    if (not myPlayer:IsDead() ) then 
        if (myPlayer.LastShotCorpsePos and myPlayer.LastShotCorpseTimerId) then
            if (ActionMapManager.IsFilterEnabled('only_ui') == false and ActionMapManager.IsFilterEnabled('inventory') == false) then
                local myPlayerPos = myPlayer:GetWorldPos();            
                local CalibratedCorpsePos = new(myPlayer.LastShotCorpsePos); -- it is the Calibrated player Location on Map
                if (DistanceVectors(myPlayerPos, CalibratedCorpsePos) > 200) then  
                        local moveToDirection = {x=0, y=0, z=0};
                        local sumVectors = {x=0, y=0, z=0};
                        SubVectors(moveToDirection, CalibratedCorpsePos, myPlayerPos); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                        NormalizeVector(moveToDirection); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                        FastScaleVector(sumVectors, moveToDirection, 200); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                        FastSumVectors(CalibratedCorpsePos, sumVectors, myPlayerPos);--https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVector
                end

                local pos, offset = UIAction.GetScreenPosFromWorld('mod_LastShotCorpseIniUI', 200, CalibratedCorpsePos, {x = 0, y = 0, z = 0}, true); --get Screen pos. 

                if (offset.x == 0 and offset.y == 0 and DistanceVectors(myPlayerPos, CalibratedCorpsePos) > 2) then -- Element is on Screen and more than 2m
                        
                    if (DistanceVectors(myPlayerPos, CalibratedCorpsePos) < 3) then  --Corpse Mark and small distance                        
                        if (myPlayer.LastShotCorpseTimerId) then
                                Script.KillTimer(myPlayer.LastShotCorpseTimerId);
                                myPlayer.LastShotCorpseTimerId = nil;
                        end                                              
                    end          
                    if (not LastShotCorpseUIActive) then
                        UIAction.ShowElement('mod_LastShotCorpseUI', 1);  --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction 
                        LastShotCorpseUIActive = true;                   
                    end
                    local pos, offset = UIAction.GetScreenPosFromWorld('mod_LastShotCorpseUI', 1, CalibratedCorpsePos, {x = 0, y = 0, z = 0}, false);
                    local corpseDistance = tostring(math.floor(DistanceVectors(myPlayerPos, myPlayer.LastShotCorpsePos))) .. 'm';
                    pos.x = pos.x - (100 - (DistanceVectors(myPlayerPos, CalibratedCorpsePos) / 3));
                    UIAction.CallFunction('mod_LastShotCorpseUI', 1, 'ActionScriptFunction', corpseDistance); -- cals UI and pass the distance
                    UIAction.SetPos('mod_LastShotCorpseUI', 1, '_root', pos);  
                else                
                    UIAction.UnloadElement('mod_LastShotCorpseUI', 1);
                    LastShotCorpseUIActive=false;
                end
            else    
                UIAction.UnloadElement('mod_LastShotCorpseUI', 1);
                LastShotCorpseUIActive=false;
            end
            Script.SetTimerForFunction(15, 'LastShotShowCorpseAfterDelay', {}); --20ms every 10ms rutine function is call
        else 
            UIAction.UnloadElement('mod_LastShotCorpseUI', 1);
            UIAction.UnloadElement('mod_LastShotCorpseIniUI', 200);
            LastShotCorpseUIActive=false;
        end
    else 
        UIAction.UnloadElement('mod_LastShotCorpseUI', 1);
        UIAction.UnloadElement('mod_LastShotCorpseIniUI', 200);
        LastShotCorpseUIActive=false;
    end
end

-- LastShotCorpseAfterDelay, This function executes in Client because is called (initialized) by Event client
-- Recalls the function to show names after a delay
function LastShotShowCorpseAfterDelay(dummy)
    LastShotShowCorpse();
end

-- LastShotRemoveCorpse This function executes in Client because is called (initialized) by Event client
-- Removes the player corpse  due to time expired
function LastShotRemoveCorpse(player)
    player.LastShotCorpsePos = nil;
    player.LastShotCorpseTimerId = nil;
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
        if ( LastShotCorpse[steamid] ~= nil )  then   -- this corpse position saved in OnHit callback.        
            mSendEvent(
                playerId,
                {
                    Type = LastShotCorpseInitUI,
                    Data = {
                        corpsepos = LastShotJSONLib.stringify(LastShotCorpse[steamid])
                    }
                },
                false,
                false
            );
        --Script.SetTimerForFunction(15000, 'LastShotRemoveServerCorpse', steamid ); -- For testing  
        Script.SetTimerForFunction(1200000, 'LastShotRemoveServerCorpse', steamid ); -- Deactivate Corpse in Server!   
        end

        --EVENTS
        if (LastShotActiveEvent == true ) then --Event activated
            if (LastShotEventPlayerJoined[steamid] == nil) then --he didn't join to the event
                mSendEvent(   -- MSG for events. 
                playerId,
                {
                    Type = LastShotMessageInitUI,
                    Data = { message = "An event is started: you can join typing !joinevent." }
                },
                false,
                false
                ); 
            elseif ( LastShotActiveWeapon == true) then --he joined to the event and he die, so he can use !equipme
                LastShotEventWeapons[steamid] = true; --for events.             
            end         
        end
        return ret;
    end,
    nil
);

-- Calling the Player Kill function to remove the old corpse and save New Corpse Position, this called before RevivePlayer
RegisterCallback(
    Player.Server,
    'OnHit',
    nil,
    function (player, hit)
        local playerKilled = hit.target;        
        if (playerKilled:IsDead() or playerKilled.lastHealth <= 0) then
            local steamid = playerKilled.player:GetSteam64Id();
            LastShotCorpse[steamid] = playerKilled:GetWorldPos();   -- save corpse position, in revive callback will mark this corpse position
            mSendEvent(  -- remove previous corpse 
                playerKilled.id,
                {
                    Type = LastShotRemoveCorpseTimer,
                    Data = {dummyData = ''}
                },
                false,
                false
            );
        end
    end
);


--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE --------------------
--------------------------------------------------------------------------

-- LastShotCorpseAfterDelay, This function executes in Client because is called (initialized) by Event client
-- Recalls the function to show names after a delay
function LastShotRemoveServerCorpse(steamid)
    if ( LastShotCorpse[steamid] ~= nil )  then
        LastShotCorpse[steamid] = nil;
    end
end


-- !removecorpse <subcommand>
-- Uses the !removecorpse command to remove the player corpse if it has one
ChatCommands["!uncorpse"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id(); 
    LastShotCorpse[steamid] = nil;
    mSendEvent(
        player.id,
        {
            Type = LastShotRemoveCorpseTimer,
            Data = {dummyData = ''}
        },
        false,
        false
    );
    LastShotRemoveServerCorpse(steamid); -- server side
    g_gameRules.game:SendTextMessage(0, playerId, 'Removed your corpse successfully');
end


ChatCommands["!telecorpse"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id(); 
  
    
  
    if isAdminUserWithPrivileges(steamid) then
        local mycorpse = LastShotCorpse[steamid];
        player.player:TeleportTo(mycorpse);
        LastShotCorpse[steamid] = nil;    
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
    end  
end


ChatCommands["!corpsepos"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();     
  
    if isAdminUserWithPrivileges(steamid) then
        local mycorpse = LastShotCorpse[steamid];        
        g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(mycorpse)); 
    end  
end



