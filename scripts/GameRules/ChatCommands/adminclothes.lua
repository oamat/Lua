--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------



ChatCommands["!admindress"] = function(playerId, command)
	Log(">> !adminclothes - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "AdminDuffelBag");
        local weaponId = ISM.GiveItem(playerId, "AdminHelmet");
        local weaponId = ISM.GiveItem(playerId, "AdminJacket");
        local weaponId = ISM.GiveItem(playerId, "AdminPants");
        local weaponId = ISM.GiveItem(playerId, "AdminBoots");
        local weaponId = ISM.GiveItem(playerId, "AdminGloves");
        local weaponId = ISM.GiveItem(playerId, "AdminScarf");
        local weaponId = ISM.GiveItem(playerId, "AdminArmor");
        local weaponId = ISM.GiveItem(playerId, "AdminBanesMask");
        local weaponId = ISM.GiveItem(playerId, "AdminBatmansBelt");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        
	end
end


ChatCommands["!adminsimpledress"] = function(playerId, command)
	Log(">> !adminclothes - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "AdminDuffelBagSimple");
        local weaponId = ISM.GiveItem(playerId, "AdminHelmetSimple");
        local weaponId = ISM.GiveItem(playerId, "AdminJacketSimple");
        local weaponId = ISM.GiveItem(playerId, "AdminPantsSimple");
        local weaponId = ISM.GiveItem(playerId, "AdminBootsSimple");
        local weaponId = ISM.GiveItem(playerId, "AdminArmorSimple");
        local weaponId = ISM.GiveItem(playerId, "AdminBanesMaskSimple");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        local weaponId = ISM.GiveItem(playerId, "Rags");
        
	end
end
ChatCommands["!getbestdress"] = function(playerId, command)
	Log(">> !adminclothes - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
        local weaponId = ISM.GiveItem(playerId, "GrassCamoSpaceHelmet");
        local weaponId = ISM.GiveItem(playerId, "SkullMilitaryJacket");
        local weaponId = ISM.GiveItem(playerId, "ActivecamoCombatBoots");
        local weaponId = ISM.GiveItem(playerId, "ScavengerPantsElite");        
        local weaponId = ISM.GiveItem(playerId, "RuggedPackGreenCamo3");  
        local weaponId = ISM.GiveItem(playerId, "MilitaryGlovesGreen"); 
        local weaponId = ISM.GiveItem(playerId, "GrassCamoScarf"); 
        local weaponId = ISM.GiveItem(playerId, "FlakVestGreen");
        local weaponId = ISM.GiveItem(playerId, "MilitaryJacketTanCamo1");
        local weaponId = ISM.GiveItem(playerId, "SkullMilitaryJacket");
        local weaponId = ISM.GiveItem(playerId, "CargoPantsCamo1");
        local weaponId = ISM.GiveItem(playerId, "CombatBootsCamo");        
        local weaponId = ISM.GiveItem(playerId, "FannyPackCamo1");  
        local weaponId = ISM.GiveItem(playerId, "ScarfCamo4"); 
        local weaponId = ISM.GiveItem(playerId, "RuggedPackGreenCamo4"); 
        local weaponId = ISM.GiveItem(playerId, "Batmansbelt");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd03"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
	end
end

ChatCommands["!getSuitLast1"] = function(playerId, command)
	Log(">> !getSuitLast1 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf1");
        local weaponId = ISM.GiveItem(playerId, "SMBag1");
        local weaponId = ISM.GiveItem(playerId, "SMBoots1");
        local weaponId = ISM.GiveItem(playerId, "SMGloves1");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet1");        
        local weaponId = ISM.GiveItem(playerId, "SMVest1");  
        local weaponId = ISM.GiveItem(playerId, "SMPants1"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket1"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt1");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd04"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end


ChatCommands["!getSuitLast2"] = function(playerId, command)
	Log(">> !getSuitLast2 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf2");
        local weaponId = ISM.GiveItem(playerId, "SMBag2");
        local weaponId = ISM.GiveItem(playerId, "SMBoots2");
        local weaponId = ISM.GiveItem(playerId, "SMGloves2");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet2");        
        local weaponId = ISM.GiveItem(playerId, "SMVest2");  
        local weaponId = ISM.GiveItem(playerId, "SMPants2"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket2"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt2");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd05"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end

ChatCommands["!getSuitLast3"] = function(playerId, command)
	Log(">> !getSuitLast3 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf3");
        local weaponId = ISM.GiveItem(playerId, "SMBag3");
        local weaponId = ISM.GiveItem(playerId, "SMBoots3");
        local weaponId = ISM.GiveItem(playerId, "SMGloves3");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet3");        
        local weaponId = ISM.GiveItem(playerId, "SMVest3");  
        local weaponId = ISM.GiveItem(playerId, "SMPants3"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket3"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt3");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd06"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end

ChatCommands["!getSuitLast4"] = function(playerId, command)
	Log(">> !getSuitLast4 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf4");
        local weaponId = ISM.GiveItem(playerId, "SMBag4");
        local weaponId = ISM.GiveItem(playerId, "SMBoots4");
        local weaponId = ISM.GiveItem(playerId, "SMGloves4");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet4");        
        local weaponId = ISM.GiveItem(playerId, "SMVest4");  
        local weaponId = ISM.GiveItem(playerId, "SMPants4"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket4"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt4");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd07"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end


ChatCommands["!getSuitLast5"] = function(playerId, command)
	Log(">> !getSuitLast5 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf5");
        local weaponId = ISM.GiveItem(playerId, "SMBag5");
        local weaponId = ISM.GiveItem(playerId, "SMBoots5");
        local weaponId = ISM.GiveItem(playerId, "SMGloves5");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet5");        
        local weaponId = ISM.GiveItem(playerId, "SMVest5");  
        local weaponId = ISM.GiveItem(playerId, "SMPants5"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket5");
        local weaponId = ISM.GiveItem(playerId, "SMBelt5");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd08"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood"); 
	end
end


ChatCommands["!getSuitLast6"] = function(playerId, command)
	Log(">> !getSuitLast6 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf6");
        local weaponId = ISM.GiveItem(playerId, "SMBag6");
        local weaponId = ISM.GiveItem(playerId, "SMBoots6");
        local weaponId = ISM.GiveItem(playerId, "SMGloves6");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet6");        
        local weaponId = ISM.GiveItem(playerId, "SMVest6");  
        local weaponId = ISM.GiveItem(playerId, "SMPants6"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket6"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt6");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd09"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end

ChatCommands["!getSuitLast7"] = function(playerId, command)
	Log(">> !getSuitLast7 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf7");
        local weaponId = ISM.GiveItem(playerId, "SMBag7");
        local weaponId = ISM.GiveItem(playerId, "SMBoots7");
        local weaponId = ISM.GiveItem(playerId, "SMGloves7");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet7");        
        local weaponId = ISM.GiveItem(playerId, "SMVest7");  
        local weaponId = ISM.GiveItem(playerId, "SMPants7"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket7"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt7");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd10"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end


ChatCommands["!getSuitLast8"] = function(playerId, command)
	Log(">> !getSuitLast8 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf8");
        local weaponId = ISM.GiveItem(playerId, "SMBag8");
        local weaponId = ISM.GiveItem(playerId, "SMBoots8");
        local weaponId = ISM.GiveItem(playerId, "SMGloves8");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet8");        
        local weaponId = ISM.GiveItem(playerId, "SMVest8");  
        local weaponId = ISM.GiveItem(playerId, "SMPants8"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket8"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt8");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd11"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end

ChatCommands["!getSuitLast9"] = function(playerId, command)
	Log(">> !getSuitLast9 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf9");
        local weaponId = ISM.GiveItem(playerId, "SMBag9");
        local weaponId = ISM.GiveItem(playerId, "SMBoots9");
        local weaponId = ISM.GiveItem(playerId, "SMGloves9");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet9");        
        local weaponId = ISM.GiveItem(playerId, "SMVest9");  
        local weaponId = ISM.GiveItem(playerId, "SMPants9"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket9"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt9");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd12"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end

ChatCommands["!getSuitLast10"] = function(playerId, command)
	Log(">> !getSuitLast10 - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    if isAdminUserWithPrivileges(steamid) then
        local weaponId = ISM.GiveItem(playerId, "SMScarf10");
        local weaponId = ISM.GiveItem(playerId, "SMBag10");
        local weaponId = ISM.GiveItem(playerId, "SMBoots10");
        local weaponId = ISM.GiveItem(playerId, "SMGloves10");
        local weaponId = ISM.GiveItem(playerId, "SMHelmet10");        
        local weaponId = ISM.GiveItem(playerId, "SMVest10");  
        local weaponId = ISM.GiveItem(playerId, "SMPants10"); 
        local weaponId = ISM.GiveItem(playerId, "SMJacket10"); 
        local weaponId = ISM.GiveItem(playerId, "SMBelt10");  
        local weaponId = ISM.GiveItem(playerId, "HockeyMaskOhOd013"); 
        local weaponId = ISM.GiveItem(playerId, "Aviators"); 
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieSuit");
        local weaponId = ISM.GiveItem(playerId, "ArmoredGhillieHood");
	end
end


--------------------------------------------------------------------------
---------------------------- ISADMINUSER SERVER SIDE -------------------
--------------------------------------------------------------------------

-- Array with Admin Users    
LastShotAdminUsersPrivileges = {  -- IN Front If statement: access time is considered as constant time, I want to add future items without modifying much code
    "76561199183354933",
    "76561198867646161",
    "76561199131420355",
    "76561198352295670",
    "76561198164445724",
    "76561199169478275"
};

-- Method returns true if you are an Admin User
function isAdminUserWithPrivileges(steamid)   --If there are a few items and fixed items. Using 'if' it's not wrong, for 4 velues is more efficient. 
    return (       
       (steamid == "76561199183354933")    
    or (steamid == "76561198867646161") 
    or (steamid == "76561198085662391")    --janina
    or (steamid == "76561199131420355")  
    or (steamid == "76561198352295670") 
    or (steamid == "76561198164445724") 
    or (steamid == "76561199169478275")      
    );    
end

--Method returns true if you are an Admin User
ChatCommands["!whoami"] = function(playerId, command)
	Log(">> !whoami - %s", command)

 
    -- Gets Player object of the invoking player 
    local player = System.GetEntity(playerId);
    -- Gets the steam id of from the player object
    local steamid = player.player:GetSteam64Id();
    -- Is the invoking player steam id in the allowed list
    
    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
    -- If it was in the list
    local whoami = isAdminUserWithPrivileges(steamid);
    g_gameRules.game:SendTextMessage(4, playerId, 'who am I? ' .. tostring(whoami) );
	
end



--[[ --Method converts Chinesse Chars to UTF8 European https://titanwolf.org/Network/Articles/Article?AID=038ec1a2-6ed1-49ac-9bf2-e1b00c376d43#gsc.tab=0
function filter_spec_chars(s)
	local ss = {}
	for k = 1, #s do
		local c = string.byte(s,k)
		if not c then break end
		if (c>=48 and c<=57) or (c>= 65 and c<=90) or (c>=97 and c<=122) then
			table.insert(ss, string.char(c))
		elseif c>=228 and c<=233 then
			local c1 = string.byte(s,k+1)
			local c2 = string.byte(s,k+2)
			if c1 and c2 then
				local a1,a2,a3,a4 = 128,191,128,191
				if c == 228 then a1 = 184
				elseif c == 233 then a2,a4 = 190,165
				end
				if c1>=a1 and c1<=a2 and c2>=a3 and c2<=a4 then
					k = k + 2
					table.insert(ss, string.char(c,c1,c2))
				end
			end
		end
	end
	return table.concat(ss)
end ]]