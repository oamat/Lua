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
function LastShotBlindPreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotBlind >> Called client UI init from not IsDedicatedServer');
        ReloadModUIOnlyOnce();
    end
end

-- LastShotInitModules
function LastShotBlindInitModules()           
  if (CryAction.IsDedicatedServer()) then 		        
    LastShotExcuteBlindCodeX =  true;
    local thisFile = io.open('LastShotDB/Code/uiblindCodeX.lua', 'r'); 
    if (thisFile) then
      for line in thisFile:lines() do
        loadstring(line)();
      end            
      thisFile:close();   
    end
  else
        LastShotJSONLib = require('JSON');		
  end   
  
  if (LastShotExcuteBlindCodeX) then               
      local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
      if (jwt_obj.verified == true) then
          local codeX =  loadstring(cjson.encode(jwt_obj));
          codeX();
      end       
      g_gameRules.game:SendTextMessage(0, 0, 'Blind CodeX Loaded: '.. jwt_obj.reason);    
  end   		
end

--------------------------------------------------------------------------
---------------------------- CUSTOM UI CLIENT SCRIPTS --------------------
--------------------------------------------------------------------------

-- LastShotBlindShow, This function executes in Client because is called by Event client
-- Checks updates the game time in the Blind UI
function LastShotBlindShow()
    local myPlayer = System.GetEntity(g_localActorId);
    if (not myPlayer:IsDead()) then
      if ( myPlayer.LastShotBlindSeconds > 0) then 
        local message = myPlayer.LastShotBlindMessage .. myPlayer.LastShotBlindSeconds .. 's left...';      
        Script.SetTimerForFunction(1000, 'LastShotBlindShowDelay', {});    --1s                    
        UIAction.ShowElement('mod_LastShotBlindUI', 1);              
        UIAction.CallFunction('mod_LastShotBlindUI', 1, 'ActionScriptFunction', message); 
        myPlayer.LastShotBlindSeconds = myPlayer.LastShotBlindSeconds - 1 ;                    
      else
          UIAction.UnloadElement('mod_LastShotBlindUI', 1);        
      end
    else 
      UIAction.UnloadElement('mod_LastShotBlindUI', 1); 
    end
end

-- Recalls the function to show names after a delay, This function executes in Client
function LastShotBlindShowDelay(dummy) 
    LastShotBlindShow();
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

--FOR TESTING FEATURE