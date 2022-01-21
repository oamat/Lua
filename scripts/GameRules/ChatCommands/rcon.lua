--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------


-- !rcon 
-- Execute console command on server
ChatCommands["!rcon"] = function(playerId, command)
	Log(">> !rcon - %s", command);
	local player = System.GetEntity(playerId);
    -- Only allow the following SteamId to invoke the command 
    local steamid = player.player:GetSteam64Id();
   -- admin steamid
    
	if isAdminUserWithPrivileges(steamid) then
		System.ExecuteCommand(command);
	end
end

-- Sends the message to the entire server in the chat window AND  at the top of the screen
ChatCommands["!msgall"] = function(playerId, command)
	Log(">> !wmsg - %s", command);

	local player = System.GetEntity(playerId);
	---- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    local steamid = player.player:GetSteam64Id();
	
	
	
	-- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)

    if isAdminUserWithPrivileges(steamid) then
		g_gameRules.game:SendTextMessage(4, 0, command); -- chat window
		g_gameRules.game:SendTextMessage(0, 0, command); --top screen
	end
end