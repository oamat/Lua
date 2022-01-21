--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--

Log('LastShot Server >> Registering All events');

--------------------------------------------------------------------------
---------------------------- GLOBAL VARIABLES ---------------------------
--------------------------------------------------------------------------


--------------------------------------------------------------------------
---------------------------- CLIENT EVENTS -------------------------------
--------------------------------------------------------------------------

--Init Player Names UI & Vars
g_mEventHandlers['LastShotInitUI'] = function(playerId, data, source_id, target_id)  -- we need inicialize all vars. 
    local player = System.GetEntity(g_localActorId);  -- this is Client Side
     -- INI LOGO TOP RIGHT 
     player.LastShotLogoPlayerCount = data.playerCount;
     player.LastShotLogoPlayerTotal = data.playerTotal;
     player.LastShotLogoPlayerNew = data.playerNew; --Not for now, for the next Logo refresh
     player.LastShotRanking = LastShotJSONLib.parse(data.ranking);   --player.LastShotRanking = nil; 
     player.LastShotDeathPlaces = LastShotJSONLib.parse(data.deathPlaces);      
    --player.LastShotXNumPos = 0; --FOR TEST
    --player.LastShotYNumPos = 0; --FOR TEST      
   
    -- INI BLIN VAR
    player.LastShotBlindSeconds = 0;
    
    --INI MESSAGES VAR
    player.LastShotMessageMessage = nil;
    player.LastShotMessageTimerId = nil;
    
     -- INI COMPASS
     if (player.LastShotCompass == nil) then 
        player.LastShotCompass = true; -- deactivate compass         
    end
    
    -- INI RANKING        
    if (player.LastShotViewRanking == nil) then 
        player.LastShotViewRanking = true; -- because save problems and confusions        
    end
    
     -- INI DEATHS       
     if (player.LastShotViewDeaths == nil) then 
        player.LastShotViewDeaths = true; -- because save problems and confusions
    end

    -- INI SCREEN RESOLUTION
    --[[ if (player.LastShotFirstScreenSearch == nil) then 
        player.LastShotFirstScreenSearch = true
        player.LastShotXMiddle = 960; --1920/2 the standard
        player.LastShotYMiddle = 540; --1080/2 the standard
    end ]]
    
     --INI VIEW CLAN
    if (player.LastShotViewClan and player.LastShotClanList~=nil) then                           
        player.LastShotViewAllPlayers = false; -- because save problems and confusions.
        player.LastShotIsAdmin = false; --because save problems and confusions.            
        UIAction.ShowElement('mod_LastShotClanIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction        
        Script.SetTimerForFunction(7000, 'LastShotClanAfterDelay', {});  -- call the runtine in 7s
    else
        player.LastShotViewClan = false; -- change for testing
        player.LastShotClanList = nil; -- change for testing 
    end

    -- INI VIEW ALL PLAYERS FOR ADMINS
    if (player.LastShotViewAllPlayers and player.LastShotIsAdmin) then        
        player.LastShotViewClan = false; -- because save problems and confusions.
        player.LastShotClanList = nil; -- because save problems and confusions                      
        UIAction.ShowElement('mod_LastShotClanIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction        
        Script.SetTimerForFunction(7000, 'LastShotClanAfterDelay', {});  -- call the runtine in 7s
    else
        player.LastShotViewAllPlayers = false; --change for testing
        player.LastShotIsAdmin = false; -- we change this var and re-evaluated when somebody calls chatcommand.
    end
    
    

    -- STARTING SHOW UI Compass --only if player.LastShotCompass = true;
    Script.SetTimerForFunction(5000, 'LastShotCompassShowDelay', {}); -- call the runtine in 5s


    -- STARTING SHOW UI LOGO
    --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction
    local playerString = tostring(player.LastShotLogoPlayerCount) .. '/' .. tostring(player.LastShotLogoPlayerTotal);    
    --local newsString = [[Type !help or go to discord.    
    --!viewclan,!market,!rules !compass,!uncorpse,!aboutus !basebuilding,!deletemybase]];  --using long Strings https://stackoverflow.com/questions/52400428/newline-n-alternative-in-lua
    local newsString = '      SERVER V20.8\n-!viewclan,!unviewclan\n-!setMail,setDiscord\n-!unviewrank,!uncompass\n-!unviewdeaths,!uncorpse\n-!basebuilding,!deletemybase\n-!rules,!market!aboutus\n-!joinevent,!equipme\n-!mypos,!kc top10,!kc stats\n-!base,!pop,!restart';  --using long Strings https://stackoverflow.com/questions/52400428/newline-n-alternative-in-lua
    local discordString =                 '!help  or  !discord';     --LastShotLogoDiscordString = 'https://discord.gg/WJFMNMp9c3';
    UIAction.ShowElement('mod_LastShotLogoUI', 1);  -- We need always to call this LogoUI instanceID is 1, in this case we only have 1 grafic with id 1.
    UIAction.CallFunction('mod_LastShotLogoUI', 1, 'ActionScriptFunction', playerString, newsString, discordString);
    Script.SetTimerForFunction(15000, 'LastShotLogoShowDelay', {}); -- We need always to call this LogoUI  --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction


    -- STARTING SHOW UI RANKING    
        local _players = {'','',''};
        local _kills = {'','',''};
        local _headshots = {'','',''};            
        local indexRank = 0;
        for key, value in pairs(player.LastShotRanking) do   
                indexRank = indexRank + 1;  
                _players[indexRank] = tostring(value['playerName']);
                _kills[indexRank] = tostring(value['kills']);
                _headshots[indexRank] = tostring(value['headshots']);        
                --TEST : newsString = newsString .. tostring(indexRank) .. ') ' .. value['playerName'] .. ': ' .. tostring(value['kills']) .. ' : ' .. tostring(value['headshots']) .. '\n   ';      
         end
         
        UIAction.ShowElement('mod_LastShotRankUI', 1);   --necessary because the next proces happens in 15s
        UIAction.CallFunction('mod_LastShotRankUI', 1, 'ActionScriptFunction', _players[1], _kills[1], _headshots[1],_players[2], _kills[2], _headshots[2],_players[3], _kills[3], _headshots[3],indexRank);
        
        player.LastShotLogoRankingRefresh = true; -- because we need to change the news (now with basic commands)
        player.LastShotRankUIActive=true; -- Necessary  Ranking because we show here 
        --player.LastShotLogoUIActive=false; --  Unnecessary because we show here Logo not show yet

end


--[[ --Init Player Names Admin State
g_mEventHandlers['LastShotSetAdmin'] = function(playerId, data, source_id, target_id)
    player = System.GetEntity(source_id);

    if (player and player.player) then
        if (data.isAdmin == true) then
            player.LastShotIsAdmin = data.isAdmin;
        else
            player.LastShotIsAdmin = nil;
        end
    else
        player.LastShotIsAdmin = nil;
    end    
end ]]


--Update Logo New
g_mEventHandlers['LastShotLogoUpdateNew_Players'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotLogoPlayerCount = data.playerCount;
    player.LastShotLogoPlayerNew = data.playerNew;
    player.LastShotLogoRankingRefresh = true;           
end


--Update Logo Count players
g_mEventHandlers['LastShotLogoUpdateRank_Players'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotLogoPlayerCount = data.playerCount;
    player.LastShotLogoPlayerNew = data.playerNew;
    player.LastShotRanking = LastShotJSONLib.parse(data.ranking);        
    player.LastShotDeathPlaces = LastShotJSONLib.parse(data.deathPlaces);
    player.LastShotLogoRankingRefresh = true;  
end

--ViewRank Activate 
g_mEventHandlers['LastShotViewRank'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotViewRanking = true;
    player.LastShotLogoRankingRefresh = true; 
end

--ViewRank  Deactivate
g_mEventHandlers['LastShotUnViewRank'] = function(playerId, data, source_id, target_id)    
    local player = System.GetEntity(g_localActorId);    
    player.LastShotViewRanking = false; -- because save problems and confusions.
    player.LastShotLogoRankingRefresh = true;    
end

--ViewDeaths Activate 
g_mEventHandlers['LastShotViewDeaths'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotViewDeaths = true;
    player.LastShotLogoRankingRefresh = true; 
end

--ViewDeaths Deactivate
g_mEventHandlers['LastShotUnViewDeaths'] = function(playerId, data, source_id, target_id)    
    local player = System.GetEntity(g_localActorId);    
    player.LastShotViewDeaths = false; -- because save problems and confusions.
    player.LastShotLogoRankingRefresh = true;  
end


--Compass Activate
g_mEventHandlers['LastShotCompassActivated'] = function(playerId, data, source_id, target_id)    
    local player = System.GetEntity(g_localActorId);     
    if (not player.LastShotCompass) then -- if player wants to reload Compass frequently it's unnecessari create new rutines. 
        player.LastShotCompass = true; --because save problems and confusions.            
        Script.SetTimerForFunction(50, 'LastShotCompassShowDelay', {}); -- call the rutine in 0,05s
    end 
end

--Compass Deactivate
g_mEventHandlers['LastShotCompassDeactivated'] = function(playerId, data, source_id, target_id)    
    local player = System.GetEntity(g_localActorId); 
    player.LastShotCompass = false; --because save problems and confusions.
    UIAction.UnloadElement('mod_LastShotCompassUI', 1);
    UIAction.UnloadElement('mod_LastShotCompassIniUI', 200);
end



--ViewClan Activate or Deactivate
g_mEventHandlers['LastShotViewClan'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotClanList = LastShotJSONLib.parse(data.clanIds); 
    player.LastShotViewAllPlayers = false; -- because save problems and confusions.
    player.LastShotIsAdmin = false; --because save problems and confusions.    
    player.LastShotFirstScreenSearch = true; -- If we need to calculate the Screen Resolution, only first time   
    if (not player.LastShotViewClan) then -- if player wants to reload clanids frequently it's unnecessari create new rutines. 
        player.LastShotViewClan = true;       
        UIAction.ShowElement('mod_LastShotClanIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction        
        Script.SetTimerForFunction(10, 'LastShotClanAfterDelay', {});  -- Normal: 10, for testing 1000 or 500
    end   
    
end

--UnviewClan Activate or Deactivate
g_mEventHandlers['LastShotUnviewClan'] = function(playerId, data, source_id, target_id)    
    local player = System.GetEntity(g_localActorId);    
    player.LastShotViewClan = false;
    player.LastShotClanList = nil; 
    player.LastShotFirstScreenSearch = false; -- If we need to calculate the Screen Resolution, only first time   
    player.LastShotViewAllPlayers = false; -- because save problems and confusions.
    player.LastShotIsAdmin = false; --because save problems and confusions.  
    UIAction.UnloadElement('mod_LastShotClanUI', -1); -- Because we can have more than 1 ClanUI we need to use -1
    UIAction.UnloadElement('mod_LastShotClanIniUI', 200);    
end



--viewAllPlayers Admin Activate or Deactivate
g_mEventHandlers['LastShotViewAllPlayers'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);    
    player.LastShotViewClan = false; -- because save problems and confusions.
    player.LastShotClanList = nil; -- because save problems and confusions       
    player.LastShotFirstScreenSearch = true; -- If we need to calculate the Screen Resolution, only first time
    if (not player.LastShotViewAllPlayers) then -- if player wants to reload Viewallplayers frequently it's unnecessari create new rutines. 
        player.LastShotViewAllPlayers = true;        
        player.LastShotIsAdmin = true; -- If player gest here he is admin. 
        UIAction.ShowElement('mod_LastShotClanIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction        
        Script.SetTimerForFunction(10, 'LastShotClanAfterDelay', {});  -- Normal: 10, for testing 1000 or 500        
    end 
end


--viewAllPlayers Admin Activate or Deactivate
g_mEventHandlers['LastShotViewAllPlayersInvoker'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);  
    if (player.LastShotViewAllPlayersInvokerTimerId) then --unnecessary cancel last settimer
        Script.KillTimer(player.LastShotViewAllPlayersInvokerTimerId); --https://docs.cryengine.com/pages/viewpage.action?pageId=23306604                                
    end
    player.LastShotViewAllPlayersInvokerTimerId =  Script.SetTimerForFunction(15000, 'LastShotRemoveViewClan', player);  -- Deactivate in 15s
    player.LastShotViewClan = false; -- because save problems and confusions.
    player.LastShotClanList = nil; -- because save problems and confusions       
    player.LastShotFirstScreenSearch = true; -- If we need to calculate the Screen Resolution, only first time    
    if (not player.LastShotViewAllPlayers) then -- if player wants to reload Viewallplayers frequently it's unnecessari create new rutines. 
        player.LastShotViewAllPlayers = true;        
        player.LastShotIsAdmin = true; -- If player gest here he is admin. 
        UIAction.ShowElement('mod_LastShotClanIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction        
        Script.SetTimerForFunction(10, 'LastShotClanAfterDelay', {});  -- Normal: 10, for testing 1000 or 500        
    end 
end


--viewAllPlayers Admin Activate or Deactivate
g_mEventHandlers['LastShotUnViewAllPlayers'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotViewAllPlayers = false;
    player.LastShotIsAdmin = false;
    player.LastShotViewClan = false; -- because save problems and confusions.
    player.LastShotClanList = nil; -- because save problems and confusions    
    UIAction.UnloadElement('mod_LastShotClanUI', -1); -- Because we can have more than 1 ClanUI we need to use -1
    UIAction.UnloadElement('mod_LastShotClanIniUI', 200);    
end

--LastShotUpdateXPosNum
g_mEventHandlers['LastShotUpdateXPosNum'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotXNumPos = data.addxpos;   
end

--LastShotUpdateYPosNum 
g_mEventHandlers['LastShotUpdateYPosNum'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotYNumPos = data.addypos;   
end


--Init Mark UI & Vars
g_mEventHandlers['LastShotCorpseInitUI'] = function(playerId, data, source_id, target_id) -- When RevivePlayer
    local player = System.GetEntity(g_localActorId);    
    player.LastShotCorpsePos = LastShotJSONLib.parse(data.corpsepos);    
    player.LastShotCorpseTimerId = Script.SetTimerForFunction(1200000, 'LastShotRemoveCorpse', player);  --  20min.  -- unnecessary KillTimer because we called LastShotRemoveCorpseTimer before in RegisterCallback
    UIAction.ShowElement('mod_LastShotCorpseIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction -- Because is When RevivePlayer we can load here
    Script.SetTimerForFunction(1000, 'LastShotShowCorpseAfterDelay', {}); -- For show Corpse in 1s -- Because is When RevivePlayer we can load here
end



--Remove CorpseUI From Screen
g_mEventHandlers['LastShotRemoveCorpseTimer'] = function(playerId, data, source_id, target_id) -- When player type !uncorpse
    local player = System.GetEntity(g_localActorId);        
    if (player.LastShotCorpseTimerId) then
        Script.KillTimer(player.LastShotCorpseTimerId); --https://docs.cryengine.com/pages/viewpage.action?pageId=23306604
        player.LastShotCorpseTimerId = nil;                          
    end  
    player.LastShotCorpsePos = nil;
    UIAction.UnloadElement('mod_LastShotCorpseUI', 1);
    UIAction.UnloadElement('mod_LastShotCorpseIniUI', 200);
end


--Init Mark UI & Vars
g_mEventHandlers['LastShotEventPlaceInitUI'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);    
    player.LastShotEventPlaceName = data.eventName;
    player.LastShotEventPlacePos = LastShotJSONLib.parse(data.eventplacepos);    
    if (player.LastShotEventPlaceTimerId) then --unnecessaryn cancel last settimer
        Script.KillTimer(player.LastShotEventPlaceTimerId); --https://docs.cryengine.com/pages/viewpage.action?pageId=23306604
        player.LastShotEventPlaceTimerId = Script.SetTimerForFunction(3600000, 'LastShotRemoveEventPlace', player);   -- 1h   
        UIAction.ShowElement('mod_LastShotEventPlaceIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction              
        Script.SetTimerForFunction(1000, 'LastShotShowEventPlaceAfterDelay', {}); -- For show EventPlace in 5s, -- Because is not When RevivePlayer it's dangerous to reload here!!!
    else        
        player.LastShotEventPlaceTimerId = Script.SetTimerForFunction(3600000, 'LastShotRemoveEventPlace', player);   -- 1h  
        UIAction.ShowElement('mod_LastShotEventPlaceIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction
        Script.SetTimerForFunction(1000, 'LastShotShowEventPlaceAfterDelay', {}); -- For show EventPlace in 5s, -- Because is not When RevivePlayer it's dangerous to reload here!!!
    end
end

--LastShotEventPlaceInvokerInitUI Init Mark UI & Vars
g_mEventHandlers['LastShotEventPlaceInvokerInitUI'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);
    player.LastShotEventPlaceName = data.eventName;    
    player.LastShotEventPlacePos = LastShotJSONLib.parse(data.eventplacepos);
    if (player.LastShotEventPlaceTimerId) then --unnecessary cancel last settimer
        Script.KillTimer(player.LastShotEventPlaceTimerId); --https://docs.cryengine.com/pages/viewpage.action?pageId=23306604        
        player.LastShotEventPlaceTimerId = Script.SetTimerForFunction(60000, 'LastShotRemoveEventPlace', player);   -- 60s  
        UIAction.ShowElement('mod_LastShotEventPlaceIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction
        Script.SetTimerForFunction(1000, 'LastShotShowEventPlaceAfterDelay', {}); -- For show EventPlace in 5s, -- Because is not When RevivePlayer it's dangerous to reload here!!!                
    else    
        player.LastShotEventPlaceTimerId = Script.SetTimerForFunction(60000, 'LastShotRemoveEventPlace', player);   -- 1h        
        UIAction.ShowElement('mod_LastShotEventPlaceIniUI', 200);  -- instanceID is 200, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction
        Script.SetTimerForFunction(1000, 'LastShotShowEventPlaceAfterDelay', {}); -- For show EventPlace in 5s, -- Because is not When RevivePlayer it's dangerous to reload here!!!      
    end
end

--Remove EventPlaceUI From Screen
g_mEventHandlers['LastShotRemoveEventPlaceTimer'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);        
    if (player.LastShotEventPlaceTimerId) then
        Script.KillTimer(player.LastShotEventPlaceTimerId);  --https://docs.cryengine.com/pages/viewpage.action?pageId=23306604
        player.LastShotEventPlaceTimerId = nil;                           
        player.LastShotEventPlacePos = nil;
        UIAction.UnloadElement('mod_LastShotEventPlaceUI', 1);
        UIAction.UnloadElement('mod_LastShotEventPlaceIniUI', 200);
    end  
end

--LastShotBlindInvokerInitUI Activate or Deactivate
g_mEventHandlers['LastShotBlindInvokerInitUI'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId);  
    player.LastShotBlindMessage = data.message;
    if (player.LastShotBlindSeconds > 0) then --number of seconds ) then -- if player wants to reload clanids frequently it's unnecessari create new rutines. 
        player.LastShotBlindSeconds = 15; --number of seconds        
    else 
        player.LastShotBlindSeconds = 15; --number of seconds        
        Script.SetTimerForFunction(10, 'LastShotBlindShowDelay', {});  -- Normal: 10, for testing 1000 or 500 
    end       
end

--LastShotMessageInitUI Activate or Deactivate
g_mEventHandlers['LastShotMessageInitUI'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId); 
    player.LastShotMessageMessage = data.message;
    if (player.LastShotMessageTimerId) then --unnecessary cancel last settimer
        Script.KillTimer(player.LastShotMessageTimerId); --https://docs.cryengine.com/pages/viewpage.action?pageId=23306604                
        player.LastShotMessageTimerId = Script.SetTimerForFunction(4000, 'LastShotRemoveMessage', player); 
        Script.SetTimerForFunction(10, 'LastShotMessageShowDelay', {});
    else    
        player.LastShotMessageTimerId = Script.SetTimerForFunction(4000, 'LastShotRemoveMessage', player);       
        Script.SetTimerForFunction(10, 'LastShotMessageShowDelay', {});
    end
end

--LastShotMessageInvInitUIActivate or Deactivate
g_mEventHandlers['LastShotMessageInvInitUI'] = function(playerId, data, source_id, target_id)
    local player = System.GetEntity(g_localActorId); 
    player.LastShotMessageMessage = data.message;
    if (player.LastShotMessageTimerId) then --unnecessary cancel last settimer
        Script.KillTimer(player.LastShotMessageTimerId); --https://docs.cryengine.com/pages/viewpage.action?pageId=23306604                
        player.LastShotMessageTimerId = Script.SetTimerForFunction(10000, 'LastShotRemoveMessage', player); 
    else    
        player.LastShotMessageTimerId = Script.SetTimerForFunction(10000, 'LastShotRemoveMessage', player);       
        Script.SetTimerForFunction(10, 'LastShotMessageShowDelay', {});
    end
end

--------------------------------------------------------------------------
------------------------------ SERVER EVENTS -----------------------------
--------------------------------------------------------------------------

--LastShotInvokersEventTest
g_mEventHandlers['LastShotInvokersEventTest'] = function(playerId, data, source_id, target_id)
    LastShotInvokersEventTest(data, playerId);
end

--LastShotInvokeAirdropEventImpl
g_mEventHandlers['LastShotInvokeAirdropEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeAirdropEventImpl(data, playerId, source_id);
end

--LastShotInvokeAirplaneCrashEventImpl
g_mEventHandlers['LastShotInvokeAirplaneCrashEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeAirplaneCrashEventImpl(data, playerId, source_id);
end

--LastShotInvokeUFOEventImpl
g_mEventHandlers['LastShotInvokeUFOEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeUFOEventImpl(data, playerId, source_id);
end

--LastShotInvokeInvisibleEventImpl
g_mEventHandlers['LastShotInvokeInvisibleEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeInvisibleEventImpl(data, playerId, source_id);
end

--LastShotInvokeTeleportEventImpl
g_mEventHandlers['LastShotInvokeTeleportEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeTeleportEventImpl(data, playerId, source_id);
end

--LastShotInvokeViewAllPlayersEventImpl
g_mEventHandlers['LastShotInvokeViewAllPlayersEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeViewAllPlayersEventImpl(data, playerId, source_id);
end

--LastShotInvokeHealEventImpl
g_mEventHandlers['LastShotInvokeHealEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeHealEventImpl(data, playerId, source_id);
end

--LastShotInvokeCarEventImpl
g_mEventHandlers['LastShotInvokeCarEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeCarEventImpl(data, playerId, source_id);
end


--LastShotInvokeViewLastAirdropEventImpl
g_mEventHandlers['LastShotInvokeViewLastAirdropEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeViewLastAirdropEventImpl(data, playerId, source_id);
end

--LastShotInvokeViewLastPlaneCrashEventImpl
g_mEventHandlers['LastShotInvokeViewLastPlaneCrashEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeViewLastPlaneCrashEventImpl(data, playerId, source_id);
end

--LastShotInvokeViewLastUFOEventImpl
g_mEventHandlers['LastShotInvokeViewLastUFOEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeViewLastUFOEventImpl(data, playerId, source_id);
end

--LastShotInvokeBaseInfoEventImpl
g_mEventHandlers['LastShotInvokeBaseInfoEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeBaseInfoEventImpl(data, playerId, source_id);
end

--LastShotInvokeBlindEventImpl
g_mEventHandlers['LastShotInvokeBlindEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeBlindEventImpl(data, playerId, source_id);
end

--LastShotInvokeElevationEventImpl
g_mEventHandlers['LastShotInvokeElevationEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeElevationEventImpl(data, playerId, source_id);
end

--LastShotInvokeZonePlayerEventImpl
g_mEventHandlers['LastShotInvokeZonePlayerEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeZonePlayerEventImpl(data, playerId, source_id);
end

--LastShotInvokeCorpseEventImpl
g_mEventHandlers['LastShotInvokeCorpseEventImpl'] = function(playerId, data, source_id, target_id)
    LastShotInvokeCorpseEventImpl(data, playerId, source_id);
end

Log('LastShot Server >> Registered correctly All events');