Script.ReloadScript("scripts/gamerules/GameRulesUtils.lua");

Miscreated = {
	Properties = {
		WorldEvent = {
			fMinTime = 2700, -- min time to spawn an event (in seconds). For test 120, PRO 1800 (45 min.) 
	fMaxTime = 3600	, -- max time to spawn an event (in seconds). For test 300, PRO 3000 (60 min)
		}
	}
}

GameRulesSetStandardFuncs(Miscreated);

function Miscreated.Server:OnInit()
    self:CreateWorldEventTimer()
end

----------------------------------------------------------------------------------------------------
-- Support for the world events to spawn
----------------------------------------------------------------------------------------------------

function Miscreated:CreateWorldEventTimer()
    --Log("Miscreated.CreateWorldEventTimer")
    Script.SetTimerForFunction(randomF(self.Properties.WorldEvent.fMinTime*1000, self.Properties.WorldEvent.fMaxTime*1000), "SpawnWorldEvent", self)
end

SpawnWorldEvent = function(self)
    --Log("Miscreated:SpawnWorldEvent")
	local eventName
    local rnd = random(1, 14)

    if rnd <= 1 then
		AirDropPlane.Properties.CrateClassName="AirDropCrate"; --Red
        eventName = "AirDropPlane" --53,89% +... --> 60%
	elseif rnd <= 2 then
		AirDropPlane.Properties.CrateClassName="AirDropCrateGreen"; 
		eventName = "AirDropPlane" --53,89% +... --> 60%
	elseif rnd <= 3 then
		AirDropPlane.Properties.CrateClassName="AirDropCrateBlue"; 
		eventName = "AirDropPlane" --53,89% +... --> 60%
	elseif rnd <= 4 then
		AirDropPlane.Properties.CrateClassName="AirDropCratePurple"; 
		eventName = "AirDropPlane" --53,89% +... --> 60%
	elseif rnd <= 5 then
		AirDropPlane.Properties.CrateClassName="AirDropCrateYellow"; 
		eventName = "AirDropPlane" --53,89% +... --> 60
	elseif rnd <= 6 then
		AirDropPlane.Properties.CrateClassName="AirDropCrateBrown"; 
		eventName = "AirDropPlane" --53,89% +... --> 60
	elseif rnd <= 7 then
		AirDropPlane.Properties.CrateClassName="AirDropCrateOrange";
		eventName = "AirDropPlane" --53,89% +... --> 60
	elseif rnd <= 8 then
		AirDropPlane.Properties.CrateClassName="AirDropCrateGold";
		eventName = "AirDropPlane" --53,89% +... --> 60
    elseif rnd <= 9 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke_yellow";
		AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_yellowcrash";
		eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
	elseif rnd <= 10 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke_gold";
		AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_goldcrash";
		eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
	elseif rnd <= 11 then
        AirPlaneCrash.Properties.ParticleEffectInAir="misc.planecrash.smoke";
		AirPlaneCrash.Properties.ParticleEffectOnGround="misc.planecrash.plane_crash";
		eventName = "AirPlaneCrash"  --23,07% +.. --> 22%
    elseif rnd <= 12 then
		UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash_purple";
		UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_purplesmoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%   
	elseif rnd <= 13 then
		UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash_blue";
		UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_bluesmoke";
		eventName = "UFOCrash"  -- 23,07% -... --> 18%
	else --if rnd <= 14 then
		UFOCrash.Properties.ParticleEffectInAir="misc.UFOCrash.UFOcrash";
		UFOCrash.Properties.ParticleEffectOnGround="misc.UFOCrash.crashed_smoke";
        eventName = "UFOCrash"  -- 23,07% -... --> 18%
    end

    local spawnParams = {}
    spawnParams.class = eventName
    spawnParams.name = spawnParams.class

--Log("Miscreated:SpawnWorldEvent - Spawning Event")
    local spawnedEntity = System.SpawnEntity(spawnParams)

    if not spawnedEntity then
        Log("Miscreated:SpawnWorldEvent - entity could not be spawned")
    end

    -- set timer up for the next world event
    self:CreateWorldEventTimer()
end


----------------------------------------------------------------------------------------------------
-- Support for custom chat command mods
----------------------------------------------------------------------------------------------------

-- Table for custom CHAT COMMANDS SERVER SIDE to use
ChatCommands = { }

-- Load custom CHAT COMMANDS SERVER SIDE (mods)
Script.LoadScriptFolder("Scripts/GameRules/ChatCommands", true, true)

-- Receives all unhandled, by the core game, CHAT COMMANDS SERVER SIDE
-- Do not add custom CHAT COMMANDS SERVER SIDE directly here
-- Add new CHAT COMMANDS SERVER SIDE to a file in the Scripts/GameRules/ChatCommands folder,
-- so they can be uploaded as mods to Steam
function Miscreated:ChatCommand(playerId, command)
	--Log(">> Miscreated:ChatCommand");

	-- player is an entity
	local player = System.GetEntity(playerId)

	if not player.actor then
		Log("Miscreated:ChatCommand - playerId is not a valid player")
		return
	end

	-- Find the requested chat command and execute it
	local index = string.find(command, " ")

	if not index then
		if ChatCommands[command] then
			ChatCommands[command](playerId, "")
		end
	else
		local cmd = string.sub(command, 1, index - 1)
		if ChatCommands[cmd] then
			ChatCommands[cmd](playerId, string.sub(command, index + 1))
		end
	end
end

----------------------------------------------------------------------------------------------------
-- Support for custom player spawns
----------------------------------------------------------------------------------------------------

-- See BattleRoyale.lua for a more complete example of the following 3 methods

--[[
-- Initialize the player
-- Use this to initialize the player before the server respawns the player
-- Any change to the player's position and rotation would have to be done here
function Miscreated:InitPlayer(playerId)
	--Log(">> Miscreated:InitPlayer");
end
--]]

--[[
-- This is called when the character is being revived by the server
-- Set player stats here - only default CryEngine stats are currently exposed, like health
function Miscreated:RevivePlayer(playerId)
	--Log(">> Miscreated:RevivePlayer");
end
--]]

-- If this method is defined, then Miscreated will ONLY spawn items for a new or respawned
-- player based on the code below.
-- This is called after the player starts the spawning process
-- Add any custom equipment or other finalizing touches here
--[[
function Miscreated:EquipPlayer(playerId)
	--Log(">> Miscreated:EquipPlayer");
	
	-- Get the entity for the player
	local player = System.GetEntity(playerId);

	-- Verify the player is of type "player" - sanity check
	if (player and player.player) then

		-- Give an AT15 to playerId into whatever slot is available and have the player select it
		local weapon = ISM.GiveItem(playerId, "AT15", true);

		-- Add a STANAGx30 to playerId into the stanag_mag00 slot of the AT15
		-- Slot names can be found in the item XML files and they start at index 00 and increment up from there
		local accessory = ISM.GiveItem(playerId, "STANAGx30", false, weapon.id, "stanag_mag00");
	end
end
--]]