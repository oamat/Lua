--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------

LastShotTelePos = {};
--PLACES 
LastShotTelePos["www"] = "8006 7900 16"; 
LastShotTelePos["www0"] = "8031 7857 16";
LastShotTelePos["www1"] = "5100 8048 23"; 
LastShotTelePos["www2"] = "6772 744 16"; 
LastShotTelePos["www3"] = "558 3164 16"; 
LastShotTelePos["www4"] = "2039 2528 45"; 
LastShotTelePos["www5"] = "4676 7108 15";
LastShotTelePos["www6"] = "4922 7080 23";
LastShotTelePos["www7"] = "4641 7036 46";
LastShotTelePos["www8"] = "1769 6535 43";
LastShotTelePos["airfield1"] = "2555 746 32";
LastShotTelePos["airfield2"] = "2164 497 47"; 
LastShotTelePos["airfield3"] = "1835 654 47";    
LastShotTelePos["arena"] = "5022 4601 142";
LastShotTelePos["brightmoor"] = "5385 2251 25";
LastShotTelePos["bunkerbig"] = "1686 5369 370"; 
LastShotTelePos["bunkersmall"] = "5142 3297 30"; 
LastShotTelePos["bunkerplane"] = "3375 3942 254";
LastShotTelePos["bunkerjero"] = "4266 3794 86";     
LastShotTelePos["capebay"] = "7351 4839 47"; 
LastShotTelePos["clydehill"] = "4715 4791 139"; 
LastShotTelePos["dam"] = "5888 4573 193"; 
LastShotTelePos["hayward"] = "3885 6059 24"; 
LastShotTelePos["horseshoe"] = "1091 2225 41"; 
LastShotTelePos["hospital"] = "1629 7090 29"; 
LastShotTelePos["paint"] = "1764 6501 43"; 
LastShotTelePos["pinecrest"] = "3781 1438 32";  
LastShotTelePos["podunk"] = "2671 7000 25"; 
LastShotTelePos["rockyripple"] = "1378 1550 35"; 
LastShotTelePos["suburbs"] = "3915 5300 19"; 
LastShotTelePos["sultan"] = "2176 1975 38"; 
LastShotTelePos["turtlebay"] = "444 4127 30"; 
LastShotTelePos["woodhaven"] = "1750 3461 38";
LastShotTelePos["dinner"] = "4971 1542 29";
LastShotTelePos["brightmoor1"] = "5155 2207 24";
LastShotTelePos["brightmoor2"] = "5322 2561 24";
LastShotTelePos["tents1"] = "4638 3527 32";
LastShotTelePos["tents2"] = "4629 4150 57";
LastShotTelePos["tents3"] = "3906 3767 136";
LastShotTelePos["tents4"] = "2713 4391 49";
LastShotTelePos["derby"] = "4391 1310 22";
LastShotTelePos["culdesac"] = "3917 1977 34"; 
LastShotTelePos["pineparks"] = "4662 2033 54"; 
LastShotTelePos["antena1"] = "6356 1013 231";
LastShotTelePos["antena2"] = "2929 3193 227";
LastShotTelePos["antena3"] = "7296 4470 92";
LastShotTelePos["antena4"] = "5368 5672 422";
LastShotTelePos["antena5"] = "3107 5197 121";
LastShotTelePos["antena6"] = "1490 7135 58";
LastShotTelePos["deposit1"] = "3953 1106 76";
LastShotTelePos["deposit2"] = "1915 1686 106";
LastShotTelePos["deposit3"] = "3020 6909 24";
LastShotTelePos["market"] = "4915 4696 142";     

-- BASE OWNER --
LastShotTelePos["base"] = "4152 3432 190";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["bases"] = "4162 3299 210";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["jero"] = "4145 3471 193";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["jeroup"] = "4149 3461 209";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["gotic"] = "4678 7104 29";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["goticup"] = "4674 7107 38";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["vinxi"] = "3619 3317 271";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["vinxiup"] = "4199 3171 215";   -- Change base with your position. (Put a Vehicle and catch position of your DB)
LastShotTelePos["raul"] = "3957 3567 197";
-- ROADS --
LastShotTelePos["way_1"] = "3475 1370 48";
LastShotTelePos["way_2"] = "3230 1430 26";
LastShotTelePos["way_3"] = "2957 1510 23";
LastShotTelePos["way_4"] = "2589 1839 44";
LastShotTelePos["way1"] = "5199 2704 28";
LastShotTelePos["way2"] = "4999 2908 25";
LastShotTelePos["way3"] = "4866 3196 36";
LastShotTelePos["way4"] = "4779 3447 28";
LastShotTelePos["way5"] = "4692 3656 22";
LastShotTelePos["way6"] = "4655 3965 43";
LastShotTelePos["way7"] = "4351 4208 31";
LastShotTelePos["way8"] = "4094 4335 45";
LastShotTelePos["way9"] = "3826 4617 35";
LastShotTelePos["way10"] = "3634 4988 43";
--way --

-- Teleport to a position
ChatCommands["!tele"] = function(playerId, command)
    Log(">> !tele - %s", command);
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    
    
	-- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)

    if isAdminUserWithPrivileges(steamid) then  
        
        if (LastShotTelePos[command]) then
            player.player:TeleportTo(LastShotTelePos[command]); 
        else 
            player.player:TeleportTo(command);
        end     

    end 
end


LastShotSetPos = { }
-- Push current position - Saves current position
ChatCommands["!set"] = function(playerId, command)
	Log(">> !set - %s", command);
	local player = System.GetEntity(playerId);
	local steamid = player.player:GetSteam64Id();
  
	if isAdminUserWithPrivileges(steamid) then    
        LastShotSetPos[playerId] = player:GetWorldPos();
        g_gameRules.game:SendTextMessage(4, playerId, "Position set");    
    end
end

-- Pop current position - Returns the player to the last saved position
ChatCommands["!goback"] = function(playerId, command)
	Log(">> !goback - %s", command);
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();

	if isAdminUserWithPrivileges(steamid) then
        if LastShotSetPos[playerId] then          
            player.player:TeleportTo(LastShotSetPos[playerId]);      
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'Place Not Found');
        end  
    end
end


LastShotSetPos2 = { }
-- Push current position - Saves current position
ChatCommands["!set2"] = function(playerId, command)
	Log(">> !set2 - %s", command);
	local player = System.GetEntity(playerId);
	local steamid = player.player:GetSteam64Id();
  
	if isAdminUserWithPrivileges(steamid) then    
        LastShotSetPos2[playerId] = player:GetWorldPos();
        g_gameRules.game:SendTextMessage(4, playerId, "Position set2");    
    end
end

-- Pop current position - Returns the player to the last saved position
ChatCommands["!goback2"] = function(playerId, command)
	Log(">> !goback2 - %s", command);
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();

	if isAdminUserWithPrivileges(steamid) then
        if LastShotSetPos2[playerId] then       
            player.player:TeleportTo(LastShotSetPos2[playerId]);      
        else
            g_gameRules.game:SendTextMessage(4, playerId, 'Place Not Found');
        end  
    end
end


-- Teleport to a position up
ChatCommands["!telez"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id()
    
    
	-- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)

    if isAdminUserWithPrivileges(steamid) then        
        local pos = player:GetWorldPos();           
        pos.z = pos.z + command;
        player.player:TeleportTo(pos);
      
    end
end

-- Teleport to a position up
ChatCommands["!teley"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id()
    
    
	-- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)

    if isAdminUserWithPrivileges(steamid) then        
        local pos = player:GetWorldPos();           
        pos.y = pos.y + command;
        player.player:TeleportTo(pos);
      
    end
end


-- Teleport to a position up
ChatCommands["!telex"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id()
    
    
	-- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)

    if isAdminUserWithPrivileges(steamid) then        
        local pos = player:GetWorldPos();           
        pos.x = pos.x + command;
        player.player:TeleportTo(pos);
      
    end
end



-- Send the player's position back to them via chat
ChatCommands["!mypos"] = function(playerId, command)
	Log(">> !mypos - %s", command);
	--Change Faction to what ever faction can use this command
	--local allowCommand = 4 == player.actor:GetFaction() -- faction 0 to 7 (same numbering as cvars)
		local player = System.GetEntity(playerId);
		local pos = player:GetWorldPos();
	--end
	g_gameRules.game:SendTextMessage(4, playerId, string.format("Your position is: %.1f %.1f %.1f", pos.x, pos.y, pos.z));


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
    g_gameRules.game:SendTextMessage(4, playerId, 'Your Map Zone is ' .. LastShotPlacesNames[indexPlace] ..  ' (#' .. indexPlace .. ')');    

end



-- Summon a player by SteamId to your position
ChatCommands["!summon"] = function(playerId, command)
	Log(">> !summon - %s", command);

		local player = System.GetEntity(playerId)
		--Change Faction to what ever faction can use this command
		---- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
		local steamid = player.player:GetSteam64Id()
		
		
		-- Is the invoking player steam id in the allowed list
		--local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction5_steamids"), steamid)
		-- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
		-- If it was in the list
		if isAdminUserWithPrivileges(steamid) then
			-- Performing a generic entity search is very expensive - use sparingly
			local players = System.GetEntitiesByClass("Player")

			for i,p in pairs(players) do 
				if p.player:GetSteam64Id() == command then
					p.player:TeleportTo(playerId)
					return;
				end
			end
            g_gameRules.game:SendTextMessage(4, playerId, "A player with the SteamId does not exist on the server.");
		end
	
end


-- Uses the !chase command to chase a player by name or steam id
ChatCommands["!chase"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    local chasedPlayer = nil;
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        local players = CryAction.GetPlayerList();

        for key, player2 in pairs(players) do
            --if (player2.id ~= playerId) then
                local steamid2 = player2.player:GetSteam64Id();

                if (string.match(player2:GetName(), command) or steamid2 == command) then
                    chasedPlayer = player2;
                    break;
                end
           -- end
        end

        if (chasedPlayer ~= nil) then      
            local chasedPlayerPos = chasedPlayer:GetWorldPos();
            player.player:TeleportTo(chasedPlayerPos);          
        else
           g_gameRules.game:SendTextMessage(0, playerId, 'No player found');
        end
    end
end


-- Uses the !chase command to chase a player by name or steam id
ChatCommands["!playerpos"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    local chasedPlayer = nil;
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        local players = CryAction.GetPlayerList();

        for key, player2 in pairs(players) do
            --if (player2.id ~= playerId) then
                local steamid2 = player2.player:GetSteam64Id();
                if (string.match(player2:GetName(), command) or steamid2 == command) then
                    chasedPlayer = player2;
                    break;
                end
            --end
        end

        if (chasedPlayer ~= nil) then      
            local pos = chasedPlayer:GetWorldPos();
            g_gameRules.game:SendTextMessage(4, playerId, string.format("playerpos: %.1f %.1f %.1f", pos.x, pos.y, pos.z));
            --g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(chasedPlayerPos));          

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
            g_gameRules.game:SendTextMessage(4, playerId, 'Player Map Zone is ' .. LastShotPlacesNames[indexPlace] ..  ' (#' .. indexPlace .. ')');  

        else
           g_gameRules.game:SendTextMessage(0, playerId, 'No player found');
        end
    end
end


-- Uses the !chase command to chase a player by name or steam id
ChatCommands["!chasey"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    local chasedPlayer = nil;
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        local players = CryAction.GetPlayerList();

        for key, player2 in pairs(players) do
           --if (player2.id ~= playerId) then
                local steamid2 = player2.player:GetSteam64Id();

                if (string.match(player2:GetName(), command) or steamid2 == command) then
                    chasedPlayer = player2;
                    break;
                end
           -- end
        end

        if (chasedPlayer ~= nil) then      
            local chasedPlayerPos = chasedPlayer:GetWorldPos();
            chasedPlayerPos.y = chasedPlayerPos.y + 500;
            chasedPlayerPos.z = 0;
            player.player:TeleportTo(chasedPlayerPos);          
        else
           g_gameRules.game:SendTextMessage(0, playerId, 'No player found');
        end
    end
end

-- Uses the !chase command to chase a player by name or steam id
ChatCommands["!chasex"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    local chasedPlayer = nil;
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        local players = CryAction.GetPlayerList();

        for key, player2 in pairs(players) do
            --if (player2.id ~= playerId) then
                local steamid2 = player2.player:GetSteam64Id();

                if (string.match(player2:GetName(), command) or steamid2 == command) then
                    chasedPlayer = player2;
                    break;
                end
           -- end
        end

        if (chasedPlayer ~= nil) then      
            local chasedPlayerPos = chasedPlayer:GetWorldPos();
            chasedPlayerPos.x = chasedPlayerPos.x + 500;
            chasedPlayerPos.z = 0;
            player.player:TeleportTo(chasedPlayerPos);          
        else
           g_gameRules.game:SendTextMessage(0, playerId, 'No player found');
        end
    end
end

-- Uses the !chase command to chase a player by name or steam id
ChatCommands["!chase_y"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    local chasedPlayer = nil;
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        local players = CryAction.GetPlayerList();

        for key, player2 in pairs(players) do
           --if (player2.id ~= playerId) then
                local steamid2 = player2.player:GetSteam64Id();

                if (string.match(player2:GetName(), command) or steamid2 == command) then
                    chasedPlayer = player2;
                    break;
                end
           -- end
        end

        if (chasedPlayer ~= nil) then      
            local chasedPlayerPos = chasedPlayer:GetWorldPos();
            chasedPlayerPos.y = chasedPlayerPos.y - 500;
            chasedPlayerPos.z = 0;
            player.player:TeleportTo(chasedPlayerPos);          
        else
           g_gameRules.game:SendTextMessage(0, playerId, 'No player found');
        end
    end
end

-- Uses the !chase command to chase a player by name or steam id
ChatCommands["!chase_x"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
    local chasedPlayer = nil;
    

    -- Checks if the player has permissions to perform this command
    if isAdminUserWithPrivileges(steamid) then
        local players = CryAction.GetPlayerList();

        for key, player2 in pairs(players) do
            --if (player2.id ~= playerId) then
                local steamid2 = player2.player:GetSteam64Id();

                if (string.match(player2:GetName(), command) or steamid2 == command) then
                    chasedPlayer = player2;
                    break;
                end
           -- end
        end

        if (chasedPlayer ~= nil) then      
            local chasedPlayerPos = chasedPlayer:GetWorldPos();
            chasedPlayerPos.x = chasedPlayerPos.x - 500;
            chasedPlayerPos.z = 0;
            player.player:TeleportTo(chasedPlayerPos);          
        else
           g_gameRules.game:SendTextMessage(0, playerId, 'No player found');
        end
    end
end