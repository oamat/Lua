--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------
-- Using Theros's MisDB
--[[ Script.ReloadScript('scripts/MisDB/MisDB.lua');
LastShotDB = MisDB:Create('LastShotDB/', 'Data');
BaseMailCollection = LastShotDB:Collection('BaseMailCollection');
 ]]

LastShotBaseMails = {};
--[[ -- Our grammar arrays
LSBarticles = {"T", "A", "X", "F", "K", "U", "O", "L", "W", "Y", "H", "I", "J", "S", "B", "C", "N", "M", "Q", "E", "P", "G", "D", "Z", "R"};
LSBnouns = {"ba", "bo", "gi", "ci", "ma", "wo", "do", "ca", "to", "ra", "ki", "la", "ji", "ja", "ru", "yu", "ki"};
LSBverbs = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "11", "23", "36", "45", "57", "68", "79", "83", "95", "02", "06", "09"};
LSBadjectives = {"xf", "zi", "yk", "ta", "w4", "q7", "lz", "s1", "rt", "wj", "x8", "d3", "x2", "c4", "u2", "j8", "q0", "u1", "o7", "al", "ot", "ci", "la", "xg", "zy"};
LSBprepositions = {"Bx", "Cz", "Ny", "Mt", "Qw", "Eq", "Pl", "Gs", "Dr", "Zw", "Rx", "Td", "Ax", "Xc", "Fu", "Kj", "Uq", "Ou", "Lo", "Wa", "Yo", "Hc", "Il", "Jx", "Sz"}; ]]


--------------------------------------------------------------------------
---------------------------- LOCAL FUNCTIONS SERVER SIDE -----------------
--------------------------------------------------------------------------

-- Returns a copied table so the copy is not pointing to the same memory reference
local function LastShotShallowCopy(originalTable)
	local copy;
	if type(originalTable) == 'table' then
	  copy = {};  
	  for orig_key, orig_value in pairs(originalTable) do
		copy[orig_key] = orig_value;
	  end
	else
	  copy = originalTable;
	end
	return copy;
end


---* Write file to Disk
---@param path string       path of file to Write, starts in Server root
---@param data any          File Contents to Write
---@return boolean,string   true,nil and a message
local function isLastShotWriteFile(path, data)  -- https://www.tutorialspoint.com/lua/lua_file_io.htm
    local thisFile = assert(io.open(path, 'a'));  -- Opens a file in append mode
    if thisFile ~= nil then		
        local fWritten = thisFile:write(data);
        thisFile:close();
        if fWritten ~= nil then
            return ('1');
        else
            return ('0');
        end
    else
        return ('0');
    end
end

---* Write file to Disk
---@param path string       path of file to Write, starts in Server root
---@param data any          File Contents to Write
---@return boolean,string   true,nil and a message
local function testLastShotWriteFile(path, data)  -- https://www.tutorialspoint.com/lua/lua_file_io.htm
    local thisFile = assert(io.open(path, 'a'));  -- Opens a file in append mode
    if thisFile ~= nil then		
        local fWritten = thisFile:write(data);
        thisFile:close();
        if fWritten ~= nil then
            return ('Success Writing File: <ServerRoot>/' .. path);
        else
            return ('Failed to Write Data to File: <ServerRoot>/' .. path);
        end
    else
        return ('Failed to Open file for Writing: <ServerRoot>/' .. path);
    end
end

-- allbasesdump
-- Remove all bases of server
ChatCommands["!allbasesdump"] = function(playerId, command)
	Log(">> !allbasesdump - %s", command);
	
	--Change Faction to what ever faction can use this command
	local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
	-- Only allow the following Steamid to invoke the command
  	 -- admin steamid

	if isAdminUserWithPrivileges(steamid) then
		local bases = BaseBuildingSystem.GetPlotSigns()

		for i,b in pairs(bases) do 

			local numParts = b.plotsign:GetPartCount();
			Log("Base - index: %d, numParts: %d", i, numParts);

			if numParts > 0 then
				for p = 0, numParts - 1 do
					local partId = b.plotsign:GetPartId(p);

					local canPackUp = 1
						if (not b.plotsign:CanPackUp(partId)) then
							canPackUp = 0;
						end

					Log("Id: %d, TypeId: %d, ClassName: %s, CanPackUp: %d, MaxHealth: %f, Damage: %f", partId, b.plotsign:GetPartTypeId(partId), b.plotsign:GetPartClassName(partId), canPackUp, b.plotsign:GetMaxHealth(partId), b.plotsign:GetDamage(partId))
				end
			end
		end
	end
end


-- baseremove
-- Remove the base of the area you stay in that moment
ChatCommands["!baseremove"] = function(playerId, command)
	Log(">> !baseremove - %s", command);  
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id();
	
  
	if isAdminUserWithPrivileges(steamid) then
	  local plotSignId = player.player:GetActivePlotSignId();
	  if plotSignId then
		local b = System.GetEntity(plotSignId);
		if b then   -- Iterate through all the parts and delete them
  		  while b.plotsign:GetPartCount() > 0 do
			local partId = b.plotsign:GetPartId(0);
			b.plotsign:DeletePart(partId);
		  end    
		  b.plotsign:DeletePart(-1);  -- Delete the actual plot sign
		  g_gameRules.game:SendTextMessage(4, playerId, "Base deleted.");	
		else 
		  g_gameRules.game:SendTextMessage(4, playerId, "Base not found.");	
		end
	  end
	end
  end

-- basecrates
-- return number of crates
ChatCommands["!basecrates"] = function(playerId, command) 
	Log(">> !basecrates - %s", command);  
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id();
	if (not command or command == '') then 
		command = '1';
	end
  
	if isAdminUserWithPrivileges(steamid) then	  
	  local plotSignId = player.player:GetActivePlotSignId();
	   if plotSignId then					
			local b = System.GetEntity(plotSignId);
			if b then   -- Iterate through all the parts and delete them
				local numParts = b.plotsign:GetPartCount();
				if numParts > 0 then
					local index = 0;
					for p = 0, numParts - 1 do
						local partId = b.plotsign:GetPartId(p);														
						if (b.plotsign:GetPartTypeId(partId) == 371) then
							index = index + 1;
							if tostring(index) == command then 
								local pos = b.plotsign:GetPartWorldPos(partId);								
								g_gameRules.game:SendTextMessage(4, playerId, string.format("Position crate " .. command .. " : %.1f %.1f %.1f", pos.x, pos.y, pos.z));	
							end
						end
					end    		  		  				
					g_gameRules.game:SendTextMessage(4, playerId, 'Found crates : ' .. tostring(index) );	
				else 
					g_gameRules.game:SendTextMessage(4, playerId, "Parts not found.");	
				end 
			else 
				g_gameRules.game:SendTextMessage(4, playerId, "Base not found.");	
			end
	  end
	end
end



-- baseowner
-- return base owner , steamid
  ChatCommands["!baseowner"] = function(playerId, command)
	Log(">> !baseowner - %s", command);
	local player = System.GetEntity(playerId);
	local plotSignId = player.player:GetActivePlotSignId();    
    local steamid = player.player:GetSteam64Id();    
    -- local allowCommand = allowCommand or nil ~= string.match(System.GetCVar("g_gameRules_faction6_steamids"), steamid)
	
	if isAdminUserWithPrivileges(steamid) then
    	plotSignId = player.player:GetActivePlotSignId();
		if plotSignId then
			b = System.GetEntity(plotSignId);
			if b then		
				g_gameRules.game:SendTextMessage(4, playerId, b.plotsign:GetOwnerSteam64Id() );				
				g_gameRules.game:SendTextMessage(4, playerId, 'PlotSign is on x:' .. tostring(b:GetWorldPos().x) .. ' and y:' .. tostring(b:GetWorldPos().y) );	
			end 		
		end
    end
end



-- !deletemybase
-- Owner can Delete his base. Everybody can call this script
ChatCommands["!deletemybase"] = function(playerId, command)
    Log(">> !deletemybase - %s", command);
    --Change Faction to what ever faction can use this command
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();
 
      -- Everybody can call this script
    local plotSignId = player.player:GetActivePlotSignId();
        
    if plotSignId then
            local b = BaseBuildingSystem.GetPlotSign(plotSignId)

            if b then
                if b.plotsign:GetOwnerSteam64Id() == steamid then                    
                    while b.plotsign:GetPartCount() > 0 do  -- Iterate through all the parts and delete them
                        local partId = b.plotsign:GetPartId(0)
                        b.plotsign:DeletePart(partId)
                    end   -- Delete the actual plot sign
                    b.plotsign:DeletePart(-1)
                end
            end
        end
    end



--------------------------------------------------------------------------
---------------------------- MAIL ALERTS SERVER SIDE -------------------
--------------------------------------------------------------------------


-- !setMail
-- Owner can setMail to his base. Everybody can call this script
ChatCommands["!setMail"] = function(playerId, command)
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id();
		
		if (not command or command == '') then 
			g_gameRules.game:SendTextMessage(4, playerId, 'You need to introduce your email with !setMail mail.');	
			--g_gameRules.game:SendTextMessage(0, playerId, 'You need to introduce your email with !setMail mail.');	
		else	
			if string.find(command,"@") then			
				local plotSignId = player.player:GetActivePlotSignId();	
				if plotSignId then
					local b = BaseBuildingSystem.GetPlotSign(plotSignId);			
					if b then
						if b.plotsign:GetOwnerSteam64Id() == steamid then  
							local code = strRandom(8);		
							local playerMail = {
								['name'] = tostring(player:GetName()),
								['mail'] = tostring(command),		
								['steamid'] = tostring(steamid),
								['code'] = tostring(code),
								['basePosX'] = tostring(b:GetWorldPos().x),
								['basePosY'] = tostring(b:GetWorldPos().y)					
							}     
							LastShotBaseMails[steamid] = playerMail; 						    
							--MailConfirmCollection:SetPage(steamid, LastShotShallowCopy(playerMail));							
							--LastShotDB:Save();   					
							
							
						    local lineToSave = LastShotJSONLib.stringify(playerMail) .. '\n';
							local result = isLastShotWriteFile('LastShotDB/Data/sendmailcode.txt', lineToSave);
							if (result == '1') then
								g_gameRules.game:SendTextMessage(4, playerId, 'You have reveived a confirmation mail code. Check your email.');	
								g_gameRules.game:SendTextMessage(4, playerId, 'Then you should to confirm your mail with !confirmMail code.');				
							else 
								g_gameRules.game:SendTextMessage(4, playerId, 'We cannot save your mail. An ERROR occurs, alerts haven\'t activated.');	
							end						
						else
							g_gameRules.game:SendTextMessage(4, playerId, 'You are not the owner\'s base.');	
							--g_gameRules.game:SendTextMessage(0, playerId, 'You are not the owner\'s base.');
						end
					else
						g_gameRules.game:SendTextMessage(4, playerId, 'You are not into your area base.');	
						--g_gameRules.game:SendTextMessage(0, playerId, 'You are not into your area base.');
					end
				else
					g_gameRules.game:SendTextMessage(4, playerId, 'You are not into your area base.');	
					--g_gameRules.game:SendTextMessage(0, playerId, 'You are not into your area base.');
				end
			else 
				g_gameRules.game:SendTextMessage(4, playerId, 'You need to introduce a correct email.');
			end
		end	
end

-- !confirmMail
-- Mail Owner can activate base alerts. Everybody can call this script
ChatCommands["!confirmMail"] = function(playerId, command)		
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id(); 
	
		if (not command or command == '') then 
			g_gameRules.game:SendTextMessage(4, playerId, 'You need to introduce your email code.');	
			--g_gameRules.game:SendTextMessage(0, playerId, 'You need to introduce your email code.');	
		else 
			if LastShotBaseMails[steamid] ~= nil then	
				if LastShotBaseMails[steamid]['code'] == command then  																	    
						--BaseMailCollection:SetPage(steamid, LastShotShallowCopy(LastShotBaseMails[steamid]));						
						--LastShotDB:Save();
						--g_gameRules.game:SendTextMessage(0, playerId, 'Your mail have been confirmed. Alerts Activated.');	
						
						local lineToSave = LastShotJSONLib.stringify(LastShotBaseMails[steamid]) .. '\n';
						local result = isLastShotWriteFile('LastShotDB/Data/confirmedcode.txt', lineToSave); 					
						if (result == '1') then
							g_gameRules.game:SendTextMessage(4, playerId, 'Your mail have been confirmed. Alerts Activated.');	
						else 
							g_gameRules.game:SendTextMessage(4, playerId, 'We cannot save your mail. An ERROR occurs, alerts haven\'t activated.');	
						end
						--g_gameRules.game:SendTextMessage(4, playerId, result);
				else
					g_gameRules.game:SendTextMessage(4, playerId, 'The code is invalid. Alerts haven\'t activated.');	
					--g_gameRules.game:SendTextMessage(0, playerId, 'The code is invalid. Alerts haven\'t activated.');
				end	
			else
			  g_gameRules.game:SendTextMessage(4, playerId, 'First you need to use !setMail for config mail. Alerts haven\'t activated.');		
			end
		end	
end

-- !setDiscord
-- Owner can setDiscord to his base. Everybody can call this script
ChatCommands["!setDiscord"] = function(playerId, command)
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id();
		
		if (not command or command == '') then 
			g_gameRules.game:SendTextMessage(4, playerId, 'You need to introduce your Discord ID with !setDiscord ID.');	
			--g_gameRules.game:SendTextMessage(0, playerId, 'You need to introduce your email with !setMail mail.');	
		else							
				local plotSignId = player.player:GetActivePlotSignId();	
				if plotSignId then
					local b = BaseBuildingSystem.GetPlotSign(plotSignId);
					if b then
						if b.plotsign:GetOwnerSteam64Id() == steamid then  			
							local playerMail = {
								['name'] = tostring(player:GetName()),
								['discordid'] = tostring(command),		
								['steamid'] = tostring(steamid),								
								['basePosX'] = tostring(b:GetWorldPos().x),
								['basePosY'] = tostring(b:GetWorldPos().y)											
							}    						
						    local lineToSave = LastShotJSONLib.stringify(playerMail) .. '\n';
							local result = isLastShotWriteFile('LastShotDB/Data/senddiscord.txt', lineToSave);
							if (result == '1') then
								g_gameRules.game:SendTextMessage(4, playerId, 'You have reveived a confirmation message on discord.');	
								g_gameRules.game:SendTextMessage(4, playerId, 'Then you should to confirm your account on discord.');				
							else 
								g_gameRules.game:SendTextMessage(4, playerId, 'We cannot save your discord. An ERROR occurs, alerts haven\'t activated.');	
							end						
						else
							g_gameRules.game:SendTextMessage(4, playerId, 'You are not the owner\'s base.');	
							--g_gameRules.game:SendTextMessage(0, playerId, 'You are not the owner\'s base.');
						end
					else
						g_gameRules.game:SendTextMessage(4, playerId, 'You are not into your area base.');	
						--g_gameRules.game:SendTextMessage(0, playerId, 'You are not into your area base.');
					end
				else
					g_gameRules.game:SendTextMessage(4, playerId, 'You are not into your area base.');	
					--g_gameRules.game:SendTextMessage(0, playerId, 'You are not into your area base.');
				end
		
		end	
end


--------------------------------------------------------------------------
---------------------------- TEST ALL ALERTS SERVER SIDE -----------------
--------------------------------------------------------------------------

ChatCommands["!testcontrolError"] = function(playerId, command)
	g_gameRules.game:SendTextMessage(4, playerId, 'entro');
	local result = loadstring("return '_' + 'ok'");
	g_gameRules.game:SendTextMessage(4, playerId, result);
	local fi = result();
	g_gameRules.game:SendTextMessage(4, playerId, 'no debería verse');
end


-- !TESTstrRandom
ChatCommands["!testcommand"] = function(playerId, command)
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id(); 		
	g_gameRules.game:SendTextMessage(4, playerId, 'New');	
	if isAdminUserWithPrivileges(steamid) then
		if (not command or command == '') then 
			g_gameRules.game:SendTextMessage(4, playerId, 'type command');	
			--g_gameRules.game:SendTextMessage(0, playerId, 'type command');
		else 
			g_gameRules.game:SendTextMessage(4, playerId, 'command :' .. command );	
			--g_gameRules.game:SendTextMessage(0, playerId, 'command :' .. command );
		end
	end 
end

-- !getBaseMails
-- Mail Owner can activate base alerts. Everybody can call this script
ChatCommands["!getBaseMails"] = function(playerId, command)	  	
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id(); 
	if isAdminUserWithPrivileges(steamid) then	                      
			for key, value in pairs(LastShotBaseMails) do
				g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(value) );
			end            		
	end		
end


-- !TESTstrRandom
ChatCommands["!teststrRandom"] = function(playerId, command)
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id(); 	
	if isAdminUserWithPrivileges(steamid) then
		local code = strRandom(8);
		g_gameRules.game:SendTextMessage(4, playerId, 'The code :' .. tostring(code));	
		--g_gameRules.game:SendTextMessage(0, playerId, 'The code :' .. strRandom());
	end 
end

-- !TESTstrRandom
ChatCommands["!testWriteFile"] = function(playerId, command)
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id(); 	
	if isAdminUserWithPrivileges(steamid) then
		local json = '{"name":"Jero", "steamid":"76561199122420355", "mail":"oms@gmail.com", "code":"T8wYdJWq"}';
		local lineToSave = json .. '\n';
		local result = isLastShotWriteFile('LastShotDB/Data/confirmedcode.txt', lineToSave); 					
		if (result == '1') then
			g_gameRules.game:SendTextMessage(4, playerId, 'Your mail have been confirmed. Alerts Activated.');	
		else 
			g_gameRules.game:SendTextMessage(4, playerId, 'We cannot save your mail. An ERROR occurs, alerts haven\'t activated.');	
		end		
		--g_gameRules.game:SendTextMessage(0, playerId, 'The code :' .. strRandom());
	end 
end


-- !TESTstrRandom
ChatCommands["!testfind"] = function(playerId, command)
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id(); 	
	if isAdminUserWithPrivileges(steamid) then
		local result1 = string.find(command,'@');
		local result2 = string.find(command,'.'); 						
		g_gameRules.game:SendTextMessage(4, playerId, 'The result1 :' .. tostring(result1));	
		g_gameRules.game:SendTextMessage(4, playerId, 'The result1 :' .. tostring(result2));
	end 
end



-- !TESTsetMail
-- Owner can setMail to his base. Everybody can call this script
ChatCommands["!testsetMail"] = function(playerId, command)
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id();
	if isAdminUserWithPrivileges(steamid) then
		if (not command or command == '') then 
			g_gameRules.game:SendTextMessage(4, playerId, 'You need to introduce your email with !setMail mail.');	
			--g_gameRules.game:SendTextMessage(0, playerId, 'You need to introduce your email with !setMail mail.');	
		else	    		
			local plotSignId = player.player:GetActivePlotSignId();	
			if plotSignId then
					local b = BaseBuildingSystem.GetPlotSign(plotSignId);
					if b then
						--if b.plotsign:GetOwnerSteam64Id() == steamid then  
							local code = strRandom(8);
							local playerMail = {
								['name'] = tostring(player:GetName()),
								['mail'] = tostring(command),		
								['steamid'] = tostring(steamid),
								['code'] = tostring(code)
							}      
							LastShotBaseMails[steamid] = playerMail; 						    
							--MailConfirmCollection:SetPage(steamid, LastShotShallowCopy(playerMail));							
							--LastShotDB:Save();   					
							
							
							local lineToSave = LastShotJSONLib.stringify(playerMail) .. '\n';
							local result = testLastShotWriteFile('LastShotDB/Data/sendmailcode.txt', lineToSave);  

							g_gameRules.game:SendTextMessage(4, playerId, 'You have reveived a confirmation mail code.');	
							g_gameRules.game:SendTextMessage(4, playerId, 'You need to confirm your mail with !confirmMail code.');			
							g_gameRules.game:SendTextMessage(4, playerId, result);

							--g_gameRules.game:SendTextMessage(0, playerId, 'You need to confirm your mail with !confirmMail code.');	
						--else
						--	g_gameRules.game:SendTextMessage(4, playerId, 'You are not the owner's base.');	
						--	g_gameRules.game:SendTextMessage(0, playerId, 'You are not the owner's base.');
						--end
					else
						g_gameRules.game:SendTextMessage(4, playerId, 'You are not into your area base.');	
						--g_gameRules.game:SendTextMessage(0, playerId, 'You are not into your area base.');
					end
			else
				g_gameRules.game:SendTextMessage(4, playerId, 'You are not into your area base.');	
				--g_gameRules.game:SendTextMessage(0, playerId, 'You are not into your area base.');
			end
		end
	end
end

-- !TESTconfirmMail
-- Mail Owner can activate base alerts. Everybody can call this script
ChatCommands["!testconfirmMail"] = function(playerId, command)		
	local player = System.GetEntity(playerId);	
	local steamid = player.player:GetSteam64Id(); 
	if isAdminUserWithPrivileges(steamid) then
		if (not command or command == '') then 
			g_gameRules.game:SendTextMessage(4, playerId, 'You need to introduce your email code.');	
			--g_gameRules.game:SendTextMessage(0, playerId, 'You need to introduce your email code.');	
		else 
			if LastShotBaseMails[steamid] ~= nil then	
				if LastShotBaseMails[steamid]['code'] == command then  																	    
						--BaseMailCollection:SetPage(steamid, LastShotShallowCopy(LastShotBaseMails[steamid]));						
						--LastShotDB:Save();
						--g_gameRules.game:SendTextMessage(0, playerId, 'Your mail have been confirmed. Alerts Activated.');	
						
						local lineToSave = LastShotJSONLib.stringify(LastShotBaseMails[steamid]) .. '\n';
						local result = testLastShotWriteFile('LastShotDB/Data/confirmedcode.txt', lineToSave);  
												

						g_gameRules.game:SendTextMessage(4, playerId, 'Your mail have been confirmed. Alerts Activated.');	
						--g_gameRules.game:SendTextMessage(4, playerId, result);
				else
					g_gameRules.game:SendTextMessage(4, playerId, 'The code is invalid. Alerts haven\'t activated.');	
					--g_gameRules.game:SendTextMessage(0, playerId, 'The code is invalid. Alerts haven\'t activated.');
				end	
			else
			  g_gameRules.game:SendTextMessage(4, playerId, 'First you need to use !setMail for config mail. Alerts haven\'t activated.');		
			end
		end
	end 
end


