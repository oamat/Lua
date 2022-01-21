CreateItemTable("AirDropCrateSpawnPolice");
--[[ 
-- Called when the crate is initially dropped
function AirDropCrate:OnDropped()
	--Log("AirDropCrate - OnDropped")
end

-- Called when the crate is close to landing - about 10m above the ground
-- This is when the crate is physicalized and falls due to gravity
function AirDropCrate:OnLanding()
	--Log("AirDropCrate - OnLanding")
end

-- Called when the crate is about to land - about 2.5m above the ground
-- This is when the lading particle effects and audio are played
function AirDropCrate:OnLanded()
	--Log("AirDropCrate - OnLanded")

	-- spawn the loot after 1 second, so the explosion doesn't damage it
	Script.SetTimerForFunction(15000, "SpawnAI", self)

end
 ]]