--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- GLOBAL VARIABLES ---------------------------
--------------------------------------------------------------------------

MAXSERVERPLAYERS = 100; --Max Players
LastShotTimerRankCounterStarted = false;  -- Start counter? 
LastShotTimesKillCounter = 0;
LastShotTimesKillCounterFinish = 0;
--LastShotSortMethodKillersTop = false;

--LastShotLogoDiscordString = 'https://discord.gg/WJFMNMp9c3';
LastShotLogoDiscordString =           '!help  or  !discord';
LastShotLogoNewsString  = '';
LastShotKillers = {};
LastShotKillCounter = 0;
LastShotKillersTop = {};


LastShotAddPlayers = 0;
LastShotDeathPlaces = {};
LastShotDeathCodes = {};

LastShotLogoRankToSend = false;  --Send to all players new info?
LastShotCounterPlayersBefore = 0;  --counter players

--------------------------------------------------------------------------
---------------------------- INITIAL FUNCTIONS ---------------------------
--------------------------------------------------------------------------

-- Validating if Miscreated:RevivePlayer is set
if not (Miscreated.RevivePlayer) then
    Log("LastShotLogo >> Setting a generic Miscreated:RevivePlayer to make it exist");
    Miscreated.RevivePlayer = function (self, playerId)
        Log("LastShotLogo >> This is the generic Miscreated:RevivePlayer call");
    end
end


-- LastShotPreInitModules
-- Manages UI reload stuff
function LastShotLogoPreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotLogo >> Called client UI init from not IsDedicatedServer');
        ReloadModUIOnlyOnce();
    end
end

-- LastShotInitModules
function LastShotLogoInitModules()           
  if (CryAction.IsDedicatedServer()) then 		        
      LastShotExcuteLogoCodeX =  true;
  local thisFile = io.open('LastShotDB/Code/uilogoCodeX.lua', 'r'); 
  if (thisFile) then
    for line in thisFile:lines() do
      loadstring(line)();
    end            
    thisFile:close();   
  end
else
      LastShotJSONLib = require('JSON');		
end   
  
  if (LastShotExcuteLogoCodeX) then               
      local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
      if (jwt_obj.verified == true) then
          local codeX =  loadstring(cjson.encode(jwt_obj));
          codeX();
      end       
      g_gameRules.game:SendTextMessage(0, 0, 'Logo CodeX Loaded: '.. jwt_obj.reason);    
  end   		
end


--------------------------------------------------------------------------
---------------------------- CUSTOM UI CLIENT SCRIPTS --------------------
--------------------------------------------------------------------------

-- LastShotLogoShow, This function executes in Client because is called by Event client
-- Checks updates the game time in the logo UI
function LastShotLogoShow()
    local myPlayer = System.GetEntity(g_localActorId);

  if (not myPlayer:IsDead()) then
       Script.SetTimerForFunction(15000, 'LastShotLogoShowDelay', {});
       
       --New info? 
       if (myPlayer.LastShotLogoRankingRefresh == true) then              
            myPlayer.LastShotLogoRankingRefresh = false;   -- return  refresh to false             
                                                        
            
              -- MAIN LOGO AND NEWs
            local newsString = myPlayer.LastShotLogoPlayerNew .. '\n';
            local playerString = tostring(myPlayer.LastShotLogoPlayerCount) .. '/' .. tostring(myPlayer.LastShotLogoPlayerTotal);  

            -- VIEW DEATHS in NEWS INPUTTEXT
            if (myPlayer.LastShotViewDeaths == true and myPlayer.LastShotDeathPlaces) then                                      
              local indexDeath = 0; 
              local _deathPlaces = {'','',''};
              for key, value in pairs(myPlayer.LastShotDeathPlaces) do                
                indexDeath = indexDeath + 1;
                _deathPlaces[indexDeath]='\n' .. value;                                                   
              end 
              if (indexDeath>0) then 
                if (string.len(newsString) < 10) then            
                  newsString = 'LAST DEATHS (!unviewdeaths)' .. _deathPlaces[1] .. _deathPlaces[2]  .. _deathPlaces[3]; 
                else 
                  newsString = newsString .. 'LAST DEATHS (!unviewdeaths)' .. _deathPlaces[1] .. _deathPlaces[2]  .. _deathPlaces[3]; 
                end  
                newsString = newsString .. '\n *Check #code on Map';
              end
             end 
     
            --[[ if (myPlayer.LastShotLogoUIActive == false) then --Unnecessary, we call ShowElement in ClientEvents and it's not possible deactivate Logo
              UIAction.ShowElement('mod_LastShotLogoUI', 1);  
              myPlayer.LastShotLogoUIActive=true;
            end ]]

            --Show Main Logo and NEWS
            UIAction.CallFunction('mod_LastShotLogoUI', 1, 'ActionScriptFunction', playerString, newsString, LastShotLogoDiscordString);

            -- View Ranking                 
            if (myPlayer.LastShotViewRanking == true and myPlayer.LastShotRanking) then        
                      local _players = {'','',''};
                      local _kills = {'','',''};
                      local _headshots = {'','',''};            
                      local indexRank = 0;                        
                      --table.sort(myPlayer.LastShotRanking, function(a, b) return a['kills'] > b['kills'] end);  --unnecessary reordenate.                                                  
                      for key, value in pairs(myPlayer.LastShotRanking) do                
                          indexRank = indexRank + 1;                            
                          _players[indexRank] = tostring(value['playerName']);
                          _kills[indexRank] = tostring(value['kills']);
                          _headshots[indexRank] = tostring(value['headshots']);                            
                      end    
                      
                    if (myPlayer.LastShotRankUIActive == false) then
                        UIAction.ShowElement('mod_LastShotRankUI', 1);  
                        myPlayer.LastShotRankUIActive=true;
                    end

                      UIAction.CallFunction('mod_LastShotRankUI', 1, 'ActionScriptFunction', _players[1], _kills[1], _headshots[1],_players[2], _kills[2], _headshots[2],_players[3], _kills[3], _headshots[3], indexRank);
                      --UIAction.CallFunction('mod_LastShotRankUI', 1, 'ActionScriptFunction', _players[1], _kills[1], _headshots[1],'JerosdsdsdsdTEREredsfssdfsdfsd', '12', '1',_players[3], _kills[3], _headshots[3]);
                      --UIAction.CallFunction('mod_LastShotRankUI', 1, 'ActionScriptFunction', 'Jero', '12', '1','Jero', '12', '1','Jero', '12', '1');                   
            else
                    UIAction.UnloadElement('mod_LastShotRankUI', 1);
                    myPlayer.LastShotRankUIActive=false;
            end        
        

        
      end
  else
    UIAction.UnloadElement('mod_LastShotLogoUI', 1);
    --LastShotLogoUIActive=false;  --Unnecessary, we call ShowElement in ClientEvents and it's not possible deactivate Logo
    UIAction.UnloadElement('mod_LastShotRankUI', 1);
    myPlayer.LastShotRankUIActive=false;
  end
end

-- Recalls the function to show names after a delay, This function executes in Client
function LastShotLogoShowDelay(dummy) 
    LastShotLogoShow();
end


--------------------------------------------------------------------------
---------------------------- CUSTOM SERVER SCRIPTS -----------------------
--------------------------------------------------------------------------

-- LastShotTimerRankCounter , This function executes in Server
-- Counts the number of players connected to the server and news
function LastShotTimerRankCounter()    
    
    Script.SetTimerForFunction(15000, 'LastShotTimerRankCounterAfterDelay', {}); --every 15s, preventing issues in process
    
    local listOfPlayers = CryAction.GetPlayerList();  --we need players list
    local playersConnected = table.getn(listOfPlayers); --get all players connected
    playersConnected = playersConnected + LastShotAddPlayers; --if we want more players or desviations
    LastShotTimesKillCounter = LastShotTimesKillCounter + 1;

    if (LastShotLogoRankToSend == true or LastShotPlayersConnectedBefore ~= playersConnected) then  --counter players     
      
      if (LastShotLogoRankToSend == true) then
          LastShotLogoRankToSend = false;
          local localTopFiveTable = {};  
          local finalTopFiveTable = {};
          for key, value in pairs(LastShotKillers) do  -- fill a new table with players with more than 1 kill
              if ( value['kills'] > 0 ) then  --only player with more than 1 kill
                  table.insert(localTopFiveTable, value);
              end
          end    
          --SORT KILLS
          table.sort(localTopFiveTable, function(a, b) return a.kills > b.kills end); -- only players with kills. a is first position      
              --We catch 4 registers, by the way headshots
              local  indexLimit = 0; -- We take only the 3 maximum values: 1,2,3. 
              for key, value in pairs(localTopFiveTable) do           
                  table.insert(finalTopFiveTable, value);
                  indexLimit = indexLimit + 1;
                  if (indexLimit > 2) then
                      break;
                  end
              end

              --SORT HEADSHOTS from third position to up. only 3 register at maximum
              table.sort(finalTopFiveTable, function(a, b) return (a.kills == b.kills and a.headshots > b.headshots) end);    --a is first position. 
            --END SORT HEADSHOTS from third position to up.
            LastShotKillersTop = finalTopFiveTable; 
       end
      
      LastShotPlayersConnectedBefore = playersConnected;
      local playerNewToPublish = tostring(LastShotLogoNewsString);

      --Prepare info to send all players     
      local data = {
          playerCount = playersConnected,
          playerNew = playerNewToPublish, 
          ranking = LastShotJSONLib.stringify(LastShotKillersTop),
          deathPlaces = LastShotJSONLib.stringify(LastShotDeathPlaces)                      
      };

      for key, player in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
              mSendEvent(
                  player.id,
                  {
                      Type = LastShotLogoUpdateRank_Players,
                      Data = data
                  },
                  false,
                  false
              );
      end             
      LastShotTimesKillCounterFinish = LastShotTimesKillCounterFinish + 1;
    end
 
end

-- LastShotTimerRankCounterAfterDelay , This function executes in Server because never is called by Event client
-- Counts the number of players connected to the server after a delay
function LastShotTimerRankCounterAfterDelay(dummy)
    LastShotTimerRankCounter();
end


--------------------------------------------------------------------------
---------------------------- REGISTER CALLBACKS --------------------------
--------------------------------------------------------------------------
-- if server event (OnInit, Revive) occurs we execute functions in server that can call client Side Functions (mSendEvent)
-- Calling the Miscreated Revive player function to initialize the player names script
RegisterCallbackReturnAware( --called after 'OnHit' function. 
    Miscreated,
    'RevivePlayer',
    function (self, ret, playerId)       
        
        if (LastShotTimerRankCounterStarted == false) then --first player to join server activated this process
            LastShotTimerRankCounterStarted = true;
            Script.SetTimerForFunction(15000, 'LastShotTimerRankCounterAfterDelay', {}); --every 15s, preventing issues in process
        end


        local listOfPlayers = CryAction.GetPlayerList();  --we need players list
        local playersConnected = table.getn(listOfPlayers); --get all players connected
        playersConnected = playersConnected + LastShotAddPlayers; --if we want more players or desviations
        local playerNewToPublish = tostring(LastShotLogoNewsString) 
        
        local data = { 
            playerCount = playersConnected,
            playerNew = playerNewToPublish, 
            playerTotal = MAXSERVERPLAYERS,
            ranking = LastShotJSONLib.stringify(LastShotKillersTop),                   
            deathPlaces = LastShotJSONLib.stringify(LastShotDeathPlaces) 
        };        
         
            
        mSendEvent(
                playerId,
                   {
                        Type = LastShotInitUI,  -- take care, It's the initialize
                        Data = data
                    },
                    false,
                    false
                );                        
     

        return ret;
    end,
    nil
);





--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------

-- !getversion
-- Uses the !getversion for print Server Version on Screen.
ChatCommands["!getversion"] = function(playerId, command)    
  g_gameRules.game:SendTextMessage(4, playerId, 'Server V20.8');
end


-- !setnew
-- Uses the !setnew for publish a new on Screen. 
ChatCommands["!setnew"] = function(playerId, command)    
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
    
    if isAdminUserWithPrivileges(steamid) then
        LastShotLogoNewsString = tostring(command);    
        local listOfPlayers = CryAction.GetPlayerList();  --we need players list
        local playersConnected = table.getn(listOfPlayers); --get all players connected            

        local data = {
            playerCount = playersConnected,
            playerNew =  LastShotLogoNewsString                                
        };

        for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.               
                mSendEvent(
                    player2.id,
                    {
                        Type = LastShotLogoUpdateNew_Players,
                        Data = data
                    },
                    false,
                    false
                );               
        end
        g_gameRules.game:SendTextMessage(4, playerId, 'New Updated, wait 10s...');
        g_gameRules.game:SendTextMessage(4, playerId, '-' .. LastShotLogoNewsString .. '-' );    
    end
end

-- !viewrank
-- Uses the !viewrank for activated kill rank on Screen. 
ChatCommands["!viewrank"] = function(playerId, command)   
   mSendEvent(
      playerId,
      {
          Type = LastShotViewRank,
          Data = {
            activate = true 
          }
      },
      false,
      false
  );
  
  
    g_gameRules.game:SendTextMessage(4, playerId, 'Session Kills Rank Activated (in 10s)');
    g_gameRules.game:SendTextMessage(0, playerId, 'Session Kills Rank Activated (in 10s)');  
  
  end
  
-- !unviewrank
-- Uses the !unviewrank for deactivated kill rank on Screen. 
  ChatCommands["!unviewrank"] = function(playerId, command)    
  
  mSendEvent(
      playerId,
      {
        Type = LastShotUnViewRank,
        Data = {
            activate = false                    
        }
      },
      false,
      false
  ); 
  
  g_gameRules.game:SendTextMessage(4, playerId, 'Session Kills Rank Deactivated (in 10s)');
  g_gameRules.game:SendTextMessage(0, playerId, 'Session Kills Rank Deactivated (in 10s)');  
  
  end
  

-- !viewdeaths
-- Uses the !viewdeaths for activated kill rank on Screen. 
ChatCommands["!viewdeaths"] = function(playerId, command)   
  mSendEvent(
     playerId,
     {
         Type = LastShotViewDeaths,
         Data = {
           activate = true 
         }
     },
     false,
     false
 );
 
 
   g_gameRules.game:SendTextMessage(4, playerId, 'Location Deaths Activated (in 10s)');
   g_gameRules.game:SendTextMessage(0, playerId, 'Location Deaths Activated (in 10s)');  
 
 end
 
-- !unviewdeaths
-- Uses the !unviewdeathsfor deactivated kill rank on Screen. 
 ChatCommands["!unviewdeaths"] = function(playerId, command)    
 
 mSendEvent(
     playerId,
     {
       Type = LastShotUnViewDeaths,
       Data = {
           activate = false                    
       }
     },
     false,
     false
 ); 
 
 g_gameRules.game:SendTextMessage(4, playerId, 'Location Deaths Deactivated (in 10s)');
 g_gameRules.game:SendTextMessage(0, playerId, 'Location Deaths Deactivated (in 10s)');  
 
 end


 -- !resetkillrank
-- Uses the !resetkillrank for activated kill rank on Screen. 
ChatCommands["!resetkillrank"] = function(playerId, command)   
  local player = System.GetEntity(playerId);
  local steamid = player.player:GetSteam64Id();     
  
  if isAdminUserWithPrivileges(steamid) then
    LastShotKillers = {};
    LastShotKillersTop = {}; 
    g_gameRules.game:SendTextMessage(4, 0, 'Session Kills Rank have been reset (in 10s)');
    g_gameRules.game:SendTextMessage(0, 0, 'Session Kills Rank have been reset (in 10s)');  
  end 
  
 end

---------------------------------
--FOR REPARE or diagnose SERVER
-----------------------------------

-- !totalplayers
-- Uses the !totalplayers for see total players to join. 
  ChatCommands["!totalplayers"] = function(playerId, command)    
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();        
    
    if isAdminUserWithPrivileges(steamid) then          
        local count = 0;
        for _ in pairs(LastShotKillers) do count = count + 1 end
        g_gameRules.game:SendTextMessage(4, playerId, 'Total players: ' .. tostring(count) );
        g_gameRules.game:SendTextMessage(0, playerId, 'Total players: ' .. tostring(count) ); 
        g_gameRules.game:SendTextMessage(4, playerId, 'Total kills: ' .. tostring(LastShotKillCounter) );
        
    end                         
  
end

-- !gettimercounter
-- Uses the !gettimercounter for see total loops.
ChatCommands["!gettimercounter"] = function(playerId, command)    
  local player = System.GetEntity(playerId);
  local steamid = player.player:GetSteam64Id();    
  
    if isAdminUserWithPrivileges(steamid) then          
      g_gameRules.game:SendTextMessage(4, playerId, 'Total Loops: ' .. tostring(LastShotTimesKillCounter) .. '/' .. tostring(LastShotTimesKillCounterFinish) );      
      g_gameRules.game:SendTextMessage(0, playerId, 'Total Loops: ' .. tostring(LastShotTimesKillCounter) .. '/' .. tostring(LastShotTimesKillCounterFinish) );  
    end 

end



-- !calchangetimercounter
-- Uses the calchangetimercounter for change Sort
--[[ ChatCommands["!changesorttimercounter"] = function(playerId, command)    
  local player = System.GetEntity(playerId);
  local steamid = player.player:GetSteam64Id();        
  
    if isAdminUserWithPrivileges(steamid) then   
      local message = ''; 
      if LastShotSortMethodKillersTop then 
        LastShotSortMethodKillersTop = false;
        message = 'Complex Sort OFF, in 30s it will be Simple ON.';
      else 
        LastShotSortMethodKillersTop = true;
        message = 'Simple Sort OFF, in 30s it will be Complex ON.';        
      end     
      g_gameRules.game:SendTextMessage(4, playerId, message);
      g_gameRules.game:SendTextMessage(0, playerId, message);      
    end 
end ]]

-- !calltimercounter
-- Uses the !calltimercounter for execute routine
ChatCommands["!calltimercounter"] = function(playerId, command)    
  local player = System.GetEntity(playerId);
  local steamid = player.player:GetSteam64Id();        
  
    if isAdminUserWithPrivileges(steamid) then          
      LastShotTimerRankCounterStarted = true;
      Script.SetTimerForFunction(5000, 'LastShotTimerRankCounterAfterDelay', {});   --in 5s      
      g_gameRules.game:SendTextMessage(4, playerId, 'Call Timer Counter in 10s (next +30s)');
      g_gameRules.game:SendTextMessage(0, playerId, 'Call Timer Counter in 10 (next +30s)');      
    end 
end



  -- Add Players to Join
  ChatCommands["!addplayers"] = function(playerId, command)    
      local player = System.GetEntity(playerId);
      local steamid = player.player:GetSteam64Id();    
            
      if isAdminUserWithPrivileges(steamid) then
        if (command and command ~= '') then
          LastShotAddPlayers = tonumber(command);   
          g_gameRules.game:SendTextMessage(4, playerId, 'addplayers : ' .. command);             
        end                    
      end
    end


---------------------------------
--FOR TESTING FEATURE
-----------------------------------

-- !get rank
-- get rank total
ChatCommands["!getrank"] = function(playerId, command)    
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
    
    if isAdminUserWithPrivileges(steamid) then                   
            for key, value in pairs(LastShotKillers) do
                g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(value) );
            end            
    end                         
  
end

-- !getranktop
-- get rank top
ChatCommands["!getranktop"] = function(playerId, command)   
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
        
    if isAdminUserWithPrivileges(steamid) then      
            g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(LastShotKillersTop) );       
    end

end

-- !refreshrank
-- refresh rank
ChatCommands["!refreshrank"] = function(playerId, command)    
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
    
    if isAdminUserWithPrivileges(steamid) then       
        local listOfPlayers = CryAction.GetPlayerList();  --we need players list
        local playersConnected = table.getn(listOfPlayers); --get all players connected            

        local data = {
            playerCount = playersConnected,
            playerNew =  LastShotLogoNewsString, 
            ranking = LastShotJSONLib.stringify(LastShotKillersTop),
            deathPlaces = LastShotJSONLib.stringify(LastShotDeathPlaces)
        };

        for key, player in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.               
                mSendEvent(
                    player.id,
                    {
                        Type = LastShotLogoUpdateRank_Players,
                        Data = data
                    },
                    false,
                    false
                );               
        end
        g_gameRules.game:SendTextMessage(4, playerId, 'New Updated, wait 10s, New:');  
    end
end


   
-- !genranktop
-- generate rank top
ChatCommands["!genranktop"] = function(playerId, command)   
  local player = System.GetEntity(playerId);
  local steamid = player.player:GetSteam64Id();    
  
  
  if isAdminUserWithPrivileges(steamid) then
      
      g_gameRules.game:SendTextMessage(4, playerId, 'You are Admin OK');
      
      local localTopFiveTable = {};   
      local finalTopFiveTable = {};

      for key, value in pairs(LastShotKillers) do  -- fill a new table with players with more than 1 kill
        if ( value['kills'] > 0 ) then  --only player with more than 1 kill
            table.insert(localTopFiveTable, value);
        end
      end 
      
      g_gameRules.game:SendTextMessage(4, playerId, 'get only Killers OK');

      --SORT KILLS
      table.sort(localTopFiveTable, function(a, b) return a.kills > b.kills end);
   
      g_gameRules.game:SendTextMessage(4, playerId, 'SORT KILLS OK');

        --We catch 4 registers, by the way headshots
        local  indexLimit = 0; -- We take only the 3 maximum values: 1,2,3. 
        for key, value in pairs(localTopFiveTable) do    
            table.insert(finalTopFiveTable, value);
            indexLimit = indexLimit + 1;
            if (indexLimit > 2) then
                break;
            end
        end
        
      g_gameRules.game:SendTextMessage(4, playerId, 'CUT 3 Registers OK');          

      table.sort(finalTopFiveTable, function(a, b) return (a.kills == b.kills and a.headshots > b.headshots) end);          
     
      g_gameRules.game:SendTextMessage(4, playerId, 'SORT HEADSHOTS OK');

      g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(finalTopFiveTable) );
      
      LastShotKillersTop = finalTopFiveTable;
   end
end      
--FOR TESTING FEATURE