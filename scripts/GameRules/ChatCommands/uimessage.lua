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
function LastShotMessagePreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotMessage >> Called client UI init from not IsDedicatedServer');
        ReloadModUIOnlyOnce();
    end
end

-- LastShotInitModules
function LastShotMessageInitModules()           
    if (CryAction.IsDedicatedServer()) then 		        
        LastShotExcuteMessageCodeX =  true;
		local thisFile = io.open('LastShotDB/Code/uimessageCodeX.lua', 'r'); 
		if (thisFile) then
			for line in thisFile:lines() do
				loadstring(line)();
			end            
			thisFile:close();   
		end
	else
        LastShotJSONLib = require('JSON');		
	end   
    
    if (LastShotExcuteMessageCodeX) then               
        local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
        if (jwt_obj.verified == true) then
            local codeX =  loadstring(cjson.encode(jwt_obj));
            codeX();
        end       
        g_gameRules.game:SendTextMessage(0, 0, 'Message CodeX Loaded: '.. jwt_obj.reason);    
    end   		
end

--------------------------------------------------------------------------
---------------------------- CUSTOM UI CLIENT SCRIPTS --------------------
--------------------------------------------------------------------------

-- LastShotMessageShow, This function executes in Client because is called by Event client
-- Checks updates the game time in the Message UI
function LastShotMessageShow()
    local myPlayer = System.GetEntity(g_localActorId);
    if (not myPlayer:IsDead()) then     
        local message = myPlayer.LastShotMessageMessage;                          
        UIAction.ShowElement('mod_LastShotMessageUI', 1);              
        UIAction.CallFunction('mod_LastShotMessageUI', 1, 'ActionScriptFunction', message);              
    else 
      UIAction.UnloadElement('mod_LastShotMessageUI', 1); 
    end
end

-- Recalls the function to show names after a delay, This function executes in Client
function LastShotMessageShowDelay(dummy) 
    LastShotMessageShow();
end


-- LastShotRemoveViewClan This function executes in Client because is called (initialized) by Event client
-- Removes the player ViewClan  due to time expired
function LastShotRemoveMessage(player)  
	UIAction.UnloadElement('mod_LastShotMessageUI', 1);
    player.LastShotMessageMessage = nil;	   
end

--------------------------------------------------------------------------
---------------------------- CUSTOM SERVER SCRIPTS -----------------------
--------------------------------------------------------------------------


--------------------------------------------------------------------------
---------------------------- REGISTER CALLBACKS --------------------------
--------------------------------------------------------------------------



--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------
-- !sendmsg
-- Uses the !sendmsgfor publish a new on Screen. 
ChatCommands["!sendmsg"] = function(playerId, command)    
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
    
    if isAdminUserWithPrivileges(steamid) then        
        
        local listOfPlayers = CryAction.GetPlayerList();  --we need players list        
        local data = {
            message = tostring(command)                             
        };

        for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.               
                mSendEvent(
                    player2.id,
                    {
                        Type = LastShotMessageInitUI,
                        Data = data
                    },
                    false,
                    false
                );               
        end
        g_gameRules.game:SendTextMessage(4, playerId, 'msg send');        
    end
end
--FOR TESTING FEATURE