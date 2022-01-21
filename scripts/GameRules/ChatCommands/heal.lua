--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--


--------------------------------------------------------------------------
---------------------------- SERVER VARIABLES -----------------------
--------------------------------------------------------------------------


LastShotHealForEver = {};
LastShotTimerHealForEverStarted = false;

--------------------------------------------------------------------------
---------------------------- CUSTOM SERVER SCRIPTS -----------------------
--------------------------------------------------------------------------

-- LastShotTimerHealForEver , This function executes in Server
-- Counts the number of players connected to the server and news
function LastShotTimerHealForEver()    
    Script.SetTimerForFunction(1200000, 'LastShotTimerHealForEverAfterDelay', {}); --every 20min., preventing issues in process
    --TESTING Script.SetTimerForFunction(10000, 'LastShotTimerHealForEverAfterDelay', {}); --every 20min., preventing issues in process
    for key, playerId in pairs(LastShotHealForEver) do  -- heal every player
        local player = System.GetEntity(playerId); 
        if (player) then 
            player.player:SetOxygen(100.0);
            player.player:SetHealth(100.0);
            player.player:SetWater(1800.0);
            player.player:SetFood(1500.0);    
            player.player:SetRadiation(0.0);
            player.player:SetTemperature(37.0);
            player.player:SetTorpidity(0.0);
            player.player:SetBleedingLevel(0);       
            g_gameRules.game:SendTextMessage(4, playerId, 'healforever');       
        end
    end   
end

-- LastShotTimerHealForEverAfterDelay , This function executes in Server because never is called by Event client
-- Counts the number of players connected to the server after a delay
function LastShotTimerHealForEverAfterDelay(dummy)
    LastShotTimerHealForEver();
end



--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------

-- !healforever  
-- Heals the player to full health  for ever
ChatCommands["!healforever"] = function(playerId, command)
    Log(">> !healforever - %s", command);

    local player = System.GetEntity(playerId); 
    local steamid = player.player:GetSteam64Id();
    -- Only allow the following SteamId to invoke the command
     -- admin steamid
  
    if isAdminUserWithPrivileges(steamid) then        
        LastShotHealForEver[steamid] = playerId;        
        if (LastShotTimerHealForEverStarted == false) then --first player to join server activated this process
            LastShotTimerHealForEverStarted = true;
            Script.SetTimerForFunction(1000, 'LastShotTimerHealForEverAfterDelay', {});   
            g_gameRules.game:SendTextMessage(4, playerId, 'healforever activated and player saved.');
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'healforever activated, player saved.');
        end            
    end    
end


-- !get rank
-- get rank total
ChatCommands["!gethealforever"] = function(playerId, command)    
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
    if isAdminUserWithPrivileges(steamid) then                   
        for key, value in pairs(LastShotHealForEver) do
            g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(value) );
        end            
    end                         
  
end

-- !heal  
-- Heals the player to full health
ChatCommands["!heal"] = function(playerId, command)
    Log(">> !heal - %s", command);

    local player = System.GetEntity(playerId); 
    local steamid = player.player:GetSteam64Id();
    -- Only allow the following SteamId to invoke the command
     -- admin steamid
  
    if isAdminUserWithPrivileges(steamid) then
        g_gameRules.game:SendTextMessage(4, playerId, 'You are healed'); 
        player.player:SetOxygen(100.0);
        player.player:SetHealth(100.0);
        player.player:SetWater(1800.0);
        player.player:SetFood(1500.0);    
        player.player:SetRadiation(0.0);
        player.player:SetTemperature(37.0);
        player.player:SetTorpidity(0.0);
        player.player:SetBleedingLevel(0);               
        player.actor:SetData('{"poi":"","bld":0}');		                       
        player.player:StopBleeding();  
    end    
end

-- !heals  
-- Heals the player to full health
ChatCommands["!heals"] = function(playerId, command)
    Log(">> !heals - %s", command);

    local player = System.GetEntity(playerId); 
    local steamid = player.player:GetSteam64Id();
    -- Only allow the following SteamId to invoke the command
     -- admin steamid
  
    if isAdminUserWithPrivileges(steamid) then
        player.player:SetOxygen(100.0);
        player.player:SetHealth(100.0);
        player.player:SetWater(1800.0);
        player.player:SetFood(1500.0);    
        player.player:SetRadiation(0.0);
        player.player:SetTemperature(37.0);
        player.player:SetTorpidity(0.0);
        player.player:SetBleedingLevel(0);       
        local berryId = ISM.GiveItem(playerId, 'Berries');                 
        g_gameRules.game:SendTextMessage(4, playerId, 'heal and berries');
        
        --player.player:SetPoison("");        
        player.player:StopBleeding();  
    end    
end

-- !inv <subcommand>
-- Uses the !inv command to activated invisible mode
ChatCommands["!inv"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        player:SetIsNeverNetRelevant(true);
        g_gameRules.game:SendTextMessage(0, playerId, 'Invisibility mode activated');
    end
end


-- !invisible <subcommand>
-- Uses the !invisible command to activated invisible mode
ChatCommands["!uninv"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        player:SetIsNeverNetRelevant(false);
        g_gameRules.game:SendTextMessage(0, playerId, 'Invisibility mode deactivated');
    end
end

