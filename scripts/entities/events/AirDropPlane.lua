AirDropPlane = {
	type = "AirDropPlane",
	Client = {},
	Server = {},
	Properties = {
		-- Needs to be something very large to be seen from the ground
		fileModel = "GameSDK/Objects/props/airdrop_plane/airdrop_plane.cgf",
		fTravelHeight = 850, -- meters
		fTravelSpeed= 60, -- m/s
		fStartPercentRange = 0.8, -- middle percent of map plane can start in
		fFinishPercentRange = 0.6, -- middle percent of map plane can finish at
		fFadeInOutMultiplier = 0.75,  -- percent of map size plane appears before entering/after leaving the map
		LightLeftWingHelper = "light1",
		clrLightLeftColor = { x=1,y=0,z=0 },
		LightRightWingHelper = "light2",
		clrLightRightColor = { x=0,y=1,z=0 },
		LightRearTailHelper = "light3",
		clrLightTailColor = { x=1,y=1,z=1 },
		LightLeftWingStrobeHelper = "light4",
		clrLightLeftStrobeColor = { x=1,y=1,z=1 },
		LightRightWingStrobeHelper = "light5",
		clrLightRightStrobeColor = { x=1,y=1,z=1 },
		CrateClassName = "AirDropCrate",
		StartAudioTrigger = "Play_airdrop_plane",
		StopAudioTrigger = "Stop_airdrop_plane",
	},	
	Editor={ --Model="Editor/Objects/T.cgf",
		Icon="AirDropPlane.bmp",
	},
}

LastArrayAirDropPlane = {};
LastAirDropPlaneTotal = 0;
LastPosAirDropPlane = nil;

function AirDropPlane:OnInit()
	--Log("AirDropPlane - OnInit()")	
	self:OnReset();
end

function AirDropPlane:OnPropertyChange()
	--Log("AirDropPlane - OnPropertyChange()")
	self:OnReset();
end

function AirDropPlane:OnReset()
	--Log("AirDropPlane - OnReset()")
end

function AirDropPlane:OnShutDown()
	--Log("AirDropPlane - OnShutDown()")
end