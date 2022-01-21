UFOCrash = {
	type = "UFOCrash",
	Client = {},
	Server = {},
	Properties = {
		mass = 4000,
		fileModel = "Objects/props/ufo_event/ufo.cgf",
		fileModelCrashed = "Objects/props/ufo_event/ufo.cgf",
		fTravelHeight = 1200, -- meters
		fTravelSpeed= 35, -- m/s
		fStartPercentRange = 0.4, -- middle percent of map plane can start in
		fFinishPercentRange = 0.8, -- middle percent of map plane can finish at
		fFadeInOutMultiplier = 1.0,  -- percent of map size plane appears before entering/after leaving the map
		 -- lights not used currently - need helpers on the airplane
		LightLeftWingHelper = "",
		clrLightLeftColor = { x=1,y=0,z=0 },
		LightRightWingHelper = "",
		clrLightRightColor = { x=0,y=1,z=0 },
		LightRearTailHelper = "",
		clrLightTailColor = { x=1,y=1,z=1 },
		ParticleEffectInAir = "misc.UFOCrash.UFOcrash_blue",
		ParticleEffectOnGround = "misc.UFOCrash.crashed_bluesmoke",
		StartAudioTrigger = "Play_airdrop_plane",
		StopAudioTrigger = "Stop_airdrop_plane",
		Explosion = {
			damage = 500,
			pressure = 5000,
			min_radius = 10,
			max_radius = 45,
			min_phys_radius = 10,
			max_phys_radius = 35,
			sound_radius = 750,
			radialblurdist = 100,
			effect_name = "explosions.jerrycan_diesel.burning",
			effect_scale = 1,
			hit_type = "explosion",
		}
	},	
	Editor={
		--Model="Editor/Objects/T.cgf",
		Icon="UFOCrash.bmp",
	},
};

LastArrayUFOCrash = {};
LastUFOCrashTotal = 0;
LastPositionUFOCrash = nil;

function UFOCrash:OnInit()
	self:OnReset();	
end

function UFOCrash:OnPropertyChange()
	self:OnReset();
end

function UFOCrash:OnReset()	
end

function UFOCrash:OnShutDown()
end

-- Called when the crash happens on the server
function UFOCrash:OnCrashed()
    --Log("UFOCrash - OnCrashed")

    -- spawn the loot after 1 second, so the explosion doesn't damage it
    Script.SetTimerForFunction(5000, "SpawnUFOCrashLoot", self)
    Script.SetTimerForFunction(8000, "SpawnAI", self)
end

-- Spawn the loot
SpawnUFOCrashLoot = function(self)
    --Log("UFOCrash - SpawnUFOCrashLoot")

    -- Two meters behind the direction vector
    local vForwardOffset = {x=0,y=0,z=0}
    FastScaleVector(vForwardOffset, self:GetDirectionVector(), -2.0)

    -- Offset by the entity location
    local vSpawnPos = {x=0,y=0,z=0}
	FastSumVectors(vSpawnPos, vForwardOffset, self:GetWorldPos())
	
	local vSpawnPos1 = {x=5,y=0,z=0}
	FastSumVectors(vSpawnPos1, vForwardOffset, self:GetWorldPos())

	local vSpawnPos2 = {x=-5,y=0,z=0}
	FastSumVectors(vSpawnPos2, vForwardOffset, self:GetWorldPos())

    -- Move up by 2 meters
    FastSumVectors(vSpawnPos, vSpawnPos, {x=0,y=0,z=2})

	local rnd = random(1,30)
	if rnd <= 5 then 
		ISM.SpawnCategory("UFOCrashCrate", vSpawnPos)  --Ufo crate
		ISM.SpawnItem("UFOCrashCrateLast", vSpawnPos1) --Box last
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos2)	
	elseif rnd <= 10 then 
		ISM.SpawnCategory("UFOCrashCrate", vSpawnPos) --Ufo crate	
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos2)	
		ISM.SpawnItem("UFOSantaCrate", vSpawnPos1) --Green Santa 
		ISM.SpawnCategory("RandomMiniUFO", vSpawnPos2) --Mini UFO (20%)
	elseif rnd <= 15 then 
		ISM.SpawnCategory("UFOCrashCrate", vSpawnPos) --Ufo crate
		ISM.SpawnItem("UFOCrashCrateLast", vSpawnPos1)	--Box last
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos2)			
	elseif rnd <= 20 then 
		ISM.SpawnCategory("UFOCrashCrate", vSpawnPos1) --Ufo crate		
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos2)	
		ISM.SpawnItem("AirDropSantaCrate", vSpawnPos) --Red Santa 
		ISM.SpawnCategory("RandomMiniUFO", vSpawnPos1) --Mini UFO (20%)
	elseif rnd <= 25 then 
		ISM.SpawnCategory("UFOCrashCrate", vSpawnPos2)	 --Ufo crate		
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos1)			
		ISM.SpawnItem("UFOSantaCrateBlue", vSpawnPos) --Blue Santa 
	else --if rnd <= 30 then 
		ISM.SpawnCategory("UFOCrashCrate", vSpawnPos1)	 --Ufo crate
		ISM.SpawnItem("UFOCrashCrateLast", vSpawnPos)	 --Box last
		ISM.SpawnCategory("RandomMetalPart", vSpawnPos2)
		ISM.SpawnCategory("RandomMiniUFO", vSpawnPos) --Mini UFO (20%)					
	end	
	
	LastUFOCrashTotal = LastUFOCrashTotal + 1;
	LastPositionUFOCrash = vSpawnPos;
	LastArrayUFOCrash[LastUFOCrashTotal] = LastShotJSONLib.stringify(vSpawnPos) .. ' type:' .. rnd;
end

SpawnAI = function(self)

	local vForwardOffset = {x=0,y=0,z=0}
	FastScaleVector(vForwardOffset, self:GetDirectionVector(), 0)
	local vSpawnPos = {x=0,y=0,z=0}
	FastSumVectors(vSpawnPos, vForwardOffset, self:GetWorldPos())

	--AISM.SpawnHorde(vSpawnPos, "horde")
	--AISM.SpawnHorde(vSpawnPos, "mutant_invasion")
	--AISM.SpawnCategory(vSpawnPos, "spider_group")
	
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 2.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 3.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 3.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 3.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 3.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 3.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 3.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 3.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 3.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 3.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 5.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 5.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 5.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 5.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 5.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 2.0, 4.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 2.0, 5.0, 3.0) ]]

	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "BruteMutantSingle", true, 4.0, 5.0, 2.0) ]]
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0)
--[[ 	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanSpider", true, 4.0, 5.0, 2.0) ]]	
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
	AISM.SpawnCategory(vSpawnPos, "CrazySingle", true, 4.0, 5.0, 2.0)
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
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "SpikerSingle", true, 4.0, 5.0, 2.0) ]]
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
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0)
	AISM.SpawnCategory(vSpawnPos, "HumanZombieSingle", true, 4.0, 5.0, 2.0) ]]



end