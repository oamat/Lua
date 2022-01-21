VehicleSpawnerManager = { 

--[[
	Property descriptions:
	initialMinVehicles -- the minimum number of vehicles from this category that will exist on system startup
	abandonedTimer -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
	abandonedRespawnTimer -- how long until an abandoned vehicle will respawn (in seconds)
	destroyedTimer -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
	destroyedRespawnTimer -- how long until a destroyed vehicle will respawn (in seconds)
]]--

	vehicleCategories =
	{
		-- ====================================================================
		-- BASIC CATEGORIES, determines localitzation of vehicle spawner
		-- ====================================================================

		------------------------------------------------
		------------------------------------------------
		{
			category = "armored_truck_army",
			classes =
			{
				{ 
					class = "placeholder24", contents = "VehicleBasic4Wheels",  -- armored truck army	
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					{ name = "placeholder24_default", percent = 100 },		-- (Skin normal or _default Skin) 
						--{ name = "placeholder24_camo1", percent = 100 },		
						--{ name = "placeholder24_camo2", percent = 50 },			
						--{ name = "placeholder24_camo3", percent = 100 },		
						--{ name = "placeholder24_camo1", percent = 50 },		
					},				
				},				
				{
					class = "placeholder2", contents = "VehicleBasic4Wheels", -- 4x4OffRoad Turbo Ravager Weed
					skins = 
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder2_hex_black", percent = 14.0 }, -- (Skins here...)
						{ name = "placeholder2_hex_dark_red", percent = 14.0 },
						{ name = "placeholder2_hex_grey_green",  percent = 14.0 },
						{ name = "placeholder2_hex_yellow",  percent = 14.0 },
						{ name = "placeholder2_skulls_black", percent = 15.0 },
						{ name = "placeholder2_weed_camo_green",  percent = 14.0 },
						{ name = "placeholder2_weed_new", percent = 15.0 },		
					},
				},
				
				{
					class = "placeholder1",  contents = "VehicleBasic4Wheels",  -- Hammer Normal 
					  skins = 
					  { 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder1_Black", percent = 12.5  }, -- (Skin are here ... )
						{ name = "placeholder1_Brown", percent = 12.5  },
						{ name = "placeholder1_Camo5", percent = 12.5  },
						{ name = "placeholder1_Camo7", percent = 12.5  },
						{ name = "placeholder1_Gray", percent = 12.5  },
						{ name = "placeholder1_Green", percent = 12.5  },
						{ name = "placeholder1_Leopard", percent = 12.5  },
						{ name = "placeholder1_Yellow", percent = 12.5  },					  
					  },
				  },
				  {  
					  class = "placeholder23",  contents = "VehicleBasic4Wheels",     --Swat_Van Black Special ARMORED car (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder23_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
					},
					{
						class = "placeholder10", contents = "VehicleBasic4Wheels",   --Lamborgini Hurakan Police FBI (Skin normal or _default, empty Skin) 
						skins =
						{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder10_default2", percent = 50.0 },		 -- (Skin normal, _default or empty Skin) 	
							{ name = "placeholder10_empty", percent = 50.0 },												
						},
					},
					{ 
						class = "placeholder13", contents = "VehicleBasic4Wheels", -- Army MRAP Military vehicle	
						skins =
							{
								{ name = "placeholder13_default", percent = 33.0 },	-- Original - All Brown	
								{ name = "placeholder13_green", percent = 34.0 },	-- Green. 				
								{ name = "placeholder13_black", percent = 33.0 },	-- Black.  			
							}, 							
					},	
	
					{ 
						class = "placeholder14", contents = "VehicleBasic4Wheels",  -- -- New Hammer with Turret
							skins =
							{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
								{ name = "placeholder14_default", percent = 33.0 },		-- (Skin normal or _default) 	
								{ name = "placeholder14_green", percent = 34.0 },		-- Green 												
								{ name = "placeholder14_black", percent = 33.0 },			-- Black														
							},	 								
					},											
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "armored_truck_police",
			classes =
			{				
				{   -- placeholder7 : Dodge police
				   class = "placeholder7", contents = "VehicleBasic4Wheels",  --Dodge police -- (Skins _satin or _shiny) 
					 skins = 
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder7_satin", percent = 50.0 },  -- (Skins _satin or _shiny) 
						{ name = "placeholder7_shiny",  percent = 50.0 },						
				 	},
			   },
			   {
					class = "sedan_police", contents = "VehicleBasic4Wheels", -- Porsche Panamera
					skins =
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "sedan_police_default", percent = 100.0 },  									
				 	},
			   },			 
			   { 
				   class = "sedan_taxi_blix", contents = "VehicleBasic4Wheels",  -- Audi RS5 Coupe polizei -- (No Skins) 							  
				   skins = 
				   { 
					-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					{ name = "sedan_taxi_blix_default", percent = 100.0 },  									
				 	},
				},  
				{
					class = "placeholder10", contents = "VehicleBasic4Wheels",   --Lamborgini Hurakan Police FBI (Skin normal or _default, empty Skin) 		
					skins =
					{ 				
				 -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					 { name = "placeholder10_default", percent = 100.0 },  									
				  	},			
				},
				{ 
					class = "placeholder13", contents = "VehicleBasic4Wheels", -- Army MRAP Military vehicle	
					skins =
						{
							{ name = "placeholder13_default", percent = 33.0 },	-- Original - All Brown	
							{ name = "placeholder13_green", percent = 34.0 },	-- Green. 				
							{ name = "placeholder13_black", percent = 33.0 },	-- Black. 			
						}, 							
				},	

				{ 
					class = "placeholder14", contents = "VehicleBasic4Wheels",  -- -- New Hammer with Turret
						skins =
						{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder14_default", percent = 33.0 },		-- (Skin normal or _default) 	
							{ name = "placeholder14_green", percent = 34.0 },		-- Green 												
							{ name = "placeholder14_black", percent = 33.0 },			-- Black														
						},	 								
				},				
			},
			initialMinVehicles = 40, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds) 
		},

		--THIS CATEGORY DOESN'T WORK. -- IMPORTANT: it doesn't WORK, however exists in Original VehicleSpawnerManager.lua. I think category suv_police doesn't exist (but class suv_police yes!)	
		------------------------------------------------
		------------------------------------------------  
	--[[ 	{	
				category = "beetle",
				classes =
				{
					{
						class = "beetle", contents = "VehicleBasic4Wheels",
						skins =
						{
							-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "Beetle_Black", percent = 11.0 },
							{ name = "Beetle_Blue", percent = 11.0 },
							{ name = "Beetle_Green", percent = 11.0 },
							{ name = "Beetle_Orange", percent = 12.0 }, -- Default
							{ name = "Beetle_Pink", percent = 11.0 },
							{ name = "Beetle_Purple", percent = 11.0 },
							{ name = "Beetle_Red", percent = 11.0 },
							{ name = "Beetle_White", percent = 11.0 },
							{ name = "Beetle_Yellow", percent = 11.0 },
						},
					},
				},
				initialMinVehicles = 8,
				abandonedTimer = 172800,  -- two days
				abandonedRespawnTimer = 3600, -- one hour
				destroyedTimer = 120,
				destroyedRespawnTimer = 7200, -- two hours
			},
 ]]
		------------------------------------------------
		------------------------------------------------
		{
			category = "bicycle",
			classes =
			{
				{
					class = "placeholder11", contents = "VehicleBasic4Wheels", --SHELBY GT500 Bicolor
					skins = 
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  {	name = "placeholder11_black", percent = 6.0 }, -- (Skins here...)
					  {	name = "placeholder11_blackred", percent = 6.0 },
					  { name = "placeholder11_blue", percent = 6.0 },
					  { name = "placeholder11_bluer", percent = 6.0 },
					  { name = "placeholder11_borange", percent = 6.0 },       
					  { name = "placeholder11_chrome", percent = 6.0 },     
					  { name = "placeholder11_green", percent = 6.0 },
					  { name = "placeholder11_greener", percent = 6.0 },
					  { name = "placeholder11_grey", percent = 6.0 },   
					  { name = "placeholder11_gunmetal", percent = 6.0 },
					  { name = "placeholder11_mandarin", percent = 6.0 },
					  { name = "placeholder11_orange", percent = 6.0 },
					  { name = "placeholder11_pink", percent = 6.0 },
					  { name = "placeholder11_red", percent = 6.0 },
					  { name = "placeholder11_white", percent = 6.0 },
					  { name = "placeholder11_yellow", percent = 5.0 },      
					  { name = "placeholder11_yellower", percent = 5.0 },
					},
				  },
				  { 
					class = "suv_police", contents = "VehicleBasic4Wheels", -- BMW CSL 1971
					skins =
						{
							{ name = "suv_police_black", percent = 20 },
							{ name = "suv_police_blue", percent = 20 },
							{ name = "suv_police_brown", percent = 20 },
							{ name = "suv_police_green", percent = 20 },
							{ name = "suv_police_red", percent = 20 },
						},
				  },
				  {
					class = "placeholder5", contents = "VehicleBasic4Wheels", --SS Camaro bicolor
					skins = 
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "placeholder5_blackblue", percent = 8.0 }, -- (Skins here...)
					  {	name = "placeholder5_blackpink", percent = 8.0 },
					  { name = "placeholder5_blackred", percent = 8.0 },
					  { name = "placeholder5_blackwhite", percent = 8.0 },
					  { name = "placeholder5_blackyellow", percent = 8.0 },
					  { name = "placeholder5_bluebaby", percent = 8.0 },
					  { name = "placeholder5_bluewhite", percent = 8.0 },
					  { name = "placeholder5_greenwhite", percent = 8.0 },
					  { name = "placeholder5_greenyellow", percent = 8.0 },
					  { name = "placeholder5_pinkwhite", percent = 7.0 },
					  { name = "placeholder5_redwhite", percent = 7.0 },
					  { name = "placeholder5_yellowblack", percent = 7.0 },
					  { name = "placeholder5_yellowwhite", percent = 7.0 },
					},
				  },
				  {
					class = "placeholder4", contents = "VehicleBasic4Wheels", --Porsche Cayene	 (Skin normal or _default, Yellow Skin) 
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder4_default2", percent = 50.0 },  -- (Skin normal, _default or Yellow Skin) 
						{ name = "placeholder4_empty", percent = 50.0 },																				
					},
				  },
				  { 
					class = "placeholder6", contents = "VehicleBasic4Wheels",	--Alfa Romeo Yolo (Skin normal or _default Skin) 					
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder6_default", percent = 33.0 },  -- (Skin normal or _default Skin) 																						
						{ name = "placeholder6_black", percent = 34.0 },  -- (Skin normal or _default Skin)
						{ name = "placeholder6_grey", percent = 33.0 },  -- (Skin normal or _default Skin)
					},
				  },
				  { 
					class = "placeholder9", contents = "VehicleBasic4Wheels", --Jaguar XKR (Skin normal, _default or Zebra Skin) 	
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder9_default", percent = 33.0 },	 --(Skin normal. _default or Zebra Skin) 					 
						{ name = "placeholder9_Zebra", percent = 33.0 },
						{ name = "placeholder9_empty", percent = 34.0 },												
					},
				  },
				  {
					class = "placeholder15", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder15_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				  },
				  {
					class = "placeholder22", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder22_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
				{
					class = "placeholder21", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder21_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
				{
					class = "placeholder20", contents = "VehicleBasic4Wheels",    -- ARMY Armored VAN
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder20_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds) 
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "dirtbike",
			classes =
			{
				{
					-- All dirtbike spawners now just spawn a quadbike
					class = "quadbike", contents = "VehicleBasic4Wheels",
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "Quadbike_Black", percent = 11.0 }, -- (Skins here...) 
						{ name = "Quadbike_Blue", percent = 11.0 },
						{ name = "Quadbike_Green", percent = 11.0 },
						{ name = "Quadbike_Orange", percent = 12.0 }, -- Default??
						{ name = "Quadbike_Pink", percent = 11.0 },
						{ name = "Quadbike_Purple", percent = 11.0 },
						{ name = "Quadbike_Red", percent = 11.0 },
						{ name = "Quadbike_White", percent = 11.0 },
						{ name = "Quadbike_Yellow", percent = 11.0 },
					},
				},
				{
					class = "dirtbike", contents = "VehicleBasic4Wheels", -- New buggy 1 person
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  {	name = "dirtbike_black", percent = 17 }, -- (Skins here...) 
					  { name = "dirtbike_blue", percent = 17 },
					  { name = "dirtbike_green", percent = 17 },
					  { name = "dirtbike_pink", percent = 17 },
					  { name = "dirtbike_red", percent = 16 },
					  { name = "dirtbike_yellow", percent = 16 },
					},
				},			
				{
					class = "dune_buggy", contents = "VehicleBasic4Wheels",  -- antic buggy
					skins =
					{   -- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "DuneBuggy_Black", percent = 5.0 }, -- (Skins here...) 
						{ name = "DuneBuggy_Blue", percent = 5.0 },
						{ name = "DuneBuggy_Brown",	percent = 5.0  },
						{ name = "DuneBuggy_Camo1", percent = 5.0  },
						{ name = "DuneBuggy_Camo2", percent = 5.0  },
						{ name = "DuneBuggy_Camo3", percent = 5.0  },
						{ name = "DuneBuggy_Camo4", percent = 5.0  },
						{ name = "DuneBuggy_Camo5", percent = 5.0  },
						{ name = "DuneBuggy_Camo6", percent = 5.0  },
						{ name = "DuneBuggy_Green", percent = 5.0 },
						{ name = "DuneBuggy_Light_Green", percent = 5.0  },
						{ name = "DuneBuggy_Light_Pink", percent = 5.0  },
						{ name = "DuneBuggy_Orange", percent = 5.0 }, -- Default
						{ name = "DuneBuggy_Pink", percent = 5.0 },
						{ name = "DuneBuggy_Purple", percent = 5.0 },
						{ name = "DuneBuggy_Red", percent = 5.0 },
						{ name = "DuneBuggy_Sky_Blue", percent = 5.0 }, 
						{ name = "DuneBuggy_White", percent = 5.0 },
						{ name = "DuneBuggy_Yellow", percent = 5.0 },
						{ name = "DuneBuggy_Zebra", percent = 5.0 },
					},
				},
				{
					class = "placeholder20", contents = "VehicleBasic4Wheels",    -- ARMY Armored VAN
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder20_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
				{
					class = "placeholder4", contents = "VehicleBasic4Wheels", --Porsche Cayene  --(Skin normal or _default, Yellow Skin) 
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder4_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},
				},
				{ 
					class = "placeholder6", contents = "VehicleBasic4Wheels",	--Alfa Romeo Yolo (Skin normal or _default Skin) 					
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder6_default", percent = 33.0 },  -- (Skin normal or _default Skin) 																						
						{ name = "placeholder6_black", percent = 34.0 },  -- (Skin normal or _default Skin)
						{ name = "placeholder6_grey", percent = 33.0 },  -- (Skin normal or _default Skin)
					}, 			
				},
				{ 
					class = "placeholder9", contents = "VehicleBasic4Wheels", --Jaguar XKR --(Skin normal,  _default or Zebra Skin)  
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder9_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},			
				},
				{
					class = "placeholder19", contents = "VehicleBasic4Wheels",     --BMW Patriot (Skin normal or _default Skin) 			
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder19_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},
				},
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "dune_buggy",
			classes =
			{
				{
					class = "dune_buggy", contents = "VehicleBasic4Wheels",  -- antic buggy
					skins =
					{   -- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "DuneBuggy_Black", percent = 5.0 }, -- (Skins here...) 
						{ name = "DuneBuggy_Blue", percent = 5.0 },
						{ name = "DuneBuggy_Brown",	percent = 5.0  },
						{ name = "DuneBuggy_Camo1", percent = 5.0  },
						{ name = "DuneBuggy_Camo2", percent = 5.0  },
						{ name = "DuneBuggy_Camo3", percent = 5.0  },
						{ name = "DuneBuggy_Camo4", percent = 5.0  },
						{ name = "DuneBuggy_Camo5", percent = 5.0  },
						{ name = "DuneBuggy_Camo6", percent = 5.0  },
						{ name = "DuneBuggy_Green", percent = 5.0 },
						{ name = "DuneBuggy_Light_Green", percent = 5.0  },
						{ name = "DuneBuggy_Light_Pink", percent = 5.0  },
						{ name = "DuneBuggy_Orange", percent = 5.0 }, -- Default
						{ name = "DuneBuggy_Pink", percent = 5.0 },
						{ name = "DuneBuggy_Purple", percent = 5.0 },
						{ name = "DuneBuggy_Red", percent = 5.0 },
						{ name = "DuneBuggy_Sky_Blue", percent = 5.0 }, 
						{ name = "DuneBuggy_White", percent = 5.0 },
						{ name = "DuneBuggy_Yellow", percent = 5.0 },
						{ name = "DuneBuggy_Zebra", percent = 5.0 },
					},
				},
				{
					class = "dirtbike", contents = "VehicleBasic4Wheels", -- New buggy 1 person
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  {	name = "dirtbike_black", percent = 17 }, -- (Skins here...) 
					  { name = "dirtbike_blue", percent = 17 },
					  { name = "dirtbike_green", percent = 17 },
					  { name = "dirtbike_pink", percent = 17 },
					  { name = "dirtbike_red", percent = 16 },
					  { name = "dirtbike_yellow", percent = 16 },
					},
				},				
				{
					class = "placeholder2", contents = "VehicleBasic4Wheels", -- 4x4 Ravager Weed
					skins = 
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder2_hex_black", percent = 14.0 }, -- (Skins here...) 
						{ name = "placeholder2_hex_dark_red", percent = 14.0 },
						{ name = "placeholder2_hex_grey_green",  percent = 14.0 },
						{ name = "placeholder2_hex_yellow",  percent = 14.0 },
						{ name = "placeholder2_skulls_black", percent = 15.0 },
						{ name = "placeholder2_weed_camo_green",  percent = 14.0 },
						{ name = "placeholder2_weed_new", percent = 15.0 },
		
					},
				},
				{ 
					class = "tractor",	contents = "RandomTractorContents", -- 4x4 Offroad JackRam Up
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "tractor_black", percent = 11.0  }, -- (Skins here...) 
					  { name = "tractor_blue", percent = 11.0  },
					  { name = "tractor_green", percent = 11.0  },
					  { name = "tractor_jetblack", percent = 12.0  },
					  { name = "tractor_orange", percent = 11.0  },
					  { name = "tractor_pink", percent = 11.0  },
					  { name = "tractor_purple", percent = 11.0  },
					  { name = "tractor_purpler", percent = 11.0  },
					  { name = "tractor_red", percent = 11.0  },
					},
				}, 
				{ 
					class = "towcar", contents = "VehicleBasic4Wheels", -- Toyota Pickup 4x4 Thrulander		
					skins =    													-- (Skin normal, _black, Yellow or _default Skin) 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "towcar_empty", percent = 25.0  },	-- (Skin normal, _black, Yellow or _default Skin) 			 
					  { name = "towcar_default", percent = 25.0  },
					  { name = "towcar_Yellow", percent = 25.0  },
					  { name = "towcar_Black", percent = 25.0  },					  
					},			
				},
				{
					class = "placeholder21", contents = "VehicleBasic4Wheels",    -- ARMY Armored VAN
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder21_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
				{
					class = "placeholder20", contents = "VehicleBasic4Wheels",    -- ARMY Armored VAN
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder20_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "f100truck",
			classes =
			{
				{ 
					class = "f100truck", contents = "VehicleBasic4Wheels",  -- Ranchera
					skins =
						{   -- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "F100Truck_Black", percent = 5.0 }, -- (Skins here...) 
							{ name = "F100Truck_Blue", percent = 5.0 },
							{ name = "F100Truck_Brown",	percent = 5.0  },
							{ name = "F100Truck_Camo1", percent = 5.0  },
							{ name = "F100Truck_Camo2", percent = 5.0  },
							{ name = "F100Truck_Camo3", percent = 5.0  },
							{ name = "F100Truck_Camo4", percent = 5.0  },
							{ name = "F100Truck_Camo5", percent = 5.0  },
							{ name = "F100Truck_Camo6", percent = 5.0  },
							{ name = "F100Truck_Green", percent = 5.0 },
							{ name = "F100Truck_Light_Green", percent = 5.0  },
							{ name = "F100Truck_Light_Pink", percent = 5.0  },
							{ name = "F100Truck_Orange", percent = 5.0 }, -- Default
							{ name = "F100Truck_Pink", percent = 5.0 },
							{ name = "F100Truck_Purple", percent = 5.0 },
							{ name = "F100Truck_Red", percent = 5.0 },
							{ name = "F100Truck_Sky_Blue", percent = 4.0 }, 
							{ name = "F100Truck_White", percent = 4.0 },
							{ name = "F100Truck_Yellow", percent = 4.0 },
							{ name = "F100Truck_Zebra", percent = 4.0 },
							{ name = "F100RenovatedBlack", percent = 4.0 },
						},			
				},
				{
					class = "placeholder5",	contents = "VehicleBasic4Wheels", --SS Camaro Bicolor
					skins = 
						{   -- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder5_blackblue", percent = 7.0 }, -- (Skins here...) 
							{ name = "placeholder5_blackpink", percent = 7.0 },
							{ name = "placeholder5_blackred", percent = 7.0 },
							{ name = "placeholder5_blackwhite", percent = 7.0 },
							{ name = "placeholder5_blackyellow", percent = 8.0 },
							{ name = "placeholder5_bluebaby", percent = 8.0 },
							{ name = "placeholder5_bluewhite", percent = 8.0 },
							{ name = "placeholder5_greenwhite", percent = 8.0 },
							{ name = "placeholder5_greenyellow", percent = 8.0 },
							{ name = "placeholder5_pinkwhite", percent = 8.0 },
							{ name = "placeholder5_redwhite", percent = 8.0 },
							{ name = "placeholder5_yellowblack", percent = 8.0 },
							{ name = "placeholder5_yellowwhite", percent = 8.0 },
						},
				},				
				{
					class = "placeholder4", contents = "VehicleBasic4Wheels", --Porsche Cayene  --(Skin normal or _default, Yellow Skin) 
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder4_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},
				},
				{ 
					class = "placeholder6", contents = "VehicleBasic4Wheels",	--Alfa Romeo Yolo (Skin normal or _default Skin) 					
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder6_default", percent = 33.0 },  -- (Skin normal or _default Skin) 																						
						{ name = "placeholder6_black", percent = 34.0 },  -- (Skin normal or _default Skin)
						{ name = "placeholder6_grey", percent = 33.0 },  -- (Skin normal or _default Skin)
					},			
				},
				{ 
					class = "placeholder9", contents = "VehicleBasic4Wheels", --Jaguar XKR --(Skin normal,  _default or Zebra Skin)  
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder9_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},			
				},
				{
					class = "placeholder19", contents = "VehicleBasic4Wheels",     --BMW Patriot (Skin normal or _default Skin) 			
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder19_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},
				},
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "fishing_boat",
			classes =
			{
				{
					class = "fishing_boat", contents = "RandomFishingBoatContents",
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "FishingBoat_Black", percent = 5.0 },  -- (Skins here...) 
						{ name = "FishingBoat_Blue", percent = 5.0 },
						{ name = "FishingBoat_Brown", percent = 5.0 },
						{ name = "FishingBoat_Camo1", percent = 5.0 },
						{ name = "FishingBoat_Camo2", percent = 5.0 },
						{ name = "FishingBoat_Camo3", percent = 5.0 },
						{ name = "FishingBoat_Camo4", percent = 5.0 },
						{ name = "FishingBoat_Camo5", percent = 5.0 },
						{ name = "FishingBoat_Camo6", percent = 5.0 },
						{ name = "FishingBoat_Green", percent = 5.0 },
						{ name = "FishingBoat_Light_Green", percent = 5.0 },
						{ name = "FishingBoat_Light_Pink", percent = 5.0 },
						{ name = "FishingBoat_Orange", percent = 5.0 },
						{ name = "FishingBoat_Pink", percent = 5.0 },
						{ name = "FishingBoat_Purple", percent = 5.0 },
						{ name = "FishingBoat_Red", percent = 5.0 },
						{ name = "FishingBoat_Sky_Blue", percent = 5.0 },
						{ name = "FishingBoat_White", percent = 5.0 }, -- Default
						{ name = "FishingBoat_Yellow", percent = 5.0 },
						{ name = "FishingBoat_Zebra", percent = 5.0 },
					},
				},
			},
			initialMinVehicles = 10, 		-- 10 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "jetski",
			classes =
			{
				{ 
				class = "jetski", contents = "RandomJetskiContents",
				skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "jetski_default", percent = 100.0 },  -- (Skins here...) 
					},
				},  -- (No Skins...) 
			},
			initialMinVehicles = 10,
			abandonedTimer = 115200,  -- 32 Hours
			abandonedRespawnTimer = 600, -- 10 min. 
			destroyedTimer = 180, -- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, -- 10 min. 
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "party_bus",
			classes =
			{
				{ 
					class = "party_bus", contents = "RandomPartyBusContents",
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "party_bus_default", percent = 100.0 },  -- (Skins here...) 
					},
				},  -- Swat Party Bus
	
				{ 
					class = "placeholder3", contents = "VehicleBasic4Wheels", --Jeep Willys
					skins =
					{
						{ name = "placeholder3_original", percent = 20.0 },
						{ name = "placeholder3_unmarked", percent = 20.0 },
						{ name = "placeholder3_black", percent = 20.0 },
						{ name = "placeholder3_green", percent = 20.0 },
						{ name = "placeholder3_yellow", percent = 20.0 },
					},
				},
				{
				   class = "beetle", contents = "VehicleBasic4Wheels", -- Special Beetle
					skins = 
					{ -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					{ name = "beetle_super", percent = 9.0 }, -- (Skins here...) 
					{ name = "beetle_black", percent = 7.0 }, -- (Skins here...) 
					{ name = "beetle_blue", percent = 7.0 },
					{ name = "beetle_camo1", percent = 7.0 },
					{ name = "beetle_camo2", percent = 7.0 },
					{ name = "beetle_camo3", percent = 7.0 },
					{ name = "beetle_camo4", percent = 7.0 },
					{ name = "beetle_green", percent = 7.0 },
					{ name = "beetle_orange", percent = 7.0 },
					{ name = "beetle_pink", percent = 7.0 },
					{ name = "beetle_purple", percent = 7.0 },
					{ name = "beetle_red", percent = 7.0 },
					{ name = "beetle_white", percent = 7.0 },
					{ name = "beetle_yellow", percent = 7.0 },
					},
				},
				{
					class = "placeholder8",	contents = "VehicleBasic4Wheels", -- Bmw
					skins = 
					{  -- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder8_black", percent = 10.0 },  -- (Skins here...) 
						{ name = "placeholder8_blue", percent = 9.0  },
						{ name = "placeholder8_green", percent = 9.0 },
						{ name = "placeholder8_brgreen", percent = 9.0 },
						{ name = "placeholder8_orange", percent = 9.0  },
						{ name = "placeholder8_pink",	percent = 9.0 },
						{ name = "placeholder8_purple", percent = 9.0  },
						{ name = "placeholder8_red", percent = 9.0  },
						{ name = "placeholder8_silver", percent = 9.0 },
						{ name = "placeholder8_white", percent = 9.0 },
						{ name = "placeholder8_yellow", percent = 9.0 },
					},
				},
				{ 
					class = "placeholder18", contents = "VehicleBasic4Wheels", -- Chevrolet corvette
					skins =
						{
							{ name = "placeholder18_black", percent = 20 },
							{ name = "placeholder18_blue", percent = 20 },
							{ name = "placeholder18_green", percent = 20 },
							{ name = "placeholder18_red", percent = 20 },
							{ name = "placeholder18_yellow", percent = 20 },											
						},
				},	
		
				{ 
						class = "placeholder16", contents = "VehicleBasic4Wheels",  --Audi RS14  
							skins =
							{
								{ name = "placeholder16_black", percent = 18 },
								{ name = "placeholder16_blue", percent = 18 },
								{ name = "placeholder16_green", percent = 18 },
								{ name = "placeholder16_red", percent = 18 },
								{ name = "placeholder16_brown", percent = 18 },
								{ name = "placeholder16_chrome", percent = 10 },
								
							},
				},									
			},
			initialMinVehicles = 40, 		-- 40 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "quadbike",
			classes =
			{
				{
					class = "quadbike", contents = "VehicleBasic4Wheels",
					skins =
					{
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "Quadbike_Black", percent = 6.0 }, -- (Skins here...) 
						{ name = "Quadbike_Blue", percent = 6.0 },
						{ name = "Quadbike_Brown", percent = 6.0 },
						{ name = "Quadbike_Camo5", percent = 6.0 },
						{ name = "Quadbike_Camo6", percent = 6.0 },
						{ name = "Quadbike_Green", percent = 6.0 },
						{ name = "Quadbike_Light_Green", percent = 7.0 },
						{ name = "Quadbike_Light_Pink", percent = 7.0 },
						{ name = "Quadbike_Orange", percent = 6.0 }, -- Default??
						{ name = "Quadbike_Pink", percent = 6.0 },
						{ name = "Quadbike_Purple", percent = 6.0 },
						{ name = "Quadbike_Red", percent = 6.0 },
						{ name = "Quadbike_Sky_Blue", percent = 7.0 },						
						{ name = "Quadbike_White", percent = 6.0 },
						{ name = "Quadbike_Yellow", percent = 6.0 },
						{ name = "Quadbike_Zebra", percent = 7.0 },
					},
				},
				{ 
					class = "f100truck", contents = "VehicleBasic4Wheels",  -- Ranchera
					skins =
						{   -- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "F100Truck_Black", percent = 5.0 }, -- (Skins here...) 
							{ name = "F100Truck_Blue", percent = 5.0 },
							{ name = "F100Truck_Brown",	percent = 5.0  },
							{ name = "F100Truck_Camo1", percent = 5.0  },
							{ name = "F100Truck_Camo2", percent = 5.0  },
							{ name = "F100Truck_Camo3", percent = 5.0  },
							{ name = "F100Truck_Camo4", percent = 5.0  },
							{ name = "F100Truck_Camo5", percent = 5.0  },
							{ name = "F100Truck_Camo6", percent = 5.0  },
							{ name = "F100Truck_Green", percent = 5.0 },
							{ name = "F100Truck_Light_Green", percent = 5.0  },
							{ name = "F100Truck_Light_Pink", percent = 5.0  },
							{ name = "F100Truck_Orange", percent = 5.0 }, -- Default
							{ name = "F100Truck_Pink", percent = 5.0 },
							{ name = "F100Truck_Purple", percent = 5.0 },
							{ name = "F100Truck_Red", percent = 5.0 },
							{ name = "F100Truck_Sky_Blue", percent = 4.0 }, 
							{ name = "F100Truck_White", percent = 4.0 },
							{ name = "F100Truck_Yellow", percent = 4.0 },
							{ name = "F100Truck_Zebra", percent = 4.0 },
							{ name = "F100RenovatedBlack", percent = 4.0 },
						},			
				},
				{ 
					class = "towcar", contents = "VehicleBasic4Wheels", -- Toyota Pickup 4x4 Thrulander		
					skins =    													-- (Skin normal, _black, Yellow or _default Skin) 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "towcar_empty", percent = 25.0  },	-- (Skin normal, _black, Yellow or _default Skin) 			 
					  { name = "towcar_default", percent = 25.0  },
					  { name = "towcar_Yellow", percent = 25.0  },
					  { name = "towcar_Black", percent = 25.0  },					  
					},			
				},				
				{
					class = "placeholder20", contents = "VehicleBasic4Wheels",    -- ARMY Armored VAN
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder20_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
				{
					class = "beetle", contents = "VehicleBasic4Wheels", -- Special Beetle
					 skins = 
					 { -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					 { name = "beetle_super", percent = 9.0 }, -- (Skins here...) 
					 { name = "beetle_black", percent = 7.0 }, -- (Skins here...) 
					 { name = "beetle_blue", percent = 7.0 },
					 { name = "beetle_camo1", percent = 7.0 },
					 { name = "beetle_camo2", percent = 7.0 },
					 { name = "beetle_camo3", percent = 7.0 },
					 { name = "beetle_camo4", percent = 7.0 },
					 { name = "beetle_green", percent = 7.0 },
					 { name = "beetle_orange", percent = 7.0 },
					 { name = "beetle_pink", percent = 7.0 },
					 { name = "beetle_purple", percent = 7.0 },
					 { name = "beetle_red", percent = 7.0 },
					 { name = "beetle_white", percent = 7.0 },
					 { name = "beetle_yellow", percent = 7.0 },
					 },
				 },
				 { 
					class = "placeholder18", contents = "VehicleBasic4Wheels", -- Chevrolet corvette
					skins =
						{
							{ name = "placeholder18_black", percent = 20 },
							{ name = "placeholder18_blue", percent = 20 },
							{ name = "placeholder18_green", percent = 20 },
							{ name = "placeholder18_red", percent = 20 },
							{ name = "placeholder18_yellow", percent = 20 },											
						},
				},	
		
				{ 
							class = "placeholder16", contents = "VehicleBasic4Wheels",  --Audi RS14
							skins =
							{
								{ name = "placeholder16_black", percent = 18 },
								{ name = "placeholder16_blue", percent = 18 },
								{ name = "placeholder16_green", percent = 18 },
								{ name = "placeholder16_red", percent = 18 },
								{ name = "placeholder16_brown", percent = 18 },
								{ name = "placeholder16_chrome", percent = 10 },
								
							},
				},						
				--[[ {
					class = "armored_truck_army", contents = "VehicleBasic4Wheels",    --  Tank Abrams
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "armored_truck_army_default", percent = 25 },		-- (Skin normal or _default Skin) 
							{ name = "armored_truck_army_brutan", percent = 25 },		-- (Skin normal or _default Skin) 
							{ name = "armored_truck_army_desert", percent = 25 },		-- (Skin normal or _default Skin) 
							{ name = "armored_truck_army_stealth", percent = 25 },		-- (Skin normal or _default Skin) 
						},
				}, ]]
			},
			initialMinVehicles = 40, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "sedan_base",
			classes =
			{
				{
					class = "sedan_base", contents = "VehicleBasic4Wheels", -- Subaru BRZ					
					skins =
							{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
								{ name = "sedan_base_default", percent = 5.0 },  -- (Skins here...) 
							},
				},
				{ 
					class = "sedan_taxi_engoa", contents = "VehicleBasic4Wheels", -- Audi RS5 Coupe normal -- (Skin normal, default or Yellow... )															
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "sedan_taxi_engoa_default", percent = 100.0 },  -- (Skins here...) 
					},
				}, 				
				{
					class = "placeholder8",	contents = "VehicleBasic4Wheels", -- Bmw
					skins = 
					{  -- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder8_black", percent = 10.0 },  -- (Skins here...) 
						{ name = "placeholder8_blue", percent = 9.0  },
						{ name = "placeholder8_green", percent = 9.0 },
						{ name = "placeholder8_brgreen", percent = 9.0 },
						{ name = "placeholder8_orange", percent = 9.0  },
						{ name = "placeholder8_pink",	percent = 9.0 },
						{ name = "placeholder8_purple", percent = 9.0  },
						{ name = "placeholder8_red", percent = 9.0  },
						{ name = "placeholder8_silver", percent = 9.0 },
						{ name = "placeholder8_white", percent = 9.0 },
						{ name = "placeholder8_yellow", percent = 9.0 },
					},
				},
				{ 
					class = "suv_police", contents = "VehicleBasic4Wheels", -- BMW CSL 1971
					skins =
						{
							{ name = "suv_police_black", percent = 20 },
							{ name = "suv_police_blue", percent = 20 },
							{ name = "suv_police_brown", percent = 20 },
							{ name = "suv_police_green", percent = 20 },
							{ name = "suv_police_red", percent = 20 },
						},
				},
				{
					class = "placeholder11", contents = "VehicleBasic4Wheels", --SHELBY GT500 Bicolor
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder11_black", percent = 5.0 }, -- (Skins here...) 
						{ name = "placeholder11_blackred", percent = 5.0 },
						{ name = "placeholder11_green", percent = 6.0 },
						{ name = "placeholder11_yellow", percent = 6.0 },
						{ name = "placeholder11_white", percent = 6.0 },
						{ name = "placeholder11_red", percent = 6.0 },
						{ name = "placeholder11_grey", percent = 6.0 },
						{ name = "placeholder11_blue", percent = 6.0 },
						{ name = "placeholder11_chrome", percent = 6.0 },
						{ name = "placeholder11_bluer", percent = 6.0 },
						{ name = "placeholder11_borange", percent = 6.0 },
						{ name = "placeholder11_greener", percent = 6.0 },
						{ name = "placeholder11_gunmetal", percent = 6.0 },
						{ name = "placeholder11_mandarin", percent = 6.0 },
						{ name = "placeholder11_orange", percent = 6.0 },
						{ name = "placeholder11_pink", percent = 6.0 },
						{ name = "placeholder11_yellower", percent = 6.0 },
					},
				},
				{
					class = "placeholder4", contents = "VehicleBasic4Wheels", --Porsche Cayene	 (Skin normal or _default, Yellow Skin) 
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder4_default2", percent = 50.0 },  -- (Skin normal, _default or Yellow Skin) 
						{ name = "placeholder4_empty", percent = 50.0 },																				
					},
				  },
				  { 
					class = "placeholder6", contents = "VehicleBasic4Wheels",	--Alfa Romeo Yolo (Skin normal or _default Skin) 					
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder6_default", percent = 33.0 },  -- (Skin normal or _default Skin) 																						
						{ name = "placeholder6_black", percent = 34.0 },  -- (Skin normal or _default Skin)
						{ name = "placeholder6_grey", percent = 33.0 },  -- (Skin normal or _default Skin)
					},
				  },
				  { 
					class = "placeholder9", contents = "VehicleBasic4Wheels", --Jaguar XKR (Skin normal, _default or Zebra Skin) 	
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder9_default", percent = 33.0 },	 --(Skin normal. _default or Zebra Skin) 					 
						{ name = "placeholder9_Zebra", percent = 33.0 },
						{ name = "placeholder9_empty", percent = 34.0 },												
					},
				  },
				  { 
					class = "placeholder18", contents = "VehicleBasic4Wheels", -- Chevrolet corvette
					skins =
						{
							{ name = "placeholder18_black", percent = 20 },
							{ name = "placeholder18_blue", percent = 20 },
							{ name = "placeholder18_green", percent = 20 },
							{ name = "placeholder18_red", percent = 20 },
							{ name = "placeholder18_yellow", percent = 20 },											
						},
					},	
		
					{ 
							class = "placeholder16", contents = "VehicleBasic4Wheels",  --Audi RS14
							skins =
							{
								{ name = "placeholder16_black", percent = 18 },
								{ name = "placeholder16_blue", percent = 18 },
								{ name = "placeholder16_green", percent = 18 },
								{ name = "placeholder16_red", percent = 18 },
								{ name = "placeholder16_brown", percent = 18 },
								{ name = "placeholder16_chrome", percent = 10 },
								
							},
					},								
					--[[ {
						class = "armored_truck_army", contents = "VehicleBasic4Wheels",    --  Tank Abrams
							skins = 
							{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
								{ name = "armored_truck_army_default", percent = 25 },		-- (Skin normal or _default Skin) 
								{ name = "armored_truck_army_brutan", percent = 25 },		-- (Skin normal or _default Skin) 
								{ name = "armored_truck_army_desert", percent = 25 },		-- (Skin normal or _default Skin) 
								{ name = "armored_truck_army_stealth", percent = 25 },		-- (Skin normal or _default Skin) 
							},
					}, ]]
			},
			initialMinVehicles = 40, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "sedan_police",
			classes =
			{
				{
					class = "sedan_police", contents = "VehicleBasic4Wheels", -- Porsche Panamera
					skins =
					{ 					
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "sedan_police_default", percent = 100.0 },  									
				 	},
			   },
			   { 
				class = "sedan_taxi_blix", contents = "VehicleBasic4Wheels",  -- Audi RS5 Coupe polizei -- (No Skins) 							  
				skins =
					{ 				
				 -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					 { name = "sedan_taxi_blix_default", percent = 100.0 },  									
				  },
			 	},   
				{ 
				   class = "placeholder7", contents = "VehicleBasic4Wheels", --Dodge police -- (Skins _satin or _shiny) 
					  skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "placeholder7_satin", percent = 50 },  -- (Skins _satin or _shiny) 
					  { name = "placeholder7_shiny", percent = 50 },
					},
				},
				{ 
					class = "suv_police", contents = "VehicleBasic4Wheels", -- BMW CSL 1971
					skins =
						{
							{ name = "suv_police_black", percent = 20 },
							{ name = "suv_police_blue", percent = 20 },
							{ name = "suv_police_brown", percent = 20 },
							{ name = "suv_police_green", percent = 20 },
							{ name = "suv_police_red", percent = 20 },
						},
					},				
				{
					class = "placeholder10", contents = "VehicleBasic4Wheels",   --Lamborgini Hurakan Police FBI (Skin normal or _default, empty Skin) 		
					skins =
					{ 				
				 -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					 { name = "placeholder10_default", percent = 100.0 },  									
				  	},			
				},
				{
					class = "placeholder15", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder15_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				  },
				  {
					class = "placeholder22", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder22_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
				{
					class = "placeholder21", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder21_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},			
			},
			initialMinVehicles = 30,		
			abandonedTimer = 115200,  -- 32 Hours
			abandonedRespawnTimer = 600, -- 10 min. 
			destroyedTimer = 180,
			destroyedRespawnTimer = 600, -- 10 min. 
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "sedan_taxi",
			classes =
			{				
				{ 
					class = "sedan_taxi_engoa", contents = "VehicleBasic4Wheels", -- Audi RS5 Coupe normal -- (Skin normal, default or Yellow... )
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "sedan_taxi_engoa_default2", percent = 50.0  },  -- (Skin normal, default or Yellow... )
					  { name = "sedan_taxi_engoa_Yellow", percent = 50.0  },
					},											
				}, 			
				{ 
					class = "sedan_base", contents = "VehicleBasic4Wheels", -- Subaru BRZ					
					skins =
							{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
								{ name = "sedan_base_default", percent = 100.0 },  -- (Skins here...) 
							},
				},  
				{ 
					class = "placeholder8", contents = "VehicleBasic4Wheels", -- Bmw
					skins = 
					{ -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  {	name = "placeholder8_black", percent = 10.0 },  -- (Skin are here ... )
					  {	name = "placeholder8_blue", percent = 9.0  },
					  {	name = "placeholder8_green", percent = 9.0 },
					  {	name = "placeholder8_brgreen", percent = 9.0 },
					  {	name = "placeholder8_orange", percent = 9.0  },
					  {	name = "placeholder8_pink",	percent = 9.0 },
					  {	name = "placeholder8_purple", percent = 9.0  },
					  {	name = "placeholder8_red", percent = 9.0  },
					  { name = "placeholder8_silver", percent = 9.0 },
					  {	name = "placeholder8_white", percent = 9.0 },
					  { name = "placeholder8_yellow", percent = 9.0 },
					},
				},  
				{ 
					class = "placeholder5", contents = "VehicleBasic4Wheels", --SS Camaro Bicolor
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder5_blackblue", percent = 7.0 },  -- (Skin are here ... )
						{ name = "placeholder5_blackpink", percent = 7.0 },
						{ name = "placeholder5_blackred", percent = 7.0 },
						{ name = "placeholder5_blackwhite", percent = 7.0 },
						{ name = "placeholder5_blackyellow", percent = 8.0 },
						{ name = "placeholder5_bluebaby", percent = 8.0 },
						{ name = "placeholder5_bluewhite", percent = 8.0 },
						{ name = "placeholder5_greenwhite", percent = 8.0 },
						{ name = "placeholder5_greenyellow", percent = 8.0 },
						{ name = "placeholder5_pinkwhite", percent = 8.0 },
						{ name = "placeholder5_redwhite", percent = 8.0 },
						{ name = "placeholder5_yellowblack", percent = 8.0 },
						{ name = "placeholder5_yellowwhite", percent = 8.0 },
					},
				},
				{
					class = "placeholder15", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder15_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				  },
				  {
					class = "placeholder22", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder22_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},
				{
					class = "placeholder21", contents = "VehicleBasic4Wheels",     --TRACTOR ZETTELMEYER ZL 1801  (Skin normal or _default Skin) 			
						skins = 
						{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
							{ name = "placeholder21_default", percent = 100 },		-- (Skin normal or _default Skin) 
						},
				},				
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "suv_basic",
			classes =
			{				
				{ 
					class = "placeholder8",	contents = "VehicleBasic4Wheels", -- Bmw
					skins = 
					{  -- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder8_black", percent = 10.0 },  -- (Skin are here ... )
						{ name = "placeholder8_blue", percent = 9.0  },
						{ name = "placeholder8_green", percent = 9.0 },
						{ name = "placeholder8_brgreen", percent = 9.0 },
						{ name = "placeholder8_orange", percent = 9.0  },
						{ name = "placeholder8_pink",	percent = 9.0 },
						{ name = "placeholder8_purple", percent = 9.0  },
						{ name = "placeholder8_red", percent = 9.0  },
						{ name = "placeholder8_silver", percent = 9.0 },
						{ name = "placeholder8_white", percent = 9.0 },
						{ name = "placeholder8_yellow", percent = 9.0 },
					},
				},        
				{
					class = "placeholder11", contents = "VehicleBasic4Wheels", --SHELBY GT500 Bicolor
					skins = 
					{  -- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder11_black", percent = 5.0 },  -- (Skin are here ... )
						{ name = "placeholder11_blackred", percent = 5.0 },
						{ name = "placeholder11_green", percent = 6.0 },
						{ name = "placeholder11_yellow", percent = 6.0 },
						{ name = "placeholder11_white", percent = 6.0 },
						{ name = "placeholder11_red", percent = 6.0 },
						{ name = "placeholder11_grey", percent = 6.0 },
						{ name = "placeholder11_blue", percent = 6.0 },
						{ name = "placeholder11_chrome", percent = 6.0 },
						{ name = "placeholder11_bluer", percent = 6.0 },
						{ name = "placeholder11_borange", percent = 6.0 },
						{ name = "placeholder11_greener", percent = 6.0 },
						{ name = "placeholder11_gunmetal", percent = 6.0 },
						{ name = "placeholder11_mandarin", percent = 6.0 },
						{ name = "placeholder11_orange", percent = 6.0 },
						{ name = "placeholder11_pink", percent = 6.0 },
						{ name = "placeholder11_yellower", percent = 6.0 },
					},
				},
				{
					class = "placeholder4", contents = "VehicleBasic4Wheels", --Porsche Cayene  --(Skin normal or _default, Yellow Skin) 
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder4_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},
				},
				{ 
					class = "placeholder6", contents = "VehicleBasic4Wheels",	--Alfa Romeo Yolo (Skin normal or _default Skin) 					
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder6_default", percent = 33.0 },  -- (Skin normal or _default Skin) 																						
						{ name = "placeholder6_black", percent = 34.0 },  -- (Skin normal or _default Skin)
						{ name = "placeholder6_grey", percent = 33.0 },  -- (Skin normal or _default Skin)
					}, 			
				},
				{ 
					class = "placeholder9", contents = "VehicleBasic4Wheels", --Jaguar XKR --(Skin normal,  _default or Zebra Skin)  
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder9_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},			
				},
				{
					class = "placeholder19", contents = "VehicleBasic4Wheels",     --BMW Patriot (Skin normal or _default Skin) 			
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder19_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},
				},
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

	
	 --THIS CATEGORY DOESN'T WORK. -- IMPORTANT: it doesn't WORK, however exists in Original VehicleSpawnerManager.lua. I think category suv_police doesn't exist (but class suv_police yes!)	
	 	------------------------------------------------
		------------------------------------------------
 			
	--[[   {
		category = "suv_police",
		classes =
		{
			{ class = "suv_police", contents = "VehicleBasic4Wheels" },
		},
		initialMinVehicles = 2,
		abandonedTimer = 172800,  -- two days
		abandonedRespawnTimer = 3600, -- one hour
		destroyedTimer = 120,
		destroyedRespawnTimer = 7200, -- two hours
	}, ]]

		------------------------------------------------
		------------------------------------------------
		{
			category = "towcar",
			classes =
			{				
				{ 
					class = "towcar", contents = "VehicleBasic4Wheels", -- Toyota Pickup 4x4 Thrulander		
					skins =    													-- (Skin normal, _black, Yellow or _default Skin) 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "towcar_empty", percent = 25.0  },	-- (Skin normal, _black, Yellow or _default Skin) 			 
					  { name = "towcar_default", percent = 25.0  },
					  { name = "towcar_Yellow", percent = 25.0  },
					  { name = "towcar_Black", percent = 25.0  },					  
					},			
				}, 
				{
				  class = "placeholder1",  contents = "VehicleBasic4Wheels",  -- Hammer 
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
					{ name = "placeholder1_Black", percent = 12.5  }, -- (Skin are here ... )
						{ name = "placeholder1_Brown", percent = 12.5  },
						{ name = "placeholder1_Camo5", percent = 12.5  },
						{ name = "placeholder1_Camo7", percent = 12.5  },
						{ name = "placeholder1_Gray", percent = 12.5  },
						{ name = "placeholder1_Green", percent = 12.5  },
						{ name = "placeholder1_Leopard", percent = 12.5  },
						--{ name = "placeholder1_Pink", percent = 10.0  },
						--{ name = "placeholder1_White", percent = 10.0  },
						{ name = "placeholder1_Yellow", percent = 12.5  },					  
					},
				},
				{
					class = "placeholder2", contents = "VehicleBasic4Wheels", -- 4x4OffRoad Turbo Ravager Weed
					skins = 
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder2_hex_black", percent = 14.0 },  -- (Skin are here ... )
						{ name = "placeholder2_hex_dark_red", percent = 14.0 },
						{ name = "placeholder2_hex_grey_green",  percent = 14.0 },
						{ name = "placeholder2_hex_yellow",  percent = 14.0 },
						{ name = "placeholder2_skulls_black", percent = 15.0 },
						{ name = "placeholder2_weed_camo_green",  percent = 14.0 },
						{ name = "placeholder2_weed_new", percent = 15.0 },		
					},
				},
				{
					class = "tractor",	contents = "RandomTractorContents", --4x4 Off road JackRam Up
					skins = 
					{ -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "tractor_black", percent = 11.0  }, -- (Skin are here ... )
					  { name = "tractor_blue", percent = 11.0  },
					  { name = "tractor_green", percent = 11.0  },
					  { name = "tractor_jetblack", percent = 12.0  },
					  { name = "tractor_orange", percent = 11.0  },
					  { name = "tractor_pink", percent = 11.0  },
					  { name = "tractor_purple", percent = 11.0  },
					  { name = "tractor_purpler", percent = 11.0  },
					  { name = "tractor_red", percent = 11.0  },
					},
				},						
			},
			initialMinVehicles = 30,
			abandonedTimer = 115200,  -- 32 Hours
			abandonedRespawnTimer = 600, -- 10 min. 
			destroyedTimer = 180,
			destroyedRespawnTimer = 600, -- 10 min. 
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "tractor",
			classes =
			{				
				{
					class = "tractor",	contents = "RandomTractorContents", --4x4 Off road JackRam Up
					skins = 
					{ -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					  { name = "tractor_black", percent = 11.0  }, -- (Skin are here ... )
					  { name = "tractor_blue", percent = 11.0  },
					  { name = "tractor_green", percent = 11.0  },
					  { name = "tractor_jetblack", percent = 12.0  },
					  { name = "tractor_orange", percent = 11.0  },
					  { name = "tractor_pink", percent = 11.0  },
					  { name = "tractor_purple", percent = 11.0  },
					  { name = "tractor_purpler", percent = 11.0  },
					  { name = "tractor_red", percent = 11.0  },
					},
				},
				{
					class = "placeholder2", contents = "VehicleBasic4Wheels", -- 4x4OffRoad Turbo Ravager Weed
					skins = 
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder2_hex_black", percent = 14.0 },  -- (Skin are here ... )
						{ name = "placeholder2_hex_dark_red", percent = 14.0 },
						{ name = "placeholder2_hex_grey_green",  percent = 14.0 },
						{ name = "placeholder2_hex_yellow",  percent = 14.0 },
						{ name = "placeholder2_skulls_black", percent = 15.0 },
						{ name = "placeholder2_weed_camo_green",  percent = 14.0 },
						{ name = "placeholder2_weed_new", percent = 15.0 },		
					},
				},
				{
					class = "dune_buggy", contents = "VehicleBasic4Wheels",  -- antic buggy
					skins =
					{   -- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "DuneBuggy_Black", percent = 5.0 }, -- (Skins here...) 
						{ name = "DuneBuggy_Blue", percent = 5.0 },
						{ name = "DuneBuggy_Brown",	percent = 5.0  },
						{ name = "DuneBuggy_Camo1", percent = 5.0  },
						{ name = "DuneBuggy_Camo2", percent = 5.0  },
						{ name = "DuneBuggy_Camo3", percent = 5.0  },
						{ name = "DuneBuggy_Camo4", percent = 5.0  },
						{ name = "DuneBuggy_Camo5", percent = 5.0  },
						{ name = "DuneBuggy_Camo6", percent = 5.0  },
						{ name = "DuneBuggy_Green", percent = 5.0 },
						{ name = "DuneBuggy_Light_Green", percent = 5.0  },
						{ name = "DuneBuggy_Light_Pink", percent = 5.0  },
						{ name = "DuneBuggy_Orange", percent = 5.0 }, -- Default
						{ name = "DuneBuggy_Pink", percent = 5.0 },
						{ name = "DuneBuggy_Purple", percent = 5.0 },
						{ name = "DuneBuggy_Red", percent = 5.0 },
						{ name = "DuneBuggy_Sky_Blue", percent = 5.0 }, 
						{ name = "DuneBuggy_White", percent = 5.0 },
						{ name = "DuneBuggy_Yellow", percent = 5.0 },
						{ name = "DuneBuggy_Zebra", percent = 5.0 },
					},
				},	
				{  class = "placeholder23",  contents = "VehicleBasic4Wheels",     --Swat_Van Black Special ARMORED car (Skin normal or _default Skin) 			
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder23_default", percent = 100 },		-- (Skin normal or _default Skin) 
					},
				},
				{
					class = "beetle", contents = "VehicleBasic4Wheels", -- Special Beetle
					 skins = 
					 { -- If the total doesn't equal 100% then the remainder will spawn with the default skin
					 { name = "beetle_super", percent = 9.0 }, -- (Skins here...) 
					 { name = "beetle_black", percent = 7.0 }, -- (Skins here...) 
					 { name = "beetle_blue", percent = 7.0 },
					 { name = "beetle_camo1", percent = 7.0 },
					 { name = "beetle_camo2", percent = 7.0 },
					 { name = "beetle_camo3", percent = 7.0 },
					 { name = "beetle_camo4", percent = 7.0 },
					 { name = "beetle_green", percent = 7.0 },
					 { name = "beetle_orange", percent = 7.0 },
					 { name = "beetle_pink", percent = 7.0 },
					 { name = "beetle_purple", percent = 7.0 },
					 { name = "beetle_red", percent = 7.0 },
					 { name = "beetle_white", percent = 7.0 },
					 { name = "beetle_yellow", percent = 7.0 },
					 },
				 },
				 { 
					class = "placeholder3", contents = "VehicleBasic4Wheels", --Jeep Willys
					skins =
					{
						{ name = "placeholder3_original", percent = 20.0 },
						{ name = "placeholder3_unmarked", percent = 20.0 },
						{ name = "placeholder3_black", percent = 20.0 },
						{ name = "placeholder3_green", percent = 20.0 },
						{ name = "placeholder3_yellow", percent = 20.0 },
					},
				},
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "truck_5ton",
			classes =
			{
				{ 
					class = "truck_5ton", contents = "VehicleBasic8Wheels",  -- TRUCK BR, 8 rodes
					skins =
					{
						{ name = "truck_5ton_default", percent = 100.0 },
					},
				},	-- (No Skins )	
				{
					class = "truck_semi", contents = "VehicleBasic6Wheels", -- TRUCK TANK MILITARY, necessita 6 rodes					
					skins =
					{
						{ name = "truck_semi_default", percent = 100.0 },
					},
				},		
				{
				  class = "placeholder10", contents = "VehicleBasic4Wheels",   --Lamborgini Hurakan Police FBI (Skin normal, _default or empty Skin) 
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder10_default2", percent = 50.0 },		 -- (Skin normal, _default or empty Skin) 	
						{ name = "placeholder10_empty", percent = 50.0 },												
					},
				},
				{  
					class = "placeholder23",  contents = "VehicleBasic4Wheels",     --Swat_Van Black Special ARMORED car (Skin normal or _default Skin) 	
					skins =
					{	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder23_default", percent = 100.0 },		 -- (Skin normal, _default or empty Skin) 																
					},						
				},			
				{   -- placeholder7 : Dodge police
				class = "placeholder7", contents = "VehicleBasic4Wheels",  --Dodge police -- (Skins _satin or _shiny) 
					skins = 
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder7_satin", percent = 50.0 },  -- (Skins _satin or _shiny) 
						{ name = "placeholder7_shiny",  percent = 50.0 },						
					},
		   		},			   		
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

		------------------------------------------------
		------------------------------------------------
		{
			category = "truck_semi",
			classes =
			{				
				{
					class = "truck_semi", contents = "VehicleBasic6Wheels", -- TRUCK TANK MILITARY, necessita 6 rodes					
					skins =
					{
						{ name = "truck_semi_default", percent = 100.0 },
					},
				},	
				{ 
					class = "truck_5ton", contents = "VehicleBasic8Wheels",  -- TRUCK BR, 8 rodes
					skins =
					{
						{ name = "truck_5ton_default", percent = 100.0 },
					},
				},	-- (No Skins )	
				{ 
					class = "placeholder24", contents = "VehicleBasic4Wheels",  -- armored truck army	
					skins = 
					{ 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						 { name = "placeholder24_default", percent = 100 },		-- (Skin normal or _default Skin) 
						--{ name = "placeholder24_camo1", percent = 50 },		
						--{ name = "placeholder24_camo2", percent = 100 },		
						--{ name = "placeholder24_camo3", percent = 20 },		
						--{ name = "placeholder24_camo4", percent = 20 },		
					},				
				},		
				{
					class = "placeholder1",  contents = "VehicleBasic4Wheels",  -- Hammer 
					  skins = 
				   { 	-- If the total doesn't equal 100% then the remainder will spawn with the default skin
				   { name = "placeholder1_Black", percent = 12.5  }, -- (Skin are here ... )
				   { name = "placeholder1_Brown", percent = 12.5  },
				   { name = "placeholder1_Camo5", percent = 12.5  },
				   { name = "placeholder1_Camo7", percent = 12.5  },
				   { name = "placeholder1_Gray", percent = 12.5  },
				   { name = "placeholder1_Green", percent = 12.5  },
				   { name = "placeholder1_Leopard", percent = 12.5  },
				   --{ name = "placeholder1_Pink", percent = 10.0  },
				   --{ name = "placeholder1_White", percent = 10.0  },
				   { name = "placeholder1_Yellow", percent = 12.5  },					  
				    },
				},		 	
				{
					class = "placeholder2", contents = "VehicleBasic4Wheels", -- 4x4OffRoad Turbo Ravager Weed
					skins = 
					{ 
						-- If the total doesn't equal 100% then the remainder will spawn with the default skin
						{ name = "placeholder2_hex_black", percent = 14.0 },  -- (Skin are here ... )
						{ name = "placeholder2_hex_dark_red", percent = 14.0 },
						{ name = "placeholder2_hex_grey_green",  percent = 14.0 },
						{ name = "placeholder2_hex_yellow",  percent = 14.0 },
						{ name = "placeholder2_skulls_black", percent = 15.0 },
						{ name = "placeholder2_weed_camo_green",  percent = 14.0 },
						{ name = "placeholder2_weed_new", percent = 15.0 },		
					},
				},									
			},
			initialMinVehicles = 30, 		-- 30 vehicles -- the minimum number of vehicles from this category that will exist on system startup
			abandonedTimer = 115200, 		-- 32 hours -- how long until an abandoned vehicle will be removed from gameplay (in seconds)
			abandonedRespawnTimer = 600, 	-- 10 min. -- how long until an removed for abandoned vehicle will respawn (in seconds)
			destroyedTimer = 180, 	-- 3 min. -- how long until a destroyed vehicle will be removed from gameplay (in seconds)
			destroyedRespawnTimer = 600, 	-- 10 min. -- how long until a destroyed vehicle will respawn (in seconds)
		},

	},
}

--------------------------------------------------------------------------
-- Functions called from C++
--------------------------------------------------------------------------
function VehicleSpawnerManager:OnInit()
	--Log("VehicleSpawnerManager:OnInit");

	self:OnReset();
end

------------------------------------------------------------------------------------------------------
-- OnPropertyChange called only by the editor.
------------------------------------------------------------------------------------------------------
function VehicleSpawnerManager:OnPropertyChange()
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnReset called only by the editor.
------------------------------------------------------------------------------------------------------
function VehicleSpawnerManager:OnReset()
	--Log("VehicleSpawnerManager:OnReset");
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnSpawn called Editor/Game.
------------------------------------------------------------------------------------------------------
function VehicleSpawnerManager:OnSpawn()	
	self:Reset();	
end

function VehicleSpawnerManager:Reset()
	--Log("VehicleSpawnerManager:Reset");	
end

-- Load mods
Script.LoadScriptFolder("scripts/spawners/vsm_mods", true, true)