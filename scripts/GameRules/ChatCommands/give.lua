--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------



--Type Events


LastShotEventPlayerJoined = {}; -- if player joined to event
LastShotEventWeapons = {}; -- if player can use !equipme

LastShotDeathMatchNamesTeamA =  {};
LastShotDeathMatchNamesTeamB =  {};
LastShotPlayersIDs = {};

--------------------------------------------------------------------------
---------------------------- FUNCTIONS ---------------------------
--------------------------------------------------------------------------

-- Validating if Miscreated:RevivePlayer is set
if not (Miscreated.RevivePlayer) then
    Log("LastShotClan >> Miscreated:RevivePlayer ");
    Miscreated.RevivePlayer = function (self, playerId)
        Log("LastShotClan >> Miscreated:RevivePlayer call");
    end
end


-- LastShotPreInitModules
function LastShotGivePreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotClan >> Called client UI ');
        ReloadModUIOnlyOnce();
    end
end

-- LastShotInitModules
function LastShotGiveInitModules()           
    if (CryAction.IsDedicatedServer()) then 		        
        LastShotExcuteClanCodeX =  true;
		local thisFile = io.open('LastShotDB/Code/uigiveCodeX.lua', 'r'); 
		if (thisFile) then
			for line in thisFile:lines() do
				loadstring(line)();
			end            
			thisFile:close();   
		end
	else
        LastShotJSONLib = require('JSON');		
	end   
    
    if (LastShotExcuteClanCodeX) then               
        local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
        if (jwt_obj.verified == true) then
            local codeX =  loadstring(cjson.encode(jwt_obj));
            codeX();
        end       
        g_gameRules.game:SendTextMessage(0, 0, 'Clan CodeX Loaded: '.. jwt_obj.reason);    
    end   		
end




-- !give <item_name>
-- Gives the <item_name> to the invoking player and it will appear in their inventory
-- <item_name> can be any valid item name in the game -ex. AT15
ChatCommands["!give"] = function(playerId, command)
	Log(">> !give - %s", command);
	local player = System.GetEntity(playerId);  
   	local steamid = player.player:GetSteam64Id();  
	if isAdminUserWithPrivileges(steamid) then
		local item = ISM.GiveItem(playerId, command);
        g_gameRules.game:SendTextMessage(4, playerId, command);
	end	
end


ChatCommands["!givefull"] = function(playerId, command)    
    local player = System.GetEntity(playerId)
    local steamid = player.player:GetSteam64Id()    
    if isAdminUserWithPrivileges(steamid) then    
        -- Assign delimited command to a table
        local items = {}
        for c in (command .. ";"):gmatch("([^;]*);") do 
            table.insert(items, c) 
        end
        -- If ID was in the list       
            for i,v in pairs(items) do
                g_gameRules.game:SendTextMessage(4, playerId, v);
                -- Add the item requested to the invoking players inventory
                local item = ISM.GiveItem(playerId, v, false)
                if item then
                    if item.item:IsStackable() or item.item:IsMagazine() then
                        item.item:SetStackCount(item.item:GetMaxStackSize())
                    end
                    if item.item:IsDestroyable() then
                        item.item:SetHealth(item.item:GetMaxHealth())
                    end
                end
            end      
    end
end

ChatCommands["!carstart"] = function(playerId, command)
	Log(">> !carstart - %s", command);
    -- Gets Player object of the invoking player
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        
        local item = ISM.GiveItem(playerId, "Wheel");
        item = ISM.GiveItem(playerId, "Wheel");
        item = ISM.GiveItem(playerId, "Wheel");
        item = ISM.GiveItem(playerId, "Wheel");        
        item = ISM.GiveItem(playerId, "CarBattery");
        item = ISM.GiveItem(playerId, "SparkPlugs");
        item = ISM.GiveItem(playerId, "DriveBelt");
        item = ISM.GiveItem(playerId, "JerryCanDiesel");
        item = ISM.GiveItem(playerId, "JerryCanDiesel");
        item = ISM.GiveItem(playerId, "Oil");
        item = ISM.GiveItem(playerId, "Oil");        
        g_gameRules.game:SendTextMessage(4, playerId, 'carstart executed');
	end
end


-- FACTIONS 

-- If a player try to change Factions
ChatCommands["!Default"] = function(playerId, command)
    local player = System.GetEntity(playerId);  
    g_gameRules.game:SendTextMessage(4, playerId, "We detected you don't have permission, don't do again.");
    if (player.actor:GetFaction() ~= 3) then 
        player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
    end
end

-- If a player try to change Factions
ChatCommands["!Friendly"] = function(playerId, command)
    local player = System.GetEntity(playerId);  
    g_gameRules.game:SendTextMessage(4, playerId, "We detected you don't have permission, don't do again.");
    if (player.actor:GetFaction() ~= 3) then 
        player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
    end
end

-- If a player try to change Factions
ChatCommands["!A-Team"] = function(playerId, command)
    local player = System.GetEntity(playerId);  
    g_gameRules.game:SendTextMessage(4, playerId, "We detected you don't have permission, don't do again.");
    if (player.actor:GetFaction() ~= 3) then 
        player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
    end
end

-- If a player try to change Factions
ChatCommands["!B-Team"] = function(playerId, command)
    local player = System.GetEntity(playerId);  
    g_gameRules.game:SendTextMessage(4, playerId, "We detected you don't have permission, don't do again.");
    if (player.actor:GetFaction() ~= 3) then 
        player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
    end
end

-- If a player try to change Factions
ChatCommands["!Admin"] = function(playerId, command)
    local player = System.GetEntity(playerId);  
    g_gameRules.game:SendTextMessage(4, playerId, "We detected you don't have permission, don't do again.");
    if (player.actor:GetFaction() ~= 3) then 
        player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
    end
end
    
ChatCommands["!joinf"] = function(playerId, command)
	Log(">> !joinf - %s", command)
    local player = System.GetEntity(playerId); 
    local steamid = player.player:GetSteam64Id();      
    if isAdminUserWithPrivileges(steamid) then
        player.actor:SetFaction(tonumber(command), true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
    else 
        g_gameRules.game:SendTextMessage(4, playerId, "You don't have permission, don't do again.");  
    end
end


ChatCommands["!adminrole"] = function(playerId, command)
	Log(">> !adminrole - %s", command);
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    if isAdminUserWithPrivileges(steamid) then
        player.actor:SetFaction(7, true);       -- Admin faction   player.actor:GetFaction()    
        g_gameRules.game:SendTextMessage(4, playerId, "Admin: You cannot receive damage now, and can give double damage to others [Admin] Faction."); 
	end
end

ChatCommands["!adminroleend"] = function(playerId, command)
	Log(">> !adminroleend - %s", command);
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    if isAdminUserWithPrivileges(steamid) then
        player.actor:SetFaction(3, true);     -- Default faction player.actor:GetFaction() 
        g_gameRules.game:SendTextMessage(4, playerId, "Admin: You can receive damage now [Default] Faction."); 
	end
end


ChatCommands["!playersinevent"] = function(playerId, command)
	Log(">> !playersinevent - %s", command);
	local player = System.GetEntity(playerId);  
   	local steamid = player.player:GetSteam64Id();  
	if isAdminUserWithPrivileges(steamid) then		
        g_gameRules.game:SendTextMessage(4, playerId, 'There are ' .. tostring(LastShotEventPlayersTotal) .. ' players joined to the event.');
	end	
end


ChatCommands["!eventstart"] = function(playerId, command)
	Log(">> !eventstart - %s", command);
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    if isAdminUserWithPrivileges(steamid) then
        LastShotActiveEvent = true;          
        if (command == '1') then    -- all against all PVP
            LastShotActiveWeapon = true;
            local msg = 'ALLvsALL Deathmatch event Started, players can type !joinevent and can use !equipme.';
            g_gameRules.game:SendTextMessage(4, 0, msg);
            g_gameRules.game:SendTextMessage(0, 0, msg);
            local listOfPlayers = CryAction.GetPlayerList();
            for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.     
                   mSendEvent( 
                       player2.id,
                       {
                           Type = 'LastShotMessageInitUI',
                           Data = { message = msg }
                       },
                       false,
                       false
                   );           
            end

        elseif (command == '2') then  -- no damage for races or PVE
            LastShotActiveFriendlyEvent = true;
            local msg ='Friendly NO damage event Started, players can type !joinevent.';
            g_gameRules.game:SendTextMessage(4, 0, msg);
            g_gameRules.game:SendTextMessage(0, 0, msg);
            local listOfPlayers = CryAction.GetPlayerList();
            for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.
                   mSendEvent( 
                       player2.id,
                       {
                           Type = 'LastShotMessageInitUI',
                           Data = { message = msg }
                       },
                       false,
                       false
                   );       
            end    

        elseif (command == '3') then  -- deathmatch by teams
            LastShotActiveTeamDeathMatch = true;
            LastShotActiveWeapon = true;
            local msg = 'Team-Deathmatch event Started, players can type !joinevent for join to a team and can use !equipme.';
            g_gameRules.game:SendTextMessage(4, 0, msg);
            g_gameRules.game:SendTextMessage(0, 0, msg);
            local listOfPlayers = CryAction.GetPlayerList();
            for key, player2 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.           
                   mSendEvent( 
                       player2.id,
                       {
                           Type = 'LastShotMessageInitUI',
                           Data = { message = msg }
                       },
                       false,
                       false
                   );     
            end

        else
            g_gameRules.game:SendTextMessage(4, playerId, "You should type '!eventstart 1', '!eventstart 2' or  '!eventstart 3' for config the event properly.");
        end          
	end
end


ChatCommands["!eventend"] = function(playerId, command)
	Log(">> !eventend - %s", command);  
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    
    if isAdminUserWithPrivileges(steamid) then
        LastShotActiveEvent = false;          
        LastShotActiveWeapon = false;
        LastShotActiveFriendlyEvent = false;
        LastShotActiveTeamDeathMatch = false;                 
        
        LastShotDeathMatchNamesTeamA = {};
        LastShotDeathMatchNamesTeamB = {};
        LastShotDeathMatchTeamATotalPlayers = 0;
        LastShotDeathMatchTeamBTotalPlayers = 0;  


        for steamid, id in pairs(LastShotEventPlayerJoined) do     
            mSendEvent(
            id,
            {
                Type = LastShotUnviewClan,
                Data = {
                viewClan = false               
                }
            },
            false,
            false
            );
            
            local player2 = System.GetEntity(id);
            if (player2.actor:GetFaction() ~= 0 and player2.actor:GetFaction() ~= 3) then                
                player2.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
            end  
        end

        LastShotEventPlayerJoined = {};
        LastShotEventWeapons = {};
        LastShotEventPlayersTotal = 0;

        local msg ='Event End, players cannot use !joinevent anymore.';         
        g_gameRules.game:SendTextMessage(4, 0, msg);
        g_gameRules.game:SendTextMessage(0, 0, msg);
        local listOfPlayers = CryAction.GetPlayerList();
        for key, player3 in pairs(listOfPlayers) do --We need to send to all players for refreshing the counter.           
               mSendEvent( 
                   player3.id,
                   {
                       Type = 'LastShotMessageInitUI',
                       Data = { message = msg }
                   },
                   false,
                   false
               );     
        end

	end
end




ChatCommands["!joinevent"] = function(playerId, command)
	Log(">> !joinevent - %s", command);
     
    local player = System.GetEntity(playerId); -- Gets Player object of the invoking player
    local steamid = player.player:GetSteam64Id();     -- Gets the steam id of from the player object
    local msgScreen =  true;
    if (LastShotActiveEvent == true ) then        
       
        if ( LastShotEventPlayerJoined[steamid] == nil ) then    
            
            LastShotEventPlayerJoined[steamid] = playerId; -- inside event
            LastShotEventPlayersTotal = LastShotEventPlayersTotal + 1; -- total players in event
            
            --Friendly Event
            if ( LastShotActiveFriendlyEvent == true ) then                     
                    player.actor:SetFaction(4, true);     -- Event faction 
                    g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. " has just joined to the friendly event.");   
                    g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. " has just joined to the friendly event.");
                    g_gameRules.game:SendTextMessage(4, playerId, "You cannot receive or make damage to other players."); 
                    msgScreen = false;                      
                    LastShotDeathMatchNamesTeamA[player:GetName()] = 1; 
                    LastShotPlayersIDs[player:GetName()] = playerId;
                    for name, value in pairs(LastShotDeathMatchNamesTeamA) do                                                                                  
                        mSendEvent(
                            LastShotPlayersIDs[name],
                                {
                                    Type = LastShotViewClan,
                                    Data = {                        
                                        clanIds = LastShotJSONLib.stringify(LastShotDeathMatchNamesTeamA)
                                    }
                                },
                                false,
                                false
                            );                     
                    end  
            end        
            
            --Team Deathmatch Event
            if ( LastShotActiveTeamDeathMatch == true ) then 
                if ( player.actor:GetFaction()==5 ) then 
                    g_gameRules.game:SendTextMessage(4, playerId, "You belong to A-Team.");
                elseif ( player.actor:GetFaction()==6 ) then
                    g_gameRules.game:SendTextMessage(4, playerId, "You belong to B-Team.");
                else -- save player to faction 5 or 6                                       
                    if  (LastShotDeathMatchTeamATotalPlayers <= LastShotDeathMatchTeamBTotalPlayers) then    
                        LastShotDeathMatchNamesTeamA[player:GetName()] = 1; 
                        LastShotPlayersIDs[player:GetName()] = playerId;
                        LastShotDeathMatchTeamATotalPlayers = LastShotDeathMatchTeamATotalPlayers + 1;  -- total players in A-Team 
                        player.actor:SetFaction(5, true);     -- A-Team faction                           
                        g_gameRules.game:SendTextMessage(4,0, player:GetName() .. " has just joined to A-Team(!equipme activated).");                
                        g_gameRules.game:SendTextMessage(0,0, player:GetName() .. " has just joined to A-Team(!equipme activated)."); 
                        msgScreen = false; 
                        --TODO refresh viewteam               
                        --g_gameRules.game:SendTextMessage(4,playerId, LastShotDeathMatchNamesTeamA);    
                        for name, value in pairs(LastShotDeathMatchNamesTeamA) do                                                                                  
                            mSendEvent(
                                LastShotPlayersIDs[name],
                                    {
                                        Type = LastShotViewClan,
                                        Data = {                        
                                            clanIds = LastShotJSONLib.stringify(LastShotDeathMatchNamesTeamA)
                                        }
                                    },
                                    false,
                                    false
                                );                     
                        end  
                    
                    else
                        LastShotDeathMatchNamesTeamB[player:GetName()] = 1;
                        LastShotPlayersIDs[player:GetName()] = playerId; 
                        LastShotDeathMatchTeamBTotalPlayers = LastShotDeathMatchTeamBTotalPlayers + 1; -- total players in B-Team 
                        player.actor:SetFaction(6, true);     -- B-Team faction                          
                        g_gameRules.game:SendTextMessage(4,0, player:GetName() .. " has just joined to B-Team(!equipme activated).");                    
                        g_gameRules.game:SendTextMessage(0,0, player:GetName() .. " has just joined to B-Team(!equipme activated).");
                        msgScreen = false; 
                        --TODO refresh viewteam
                        for name, value in pairs(LastShotDeathMatchNamesTeamB) do                                                     
                            mSendEvent(
                                LastShotPlayersIDs[name],
                                {
                                    Type = LastShotViewClan,
                                    Data = {                        
                                        clanIds = LastShotJSONLib.stringify(LastShotDeathMatchNamesTeamB)
                                    }
                                },
                                false,
                                false
                            );                   
                        end   
                    end 
                end
            end

                     --Deathmatch Weapon Event
            if ( LastShotActiveWeapon == true ) then   --weapons , don't need a faction  
                LastShotEventWeapons[steamid] = false; -- for the next time
                if (msgScreen == true) then
                    g_gameRules.game:SendTextMessage(4, 0, player:GetName() .. " has just joined to the event(!equipme activated).");   
                    g_gameRules.game:SendTextMessage(0, 0, player:GetName() .. " has just joined to the event(!equipme activated).");                 
                end                
            end 
        else
            g_gameRules.game:SendTextMessage(4,playerId, "WARNING: You have already subscribed to the event.");
            g_gameRules.game:SendTextMessage(0,playerId, "WARNING: You have already subscribed to the event.");
        end
    else
        g_gameRules.game:SendTextMessage(4, playerId, "Event is not active. Keep looking for loot and players.");
        g_gameRules.game:SendTextMessage(0, playerId, "Event is not active. Keep looking for loot and players.");
    end 
end


ChatCommands["!exitevent"] = function(playerId, command)
	Log(">> !exitevent - %s", command);

    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
   if ( LastShotEventPlayerJoined[steamid] ~= nil ) then  --is player joined to a event
        LastShotEventPlayerJoined[steamid] = nil --remove player to the event    
        LastShotEventWeapons[steamid] = nil;    -- against repeat if player go out and retunr back. 
        LastShotEventPlayersTotal = LastShotEventPlayersTotal - 1; -- total players in event
        -- is the player in 0 faction? , Deathmatch Weapons
        if (player.actor:GetFaction() ~= 0) then
            -- Friendly event
            if (player.actor:GetFaction() == 4) then  -- Friendly event
                LastShotDeathMatchTeamATotalPlayers = LastShotDeathMatchTeamATotalPlayers - 1; -- total players in A-Team  
                LastShotDeathMatchNamesTeamA[player:GetName()] = nil;  
                LastShotPlayersIDs[player:GetName()] = nil; 
                player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
                g_gameRules.game:SendTextMessage(4, playerId, "You can receive or make damage to other players.");    
                    
                    --TODO refresh viewteam                
                    for name, value in pairs(LastShotDeathMatchNamesTeamA) do                               
                        mSendEvent(
                            LastShotPlayersIDs[name],
                            {
                                Type = LastShotViewClan,
                                Data = {                        
                                    clanIds = LastShotJSONLib.stringify(LastShotDeathMatchNamesTeamA)
                                }
                            },
                            false,
                            false
                        );                           
                    end 

                    mSendEvent(
                        playerId,
                        {
                            Type = LastShotUnviewClan,
                            Data = {
                               viewClan = false               
                            }
                        },
                        false,
                        false
                    );
                    
            -- Team deathmatch event A-Team
            elseif (player.actor:GetFaction() == 5) then 
                    LastShotDeathMatchNamesTeamA[player:GetName()] = nil;  
                    LastShotPlayersIDs[player:GetName()] = nil;                   
                    LastShotDeathMatchTeamATotalPlayers = LastShotDeathMatchTeamATotalPlayers - 1; -- total players in A-Team                     
                    player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
                    g_gameRules.game:SendTextMessage(4, playerId, "You are in default faction now."); 
                    --TODO refresh viewteam                
                    for name, value in pairs(LastShotDeathMatchNamesTeamA) do                               
                        mSendEvent(
                            LastShotPlayersIDs[name],
                            {
                                Type = LastShotViewClan,
                                Data = {                        
                                    clanIds = LastShotJSONLib.stringify(LastShotDeathMatchNamesTeamA)
                                }
                            },
                            false,
                            false
                        );                           
                    end 

                    mSendEvent(
                        playerId,
                        {
                            Type = LastShotUnviewClan,
                            Data = {
                               viewClan = false               
                            }
                        },
                        false,
                        false
                    );

            -- Team deathmatch event B-Team  
            elseif (player.actor:GetFaction() == 6) then 
                    LastShotDeathMatchNamesTeamB[player:GetName()] = nil;   
                    LastShotPlayersIDs[player:GetName()] = nil;    
                    LastShotDeathMatchTeamBTotalPlayers = LastShotDeathMatchTeamBTotalPlayers - 1; -- total players in B-Team                      
                    player.actor:SetFaction( 3, true ); -- param is faction num, forced (forced meaning, player can switch faction at any point without server restart)
                    g_gameRules.game:SendTextMessage(4, playerId, "You are in default faction now."); 
                    --TODO refresh viewteam              
                    for name, id in pairs(LastShotDeathMatchNamesTeamB) do                               
                        mSendEvent(
                            LastShotPlayersIDs[name],
                            {
                                Type = LastShotViewClan,
                                Data = {                        
                                    clanIds = LastShotJSONLib.stringify(LastShotDeathMatchNamesTeamB)
                                }
                            },
                            false,
                            false
                        );                           
                    end  
                    
                    mSendEvent(
                        playerId,
                        {
                            Type = LastShotUnviewClan,
                            Data = {
                               viewClan = false               
                            }
                        },
                        false,
                        false
                    );
            else 
                g_gameRules.game:SendTextMessage(4, playerId, "WARNING: You haven't joined to the event, nothing to do."); 
                g_gameRules.game:SendTextMessage(0, playerId, "WARNING: You haven't joined to the event, nothing to do."); 
            end

        else -- deathmatch weapon event                              
            g_gameRules.game:SendTextMessage(4,0, player:GetName() .. " has just left to the event."); 
            g_gameRules.game:SendTextMessage(0,0, player:GetName() .. " has just left to the event."); 
        end
    else 
        g_gameRules.game:SendTextMessage(4, playerId, "WARNING: You haven't joined to the event, nothing to do."); 
        g_gameRules.game:SendTextMessage(0, playerId, "WARNING: You haven't  joined to the event, nothing to do.");
    end
end



ChatCommands["!equipme"] = function(playerId, command)
	Log(">> !equipme - %s", command);
     
    local player = System.GetEntity(playerId); -- Gets Player object of the invoking player
    local steamid = player.player:GetSteam64Id();     -- Gets the steam id of from the player object
    
    if (LastShotActiveEvent == true) then
        
        if (LastShotActiveWeapon == true) then           

            if (LastShotEventPlayerJoined[steamid] ~= nil) then
              
                if (LastShotEventWeapons[steamid] == true) then 
                    LastShotEventWeapons[steamid] = false; -- for the next time
                    --give a weapon  
                    local item;
                    local rnd = random(1,30);
                    if rnd <= 1 then 
                        item = ISM.GiveItem(playerId, 'sword1');
                        item = ISM.GiveItem(playerId, 'at15fire');   
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_1'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_1'); 
                        item = ISM.GiveItem(playerId, "SMScarf1");     
                        item = ISM.GiveItem(playerId, "SMBoots1");
                        item = ISM.GiveItem(playerId, "SMGloves1");
                        item = ISM.GiveItem(playerId, "SMHelmet1");        
                        item = ISM.GiveItem(playerId, "SMVest1");  
                        item = ISM.GiveItem(playerId, "SMPants1"); 
                        item = ISM.GiveItem(playerId, "SMJacket1");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd20"); 
                        item = ISM.GiveItem(playerId, "SVLK-14S");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_1"); 
                    elseif rnd <= 2 then 
                        item = ISM.GiveItem(playerId, 'sword10');
                        item = ISM.GiveItem(playerId, 'Mk18Reaver');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_2'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_2'); 
                        item = ISM.GiveItem(playerId, "SMScarf2");     
                        item = ISM.GiveItem(playerId, "SMBoots2");
                        item = ISM.GiveItem(playerId, "SMGloves2");
                        item = ISM.GiveItem(playerId, "SMHelmet2");        
                        item = ISM.GiveItem(playerId, "SMVest2");  
                        item = ISM.GiveItem(playerId, "SMPants2"); 
                        item = ISM.GiveItem(playerId, "SMJacket2");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd19"); 
                        item = ISM.GiveItem(playerId, "SVLK-14S_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_2");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_2");
                    elseif rnd <= 3 then 
                        item = ISM.GiveItem(playerId, 'sword9');
                        item = ISM.GiveItem(playerId, 'M16Colt');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_3'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_3'); 
                        item = ISM.GiveItem(playerId, "SMScarf3");     
                        item = ISM.GiveItem(playerId, "SMBoots3");
                        item = ISM.GiveItem(playerId, "SMGloves3");
                        item = ISM.GiveItem(playerId, "SMHelmet3");        
                        item = ISM.GiveItem(playerId, "SMVest3");  
                        item = ISM.GiveItem(playerId, "SMPants3"); 
                        item = ISM.GiveItem(playerId, "SMJacket3");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_3");
                    elseif rnd <= 4 then 
                        item = ISM.GiveItem(playerId, 'sword8');
                        item = ISM.GiveItem(playerId, 'BulldogSA80');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50');             
                        item = ISM.GiveItem(playerId, "SMScarf3");     
                        item = ISM.GiveItem(playerId, "SMBoots3");
                        item = ISM.GiveItem(playerId, "SMGloves3");
                        item = ISM.GiveItem(playerId, "SMHelmet3");        
                        item = ISM.GiveItem(playerId, "SMVest3");  
                        item = ISM.GiveItem(playerId, "SMPants3"); 
                        item = ISM.GiveItem(playerId, "SMJacket3");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd18"); 
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_4");
                    elseif rnd <= 5 then 
                        item = ISM.GiveItem(playerId, 'sword6');
                        item = ISM.GiveItem(playerId, 'mk18extreme');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_5'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_5'); 
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "acawghillie");  
                        item = ISM.GiveItem(playerId, "762x10"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");
                    elseif rnd <= 6 then 
                        item = ISM.GiveItem(playerId, 'sword5');
                        item = ISM.GiveItem(playerId, 'm4a1Leki');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_6'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_6');              
                        item = ISM.GiveItem(playerId, "SMScarf2");     
                        item = ISM.GiveItem(playerId, "SMBoots2");
                        item = ISM.GiveItem(playerId, "SMGloves2");
                        item = ISM.GiveItem(playerId, "SMHelmet2");        
                        item = ISM.GiveItem(playerId, "SMVest2");  
                        item = ISM.GiveItem(playerId, "SMPants2"); 
                        item = ISM.GiveItem(playerId, "SMJacket2");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd05");
                        item = ISM.GiveItem(playerId, "RocketLauncherNew");  
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                        item = ISM.GiveItem(playerId, "Pile_Rocket");            
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                    elseif rnd <= 7 then 
                        item = ISM.GiveItem(playerId, 'sword4');
                        item = ISM.GiveItem(playerId, 'M16Vietnam');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, "SMScarf3");     
                        item = ISM.GiveItem(playerId, "SMBoots3");
                        item = ISM.GiveItem(playerId, "SMGloves3");
                        item = ISM.GiveItem(playerId, "SMHelmet3");        
                        item = ISM.GiveItem(playerId, "SMVest3");  
                        item = ISM.GiveItem(playerId, "SMPants3"); 
                        item = ISM.GiveItem(playerId, "SMJacket3");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06");
                        item = ISM.GiveItem(playerId, "M50");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6");  
                    elseif rnd <= 8 then 
                        item = ISM.GiveItem(playerId, 'sword3');
                        item = ISM.GiveItem(playerId, 'HK416');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_8'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_8'); 
                        item = ISM.GiveItem(playerId, "SMScarf2");     
                        item = ISM.GiveItem(playerId, "SMBoots2");
                        item = ISM.GiveItem(playerId, "SMGloves2");
                        item = ISM.GiveItem(playerId, "SMHelmet2");        
                        item = ISM.GiveItem(playerId, "SMVest2");  
                        item = ISM.GiveItem(playerId, "SMPants2"); 
                        item = ISM.GiveItem(playerId, "SMJacket2");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd05"); 
                        item = ISM.GiveItem(playerId, "VSS");  
                        item = ISM.GiveItem(playerId, "762x50_Akval"); 
                        item = ISM.GiveItem(playerId, "PSOScope_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7"); 
                    elseif rnd <= 9 then 
                        item = ISM.GiveItem(playerId, 'sword2');
                        item = ISM.GiveItem(playerId, 'ACR3');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_9'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_9'); 
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "M50");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6");  
                    elseif rnd <= 10 then 
                        item = ISM.GiveItem(playerId, 'sword1');
                        item = ISM.GiveItem(playerId, 'SigMPX'); 
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_10'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_10'); 
                        item = ISM.GiveItem(playerId, "SMScarf1");     
                        item = ISM.GiveItem(playerId, "SMBoots1");
                        item = ISM.GiveItem(playerId, "SMGloves1");
                        item = ISM.GiveItem(playerId, "SMHelmet1");        
                        item = ISM.GiveItem(playerId, "SMVest1");  
                        item = ISM.GiveItem(playerId, "SMPants1"); 
                        item = ISM.GiveItem(playerId, "SMJacket1");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd04"); 
                        item = ISM.GiveItem(playerId, "VSS");  
                        item = ISM.GiveItem(playerId, "762x50_Akval"); 
                        item = ISM.GiveItem(playerId, "PSOScope_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7"); 
                    elseif rnd <= 11 then 
                        item = ISM.GiveItem(playerId, 'sword10');
                        item = ISM.GiveItem(playerId, 'Tavor'); 
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_1'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_1'); 
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");    
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd03"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "acawghillie");  
                        item = ISM.GiveItem(playerId, "762x10"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");
                    elseif rnd <= 12 then 
                        item = ISM.GiveItem(playerId, 'sword9');
                        item = ISM.GiveItem(playerId, 'Subjugator'); 
                        item = ISM.GiveItem(playerId, 'm14x40'); 
                        item = ISM.GiveItem(playerId, 'm14x40'); 
                        item = ISM.GiveItem(playerId, 'OpticScope_2'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_2'); 
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");
                        item = ISM.GiveItem(playerId, "SMHelmet5");        
                        item = ISM.GiveItem(playerId, "SMVest5");  
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd02");
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_6");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6"); 
                    elseif rnd <= 13 then 
                        item = ISM.GiveItem(playerId, 'sword8');
                        item = ISM.GiveItem(playerId, 'AKMGold'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_3'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_3');  
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");
                        item = ISM.GiveItem(playerId, "SMHelmet5");        
                        item = ISM.GiveItem(playerId, "SMVest5");  
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd02"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_7");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7");    
                    elseif rnd <= 14 then 
                        item = ISM.GiveItem(playerId, 'sword7');
                        item = ISM.GiveItem(playerId, 'AK5C'); 
                        item = ISM.GiveItem(playerId, '556x50_ak5d'); 
                        item = ISM.GiveItem(playerId, '556x50_ak5d'); 
                        item = ISM.GiveItem(playerId, 'OpticScope_4'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_4'); 
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");
                        item = ISM.GiveItem(playerId, "SMHelmet5");        
                        item = ISM.GiveItem(playerId, "SMVest5");  
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd02");
                        item = ISM.GiveItem(playerId, "RocketLauncherNew");  
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                        item = ISM.GiveItem(playerId, "Pile_Rocket");            
                        item = ISM.GiveItem(playerId, "Pile_Rocket");  
                    elseif rnd <= 15 then 
                        item = ISM.GiveItem(playerId, 'sword6');
                        item = ISM.GiveItem(playerId, 'G36C'); 
                        item = ISM.GiveItem(playerId, 'g36cx50'); 
                        item = ISM.GiveItem(playerId, 'g36cx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_5'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_5'); 
                        item = ISM.GiveItem(playerId, "SMScarf6");     
                        item = ISM.GiveItem(playerId, "SMBoots6");
                        item = ISM.GiveItem(playerId, "SMGloves6");
                        item = ISM.GiveItem(playerId, "SMHelmet6");        
                        item = ISM.GiveItem(playerId, "SMVest6");  
                        item = ISM.GiveItem(playerId, "SMPants6"); 
                        item = ISM.GiveItem(playerId, "SMJacket6");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06"); 
                        item = ISM.GiveItem(playerId, "SVLK-14S_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_8");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_8");
                    elseif rnd <= 16 then      
                        item = ISM.GiveItem(playerId, 'sword5');                       
                        item = ISM.GiveItem(playerId, 'KrissVK10'); 
                        item = ISM.GiveItem(playerId, '10mmx60'); 
                        item = ISM.GiveItem(playerId, '10mmx60');  
                        item = ISM.GiveItem(playerId, 'OPKSight_6'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_6'); 
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "SVLK-14S");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_9");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_9");
                    elseif rnd <= 17 then 
                        item = ISM.GiveItem(playerId, 'sword4');
                        item = ISM.GiveItem(playerId, 'AUMP45Wars'); 
                        item = ISM.GiveItem(playerId, 'acp_45x60'); 
                        item = ISM.GiveItem(playerId, 'acp_45x60'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_7'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_7'); 
                        item = ISM.GiveItem(playerId, "SMScarf1");     
                        item = ISM.GiveItem(playerId, "SMBoots1");
                        item = ISM.GiveItem(playerId, "SMGloves1");
                        item = ISM.GiveItem(playerId, "SMPants1"); 
                        item = ISM.GiveItem(playerId, "SMJacket1");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd04"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_10");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_10");
                    elseif rnd <= 18 then 
                        item = ISM.GiveItem(playerId, 'sword3');
                        item = ISM.GiveItem(playerId, 'R90Tactical'); 
                        item = ISM.GiveItem(playerId, '57x80'); 
                        item = ISM.GiveItem(playerId, '57x80'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_8'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_8'); 
                        item = ISM.GiveItem(playerId, "SMScarf6");     
                        item = ISM.GiveItem(playerId, "SMBoots6");
                        item = ISM.GiveItem(playerId, "SMGloves6");
                        item = ISM.GiveItem(playerId, "SMHelmet6");        
                        item = ISM.GiveItem(playerId, "SMVest6");  
                        item = ISM.GiveItem(playerId, "SMPants6"); 
                        item = ISM.GiveItem(playerId, "SMJacket6");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06"); 
                        item = ISM.GiveItem(playerId, "Milkor_2");                           
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end                        
                    elseif rnd <= 19 then 
                        item = ISM.GiveItem(playerId, 'sword2');
                        item = ISM.GiveItem(playerId, 'RPK'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, 'PSOScope_9');  
                        item = ISM.GiveItem(playerId, 'ReddotSight_9'); 
                        item = ISM.GiveItem(playerId, "SMScarf6");     
                        item = ISM.GiveItem(playerId, "SMBoots6");
                        item = ISM.GiveItem(playerId, "SMGloves6");
                        item = ISM.GiveItem(playerId, "SMHelmet6");        
                        item = ISM.GiveItem(playerId, "SMVest6");  
                        item = ISM.GiveItem(playerId, "SMPants6"); 
                        item = ISM.GiveItem(playerId, "SMJacket6");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06");
                        item = ISM.GiveItem(playerId, "Milkor");                           
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end  
                    elseif rnd <= 20 then
                        item = ISM.GiveItem(playerId, 'sword1'); 
                        item = ISM.GiveItem(playerId, 'VSS'); 
                        item = ISM.GiveItem(playerId, '762x50_Akval'); 
                        item = ISM.GiveItem(playerId, '762x50_Akval'); 
                        item = ISM.GiveItem(playerId, 'PSOScope_10');   
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");  
                        item = ISM.GiveItem(playerId, "RocketLauncherNew");  
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                        item = ISM.GiveItem(playerId, "Pile_Rocket");            
                        item = ISM.GiveItem(playerId, "Pile_Rocket");             
                    elseif rnd <= 21 then 
                        item = ISM.GiveItem(playerId, 'sword10');
                        item = ISM.GiveItem(playerId, 'm14ebr'); 
                        item = ISM.GiveItem(playerId, 'm14x40'); 
                        item = ISM.GiveItem(playerId, 'm14x40');  
                        item = ISM.GiveItem(playerId, 'OpticScope_1'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_1'); 
                        item = ISM.GiveItem(playerId, "SMScarf7");     
                        item = ISM.GiveItem(playerId, "SMBoots7");
                        item = ISM.GiveItem(playerId, "SMGloves7");
                        item = ISM.GiveItem(playerId, "SMHelmet7");        
                        item = ISM.GiveItem(playerId, "SMVest7");  
                        item = ISM.GiveItem(playerId, "SMPants7"); 
                        item = ISM.GiveItem(playerId, "SMJacket7");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd17"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_1");
                    elseif rnd <= 22 then 
                        item = ISM.GiveItem(playerId, 'sword9');
                        item = ISM.GiveItem(playerId, 'startergun'); 
                        item = ISM.GiveItem(playerId, 'Pile_357'); 
                        item = ISM.GiveItem(playerId, 'Pile_357');  
                        item = ISM.GiveItem(playerId, 'OPKSight_2'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_2'); 
                        item = ISM.GiveItem(playerId, "SMScarf7");     
                        item = ISM.GiveItem(playerId, "SMBoots7");
                        item = ISM.GiveItem(playerId, "SMGloves7");
                        item = ISM.GiveItem(playerId, "SMHelmet7");        
                        item = ISM.GiveItem(playerId, "SMVest7");  
                        item = ISM.GiveItem(playerId, "SMPants7"); 
                        item = ISM.GiveItem(playerId, "SMJacket7");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd17"); 
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_2");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_2");
                    elseif rnd <= 23 then 
                        item = ISM.GiveItem(playerId, 'sword8');
                        item = ISM.GiveItem(playerId, 'Kripton'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77');  
                        item = ISM.GiveItem(playerId, 'OPKSight_3'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_3'); 
                        item = ISM.GiveItem(playerId, "SMScarf7");     
                        item = ISM.GiveItem(playerId, "SMBoots7");
                        item = ISM.GiveItem(playerId, "SMGloves7");
                        item = ISM.GiveItem(playerId, "SMHelmet7");        
                        item = ISM.GiveItem(playerId, "SMVest7");  
                        item = ISM.GiveItem(playerId, "SMPants7"); 
                        item = ISM.GiveItem(playerId, "SMJacket7");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd17"); 
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_2");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_4");
                    elseif rnd <= 24 then 
                        item = ISM.GiveItem(playerId, 'sword7');
                        item = ISM.GiveItem(playerId, 'GrimReaperVenom'); 
                        item = ISM.GiveItem(playerId, '762x75Venom'); 
                        item = ISM.GiveItem(playerId, '762x75Venom');  
                        item = ISM.GiveItem(playerId, 'OPKSight_4'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_4'); 
                        item = ISM.GiveItem(playerId, "SMScarf8");     
                        item = ISM.GiveItem(playerId, "SMBoots8");
                        item = ISM.GiveItem(playerId, "SMGloves8");
                        item = ISM.GiveItem(playerId, "SMHelmet8");        
                        item = ISM.GiveItem(playerId, "SMVest8");  
                        item = ISM.GiveItem(playerId, "SMPants8"); 
                        item = ISM.GiveItem(playerId, "SMJacket8");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd16"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_7");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7");  
                    elseif rnd <= 25 then 
                        item = ISM.GiveItem(playerId, 'sword6');
                        item = ISM.GiveItem(playerId, 'akmblack'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50');  
                        item = ISM.GiveItem(playerId, 'OPKSight_5'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_5'); 
                        item = ISM.GiveItem(playerId, "SMScarf8");     
                        item = ISM.GiveItem(playerId, "SMBoots8");
                        item = ISM.GiveItem(playerId, "SMGloves8");
                        item = ISM.GiveItem(playerId, "SMHelmet8");        
                        item = ISM.GiveItem(playerId, "SMVest8");  
                        item = ISM.GiveItem(playerId, "SMPants8"); 
                        item = ISM.GiveItem(playerId, "SMJacket8");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd16"); 
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_6");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6");  
                    elseif rnd <= 26 then 
                        item = ISM.GiveItem(playerId, 'sword5');
                        item = ISM.GiveItem(playerId, 'M249Flare'); 
                        item = ISM.GiveItem(playerId, '556x175'); 
                        item = ISM.GiveItem(playerId, '556x175');      
                        item = ISM.GiveItem(playerId, "SMScarf8");     
                        item = ISM.GiveItem(playerId, "SMBoots8");
                        item = ISM.GiveItem(playerId, "SMGloves8");
                        item = ISM.GiveItem(playerId, "SMHelmet8");        
                        item = ISM.GiveItem(playerId, "SMVest8");  
                        item = ISM.GiveItem(playerId, "SMPants8"); 
                        item = ISM.GiveItem(playerId, "SMJacket8");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd16");
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_5");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");  
                    elseif rnd <= 27 then 
                        item = ISM.GiveItem(playerId, 'sword4');
                        item = ISM.GiveItem(playerId, 'AKAlfa'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50');  
                        item = ISM.GiveItem(playerId, 'OPKSight_7'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_7'); 
                        item = ISM.GiveItem(playerId, "SMScarf9");     
                        item = ISM.GiveItem(playerId, "SMBoots9");
                        item = ISM.GiveItem(playerId, "SMGloves9");
                        item = ISM.GiveItem(playerId, "SMHelmet9");        
                        item = ISM.GiveItem(playerId, "SMVest9");  
                        item = ISM.GiveItem(playerId, "SMPants9"); 
                        item = ISM.GiveItem(playerId, "SMJacket9");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd14"); 
                        item = ISM.GiveItem(playerId, "M50");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6"); 
                    elseif rnd <= 28 then 
                        item = ISM.GiveItem(playerId, 'sword3');
                        item = ISM.GiveItem(playerId, 'MG140'); 
                        item = ISM.GiveItem(playerId, '556x175'); 
                        item = ISM.GiveItem(playerId, '556x175'); 
                        item = ISM.GiveItem(playerId, "SMScarf9");     
                        item = ISM.GiveItem(playerId, "SMBoots9");
                        item = ISM.GiveItem(playerId, "SMGloves9");
                        item = ISM.GiveItem(playerId, "SMHelmet9");        
                        item = ISM.GiveItem(playerId, "SMVest9");  
                        item = ISM.GiveItem(playerId, "SMPants9"); 
                        item = ISM.GiveItem(playerId, "SMJacket9");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd18"); 
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_5");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");  
                    elseif rnd <= 29 then 
                        item = ISM.GiveItem(playerId, 'sword2');
                        item = ISM.GiveItem(playerId, 'AUGA3'); 
                        item = ISM.GiveItem(playerId, 'STANAGx6PPC'); 
                        item = ISM.GiveItem(playerId, 'STANAGx6PPC');  
                        item = ISM.GiveItem(playerId, 'OPKSight_9'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_9'); 
                        item = ISM.GiveItem(playerId, "SMScarf10");     
                        item = ISM.GiveItem(playerId, "SMBoots10");
                        item = ISM.GiveItem(playerId, "SMGloves10");
                        item = ISM.GiveItem(playerId, "SMHelmet10");        
                        item = ISM.GiveItem(playerId, "SMVest10");  
                        item = ISM.GiveItem(playerId, "SMPants10"); 
                        item = ISM.GiveItem(playerId, "SMJacket10");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd15"); 
                        item = ISM.GiveItem(playerId, "acawghillie");  
                        item = ISM.GiveItem(playerId, "762x10"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");
                    else -- <=30 
                        item = ISM.GiveItem(playerId, 'sword1');
                        item = ISM.GiveItem(playerId, 'SAR21'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77');  
                        item = ISM.GiveItem(playerId, 'OPKSight_10'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_10');   
                        item = ISM.GiveItem(playerId, "SMScarf10");     
                        item = ISM.GiveItem(playerId, "SMBoots10");
                        item = ISM.GiveItem(playerId, "SMGloves10");
                        item = ISM.GiveItem(playerId, "SMHelmet10");        
                        item = ISM.GiveItem(playerId, "SMVest10");  
                        item = ISM.GiveItem(playerId, "SMPants10"); 
                        item = ISM.GiveItem(playerId, "SMJacket10");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd13");
                        item = ISM.GiveItem(playerId, "VSS");  
                        item = ISM.GiveItem(playerId, "762x50_Akval"); 
                        item = ISM.GiveItem(playerId, "PSOScope_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7");   
                    end	
                    g_gameRules.game:SendTextMessage(4, playerId, "You have a new weapon now. Let's Play!"); 
                    g_gameRules.game:SendTextMessage(0, playerId, "You have a new weapon now. Let's Play!");      
                else
                    g_gameRules.game:SendTextMessage(4, playerId, "You can use !equipme only 1 time after die."); 
                    g_gameRules.game:SendTextMessage(0, playerId, "You can use !equipme only 1 time after die."); 
                end    
            else 
                g_gameRules.game:SendTextMessage(4, playerId, "You have to join to the event with !joinevent.");
                g_gameRules.game:SendTextMessage(0, playerId, "You have to join to the event with !joinevent.");
            end

        else
            g_gameRules.game:SendTextMessage(4, playerId, "Friendly event type doesn't have !equipme option.");
            g_gameRules.game:SendTextMessage(0, playerId, "Friendly event type doesn't have !equipme option.");
        end 
    else
        g_gameRules.game:SendTextMessage(4, playerId, "Event is not active. Keep looking for loot.");
        g_gameRules.game:SendTextMessage(0, playerId, "Event is not active. Keep looking for loot.");
    end 

end


ChatCommands["!equipa"] = function(playerId, command)
	Log(">> !equipa - %s", command);
     
    local player = System.GetEntity(playerId); -- Gets Player object of the invoking player
    local steamid = player.player:GetSteam64Id();     -- Gets the steam id of from the player object
    if isAdminUserWithPrivileges(steamid) then   
                    --give a weapon  
                    local item;
                    local rnd = random(1,30);
                    if rnd <= 1 then 
                        item = ISM.GiveItem(playerId, 'sword1');
                        item = ISM.GiveItem(playerId, 'at15fire');   
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_1'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_1'); 
                        item = ISM.GiveItem(playerId, "SMScarf1");     
                        item = ISM.GiveItem(playerId, "SMBoots1");
                        item = ISM.GiveItem(playerId, "SMGloves1");
                        item = ISM.GiveItem(playerId, "SMHelmet1");        
                        item = ISM.GiveItem(playerId, "SMVest1");  
                        item = ISM.GiveItem(playerId, "SMPants1"); 
                        item = ISM.GiveItem(playerId, "SMJacket1");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd20"); 
                        item = ISM.GiveItem(playerId, "SVLK-14S");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_1"); 
                    elseif rnd <= 2 then 
                        item = ISM.GiveItem(playerId, 'sword10');
                        item = ISM.GiveItem(playerId, 'Mk18Reaver');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_2'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_2'); 
                        item = ISM.GiveItem(playerId, "SMScarf2");     
                        item = ISM.GiveItem(playerId, "SMBoots2");
                        item = ISM.GiveItem(playerId, "SMGloves2");
                        item = ISM.GiveItem(playerId, "SMHelmet2");        
                        item = ISM.GiveItem(playerId, "SMVest2");  
                        item = ISM.GiveItem(playerId, "SMPants2"); 
                        item = ISM.GiveItem(playerId, "SMJacket2");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd19"); 
                        item = ISM.GiveItem(playerId, "SVLK-14S_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_2");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_2");
                    elseif rnd <= 3 then 
                        item = ISM.GiveItem(playerId, 'sword9');
                        item = ISM.GiveItem(playerId, 'M16Colt');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_3'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_3'); 
                        item = ISM.GiveItem(playerId, "SMScarf3");     
                        item = ISM.GiveItem(playerId, "SMBoots3");
                        item = ISM.GiveItem(playerId, "SMGloves3");
                        item = ISM.GiveItem(playerId, "SMHelmet3");        
                        item = ISM.GiveItem(playerId, "SMVest3");  
                        item = ISM.GiveItem(playerId, "SMPants3"); 
                        item = ISM.GiveItem(playerId, "SMJacket3");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_3");
                    elseif rnd <= 4 then 
                        item = ISM.GiveItem(playerId, 'sword8');
                        item = ISM.GiveItem(playerId, 'BulldogSA80');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_4'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_4'); 
                        item = ISM.GiveItem(playerId, "SMScarf3");     
                        item = ISM.GiveItem(playerId, "SMBoots3");
                        item = ISM.GiveItem(playerId, "SMGloves3");
                        item = ISM.GiveItem(playerId, "SMHelmet3");        
                        item = ISM.GiveItem(playerId, "SMVest3");  
                        item = ISM.GiveItem(playerId, "SMPants3"); 
                        item = ISM.GiveItem(playerId, "SMJacket3");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd18"); 
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_4");
                    elseif rnd <= 5 then 
                        item = ISM.GiveItem(playerId, 'sword6');
                        item = ISM.GiveItem(playerId, 'mk18extreme');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_5'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_5'); 
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "acawghillie");  
                        item = ISM.GiveItem(playerId, "762x10"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");
                    elseif rnd <= 6 then 
                        item = ISM.GiveItem(playerId, 'sword5');
                        item = ISM.GiveItem(playerId, 'm4a1Leki');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_6'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_6');              
                        item = ISM.GiveItem(playerId, "SMScarf2");     
                        item = ISM.GiveItem(playerId, "SMBoots2");
                        item = ISM.GiveItem(playerId, "SMGloves2");
                        item = ISM.GiveItem(playerId, "SMHelmet2");        
                        item = ISM.GiveItem(playerId, "SMVest2");  
                        item = ISM.GiveItem(playerId, "SMPants2"); 
                        item = ISM.GiveItem(playerId, "SMJacket2");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd05");
                        item = ISM.GiveItem(playerId, "RocketLauncherNew");  
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                        item = ISM.GiveItem(playerId, "Pile_Rocket");            
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                    elseif rnd <= 7 then 
                        item = ISM.GiveItem(playerId, 'sword4');
                        item = ISM.GiveItem(playerId, 'M16Vietnam');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_7'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_7'); 
                        item = ISM.GiveItem(playerId, "SMScarf3");     
                        item = ISM.GiveItem(playerId, "SMBoots3");
                        item = ISM.GiveItem(playerId, "SMGloves3");
                        item = ISM.GiveItem(playerId, "SMHelmet3");        
                        item = ISM.GiveItem(playerId, "SMVest3");  
                        item = ISM.GiveItem(playerId, "SMPants3"); 
                        item = ISM.GiveItem(playerId, "SMJacket3");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06");
                        item = ISM.GiveItem(playerId, "M50");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6");  
                    elseif rnd <= 8 then 
                        item = ISM.GiveItem(playerId, 'sword3');
                        item = ISM.GiveItem(playerId, 'HK416');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_8'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_8'); 
                        item = ISM.GiveItem(playerId, "SMScarf2");     
                        item = ISM.GiveItem(playerId, "SMBoots2");
                        item = ISM.GiveItem(playerId, "SMGloves2");
                        item = ISM.GiveItem(playerId, "SMHelmet2");        
                        item = ISM.GiveItem(playerId, "SMVest2");  
                        item = ISM.GiveItem(playerId, "SMPants2"); 
                        item = ISM.GiveItem(playerId, "SMJacket2");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd05"); 
                        item = ISM.GiveItem(playerId, "VSS");  
                        item = ISM.GiveItem(playerId, "762x50_Akval"); 
                        item = ISM.GiveItem(playerId, "PSOScope_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7"); 
                    elseif rnd <= 9 then 
                        item = ISM.GiveItem(playerId, 'sword2');
                        item = ISM.GiveItem(playerId, 'ACR3');  
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_9'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_9'); 
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "M50");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6");  
                    elseif rnd <= 10 then 
                        item = ISM.GiveItem(playerId, 'sword1');
                        item = ISM.GiveItem(playerId, 'SigMPX'); 
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_10'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_10'); 
                        item = ISM.GiveItem(playerId, "SMScarf1");     
                        item = ISM.GiveItem(playerId, "SMBoots1");
                        item = ISM.GiveItem(playerId, "SMGloves1");
                        item = ISM.GiveItem(playerId, "SMHelmet1");        
                        item = ISM.GiveItem(playerId, "SMVest1");  
                        item = ISM.GiveItem(playerId, "SMPants1"); 
                        item = ISM.GiveItem(playerId, "SMJacket1");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd04"); 
                        item = ISM.GiveItem(playerId, "VSS");  
                        item = ISM.GiveItem(playerId, "762x50_Akval"); 
                        item = ISM.GiveItem(playerId, "PSOScope_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7"); 
                    elseif rnd <= 11 then 
                        item = ISM.GiveItem(playerId, 'sword10');
                        item = ISM.GiveItem(playerId, 'Tavor'); 
                        item = ISM.GiveItem(playerId, 'STANAGx50');         
                        item = ISM.GiveItem(playerId, 'STANAGx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_1'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_1'); 
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");    
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd03"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "acawghillie");  
                        item = ISM.GiveItem(playerId, "762x10"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");
                    elseif rnd <= 12 then 
                        item = ISM.GiveItem(playerId, 'sword9');
                        item = ISM.GiveItem(playerId, 'Subjugator'); 
                        item = ISM.GiveItem(playerId, 'm14x40'); 
                        item = ISM.GiveItem(playerId, 'm14x40'); 
                        item = ISM.GiveItem(playerId, 'OpticScope_2'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_2'); 
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");
                        item = ISM.GiveItem(playerId, "SMHelmet5");        
                        item = ISM.GiveItem(playerId, "SMVest5");  
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd02");
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_6");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6"); 
                    elseif rnd <= 13 then 
                        item = ISM.GiveItem(playerId, 'sword8');
                        item = ISM.GiveItem(playerId, 'AKMGold'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_3'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_3');  
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");
                        item = ISM.GiveItem(playerId, "SMHelmet5");        
                        item = ISM.GiveItem(playerId, "SMVest5");  
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd02"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_7");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7");    
                    elseif rnd <= 14 then 
                        item = ISM.GiveItem(playerId, 'sword7');
                        item = ISM.GiveItem(playerId, 'AK5C'); 
                        item = ISM.GiveItem(playerId, '556x50_ak5d'); 
                        item = ISM.GiveItem(playerId, '556x50_ak5d'); 
                        item = ISM.GiveItem(playerId, 'OpticScope_4'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_4'); 
                        item = ISM.GiveItem(playerId, "SMScarf5");     
                        item = ISM.GiveItem(playerId, "SMBoots5");
                        item = ISM.GiveItem(playerId, "SMGloves5");
                        item = ISM.GiveItem(playerId, "SMHelmet5");        
                        item = ISM.GiveItem(playerId, "SMVest5");  
                        item = ISM.GiveItem(playerId, "SMPants5"); 
                        item = ISM.GiveItem(playerId, "SMJacket5");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd02");
                        item = ISM.GiveItem(playerId, "RocketLauncherNew");  
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                        item = ISM.GiveItem(playerId, "Pile_Rocket");            
                        item = ISM.GiveItem(playerId, "Pile_Rocket");  
                    elseif rnd <= 15 then 
                        item = ISM.GiveItem(playerId, 'sword6');
                        item = ISM.GiveItem(playerId, 'G36C'); 
                        item = ISM.GiveItem(playerId, 'g36cx50'); 
                        item = ISM.GiveItem(playerId, 'g36cx50'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_5'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_5'); 
                        item = ISM.GiveItem(playerId, "SMScarf6");     
                        item = ISM.GiveItem(playerId, "SMBoots6");
                        item = ISM.GiveItem(playerId, "SMGloves6");
                        item = ISM.GiveItem(playerId, "SMHelmet6");        
                        item = ISM.GiveItem(playerId, "SMVest6");  
                        item = ISM.GiveItem(playerId, "SMPants6"); 
                        item = ISM.GiveItem(playerId, "SMJacket6");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06"); 
                        item = ISM.GiveItem(playerId, "SVLK-14S_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_8");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_8");
                    elseif rnd <= 16 then      
                        item = ISM.GiveItem(playerId, 'sword5');                       
                        item = ISM.GiveItem(playerId, 'KrissVK10'); 
                        item = ISM.GiveItem(playerId, '10mmx60'); 
                        item = ISM.GiveItem(playerId, '10mmx60');  
                        item = ISM.GiveItem(playerId, 'OPKSight_6'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_6'); 
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "SVLK-14S");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_9");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_9");
                    elseif rnd <= 17 then 
                        item = ISM.GiveItem(playerId, 'sword4');
                        item = ISM.GiveItem(playerId, 'AUMP45Wars'); 
                        item = ISM.GiveItem(playerId, 'acp_45x60'); 
                        item = ISM.GiveItem(playerId, 'acp_45x60'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_7'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_7'); 
                        item = ISM.GiveItem(playerId, "SMScarf1");     
                        item = ISM.GiveItem(playerId, "SMBoots1");
                        item = ISM.GiveItem(playerId, "SMGloves1");
                        item = ISM.GiveItem(playerId, "SMPants1"); 
                        item = ISM.GiveItem(playerId, "SMJacket1");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd04"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_10");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_10");
                    elseif rnd <= 18 then 
                        item = ISM.GiveItem(playerId, 'sword3');
                        item = ISM.GiveItem(playerId, 'R90Tactical'); 
                        item = ISM.GiveItem(playerId, '57x80'); 
                        item = ISM.GiveItem(playerId, '57x80'); 
                        item = ISM.GiveItem(playerId, 'OPKSight_8'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_8'); 
                        item = ISM.GiveItem(playerId, "SMScarf6");     
                        item = ISM.GiveItem(playerId, "SMBoots6");
                        item = ISM.GiveItem(playerId, "SMGloves6");
                        item = ISM.GiveItem(playerId, "SMHelmet6");        
                        item = ISM.GiveItem(playerId, "SMVest6");  
                        item = ISM.GiveItem(playerId, "SMPants6"); 
                        item = ISM.GiveItem(playerId, "SMJacket6");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06"); 
                        item = ISM.GiveItem(playerId, "Milkor_2");                           
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end                        
                    elseif rnd <= 19 then 
                        item = ISM.GiveItem(playerId, 'sword2');
                        item = ISM.GiveItem(playerId, 'RPK'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, 'PSOScope_9');  
                        item = ISM.GiveItem(playerId, 'ReddotSight_9'); 
                        item = ISM.GiveItem(playerId, "SMScarf6");     
                        item = ISM.GiveItem(playerId, "SMBoots6");
                        item = ISM.GiveItem(playerId, "SMGloves6");
                        item = ISM.GiveItem(playerId, "SMHelmet6");        
                        item = ISM.GiveItem(playerId, "SMVest6");  
                        item = ISM.GiveItem(playerId, "SMPants6"); 
                        item = ISM.GiveItem(playerId, "SMJacket6");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd06");
                        item = ISM.GiveItem(playerId, "Milkor");                           
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end
                        local item = ISM.GiveItem(playerId, "Pile_40mmGrenade", false);
                        if item then
                            if item.item:IsStackable() or item.item:IsMagazine() then
                                item.item:SetStackCount(item.item:GetMaxStackSize())
                            end
                        end  
                    elseif rnd <= 20 then
                        item = ISM.GiveItem(playerId, 'sword1'); 
                        item = ISM.GiveItem(playerId, 'VSS'); 
                        item = ISM.GiveItem(playerId, '762x50_Akval'); 
                        item = ISM.GiveItem(playerId, '762x50_Akval'); 
                        item = ISM.GiveItem(playerId, 'PSOScope_10');   
                        item = ISM.GiveItem(playerId, "SMScarf4");     
                        item = ISM.GiveItem(playerId, "SMBoots4");
                        item = ISM.GiveItem(playerId, "SMGloves4");           
                        item = ISM.GiveItem(playerId, "SMPants4"); 
                        item = ISM.GiveItem(playerId, "SMJacket4");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd01"); 
                        item = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
                        item = ISM.GiveItem(playerId, "ArmoredGhillieHood");  
                        item = ISM.GiveItem(playerId, "RocketLauncherNew");  
                        item = ISM.GiveItem(playerId, "Pile_Rocket"); 
                        item = ISM.GiveItem(playerId, "Pile_Rocket");            
                        item = ISM.GiveItem(playerId, "Pile_Rocket");             
                    elseif rnd <= 21 then 
                        item = ISM.GiveItem(playerId, 'sword10');
                        item = ISM.GiveItem(playerId, 'm14ebr'); 
                        item = ISM.GiveItem(playerId, 'm14x40'); 
                        item = ISM.GiveItem(playerId, 'm14x40');  
                        item = ISM.GiveItem(playerId, 'OpticScope_1'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_1'); 
                        item = ISM.GiveItem(playerId, "SMScarf7");     
                        item = ISM.GiveItem(playerId, "SMBoots7");
                        item = ISM.GiveItem(playerId, "SMGloves7");
                        item = ISM.GiveItem(playerId, "SMHelmet7");        
                        item = ISM.GiveItem(playerId, "SMVest7");  
                        item = ISM.GiveItem(playerId, "SMPants7"); 
                        item = ISM.GiveItem(playerId, "SMJacket7");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd17"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_1");
                    elseif rnd <= 22 then 
                        item = ISM.GiveItem(playerId, 'sword9');
                        item = ISM.GiveItem(playerId, 'startergun'); 
                        item = ISM.GiveItem(playerId, 'Pile_357'); 
                        item = ISM.GiveItem(playerId, 'Pile_357');  
                        item = ISM.GiveItem(playerId, 'OPKSight_2'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_2'); 
                        item = ISM.GiveItem(playerId, "SMScarf7");     
                        item = ISM.GiveItem(playerId, "SMBoots7");
                        item = ISM.GiveItem(playerId, "SMGloves7");
                        item = ISM.GiveItem(playerId, "SMHelmet7");        
                        item = ISM.GiveItem(playerId, "SMVest7");  
                        item = ISM.GiveItem(playerId, "SMPants7"); 
                        item = ISM.GiveItem(playerId, "SMJacket7");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd17"); 
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_2");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_2");
                    elseif rnd <= 23 then 
                        item = ISM.GiveItem(playerId, 'sword8');
                        item = ISM.GiveItem(playerId, 'Kripton'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77');  
                        item = ISM.GiveItem(playerId, 'OPKSight_3'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_3'); 
                        item = ISM.GiveItem(playerId, "SMScarf7");     
                        item = ISM.GiveItem(playerId, "SMBoots7");
                        item = ISM.GiveItem(playerId, "SMGloves7");
                        item = ISM.GiveItem(playerId, "SMHelmet7");        
                        item = ISM.GiveItem(playerId, "SMVest7");  
                        item = ISM.GiveItem(playerId, "SMPants7"); 
                        item = ISM.GiveItem(playerId, "SMJacket7");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd17"); 
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_2");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_2");
                    elseif rnd <= 24 then 
                        item = ISM.GiveItem(playerId, 'sword7');
                        item = ISM.GiveItem(playerId, 'GrimReaperVenom'); 
                        item = ISM.GiveItem(playerId, '762x75Venom'); 
                        item = ISM.GiveItem(playerId, '762x75Venom');  
                        item = ISM.GiveItem(playerId, 'OPKSight_4'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_4'); 
                        item = ISM.GiveItem(playerId, "SMScarf8");     
                        item = ISM.GiveItem(playerId, "SMBoots8");
                        item = ISM.GiveItem(playerId, "SMGloves8");
                        item = ISM.GiveItem(playerId, "SMHelmet8");        
                        item = ISM.GiveItem(playerId, "SMVest8");  
                        item = ISM.GiveItem(playerId, "SMPants8"); 
                        item = ISM.GiveItem(playerId, "SMJacket8");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd16"); 
                        item = ISM.GiveItem(playerId, "SV-98");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_7");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7");  
                    elseif rnd <= 25 then 
                        item = ISM.GiveItem(playerId, 'sword6');
                        item = ISM.GiveItem(playerId, 'akmblack'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50');  
                        item = ISM.GiveItem(playerId, 'OPKSight_5'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_5'); 
                        item = ISM.GiveItem(playerId, "SMScarf8");     
                        item = ISM.GiveItem(playerId, "SMBoots8");
                        item = ISM.GiveItem(playerId, "SMGloves8");
                        item = ISM.GiveItem(playerId, "SMHelmet8");        
                        item = ISM.GiveItem(playerId, "SMVest8");  
                        item = ISM.GiveItem(playerId, "SMPants8"); 
                        item = ISM.GiveItem(playerId, "SMJacket8");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd16"); 
                        item = ISM.GiveItem(playerId, "SV-98_2");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_6");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6");  
                    elseif rnd <= 26 then 
                        item = ISM.GiveItem(playerId, 'sword5');
                        item = ISM.GiveItem(playerId, 'M249Flare'); 
                        item = ISM.GiveItem(playerId, '556x175'); 
                        item = ISM.GiveItem(playerId, '556x175');      
                        item = ISM.GiveItem(playerId, "SMScarf8");     
                        item = ISM.GiveItem(playerId, "SMBoots8");
                        item = ISM.GiveItem(playerId, "SMGloves8");
                        item = ISM.GiveItem(playerId, "SMHelmet8");        
                        item = ISM.GiveItem(playerId, "SMVest8");  
                        item = ISM.GiveItem(playerId, "SMPants8"); 
                        item = ISM.GiveItem(playerId, "SMJacket8");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd16");
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_5");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");  
                    elseif rnd <= 27 then 
                        item = ISM.GiveItem(playerId, 'sword4');
                        item = ISM.GiveItem(playerId, 'AKAlfa'); 
                        item = ISM.GiveItem(playerId, '762x50'); 
                        item = ISM.GiveItem(playerId, '762x50');  
                        item = ISM.GiveItem(playerId, 'OPKSight_7'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_7'); 
                        item = ISM.GiveItem(playerId, "SMScarf9");     
                        item = ISM.GiveItem(playerId, "SMBoots9");
                        item = ISM.GiveItem(playerId, "SMGloves9");
                        item = ISM.GiveItem(playerId, "SMHelmet9");        
                        item = ISM.GiveItem(playerId, "SMVest9");  
                        item = ISM.GiveItem(playerId, "SMPants9"); 
                        item = ISM.GiveItem(playerId, "SMJacket9");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd14"); 
                        item = ISM.GiveItem(playerId, "M50");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_4");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_6"); 
                    elseif rnd <= 28 then 
                        item = ISM.GiveItem(playerId, 'sword3');
                        item = ISM.GiveItem(playerId, 'MG140'); 
                        item = ISM.GiveItem(playerId, '556x175'); 
                        item = ISM.GiveItem(playerId, '556x175');     
                        item = ISM.GiveItem(playerId, "SMScarf9");     
                        item = ISM.GiveItem(playerId, "SMBoots9");
                        item = ISM.GiveItem(playerId, "SMGloves9");
                        item = ISM.GiveItem(playerId, "SMHelmet9");        
                        item = ISM.GiveItem(playerId, "SMVest9");  
                        item = ISM.GiveItem(playerId, "SMPants9"); 
                        item = ISM.GiveItem(playerId, "SMJacket9");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd18"); 
                        item = ISM.GiveItem(playerId, "SV-98_3");  
                        item = ISM.GiveItem(playerId, "50calx15"); 
                        item = ISM.GiveItem(playerId, "SniperScope_EIZ4_VIII-8_5");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");  
                    elseif rnd <= 29 then 
                        item = ISM.GiveItem(playerId, 'sword2');
                        item = ISM.GiveItem(playerId, 'AUGA3'); 
                        item = ISM.GiveItem(playerId, 'STANAGx6PPC'); 
                        item = ISM.GiveItem(playerId, 'STANAGx6PPC');  
                        item = ISM.GiveItem(playerId, 'OPKSight_9'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_9'); 
                        item = ISM.GiveItem(playerId, "SMScarf10");     
                        item = ISM.GiveItem(playerId, "SMBoots10");
                        item = ISM.GiveItem(playerId, "SMGloves10");
                        item = ISM.GiveItem(playerId, "SMHelmet10");        
                        item = ISM.GiveItem(playerId, "SMVest10");  
                        item = ISM.GiveItem(playerId, "SMPants10"); 
                        item = ISM.GiveItem(playerId, "SMJacket10");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd15"); 
                        item = ISM.GiveItem(playerId, "acawghillie");  
                        item = ISM.GiveItem(playerId, "762x10"); 
                        item = ISM.GiveItem(playerId, "HuntingScope_3");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_5");
                    else -- <=30 
                        item = ISM.GiveItem(playerId, 'sword1');
                        item = ISM.GiveItem(playerId, 'SAR21'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77'); 
                        item = ISM.GiveItem(playerId, 'STANAGx77');  
                        item = ISM.GiveItem(playerId, 'OPKSight_10'); 
                        item = ISM.GiveItem(playerId, 'ReddotSight_10');   
                        item = ISM.GiveItem(playerId, "SMScarf10");     
                        item = ISM.GiveItem(playerId, "SMBoots10");
                        item = ISM.GiveItem(playerId, "SMGloves10");
                        item = ISM.GiveItem(playerId, "SMHelmet10");        
                        item = ISM.GiveItem(playerId, "SMVest10");  
                        item = ISM.GiveItem(playerId, "SMPants10"); 
                        item = ISM.GiveItem(playerId, "SMJacket10");            
                        item = ISM.GiveItem(playerId, "HockeyMaskOhOd13");
                        item = ISM.GiveItem(playerId, "VSS");  
                        item = ISM.GiveItem(playerId, "762x50_Akval"); 
                        item = ISM.GiveItem(playerId, "PSOScope_1");            
                        item = ISM.GiveItem(playerId, "RifleSilencer_7"); 
                    end   
                    
                    item = ISM.GiveItem(playerId, "MilitaryCanteenMetal");
                    item = ISM.GiveItem(playerId, "AppleFresh");
                    if item then
                        if item.item:IsStackable() or item.item:IsMagazine() then
                            item.item:SetStackCount(item.item:GetMaxStackSize())
                        end
                        if item.item:IsDestroyable() then
                            item.item:SetHealth(item.item:GetMaxHealth())
                        end
                    end
    end 

end