AirPlaneCrash = {
	type = "AirPlaneCrash",
	Client = {},
	Server = {},
	Properties = {
		mass = 8000,
		fileModel = "Objects/props/misc/vehicles/small_plane/small_plane_a.cgf",
		fileModelCrashed = "Objects/props/crashed_plane/small_plane_crashed.cgf",
		fTravelHeight = 1800, -- meters
		fTravelSpeed= 45, -- m/s
		fStartPercentRange = 0.8, -- middle percent of map plane can start in
		fFinishPercentRange = 0.8, -- middle percent of map plane can finish at
		fFadeInOutMultiplier = 0.1,  -- percent of map size plane appears before entering/after leaving the map
		 -- lights not used currently - need helpers on the airplane
		LightLeftWingHelper = "",
		clrLightLeftColor = { x=1,y=0,z=0 },
		LightRightWingHelper = "",
		clrLightRightColor = { x=0,y=1,z=0 },
		LightRearTailHelper = "",
		clrLightTailColor = { x=1,y=1,z=1 },
		ParticleEffectInAir = "misc.planecrash.smoke",
		ParticleEffectOnGround = "misc.planecrash.plane_crash",
		StartAudioTrigger = "Play_prop_plane",
		StopAudioTrigger = "Stop_prop_plane",
		Explosion = {
			damage = 500,
			pressure = 2000,
			min_radius = 4,
			max_radius = 40,
			min_phys_radius = 4,
			max_phys_radius = 20,
			sound_radius = 600,
			radialblurdist = 450,
			effect_name = "explosions.jerrycan_diesel.burning",
			effect_scale = 15,
			hit_type = "explosion",
		}
	},	
	Editor={
		--Model="Editor/Objects/T.cgf",
		Icon="AirPlaneCrash.bmp",
	},
}

LastArrayAirPlaneCrash = {};
LastAirPlaneCrashTotal = 0;
LastPosAirPlaneCrash = nil;

function AirPlaneCrash:OnInit()
	self:OnReset();
end

function AirPlaneCrash:OnPropertyChange()
	self:OnReset();
end

function AirPlaneCrash:OnReset()
end

function AirPlaneCrash:OnShutDown()
end

-- Called when the crash happens on the server
function AirPlaneCrash:OnCrashed()
	--Log("AirPlaneCrash - OnCrashed")

	-- spawn the loot after 1 second, so the explosion doesn't damage it
	Script.SetTimerForFunction(5000, "SpawnAirPlaneCrashLoot", self)
	Script.SetTimerForFunction(8000, "SpawnAI", self)
end




-- Spawn the loot
SpawnAirPlaneCrashLoot = function(self)
	--Log("AirPlaneCrash - SpawnAirPlaneCrashLoot")

	local vForwardOffset = {x=0,y=0,z=0}
	FastScaleVector(vForwardOffset, self:GetDirectionVector(), -2.0)

	local vForwardOffset1 = {x=10,y=10,z=0}
	FastScaleVector(vForwardOffset1, self:GetDirectionVector(), -10.0)

	local vForwardOffset2 = {x=-10,y=-10,z=0}
	FastScaleVector(vForwardOffset2, self:GetDirectionVector(), -2.0)

	local vForwardOffset3 = {x=0,y=0,z=0}
	FastScaleVector(vForwardOffset3, self:GetDirectionVector(), -20.0)

	local vForwardOffset4 = {x=10,y=-20,z=0}
	FastScaleVector(vForwardOffset4, self:GetDirectionVector(), 10.0)

	local vForwardOffset5 = {x=-10,y=-20,z=0}
	FastScaleVector(vForwardOffset5, self:GetDirectionVector(), 10.0)

	local vForwardOffset6 = {x=-15,y=-15,z=0}
	FastScaleVector(vForwardOffset6, self:GetDirectionVector(), 5.0)

	local vForwardOffset7 = {x=-5,y=-5,z=0}
	FastScaleVector(vForwardOffset7, self:GetDirectionVector(), -5.0)

	local vForwardOffset8 = {x=10,y=-10,z=0}
	FastScaleVector(vForwardOffset8, self:GetDirectionVector(), -15.0)

	local vSpawnPos = {x=0,y=0,z=0}
	FastSumVectors(vSpawnPos, vForwardOffset, self:GetWorldPos())
	FastSumVectors(vSpawnPos, vSpawnPos, {x=0,y=0,z=2})
	
	local vSpawnPos1 = {x=10,y=0,z=0}
	FastSumVectors(vSpawnPos1, vForwardOffset1, self:GetWorldPos())

	local vSpawnPos2 = {x=-10,y=0,z=0}
	FastSumVectors(vSpawnPos2, vForwardOffset2, self:GetWorldPos())

	local vSpawnPos3 = {x=10,y=-10,z=0}
	FastSumVectors(vSpawnPos3, vForwardOffset3, self:GetWorldPos())	
	FastSumVectors(vSpawnPos3, vSpawnPos3, {x=0,y=0,z=-5})

	local vSpawnPos4 = {x=-10,y=-20,z=0}
	FastSumVectors(vSpawnPos4, vForwardOffset4, self:GetWorldPos())

	local vSpawnPos5 = {x=10,y=-20,z=0}
	FastSumVectors(vSpawnPos5, vForwardOffset5, self:GetWorldPos())

	local vSpawnPos6 = {x=15,y=-15,z=0}
	FastSumVectors(vSpawnPos6, vForwardOffset6, self:GetWorldPos())

	local vSpawnPos7 = {x=5,y=-5,z=0}
	FastSumVectors(vSpawnPos7, vForwardOffset7, self:GetWorldPos())

	local vSpawnPos8 = {x=-20,y=15,z=0}
	FastSumVectors(vSpawnPos8, vForwardOffset8, self:GetWorldPos())



	---------------

	local rnd = random(1,30)	-- 1 Crate + 2 Backpacks . Less Plane pieces
	if rnd <= 5 then       --Ardrop + Backpack
        ISM.SpawnItem("PlaneCrashCrateBrown", vSpawnPos) --AirDrop Crate
		ISM.SpawnCategory("AirPlaneCrashBackpack", vSpawnPos1)  --Back Pack
		ISM.SpawnItem("debris_01", vSpawnPos2)
		ISM.SpawnItem("debris_01", vSpawnPos6)
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos8) -- MetalPart	
	    ISM.SpawnItem("planecrash_engine", vSpawnPos4)
		ISM.SpawnItem("planecrash_mid", vSpawnPos3)		
		ISM.SpawnItem("planecrash_gear", vSpawnPos7)
	elseif rnd <= 10 then   --Ardrop + Box Lastshot     
		ISM.SpawnItem("PlaneCrashCrateBlue", vSpawnPos) --AirDrop Crate			
		ISM.SpawnItem("debris_01", vSpawnPos2)
		ISM.SpawnItem("debris_01", vSpawnPos6)
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos8)	 -- MetalPart		
		ISM.SpawnItem("PlaneCrashCrateSpawn", vSpawnPos1)	 -- LastShot Box
		ISM.SpawnItem("planecrash_engine", vSpawnPos4)
		ISM.SpawnItem("planecrash_mid", vSpawnPos3)
		ISM.SpawnItem("planecrash_gear", vSpawnPos7)
	elseif rnd <= 15 then        --Ardrop + Green Santa
		ISM.SpawnItem("PlaneCrashCratePurple", vSpawnPos) --AirDrop Crate		 		
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos8)	 -- MetalPart		
		ISM.SpawnItem("debris_01", vSpawnPos2)
        ISM.SpawnItem("debris_01", vSpawnPos5)
        ISM.SpawnItem("debris_01", vSpawnPos3)		
		ISM.SpawnItem("UFOSantaCrate", vSpawnPos1)  --Green Santa
		ISM.SpawnItem("planecrash_engine", vSpawnPos4)
        ISM.SpawnItem("planecrash_engine", vSpawnPos6)	   
		ISM.SpawnItem("planecrash_mid", vSpawnPos7)
        ISM.SpawnItem("planecrash_gear", vSpawnPos8)
		ISM.SpawnItem("planecrash_gear", vSpawnPos7)
	elseif rnd <= 20 then        --Ardrop + Box LastShot
		ISM.SpawnItem("PlaneCrashCrateGreen", vSpawnPos)	 --AirDrop Crate		
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos5) -- MetalPart						
		ISM.SpawnItem("debris_01", vSpawnPos3)
        ISM.SpawnItem("debris_01", vSpawnPos8)
        ISM.SpawnItem("debris_01", vSpawnPos1)		
		ISM.SpawnItem("PlaneCrashCrateSpawn", vSpawnPos2)	-- LastShot Box
		ISM.SpawnItem("planecrash_engine", vSpawnPos4)
        ISM.SpawnItem("planecrash_engine", vSpawnPos2)	   
		ISM.SpawnItem("planecrash_mid", vSpawnPos3)
        ISM.SpawnItem("planecrash_gear", vSpawnPos6)
		ISM.SpawnItem("planecrash_gear", vSpawnPos7)		
    elseif rnd <= 25 then --Ardrop + Red Santa
		ISM.SpawnItem("PlaneCrashCrateYellow", vSpawnPos)	 --AirDrop Crate			
		ISM.SpawnItem("debris_01", vSpawnPos7)
		ISM.SpawnItem("debris_01", vSpawnPos2)
		ISM.SpawnItem("debris_01", vSpawnPos4)
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos3)	 -- MetalPart	
		ISM.SpawnItem("AirDropSantaCrateSpawn", vSpawnPos1)  --Red Santa	
		ISM.SpawnItem("planecrash_engine", vSpawnPos5)
		ISM.SpawnItem("planecrash_engine", vSpawnPos8)		
		ISM.SpawnItem("planecrash_mid", vSpawnPos4)		
		ISM.SpawnItem("planecrash_gear", vSpawnPos6)
		ISM.SpawnItem("planecrash_gear", vSpawnPos5)	  	
	else -- 	if rnd <= 30 then --Ardrop + BackPack
		ISM.SpawnItem("PlaneCrashCrateGold", vSpawnPos) --AirDrop Crate			
		ISM.SpawnItem("debris_01", vSpawnPos2)
		ISM.SpawnItem("debris_01", vSpawnPos3)
		ISM.SpawnItem("debris_01", vSpawnPos7)		
		ISM.SpawnCategory("AirPlaneCrashBackpack", vSpawnPos1)  --Back Pack
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos8)	 -- MetalPart		
		ISM.SpawnItem("planecrash_engine", vSpawnPos5)
		ISM.SpawnItem("planecrash_engine", vSpawnPos2)		
		ISM.SpawnItem("planecrash_mid", vSpawnPos4)		
		ISM.SpawnItem("planecrash_gear", vSpawnPos6)
		ISM.SpawnItem("planecrash_gear", vSpawnPos5)	
	end  

	LastAirPlaneCrashTotal = LastAirPlaneCrashTotal + 1;
	LastPosAirPlaneCrash = vSpawnPos;
	LastArrayAirPlaneCrash[LastAirPlaneCrashTotal] = LastShotJSONLib.stringify(vSpawnPos) .. ' type:' .. rnd;
end

SpawnAI = function(self)

	local vForwardOffset = {x=0,y=0,z=0}
	FastScaleVector(vForwardOffset, self:GetDirectionVector(), 0)
	local vSpawnPos = {x=0,y=0,z=0}
	FastSumVectors(vSpawnPos, vForwardOffset, self:GetWorldPos())

	--AISM.SpawnHorde(vSpawnPos, "horde")
	--AISM.SpawnHorde(vSpawnPos, "mutant_invasion")
	--AISM.SpawnCategory(vSpawnPos, "spider_group")
	--AISM.SpawnHorde(vSpawnPos, "twoheaddog_invasion")
	--AISM.SpawnHorde(vSpawnPos, "giantroach_invasion")
	--AISM.SpawnCategory(vSpawnPos, "bear_invasion")

	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 2.0, 5.0, 2.0 )	]]
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 2.0, 5.0, 2.0 )]]
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 2.0) ]]
	
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0)	
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0) ]]
	
	--AISM.SpawnCategory(vSpawnPos, "mutant_invasion", true, 4.0, 5.0, 2.0)
	--AISM.SpawnCategory(vSpawnPos, "spider_group", true, 2.0, 5.0, 2.0)
	--AISM.SpawnCategory(vSpawnPos, "horde", true, 2.0, 5.0, 2.0)
	
 end