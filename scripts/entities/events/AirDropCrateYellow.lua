CreateItemTable("AirDropCrateYellow");

-- Called when the crate is initially dropped
function AirDropCrateYellow:OnDropped()
	--Log("AirDropCrate - OnDropped")
end

-- Called when the crate is close to landing - about 10m above the ground
-- This is when the crate is physicalized and falls due to gravity
function AirDropCrateYellow:OnLanding()
	--Log("AirDropCrate - OnLanding")
end

-- Called when the crate is about to land - about 2.5m above the ground
-- This is when the lading particle effects and audio are played
function AirDropCrateYellow:OnLanded()
	--Log("AirDropCrate - OnLanded")

	-- spawn the loot after 1 second, so the explosion doesn't damage it
	Script.SetTimerForFunction(15000, "SpawnAI", self)

end


SpawnAI = function(self)

	local vForwardOffset = {x=0,y=0,z=0}
	FastScaleVector(vForwardOffset, self:GetDirectionVector(), 0)
	local vSpawnPos = {x=0,y=0,z=0}
	FastSumVectors(vSpawnPos, vForwardOffset, self:GetWorldPos())

	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)	
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)	
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 5.0)	
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 5.0)	
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)	
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)	
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 5.0)	
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 5.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 5.0)	
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 5.0) ]]

	LastAirDropPlaneTotal = LastAirDropPlaneTotal + 1;
	LastPosAirDropPlane = vSpawnPos;
	LastArrayAirDropPlane[LastAirDropPlaneTotal] = LastShotJSONLib.stringify(vSpawnPos) .. ' type:' .. AirDropPlane.Properties.CrateClassName;
	
end 