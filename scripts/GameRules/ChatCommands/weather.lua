-- !weather
  -- Starts any of the weather pattern on the server (by number or name)
  ChatCommands["!weather"] = function(playerId, command)
	Log(">> !weather - %s", command)

	local player = System.GetEntity(playerId)
  
  -- Only allow the following SteamId to invoke the command 
  local steamid = player.player:GetSteam64Id()
   -- admin steamid
  
  -- or through faction restrictions
  ---- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
  
  -- or through actual current faction
  -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)

	if isAdminUserWithPrivileges(steamid) then
    System.ExecuteCommand("wm_startPattern " .. command)
    System.ExecuteCommand("wm_forceTime " .. 12)    
	end
end

-- !weather
  -- Starts any of the weather pattern on the server (by number or name)
  ChatCommands["!weathern"] = function(playerId, command)
    Log(">> !weathern - %s", command)
  
    local player = System.GetEntity(playerId)
    
    -- Only allow the following SteamId to invoke the command 
    local steamid = player.player:GetSteam64Id()
     -- admin steamid
    
    -- or through faction restrictions
    ---- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    
    -- or through actual current faction
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
  
    if isAdminUserWithPrivileges(steamid) then
      System.ExecuteCommand("wm_startPattern " .. command)
      System.ExecuteCommand("wm_forceTime " .. 0)    
    end
  end
-- !time
  -- Changes Time of Day/Night on the server (by number)
  ChatCommands["!time"] = function(playerId, command)
    Log(">> !time - %s", command)
  
    local player = System.GetEntity(playerId)
    
    -- Only allow the following SteamId to invoke the command 
    local steamid = player.player:GetSteam64Id()
     -- admin steamid
    
    -- or through faction restrictions
    ---- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    
    -- or through actual current faction
      -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    
    if isAdminUserWithPrivileges(steamid) then
      System.ExecuteCommand("wm_forceTime " .. command)
      --g_gameRules.game:SendTextMessage(0, 0, playerid, command);
      --g_gameRules.game:SendTextMessage(4, playerId, string.format("Your position is: %.1f %.1f %.1f", pos.x, pos.y, pos.z));
    end
  end