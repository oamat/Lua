--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--
--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------


-- HELP and INFO
ChatCommands["!help"] = function(playerId, command)
	Log(">> !help - %s", command);
	g_gameRules.game:SendTextMessage(4, playerId, "!pop,!uptime,!ping,!restart,!server,!base !discord,!kc score,!kc stats,!kc top10 !aboutus,!deletemybase,!viewclan !unviewclan,!rules,!basebuilding,!market !compass,!uncompass,!uncorpse,!mypos !unviewrank,!setMail,!setDiscord !joinevent,!equipme,!unviewdeaths");		
end

ChatCommands["!rules"] = function(playerId, command)
	Log(">> !rules - %s", command);	
	g_gameRules.game:SendTextMessage(4, playerId, "Simplified rules: No bases at high loot areas neither special buildings, no road or metal spawn blocking, no glitch bases, no chat-abuse, no cheating/glitching! print !basebuilding for base Rules.");	
end

ChatCommands["!discord"] = function(playerId, command)
	Log(">> !discord - %s", command);	
	g_gameRules.game:SendTextMessage(4, playerId, "Join to discord: https://discord.gg/WJFMNMp9c3");	
end

ChatCommands["!basebuilding"] = function(playerId, command)
	Log(">> !basebuilding - %s", command);	
	g_gameRules.game:SendTextMessage(4, playerId, "Do not build your base at high loot areas neither antennas, bunkers, dinner, police or gas Station, special buildings, and do not block roads or metal part spawns. Your crates must be raidable. See discord!");	
end

ChatCommands["!aboutus"] = function(playerId, command)
	Log(">> !aboutus - %s", command);	
	g_gameRules.game:SendTextMessage(4, playerId, "LastShotBCN From Barcelona as been around since September 2020. We are passionate Miscreated players who were tired of the constants Wipes. Join Discord to learn more.");
	
end

ChatCommands["!market"] = function(playerId, command)
	Log(">> !market - %s", command);	
	g_gameRules.game:SendTextMessage(4, playerId, "You can sell or buy ALL items in market or Amalgamed Terminals (exchange items too). Players should go to the market for shopping and thus make contacts with other players (networking).");
	
end

