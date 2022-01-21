ItemSpawnerManager =
{

--[[

Each item category below can either have a "classes" or a "group" table in it.
If it contains a "group", then the spawner will process ALL of the items in the group and attempt to spawn all of them.
Using a group allows you to spawn a group of items at once (like a weapon and ammo for it).
If it contains a "classes" then it will radomly pick just ONE of them to attempt to spawn.

Example:

	category = "RandomAttachments",
	group = -- tries to spawn ALL items below
	{
		{ class = "M40x5", percent = 25.0 }, -- 25% chance this item will be spawned
		{ class = "HuntingScope", percent = 5.0 }, -- 5% chance this item will be spawned
	},

{ class = "SchoolPackGreen", percent = 100 },

The percent can be accurate to 4 decimal places (.001) to make for rare item spawns (one in 1,000), but the categories can be nested,
so you can have for example a 1 in 1,000 chance for a category that has a 1 in 1,000 chance of an item so 1 in 1,000,000 in that case for a really rare spawn

Item Categories can be nested to allow for a great amount of variety when spawning items.

--------------

Item Contents:

To add contents to the storage space for an item when it is spawned you need to tell the storage
category that it has "contents", like this:

	{ class = "RuggedPack", contents="RandomBackpackContents", percent = 25 },

Then, when you define the contents category you can use the optional percent, min, and max attributes like so:

	category = "RandomBackpackContents",
	classes =
	{
		{ category = "RandomFood", percent = 15, min = 1, max = 4 },
	},

What the above does is if a "RuggedPack" is spawned then there is a 15% chance that it will spawn with between
1 and 4 "RandomFood" items. A first item is always guaranteed to be spawned, but each successive item's percent is
reduced to 25% of the prior item's, like so:

1st item = 100% to spawn
2nd item = 25% to spawn (if first item spawned)
3rd item = 6.25% to spawn (if second item spawned)
4th item = 1.5625% to spawn (if third item spawned)
...

--]]


	itemCategories =
	{
		-- ====================================================================
		-- BASIC CATEGORIES
		-- ====================================================================

		-- --------------------------------------------------------------------
		-- Static Spawners
		-- These are currently placed on the level to only spawn these items
		-- by the level designers
		-- --------------------------------------------------------------------

		-- --------------------------------------------------------------------
		-- FOR INTERNAL TESTING - DONT USE
		-- --------------------------------------------------------------------

		{
			category = "SpawnTest",
			classes =
			{
				{ class = "G18Pistol", contents="RandomM40A5Attachments", percent = 100 },
			},
		},

		{
			category = "RandomM40A5Attachments",
			group =
			{
				{ class = "9mmx10", percent = 100.0 },
			},
		},

				-- --------------------------------------------------------------------
		-- Lobster cage nz                                                                  --------------NationZ
		-- --------------------------------------------------------------------
		{
			category = "RandomLobsterLoot",
			classes =
			{
		        { class = "trout_nz", percent = 50 },
		        { class = "Seaweed", percent = 20 },
		        { class = "trout_nzRotten", percent = 30 },
			},
		},
		
		-- --------------------------------------------------------------------
		-- castor cage nz
		-- --------------------------------------------------------------------
		{
			category = "RandomCastorLoot",
			classes =
			{
		        { class = "castor_nz", percent = 50 },
		        { category = "RandomSeeds", percent = 30 },
		        { class = "castor_nzRotten", percent = 20 },
			},
		},

		-- --------------------------------------------------------------------
		-- rat cage nz
		-- --------------------------------------------------------------------
		{
			category = "RandomRatLoot",
			classes =
			{
		        { class = "rat_nz", percent = 50 },
		        { category = "CerealBox", percent = 20 },
		        { class = "rat_nzRotten", percent = 30 },
			},
		},
		
		
		
		-- --------------------------------------------------------------------
		-- rabbit cage nz
		-- --------------------------------------------------------------------
		{
			category = "RandomRabbitLoot",
			classes =
			{
		        { class = "rabbit_nz", percent = 50 },
		        { category = "RandomVeggie", percent = 30 },
		        { class = "rabbit_nzRotten", percent = 20 },
			},
		},
		
		
		-- --------------------------------------------------------------------
		-- Snake cage nz
		-- --------------------------------------------------------------------
		{
			category = "RandomSnakeLoot",
			classes =
			{
		        { class = "snake_nz", percent = 50 },
		        { class = "EggChickenRotten", percent = 30 },
		        { class = "snake_nzRotten", percent = 20 },
			},
		},
		
		-- --------------------------------------------------------------------
		-- squirrel cage nz
		-- --------------------------------------------------------------------
		{
			category = "RandomSquirrelLoot",
			classes =
			{
		        { class = "squirrel_nz", percent = 50 },
		        { class = "NutSpread", percent = 20 },
		        { class = "squirrel_nzRotten", percent = 30 },
			},
		},
		
		-- --------------------------------------------------------------------
		-- Turtle cage nz
		-- --------------------------------------------------------------------
		{
			category = "RandomTurtleLoot",
			classes =
			{
		        { class = "turtle_nz", percent = 50 },
		        { category = "ClamSingle", percent = 30 },
		        { class = "turtle_nzRotten", percent = 20 },
			},
		},
				
		-- --------------------------------------------------------------------
		-- Chicken Coop nz
		-- --------------------------------------------------------------------
		{
			category = "RandomChickenCoopLoot",
			classes =
			{
		        { class = "EggChicken", percent = 70 },
		        { class = "EggChickenRotten", percent = 20 },
		        { class = "ChickenRotten", percent = 10 },
			},
		},		

		-- --------------------------------------------------------------------
		-- Pig Pen nz                                                                          -------------NationZ
		-- --------------------------------------------------------------------
		{
			category = "RandomPigpenLoot",
			classes =
			{
		        { category = "RandomRottenVeggie", percent = 50 },
		        { class = "rat_nzRotten", percent = 20 },
		        { class = "BioFuel", percent = 30 },
			},
		},



			-- --------------------------------------------------------------------
		-- Return 1 Ramdom SWORD For UFO
		-- --------------------------------------------------------------------

		{
		    category = "RandomChainMEtalPartBuilding",  
			classes =
			{
				{ class = "4mx6m_chainlink_01", percent = 10, min = 3, max = 5 },	
				{ class = "barbwire_fence_placeable_swinging_gate_posts", percent = 10, min = 3, max = 5 },				
				{ class = "barbwire_fence_placeable_swinging_gate_right", percent = 10, min = 3, max = 5 },	
				{ class = "fence_chainlink_placeable_door", percent = 10, min = 3, max = 5 },	
				{ class = "barbwire_fence_placeable_pole", percent = 10, min = 3, max = 5 },	
				{ class = "barbwire_fence_placeable_corner_b", percent = 10, min = 3, max = 5 },	
				{ class = "barbwire_fence_placeable_2m", percent = 10, min = 3, max = 5 },	
				{ class = "metal_gate_lockable_6m_5_4m", percent = 10, min = 3, max = 5 },	
				{ class = "metal_gatehouse_8m_8m", percent = 10, min = 3, max = 5 },							
				{ class = "sliding_gate_frame_double", percent = 10, min = 3, max = 5 },				
				{ class = "sliding_gate_door_wall_2x4", percent = 10, min = 3, max = 5 },	
				{ class = "sliding_gate_door_double_wall_2x8", percent = 10, min = 3, max = 5 },	
				{ class = "sliding_gate_door_double", percent = 10, min = 3, max = 5 },		
			},
		},


		{
		    category = "RandomConcretePartBuilding",
			classes =
			{
				{ class = "concrete_wall_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_3m_4m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_3m_4m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_3m_4m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_3m_2m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_3m_2m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_3m_2m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_3m_2m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_door_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_door_3m_4m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_door_3m_4m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_door_3m_4m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_window_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_window_3m_4m_black", percent = 10, min = 3, max = 5 },                            
				{ class = "concrete_wall_window_3m_4m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_wall_window_3m_4m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3x3m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3x3m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3x3m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_3x3m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_2m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_2m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_2m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_halfwall1_2m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_4m_4m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_4m_4m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_4m_4m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_4m_4m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_3m_4m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_3m_4m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_3m_4m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_16m_16m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_16m_16m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_16m_16m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_platform_16m_16m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_foundation_4m_4m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_foundation_4m_4m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_foundation_4m_4m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_foundation_4m_4m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_1m_3m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_1m_3m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_1m_3m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_1m_3m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_2m_1_3m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_2m_1_3m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_2m_1_3m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_stairs_2m_1_3m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_roof", percent = 10, min = 3, max = 5 },
				{ class = "concrete_roof_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_roof_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_roof_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_c_shape", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_column", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_corner", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_c_shape_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_column_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_corner_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_c_shape_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_column_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_corner_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_c_shape_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_column_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_room_corner_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs_3m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs_3m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs_3m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs_3m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs2_3m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs2_3m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs2_3m_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_block_stairs2_3m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_es_drawbridge_gate", percent = 10, min = 3, max = 5 },
				{ class = "concrete_es_drawbridge_gate_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_es_drawbridge_gate_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_es_drawbridge_gate_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gatehouse_gate", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gatehouse_gate_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gatehouse_gate_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gatehouse_gate_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_z", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_z_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_z_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_z_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_down", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_down_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_down_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_gate_down_gold", percent = 10, min = 3, max = 5 },
				{ class = "concrete_slideplatform_4x4", percent = 10, min = 3, max = 5 },
				{ class = "concrete_slidewall_x_3x4", percent = 10, min = 3, max = 5 },
				{ class = "concrete_slidewall_y_3x4", percent = 10, min = 3, max = 5 },
				{ class = "concrete_spinwall_3x4", percent = 10, min = 3, max = 5 },  
				{ class = "concrete_es_drawbridge_8m", percent = 10, min = 3, max = 5 },
				{ class = "concrete_es_drawbridge_8m_white", percent = 10, min = 3, max = 5 },
				{ class = "concrete_es_drawbridge_8m_black", percent = 10, min = 3, max = 5 },
				{ class = "concrete_es_drawbridge_8m_gold", percent = 10, min = 3, max = 5 },	
				
			},
		},

		{
		    category = "RandomTitanPartBuilding",
			classes =
			{
				{ class = "titanium_wall_3m_2m", percent = 10, min = 3, max = 5 },				
				{ class = "titanium_wall_3m_2m_window", percent = 10, min = 3, max = 5 },	
				{ class = "titanium_wall_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "titanium_wall_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "titanium_wall_3m_4m_window", percent = 10, min = 3, max = 5 },	
				{ class = "titanium_angled_roof_3x4x4", percent = 10, min = 3, max = 5 },				
				{ class = "titanium_platform_3m_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "titanium_platform_3m_4m_4m_stairs", percent = 10, min = 3, max = 5 },	
				{ class = "titanium_platform_3m_8m_8m", percent = 10, min = 3, max = 5 },	
				{ class = "door_titanium", percent = 10, min = 3, max = 5 },	
				{ class = "titanium_crenelation", percent = 10, min = 3, max = 5 },				
				{ class = "titanium_column_3m", percent = 10, min = 3, max = 5 },	
				
				
			},
		},

		{
		    category = "RandomMarblePartBuilding",
			classes =
			{
				{ class = "marble_crenelation_blue", percent = 10, min = 3, max = 5 },				
				{ class = "marble_crenelation_green", percent = 10, min = 3, max = 5 },	
				{ class = "marble_platform_black_3m_4m_4m_stairs", percent = 10, min = 3, max = 5 },	
				{ class = "marble_platform_blue_3m_4m_4m_stairs", percent = 10, min = 3, max = 5 },	
				{ class = "marble_platform_black_3m_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "marble_platform_green_3m_4m_4m", percent = 10, min = 3, max = 5 },				
				{ class = "marble_foundation_green_4m_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "marble_foundation_blue_4m_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "marble_foundation_black_4m_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "marble_foundation_4m_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "marble_angled_roof_blue_3x4x4", percent = 10, min = 3, max = 5 },				
				{ class = "marble_angled_roof_green_3x4x4", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_green_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_green_3m_4m_window", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_green_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_black_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_black_3m_4m_window", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_black_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "marble_wall_blue_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_blue_3m_4m_window", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_blue_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "marble_wall_3m_4m", percent = 10, min = 3, max = 5 },				
				{ class = "marble_wall_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "marble_wall_3m_4m_window", percent = 10, min = 3, max = 5 },		
				
				
			},
		},

		{
		    category = "RandomPlasteredPartBuilding",
			classes =
			{
				{ class = "plastered_crenelation_blue", percent = 10, min = 3, max = 5 },				
				{ class = "plastered_crenelation_green", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_platform_black_3m_4m_4m_stairs", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_platform_blue_3m_4m_4m_stairs", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_platform_black_3m_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_platform_green_3m_4m_4m", percent = 10, min = 3, max = 5 },											
				{ class = "plastered_angled_roof_blue_3x4x4", percent = 10, min = 3, max = 5 },				
				{ class = "plastered_angled_roof_green_3x4x4", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_green_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_green_3m_4m_window", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_green_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_black_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_black_3m_4m_window", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_black_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "plastered_wall_blue_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_blue_3m_4m_window", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_blue_3m_4m", percent = 10, min = 3, max = 5 },
				{ class = "plastered_wall_3m_4m", percent = 10, min = 3, max = 5 },				
				{ class = "plastered_wall_3m_4m_door", percent = 10, min = 3, max = 5 },	
				{ class = "plastered_wall_3m_4m_window", percent = 10, min = 3, max = 5 },	
				
			},
		},


		{
		    category = "RandomGlassPartBuilding",
			classes =
			{
				{ class = "glass_doorway_3m_2m", percent = 10, min = 3, max = 5 },				
				{ class = "glass_doorway_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_doorway_3m_4m_side", percent = 10, min = 3, max = 5 },	
				{ class = "glass_doorway_3m_4m_v2", percent = 10, min = 3, max = 5 },	
				{ class = "glass_doorway_3m_8m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_1_3m_2m", percent = 10, min = 3, max = 5 },				
				{ class = "glass_wall_1_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_1_3m_8m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_1_3m_12m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_1_3m_16m", percent = 10, min = 3, max = 5 },
				{ class = "glass_wall_2m_2m", percent = 10, min = 3, max = 5 },				
				{ class = "glass_wall_2m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_2m_8m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_2m_12m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_2m_16m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_3m_2m", percent = 10, min = 3, max = 5 },				
				{ class = "glass_wall_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_3m_8m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_3m_12m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_wall_3m_16m", percent = 10, min = 3, max = 5 },	
				{ class = "glass_door_2m_1m", percent = 10, min = 3, max = 5 },				
				{ class = "glass_door_3m_2m", percent = 10, min = 3, max = 5 },			
			},
		},
		

		{
		    category = "RandomRockPartBuilding",
			classes =
			{
				{ class = "rock_doorway_3m_4m", percent = 10, min = 3, max = 5 },				
				{ class = "rock_wall_3m_2m", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_4m_2m", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_4m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_window_3m_2m", percent = 10, min = 3, max = 5 },				
				{ class = "rock_wall_window_3m_4m", percent = 10, min = 3, max = 5 },	
				{ class = "rock_doorway_3m_4m_beamless", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_3m_2m_beamless", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_3m_4m_beamless", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_4m_2m_beamless", percent = 10, min = 3, max = 5 },				
				{ class = "rock_wall_4m_4m_beamless", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_window_3m_2m_beamless", percent = 10, min = 3, max = 5 },	
				{ class = "rock_wall_window_3m_4m_beamless", percent = 10, min = 3, max = 5 },	
			},
		},

		{
		    category = "RandomDoorPartBuilding",
			classes =
			{
				{ class = "door_titanium", percent = 10, min = 3, max = 5 },		
				{ class = "metal_door_lockable_1m_2m", percent = 10, min = 3, max = 5 },
				{ class = "door_glass_white", percent = 10, min = 3, max = 5 },
				{ class = "porkchop_celldoor_lockable", percent = 10, min = 3, max = 5 },
				{ class = "door_wood_white", percent = 10, min = 3, max = 5 },
				{ class = "door_wood_brown", percent = 10, min = 3, max = 5 },			
				{ class = "door_wood_white_dirty", percent = 10, min = 3, max = 5 },
				{ class = "dws_celldoor", percent = 10, min = 3, max = 5 },
				{ class = "purnelium_door_base", percent = 10, min = 3, max = 5 },
				{ class = "dws_3_Room_Singlestory_BackDoor", percent = 10 },
				{ class = "dws_24store_door_left", percent = 10, min = 3, max = 5 },			
				{ class = "dws_blind_door", percent = 10, min = 3, max = 5 },
				{ class = "dws_Church_MainDoors_Left", percent = 10, min = 3, max = 5 },
				{ class = "dws_cubicles_door", percent = 10, min = 3, max = 5 },
				{ class = "dws_corner_door", percent = 10, min = 3, max = 5 },
				{ class = "dws_darkwood_door1", percent = 10, min = 3, max = 5 },			
				{ class = "dws_farm_gate", percent = 10, min = 3, max = 5 },
				{ class = "dws_gasstationdoors", percent = 10, min = 3, max = 5 },
				{ class = "dws_flatbed_trailer_container_doorleft", percent = 10, min = 3, max = 5 },
				{ class = "dws_FlatWhite_Door", percent = 10, min = 3, max = 5 },
				{ class = "dws_Fridge_old_Doors_left", percent = 10, min = 3, max = 5 },			
				{ class = "dws_front_door_01_right", percent = 10, min = 3, max = 5 },
				{ class = "dws_hospital_door", percent = 10, min = 3, max = 5 },
				{ class = "dws_int_door", percent = 10, min = 3, max = 5 },
				{ class = "dws_hotel_door_left", percent = 10, min = 3, max = 5 },
				{ class = "dws_lockerDoor", percent = 10, min = 3, max = 5 },			
				{ class = "dws_mobilehome_door", percent = 10, min = 3, max = 5 },
				{ class = "dws_shipping_Container_LeftDoor", percent = 10, min = 3, max = 5 },
				{ class = "dws_warehouse_door_small", percent = 10, min = 3, max = 5 },
				{ class = "dws_warehouse1_door_big", percent = 10, min = 3, max = 5 },
			},
		},

	

		-- --------------------------------------------------------------------
		-- Return 1 Ramdom SWORD For UFO
		-- --------------------------------------------------------------------

		{
		    category = "RandomSword",
			classes =
			{
				{ class = "sword1", percent = 8 },				
				{ class = "sword2", percent = 10 },	
				{ class = "sword3", percent = 10 },	
				{ class = "sword4", percent = 10 },	
				{ class = "sword5", percent = 10 },	
				{ class = "sword6", percent = 10 },				
				{ class = "sword7", percent = 10 },	
				{ class = "sword8", percent = 10 },	
				{ class = "sword9", percent = 10 },	
				{ class = "sword10", percent = 10 },	
				
				
			},
		},

		-- --------------------------------------------------------------------
		-- Return 1 Ramdom Weapon SKIN
		-- --------------------------------------------------------------------

		{
			category = "RandomAT15Skin",
			classes =
			{
				{ class = "AT15", percent = 8 },
				{ class = "at15_desert_camo", percent = 10 },
				{ class = "at15_painted_blue", percent = 10 },
				{ class = "at15_painted_orange", percent = 10 },
				{ class = "at15_painted_red", percent = 10 },
				{ class = "at15_pixel_grey", percent = 10 },
				{ class = "at15_zebra_blue", percent = 10 },
				{ class = "at15_zebra_green", percent = 10 },
				{ class = "at15_zebra_red", percent = 10 },
				{ class = "at15_zebra_yellow", percent = 10 },
				{ class = "at15_tech_camo_red_yellow", percent = 10 },
		},
	},

	{
		category = "RandomDT12Skin",
		classes =
		{

			{ class = "DT12", percent = 8 },
			{ class = "dt12_silver", percent = 10 },
			{ class = "dt12_gold", percent = 10 },
			{ class = "dt12_bronze", percent = 10 },
			{ class = "dt12_black", percent = 10 },
			{ class = "dt12_nightop", percent = 10 },
			{ class = "dt12_urbanblue", percent = 10 },
			{ class = "dt12_woodland", percent = 10 },
		},
	},

	{
		category = "RandomR90Skin",
		classes =
		{
			{ class = "R90", percent = 8 },
			{ class = "r90_birdcamo", percent = 10 },
			{ class = "r90_desertcamo", percent = 10 },
			{ class = "r90_digitalcamo", percent = 10 },
			{ class = "r90_hexcamo", percent = 10 },
			{ class = "r90_hexgreen", percent = 10 },
			{ class = "r90_leafcamo", percent = 10 },
			{ class = "r90_marpatcamo", percent = 10 },
			{ class = "r90_retroblue", percent = 10 },
			{ class = "r90_scorchedearth", percent = 10 },		
		},
	},

	{
		category = "RandomM16Skin",
		classes =
		{
			{ class = "M16", percent = 8 },
			{ class = "m16_desert_camo", percent = 10 },
			{ class = "m16_desert_camo1", percent = 10 },		
			{ class = "m16_military_desert", percent = 10 },
			{ class = "m16_military_green", percent = 10 },
			{ class = "m16_orange", percent = 10 },
			{ class = "m16_red", percent = 10 },
			{ class = "m16_white", percent = 10 },
			{ class = "m16_woodland_camo", percent = 10 },
			{ class = "m16_yellow", percent = 10 },
		},
	},


	{
			category = "RandomAK5DSkin",
			classes =
			{
				{ class = "AK5D", percent = 8 },
				{ class = "ak5d_desert_camo", percent = 10 },
				{ class = "ak5d_urban_camo", percent = 10 },
				{ class = "ak5d_tile_red", percent = 10 },
				{ class = "ak5d_tile_orange", percent = 10 },
				{ class = "ak5d_tile_yellow", percent = 10 },
				{ class = "ak5d_tile_green", percent = 10 },
				{ class = "ak5d_hex_grey", percent = 10 },
				{ class = "ak5d_tile_blue", percent = 10 },
				{ class = "ak5d_stripes_warning", percent = 10 },
				{ class = "ak5d_military_tan", percent = 10 },
		},
	},
	{
			category = "RandomAA12Skin",
			classes =
			{
				{ class = "AA12", percent = 8 },
				{ class = "AA12CamoSprayWoodland", percent = 10 },
				{ class = "AA12DigitalCamoUrban", percent = 10 },
		},
	},
	{
			category = "RandomAK74USkin",
			classes =
			{
				{ class = "AK74U", percent = 8 },
				{ class = "ak74u_birdscamo", percent = 10 },
				{ class = "ak74u_gold", percent = 10 },
				{ class = "ak74u_greencamo", percent = 10 },
				{ class = "ak74u_hexcamo", percent = 10 },
				{ class = "ak74u_leafcamo", percent = 10 },
				{ class = "ak74u_marpatcamo", percent = 10 },
				{ class = "ak74u_splatter", percent = 10 },
				{ class = "ak74u_retroblue", percent = 10 },
				{ class = "ak74u_skulls", percent = 10 },
		},
	},
	{
			category = "RandomAKMSkin",
			classes =
			{
				{ class = "AKM", percent = 8 },
				{ class = "akm_painted_orange", percent = 10 },
				{ class = "akm_painted_red", percent = 10 },
				{ class = "akm_pixel_orange", percent = 10 },
				{ class = "akm_pixel_yellow", percent = 10 },
				{ class = "akm_tile_grey", percent = 10 },
				{ class = "akm_tile_red", percent = 10 },
				{ class = "akm_pixel_blue", percent = 10 },
				{ class = "akm_zebra_blue", percent = 10 },
				{ class = "akm_zebra_green", percent = 10 },
				{ class = "akm_woodland_camo", percent = 10 },
				{ class = "akm_urban_camo", percent = 10 },
		},
	},
	{
			category = "RandomAKValSkin",
			classes =
			{
				{ class = "AKVal", percent = 8 },
				{ class = "asval_camo_desert", percent = 10 },
				{ class = "asval_camo_urban", percent = 10 },
				{ class = "asval_camo_woodland", percent = 10 },
				{ class = "asval_military_green", percent = 10 },
				{ class = "asval_military_tan", percent = 10 },
				{ class = "asval_painted_orange", percent = 10 },
				{ class = "asval_painted_red", percent = 10 },
				{ class = "asval_stripes_blue", percent = 10 },
				{ class = "asval_tile_blue", percent = 10 },
				{ class = "asval_zebra_green", percent = 10 },
				{ class = "asval_zebra_red", percent = 10 },
		},
	},
	{
			category = "RandomBulldogSkin",
			classes =
			{
				{ class = "Bulldog", percent = 8 },
				{ class = "bulldog_birdscamo", percent = 10 },
				{ class = "bulldog_chochipcamo", percent = 10 },
				{ class = "bulldog_greencamo", percent = 10 },
				{ class = "bulldog_greenhex", percent = 10 },
				{ class = "bulldog_greenhexcamo", percent = 10 },
		},
	},
	{
			category = "RandomKrissVSkin",
			classes =
			{
				{ class = "KrissV", percent = 8 },
				{ class = "KrissVGamblersCamo", percent = 10 },
		},
	},
	{
			category = "RandomM97VSkin",
			classes =
			{
				{ class = "M97", percent = 8 },
				{ class = "m97_painted_green", percent = 10 },
				{ class = "m97_painted_tan", percent = 10 },
				{ class = "m97_silver", percent = 10 },
				{ class = "m97_urban_camo", percent = 10 },
				{ class = "m97_woodland_camo", percent = 10 },
		},
	},
	{
			category = "RandomMk18Skin",
			classes =
			{
				{ class = "Mk18", percent = 8 },
				{ class = "Mk18Reaver", percent = 10 },		
				{ class = "mk18_blue", percent = 10 },
				{ class = "mk18_desert_camo", percent = 10 },
				{ class = "mk18_gradient_pixel_blue", percent = 10 },
				{ class = "mk18_gradient_pixel_red", percent = 10 },
				{ class = "mk18_gradient_pixel_yellow", percent = 10 },		
				{ class = "mk18_military_green1", percent = 10 },
				{ class = "mk18_orange", percent = 10 },
				{ class = "mk18_pixel_white", percent = 10 },
				{ class = "mk18_woodland_camo", percent = 10 },
		},
	},
	{
			category = "RandomMP5Skin",
			classes =
			{
				{ class = "MP5", percent = 8 },
				{ class = "mp5_desert_camo", percent = 10 },
				{ class = "mp5_military_green", percent = 10 },
				{ class = "mp5_painted_blue", percent = 10 },
				{ class = "mp5_painted_orange", percent = 10 },
				{ class = "mp5_painted_red", percent = 10 },
				{ class = "mp5_woodland_camo", percent = 10 },
		},
	},
	{
			category = "RandomSAS12Skin",
			classes =
			{
				{ class = "SAS12", percent = 8 },
				{ class = "spas12_blue", percent = 10 },
				{ class = "spas12_desert_camo", percent = 10 },
				{ class = "spas12_jurrasic", percent = 10 },
				{ class = "spas12_military_green", percent = 10 },
				{ class = "spas12_red", percent = 10 },
				{ class = "spas12_warning_stripes", percent = 10 },
				{ class = "spas12_zebra_grey", percent = 10 },
				{ class = "spas12_yellow", percent = 10 },
		},
	},
	{
			category = "RandomCX4StormSkin",
			classes =
			{
				{ class = "CX4Storm", percent = 8 },
				{ class = "CX4Storm_desert", percent = 10 },
				{ class = "CX4Storm_green", percent = 10 },
				{ class = "CX4Storm_grey", percent = 10 },
				{ class = "CX4Storm_nightop", percent = 10 },
				{ class = "CX4Storm_urbanblue", percent = 10 },
				{ class = "CX4Storm_urban", percent = 10 },
				{ class = "CX4Storm_woodland", percent = 10 },
		},
	},
	{
			category = "RandomAUMP45Skin",
			classes =
			{
				{ class = "AUMP45", percent = 8 },
				{ class = "aump45_birdscamo", percent = 10 },
				{ class = "aump45_digitalcamo", percent = 10 },
				{ class = "aump45_hexcamo", percent = 10 },
				{ class = "aump45_hexgreen", percent = 10 },
				{ class = "aump45_leafcamo", percent = 10 },
				{ class = "aump45_marpatcamo", percent = 10 },
				{ class = "aump45_scorchedearth", percent = 10 },
				{ class = "aump45_skulls", percent = 10 },
				{ class = "aump45_urbangreen", percent = 10 },
		},
	},


		-- --------------------------------------------------------------------
		-- Return 1 Ramdom INVOKERS
		-- --------------------------------------------------------------------

		{
		    category = "RandomLastInvokers",
			classes =
			{
				{ class = "HealInvoker", percent = 11 },					
				{ class = "CorpseInvoker", percent = 11 },				
				{ class = "TeleportInvoker", percent = 11 },					
				{ class = "ZonePlayerInvoker", percent = 11 },	
				{ class = "AirCrashPlaceInvoker", percent = 11 },				
				{ class = "AirdropPlaceInvoker", percent = 11 },	
				{ class = "UFOPlaceInvoker", percent = 11 },
				{ class = "BaseInfoInvoker", percent = 11 },				
				{ class = "CarInvoker", percent = 11 },	
				{ class = "AirCrashInvoker", percent = 10 },	
				{ class = "UFOInvoker", percent = 10 },			
				{ class = "AirdropInvoker", percent = 10 },				
				{ class = "ElevationInvoker", percent = 10 },					
				{ class = "InvisibleInvoker", percent = 10 },					
				{ class = "ViewallInvoker", percent = 10 },	
				{ class = "BlindInvoker", percent = 10 },
			},
		},


		-- --------------------------------------------------------------------
		-- Return Ramdom CCTV Amalgamated Terminal
		-- --------------------------------------------------------------------

		{
		    category = "RandomCCTV",
			classes =
			{
				{ class = "SCAAMGameFloppyDisk", percent = 10 },				
				{ class = "SCAAMAppFloppyDisk", percent = 10 },
				{ class = "SCAAMCCTVCamera", percent = 10 },
				{ class = "SCAAMAmalgamatedTerminal_packed", percent = 10 },
				{ class = "SCAAMShovel", percent = 10 },
				{ class = "SCAAMEncryptedFloppyDisk", percent = 0.5 },
			},
		},


		-- --------------------------------------------------------------------
		-- Return Ramdom Last Shot Unique WEAPONS with their items
		-- --------------------------------------------------------------------
		
		
		{
			category = "RandomBestWeaponsComplete",   -- 6 slots
			classes =
			{								
				{ category = "G36CComplete", percent = 30 },
				{ category = "AK5CComplete", percent = 30 },
				{ category = "M16ColtComplete", percent = 30 },	
				{ category = "GrimReaperVenomComplete", percent = 30 },
				{ category = "acawghillieComplete", percent = 30 },
				{ category = "akmblackComplete", percent = 30 },			
				{ category = "at15fireComplete", percent = 30 },
				{ category = "M249FlareComplete", percent = 30 },
				{ category = "m40a5darkComplete", percent = 30 },
				{ category = "m4a1LekiComplete", percent = 30 },
				{ category = "Mk18ReaverComplete", percent = 30 },
				{ category = "AKMGoldComplete", percent = 30 },
				{ category = "startergunComplete", percent = 30 },
				{ category = "m14ebrComplete", percent = 30 },
				{ category = "RocketLauncherNewComplete", percent = 30 },								
				{ category = "mk18extremeComplete", percent = 30 },
				{ category = "RPKComplete", percent = 30 },	
				{ category = "M16VietnamComplete", percent = 30 },	
				{ category = "M50Complete", percent = 30 },
				{ category = "KriptonComplete", percent = 30 },	
				{ category = "VSSComplete", percent = 30 },				
				{ category = "KrissVK10Complete", percent = 30 },
				{ category = "SubjugatorComplete", percent = 30 },				
				{ category = "BulldogSA80Complete", percent = 30 },
				{ category = "AUMP45WarsComplete", percent = 30 },
				{ category = "R90TacticalComplete", percent = 30 },						
			},
		},	


		
		{
			category = "RandomBestWeaponsCompleteNew",   -- 6 slots, for preventing the same item we created the second method
			classes =
			{								
				{ category = "HK416Complete", percent = 30 },
				{ category = "AKAlfaComplete", percent = 30 },
				{ category = "FamasComplete", percent = 30 },
				{ category = "MilkorComplete", percent = 30 },
				{ category = "MG140Complete", percent = 30 },
				{ category = "AUGA3Complete", percent = 30 },
				{ category = "ACR3Complete", percent = 30 },
				{ category = "SigMPXComplete", percent = 30 },
				{ category = "TavorComplete", percent = 30 },
				{ category = "SAR21Complete", percent = 30 },
				{ category = "SVLK-14SComplete", percent = 30 },
				{ category = "SV-98Complete", percent = 30 },
			},
		},	


		{
			category = "RandomBestWeaponsCompleteAll",   -- 6 slots, for preventing the same item we created the second method
			classes =
			{								
				{ category = "HK416Complete", percent = 30 },
				{ category = "AKAlfaComplete", percent = 30 },
				{ category = "FamasComplete", percent = 30 },
				{ category = "MilkorComplete", percent = 30 },
				{ category = "MG140Complete", percent = 30 },
				{ category = "AUGA3Complete", percent = 30 },		
				{ category = "GrimReaperVenomComplete", percent = 30 },
				{ category = "acawghillieComplete", percent = 30 },
				{ category = "akmblackComplete", percent = 30 },
				{ category = "at15fireComplete", percent = 30 },
				{ category = "M249FlareComplete", percent = 30 },
				{ category = "m40a5darkComplete", percent = 30 },
				{ category = "m4a1LekiComplete", percent = 30 },
				{ category = "SubjugatorComplete", percent = 30 },				
				{ category = "startergunComplete", percent = 30 },
				{ category = "m14ebrComplete", percent = 30 },
				{ category = "ACR3Complete", percent = 30 },
				{ category = "SigMPXComplete", percent = 30 },
				{ category = "Mk18ReaverComplete", percent = 30 },
				{ category = "AKMGoldComplete", percent = 30 },
				{ category = "TavorComplete", percent = 30 },
				{ category = "SAR21Complete", percent = 30 },
				{ category = "SVLK-14SComplete", percent = 30 },
				{ category = "SV-98Complete", percent = 30 },
				{ category = "RocketLauncherNewComplete", percent = 30 },									
				{ category = "mk18extremeComplete", percent = 30 },
				{ category = "RPKComplete", percent = 30 },	
				{ category = "M16VietnamComplete", percent = 30 },	
				{ category = "M50Complete", percent = 30 },
				{ category = "KriptonComplete", percent = 30 },	
				{ category = "VSSComplete", percent = 30 },				
				{ category = "KrissVK10Complete", percent = 30 },
				{ category = "BulldogSA80Complete", percent = 30 },
				{ category = "AUMP45WarsComplete", percent = 30 },
				{ category = "R90TacticalComplete", percent = 30 },
				{ category = "G36CComplete", percent = 30 },
				{ category = "AK5CComplete", percent = 30 },
				{ category = "M16ColtComplete", percent = 30 },				
			},
		},	


		-- --------------------------------------------------------------------
		-- Return Complete Last Shot Unique WEAPONS with their items
		-- --------------------------------------------------------------------

		
		{ 
			category = "SubjugatorComplete",
			group =
			{
				{ class = "Subjugator", percent = 100 },
				{ class = "m14x40", percent = 100 },
				{ class = "m14x40", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },				
			},
		},

	

		{ 
			category = "Mk18ReaverComplete",
			group =
			{
				{ class = "Mk18Reaver", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },				
			},
		},


		{ 
			category = "AKMGoldComplete",
			group =
			{
				{ class = "AKMGold", percent = 100 },
				{ category = "Random762Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },				
			},
		},



		{ 
			category = "AK5CComplete",
			group =
			{
				{ class = "AK5C", percent = 100 },
				{ class = "556x50_ak5d", percent = 100 },			
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },				
			},
		},


		{ 
			category = "M16ColtComplete",
			group =
			{
				{ class = "M16Colt", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },	
			},
		},



		{ 
			category = "G36CComplete",
			group =
			{
				{ class = "G36C", percent = 100 },
				{ class = "g36cx50", percent = 100 },						
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },	
			},
		},


		{ 
			category = "KrissVK10Complete",
			group =
			{
				{ class = "KrissVK10", percent = 100 },
				{ class = "10mmx60", percent = 100 },							
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },		
			},
		},

		{ 
			category = "BulldogSA80Complete",
			group =
			{
				{ class = "BulldogSA80", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },		
			},
		},

		{ 
			category = "AUMP45WarsComplete",
			group =
			{
				{ class = "AUMP45Wars", percent = 100 },
				{ class = "acp_45x60", percent = 100 },						
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },	
			},
		},

		{ 
			category = "R90TacticalComplete",
			group =
			{
				{ class = "R90Tactical", percent = 100 },
				{ class = "57x80", percent = 100 },				
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },	
			},
		},

		{ 
			category = "mk18extremeComplete",
			group =
			{
				{ class = "mk18extreme", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },		
			},
		},


		{ 
			category = "RPKComplete",
			group =
			{
				{ class = "RPK", percent = 100 },								
				{ category = "Random762Mag", percent = 100 },					
				{ category = "RandomPSOScope", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },	
			},
		},
		

		{ 
			category = "RocketLauncherNewComplete",
			group =
			{
				{ class = "RocketLauncherNew", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },
				{ class = "Pile_Rocket", percent = 100 },
				{ class = "Pile_Rocket", percent = 100 },	
				{ class = "Pile_Rocket", percent = 100 },		
				{ class = "Pile_Rocket", percent = 100 },							
			},
		},

		


		{ 
			category = "VSSComplete",
			group =
			{
				{ class = "VSS", percent = 100 },
				{ class = "762x50_Akval", percent = 100 },																	
				{ category = "RandomPSOScope", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },						
			},
		},

		{ 
			category = "m14ebrComplete",
			group =
			{
				{ class = "m14ebr", percent = 100 },
				{ class = "m14x40", percent = 100 },												
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },	
			},
		},
		

		{ 
			category = "startergunComplete",
			group =
			{
				{ class = "startergun", percent = 100 },
				{ class = "Pile_357", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },	
			},
		},
		

		
		{ 
			category = "m4a1LekiComplete",
			group =
			{
				{ class = "m4a1Leki", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},
		
		{ 
			category = "M50Complete",
			group =
			{
				{ class = "M50", percent = 100 },
				{ class = "50calx15", percent = 100 },
				{ class = "50calx7x", percent = 100 },
				{ category = "RandomHuntingScope", percent = 100 },
				{ category = "RandomOpticScope", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },				
			},
		},

		
		{ 
			category = "KriptonComplete",
			group =
			{
				{ class = "Kripton", percent = 100 },
				{ class = "STANAGx77", percent = 100 },
				{ class = "STANAGx77", percent = 100 },		
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },									
			},
		},		

		{ 
			category = "M16VietnamComplete",
			group =
			{
				{ class = "M16Vietnam", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},

		{ 
			category = "GrimReaperVenomComplete",
			group =
			{
				{ class = "GrimReaperVenom", percent = 100 },
				{ class = "762x75Venom", percent = 100 },									
				{ class = "762x75Venom", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },						
			},
		},

		{ 
			category = "acawghillieComplete",
			group =
			{
				{ class = "acawghillie", percent = 100 },
				{ class = "762x10", percent = 100 },
				{ class = "762x10", percent = 100 },	
				{ category = "RandomHuntingScope", percent = 100 },		
				{ category = "RandomOpticScope", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
			},
		},

		{ 
			category = "akmblackComplete",
			group =
			{
				{ class = "akmblack", percent = 100 },
				{ category = "Random762Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },			
			},
		},

		
		{ 
			category = "at15fireComplete",
			group =
			{
				{ class = "at15fire", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },		
			},
		},

		

		{ 
			category = "M249FlareComplete",
			group =
			{
				{ class = "M249Flare", percent = 100 },				
				{ class = "Flarex150", percent = 100 },
				{ class = "556x175", percent = 100 },	
				{ class = "Flarex150_blue", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },							
			},
		},
		
		
		{ 
			category = "m40a5darkComplete",
			group =
			{
				{ class = "m40a5dark", percent = 100 },				
				{ class = "M40x10", percent = 100 },
				{ class = "M40x10", percent = 100 },	
				{ class = "M40x10", percent = 100 },
				{ category = "RandomSniperScope", percent = 100 },								
				{ category = "RandomOpticScope", percent = 100 },								
			},
		},



		{
			category = "HK416Complete",
			group =
			{
				{ category = "RandomHK416", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},

		{
			category = "AKAlfaComplete",
			group =
			{
				{ category = "RandomAKAlfa", percent = 100 },
				{ category = "Random762Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},


	
		{
			category = "FamasComplete",
			group =
			{
				{ category = "RandomFamas", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},
	
		{
			category = "MilkorComplete",
			group =
			{
				{ category = "RandomMilkor", percent = 100 },		
				{ class = "Pile_40mmGrenade", percent = 100 },										
				{ class = "Pile_sticky", percent = 100 },
				{ class = "Pile_40mmGrenade", percent = 100 },			
				{ class = "Pile_sticky", percent = 100 },			
				{ category = "RandomSniperScope", percent = 100 },  --Add this Scope for balance, it's not for Milkor					
			},
		},
	
		{
			category = "MG140Complete",
			group =
			{
				{ category = "RandomMG140", percent = 100 },
				{ class = "556x175", percent = 100 },										
				{ class = "556x175", percent = 100 },	
				{ class = "556x175", percent = 100 },														
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },				
			},
		},
	
		{
			category = "AUGA3Complete",
			group =
			{
				{ category = "RandomAUGA3", percent = 100 },
				{ class = "STANAGx6PPC", percent = 100 },
				{ class = "STANAGx6PPC", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },							
			},
		},
	
	
		{
			category = "ACR3Complete",
			group =
			{
				{ category = "RandomACR3", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},
	
		{
			category = "SigMPXComplete",
			group =
			{
				{ category = "RandomSigMPX", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},
	
		{
			category = "TavorComplete",
			group =
			{
				{ category = "RandomTavor", percent = 100 },
				{ category = "Random556Mag", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },				
				{ category = "RandomForeLight", percent = 100 },
			},
		},
	
		{
			category = "SAR21Complete",
			group =
			{
				{ category = "RandomSAR21", percent = 100 },
				{ class = "STANAGx77", percent = 100 },
				{ class = "STANAGx77", percent = 100 },
				{ category = "RandomSight", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },						
			},
		},
	
		{
			category = "SVLK-14SComplete",
			group =
			{
				{ category = "RandomSVLK-14S", percent = 100 },
				{ class = "50calx15", percent = 100 },
				{ class = "50calx15", percent = 100 },
				{ class = "50calx7x", percent = 100 },
				{ category = "RandomSniperScope_EIZ4_VIII-8", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },			
			},
		},
	
		{
			category = "SV-98Complete",
			group =
			{
				{ category = "RandomSV-98", percent = 100 },
				{ class = "50calx15", percent = 100 },
				{ class = "50calx15", percent = 100 },
				{ class = "50calx7x", percent = 100 },
				{ category = "RandomSniperScope_EIZ4_VIII-8", percent = 100 },
				{ category = "RandomRifleSilencer", percent = 100 },
				{ category = "RandomLaserSight", percent = 100 },					
			},
		},
		
    --################################################################		
	-- Random Pistols.
	


		{
			category = "RandomPistolXComplete",   -- 2 slots
			classes =
			{								
				{ category = "DeagleComplete", percent = 10 },
				{ category = "GlockComplete", percent = 10 },
				{ category = "m1911a1Complete", percent = 10 },
				{ category = "MAK10Complete", percent = 10 },
				{ category = "mp7Complete", percent = 10 },
				{ category = "PX4Complete", percent = 10 },
				{ category = "MakarovComplete", percent = 10 },
				{ category = "AP85Complete", percent = 10 },
				{ category = "P350Complete", percent = 10 },
				{ category = "scorpionComplete", percent = 10 },
				{ category = "HK45Complete", percent = 10 },
			},
		},	


		{ 
			category = "scorpionComplete", -- No Enhance
			group =
			{
				{ class = "scorpion", percent = 100 },
				{ class = "scorpion_mag_Incen", percent = 100 },								
			},
		},


		{  
			category = "DeagleComplete",  -- No Enhance
			group =
			{
				{ class = "Deagle", percent = 100 },
				{ class = "deaglex15", percent = 100 },								
			},
		},

		{ 
			category = "MAK10Complete",  -- No Enhance
			group =
			{
				{ class = "MAK10", percent = 100 },
				{ class = "9x19_mac10_DragonsBreath", percent = 100 },								
			},
		},

		{ 
			category = "GlockComplete", 
			group =
			{
				{ class = "Glock18CX", percent = 100 },
				{ class = "9mmx33_Venom", percent = 100 },								
			},
		},		

		{ 
			category = "mp7Complete",
			group =
			{
				{ class = "mp7X", percent = 100 },
				{ class = "57x50_Uranium", percent = 100 },								
			},
		},

		{ 
			category = "m1911a1Complete",
			group =
			{
				{ class = "m1911a1X", percent = 100 },
				{ class = "acp_45x30_Venom", percent = 100 },							
			},
		},

		{ 
			category = "PX4Complete",
			group =
			{
				{ class = "PX4X", percent = 100 },
				{ class = "acp_45x15_hk_DragonsBreath", percent = 100 },							
			},
		},


		{ 
			category = "MakarovComplete",
			group =
			{
				{ class = "MakarovX", percent = 100 },
				{ class = "9mmx50_Incen", percent = 100 },							
			},
		},

		{
			category = "AP85Complete",
			group =
			{
				{ class = "AP85X" },
				{ class = "9mmx33_ap85_DragonsBreath" },
			},
		},

		{ 
			category = "P350Complete",
			group =
			{
				{ class = "P350X", percent = 100 },
				{ class = "357x14_DragonsBreath", percent = 100 },							
			},
		},

		{ 
			category = "HK45Complete",
			group =
			{
				{ class = "hk45X", percent = 100 },
				{ class = "acp_45x15_hk_Uranium", percent = 100 },							
			},
		},



    --################################################################		
	-- Random LastShot New Weapon Skin.
	
	{
		category = "RandomHK416",
		classes =
		{
			{ class = "HK416", percent = 50 },
			{ class = "HK416_2", percent = 50 },										
		},
	},

	{
		category = "RandomAKAlfa",
		classes =
		{
			{ class = "AKAlfa", percent = 50 },
			{ class = "AKAlfa_2", percent = 50 },										
		},
	},

	{
		category = "RandomFamas",
		classes =
		{
			{ class = "Famas", percent = 50 },
			{ class = "Famas_2", percent = 50 },										
		},
	},

	{
		category = "RandomMilkor",
		classes =
		{
			{ class = "Milkor", percent = 50 },
			{ class = "Milkor_2", percent = 50 },										
		},
	},

	{
		category = "RandomMG140",
		classes =
		{
			{ class = "MG140", percent = 50 },
			{ class = "MG140_2", percent = 50 },										
		},
	},


	{
		category = "RandomAUGA3",
		classes =
		{
			{ class = "AUGA3", percent = 50 },
			{ class = "AUGA3_2", percent = 50 },										
		},
	},

	{
		category = "RandomACR3",
		classes =
		{
			{ class = "ACR3", percent = 50 },
			{ class = "ACR3_2", percent = 50 },										
		},
	},

	{
		category = "RandomSigMPX",
		classes =
		{
			{ class = "SigMPX", percent = 50 },
			{ class = "SigMPX_2", percent = 50 },										
		},
	},

	{
		category = "RandomTavor",
		classes =
		{
			{ class = "Tavor", percent = 50 },
			{ class = "Tavor_2", percent = 50 },										
		},
	},

	{
		category = "RandomSAR21",
		classes =
		{
			{ class = "SAR21", percent = 50 },
			{ class = "SAR21_2", percent = 50 },										
		},
	},

	{
		category = "RandomSVLK-14S",
		classes =
		{
			{ class = "SVLK-14S", percent = 50 },
			{ class = "SVLK-14S_2", percent = 50 },										
		},
	},

	{
		category = "RandomSV-98",
		classes =
		{
			{ class = "SV-98", percent = 33 },
			{ class = "SV-98_2", percent = 33 },
			{ class = "SV-98_3", percent = 34 },							
		},
	},
	

	--################################################################		
	-- Random LastShot Camo Scopes, Sight, Silencers, Lasers, Magazines,  .
	
	
	{
		category = "Random762Mag",
		classes =
		{
			{ class = "762x50", percent = 50 },
			{ class = "ext_762x75", percent = 50 },				
		},
	},
	
	{
		category = "Random556Mag",
		classes =
		{
			{ class = "STANAGx50", percent = 50 },
			{ class = "ext_556x75", percent = 50 },				
		},
	},


	{
		category = "RandomForeLight",
		classes =
		{
			{ class = "ForegripVertical", percent = 25 },
			{ class = "FlashlightRifle", percent = 25 },
			{ class = "BayonetRifle", percent = 25 },	
			{ class = "M203", percent = 25 },					
		},
	},


	



	{
		category = "RandomSight",
		classes =
		{
			{ category = "RandomOPKSight", percent = 33 },
			{ category = "RandomReflexSight", percent = 33 },
			{ category = "RandomT1Micro", percent = 33 },
			{ category = "RandomReddotSight", percent = 33 },
			{ category = "RandomR3Sight", percent = 33 },					
		},
	},

	
	{
		category = "RandomLaserSight",
		classes =
		{
			{ class = "LaserSight", percent = 33 },
			{ class = "LaserSightGreen", percent = 34 },
			{ class = "LaserSightBlue", percent = 33 },				
		},
	},


	{
		category = "RandomRifleSilencer",
		classes =
		{
			{ class = "RifleSilencer", percent = 8 },
			{ class = "RifleSilencer_1", percent = 9 },
			{ class = "RifleSilencer_2", percent = 9 },
			{ class = "RifleSilencer_3", percent = 9 },
			{ class = "RifleSilencer_4", percent = 9 },
			{ class = "RifleSilencer_5", percent = 9 },
			{ class = "RifleSilencer_6", percent = 9 },
			{ class = "RifleSilencer_7", percent = 9 },
			{ class = "RifleSilencer_8", percent = 9 },
			{ class = "RifleSilencer_9", percent = 9 },
			{ class = "RifleSilencer_10", percent = 9 },				
		},
	},
	
	{
		category = "RandomPSOScope",
		classes =
		{
			{ class = "PSOScope", percent = 8 },
			{ class = "PSOScope_1", percent = 9 },
			{ class = "PSOScope_2", percent = 9 },
			{ class = "PSOScope_3", percent = 9 },
			{ class = "PSOScope_4", percent = 9 },
			{ class = "PSOScope_5", percent = 9 },
			{ class = "PSOScope_6", percent = 9 },
			{ class = "PSOScope_7", percent = 9 },
			{ class = "PSOScope_8", percent = 9 },
			{ class = "PSOScope_9", percent = 9 },
			{ class = "PSOScope_10", percent = 9 },				
		},
	},

	{
		category = "RandomHuntingScope",
		classes =
		{
			{ class = "HuntingScope", percent = 8 },
			{ class = "HuntingScope_1", percent = 9 },
			{ class = "HuntingScope_2", percent = 9 },
			{ class = "HuntingScope_3", percent = 9 },
			{ class = "HuntingScope_4", percent = 9 },
			{ class = "HuntingScope_5", percent = 9 },
			{ class = "HuntingScope_6", percent = 9 },
			{ class = "HuntingScope_7", percent = 9 },
			{ class = "HuntingScope_8", percent = 9 },
			{ class = "HuntingScope_9", percent = 9 },
			{ class = "HuntingScope_10", percent = 9 },				
		},
	},

			
	{
		category = "RandomSniperScope_EIZ4_VIII-8",
		classes =
		{
			{ class = "SniperScope_EIZ4_VIII-8", percent = 8 },
			{ class = "SniperScope_EIZ4_VIII-8_1", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_2", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_3", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_4", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_5", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_6", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_7", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_8", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_9", percent = 9 },
			{ class = "SniperScope_EIZ4_VIII-8_10", percent = 9 },				
		},
	},

	{
		category = "RandomSniperScope",
		classes =
		{
			{ class = "SniperScope", percent = 8 },
			{ class = "SniperScope_1", percent = 9 },
			{ class = "SniperScope_2", percent = 9 },
			{ class = "SniperScope_3", percent = 9 },
			{ class = "SniperScope_4", percent = 9 },
			{ class = "SniperScope_5", percent = 9 },
			{ class = "SniperScope_6", percent = 9 },
			{ class = "SniperScope_7", percent = 9 },
			{ class = "SniperScope_8", percent = 9 },
			{ class = "SniperScope_9", percent = 9 },
			{ class = "SniperScope_10", percent = 9 },				
		},
	},

	{
		category = "RandomT1Micro",
		classes =
		{
			{ class = "T1Micro", percent = 8 },
			{ class = "T1Micro_1", percent = 9 },
			{ class = "T1Micro_2", percent = 9 },
			{ class = "T1Micro_3", percent = 9 },
			{ class = "T1Micro_4", percent = 9 },
			{ class = "T1Micro_5", percent = 9 },
			{ class = "T1Micro_6", percent = 9 },
			{ class = "T1Micro_7", percent = 9 },
			{ class = "T1Micro_8", percent = 9 },
			{ class = "T1Micro_9", percent = 9 },
			{ class = "T1Micro_10", percent = 9 },				
		},
	},

	{
		category = "RandomReddotSight",
		classes =
		{
			{ class = "ReddotSight", percent = 8 },
			{ class = "ReddotSight_1", percent = 9 },
			{ class = "ReddotSight_2", percent = 9 },
			{ class = "ReddotSight_3", percent = 9 },
			{ class = "ReddotSight_4", percent = 9 },
			{ class = "ReddotSight_5", percent = 9 },
			{ class = "ReddotSight_6", percent = 9 },
			{ class = "ReddotSight_7", percent = 9 },
			{ class = "ReddotSight_8", percent = 9 },
			{ class = "ReddotSight_9", percent = 9 },
			{ class = "ReddotSight_10", percent = 9 },				
		},
	},
	
	
	{
		category = "RandomR3Sight",
		classes =
		{
			{ class = "R3Sight", percent = 8 },
			{ class = "R3Sight_1", percent = 9 },
			{ class = "R3Sight_2", percent = 9 },
			{ class = "R3Sight_3", percent = 9 },
			{ class = "R3Sight_4", percent = 9 },
			{ class = "R3Sight_5", percent = 9 },
			{ class = "R3Sight_6", percent = 9 },
			{ class = "R3Sight_7", percent = 9 },
			{ class = "R3Sight_8", percent = 9 },
			{ class = "R3Sight_9", percent = 9 },
			{ class = "R3Sight_10", percent = 9 },				
		},
	},

	{
		category = "RandomOPKSight",
		classes =
		{
			{ class = "OPKSight", percent = 8 },
			{ class = "OPKSight_1", percent = 9 },
			{ class = "OPKSight_2", percent = 9 },
			{ class = "OPKSight_3", percent = 9 },
			{ class = "OPKSight_4", percent = 9 },
			{ class = "OPKSight_5", percent = 9 },
			{ class = "OPKSight_6", percent = 9 },
			{ class = "OPKSight_7", percent = 9 },
			{ class = "OPKSight_8", percent = 9 },
			{ class = "OPKSight_9", percent = 9 },
			{ class = "OPKSight_10", percent = 9 },				
		},
	},

	{
		category = "RandomOpticScope",
		classes =
		{
			{ class = "OpticScope", percent = 8 },
			{ class = "OpticScope_1", percent = 9 },
			{ class = "OpticScope_2", percent = 9 },
			{ class = "OpticScope_3", percent = 9 },
			{ class = "OpticScope_4", percent = 9 },
			{ class = "OpticScope_5", percent = 9 },
			{ class = "OpticScope_6", percent = 9 },
			{ class = "OpticScope_7", percent = 9 },
			{ class = "OpticScope_8", percent = 9 },
			{ class = "OpticScope_9", percent = 9 },
			{ class = "OpticScope_10", percent = 9 },				
		},
	},
	
	{
		category = "RandomReflexSight",
		classes =
		{
			{ class = "ReflexSight", percent = 8 },
			{ class = "ReflexSight_1", percent = 9 },
			{ class = "ReflexSight_2", percent = 9 },
			{ class = "ReflexSight_3", percent = 9 },
			{ class = "ReflexSight_4", percent = 9 },
			{ class = "ReflexSight_5", percent = 9 },
			{ class = "ReflexSight_6", percent = 9 },
			{ class = "ReflexSight_7", percent = 9 },
			{ class = "ReflexSight_8", percent = 9 },
			{ class = "ReflexSight_9", percent = 9 },
			{ class = "ReflexSight_10", percent = 9 },				
		},
	},
	--################################################################		
	-- A random epic spawn for hard to reach areas. Use sparingly.
	{
		category = "RandomLegendaryWeapon",
		classes =
		{		
			{ class = "SW29", percent = 10 },
			{ class = "L1AR", percent = 10 },
			{ class = "Deagle", percent = 5 },
			{ class = "Subjugator", percent = 10 },
			{ class = "SCAR-H", percent = 10 },
			{ class = "Model1873", percent = 10 },
			{ class = "Peacemaker", percent = 10 },
			{ class = "Jackal", percent = 10 },
			{ class = "Glock18C", percent = 10 },
			{ class = "mp7", percent = 10 },				
		},
	},
	
	{
		category = "RandomEpicWeapon",
		classes =
		{			
			{ category = "SubjugatorWithMagazines", percent = 20 },
			{ category = "L1ARWithMagazines", percent = 25 },
			{ category = "AA12WithMagazines", percent = 10 },			
			{ category = "ColtPythonGrimeyRickWithRounds", percent = 5 },
			{ category = "M4V5WithMagazines", percent = 20 },
			{ class = "AxePatrick", percent = 5 },
			{ class = "BaseballBatHerMajesty", percent = 5 },
			{ class = "KatanaBlackWidow", percent = 5 },		
			{ class = "SCAR-H", percent = 25 },
			{ class = "M4A1", percent = 20 },	
			{ class = "Peacemaker", percent = 5 },
			{ class = "Model1873", percent = 20 },
		},
	},

		{
			category = "RandomExtendedMagazines",
			classes =
			{
				{ class = "STANAGx50", percent = 10 },
				{ class = "STANAGx6PPC", percent = 10 },
				{ class = "50calx15", percent = 10 }, -- because we give in planeCrash Crate
				{ class = "50calx7x", percent = 10 }, -- because we give in planeCrash Crate
				{ class = "scorpion_mag", percent = 10 }, -- because we give in planeCrash Crate
				{ class = "STANAGx77", percent = 10 },    -- because we give in UFO Crate
				{ class = "762x75Venom", percent = 10 },    -- because we give in UFO Crate
				{ class = "ext_556x75", percent = 10 },
				{ class = "ext_762x75", percent = 10 },
				{ class = "M203", percent = 10 },
				{ class = "762x50_Akval", percent = 10 },
				{ class = "556x50_ak5d", percent = 10 },
				{ class = "762x50", percent = 10 },
				{ class = "acp_45x60_cx8", percent = 10 },     
				{ class = "M40x10", percent = 10 },
				{ class = "acp_45x60", percent = 10 },
				{ class = "762x10", percent = 10 },
				{ class = "556x175", percent = 10 },
				{ class = "545x60", percent = 10 },
				{ class = "57x80", percent = 10 },
				{ class = "10mmx60", percent = 10 },
				{ class = "10mmx60MP", percent = 10 },
				{ class = "g36cx50", percent = 10 },
				{ class = "deaglex15", percent = 10 },
				{ class = "l1arx50", percent = 10 },
				{ class = "m14x40", percent = 10 },		
			},
		},	
	

		{
			category = "RandomAllNormalWeaponsWithMagazines",
			classes =
			{
				{ category = "RandomNormalGoodWeapons", percent = 10 }, --no tienen magazines
				{ category = "RandomLegendaryWeapon", percent = 10 }, --no tienen magazines				
				{ category = "RandomEpicWeapon", percent = 10 },
				{ category = "RandomPoliceWeaponWithMagazines", percent = 10 },
				{ category = "RandomMilitaryWeaponWithMagazines", percent = 10 },	
				{ category = "RandomHuntingWeapons", percent = 10 },
				{ category = "RandomRangedMilitaryPure", percent = 10 },
				{ category = "RandomRangedPure", percent = 10 },
				{ category = "RandomRangedCivilianPure", percent = 10 },
				{ category = "RandomRangedPolicePure", percent = 10 },
				{ category = "RandomWeaponWithMagsPure", percent = 10 },								
			},
		},	


		{
			category = "RandomNormalGoodWeapons",
			classes =
			{				
				{ category = "RandomAKMSkin" , percent = 50 },				
				{ category = "RandomMk18Skin" , percent = 50 },				
				{ category = "RandomR90Skin" , percent = 50 },		
				{ category = "RandomBulldogSkin" , percent = 50 },
				{ category = "RandomM16Skin" , percent = 50 },
				{ category = "RandomAUMP45Skin" , percent = 50 },
				{ category = "RandomAKValSkin" , percent = 50 },
				{ category = "RandomAK5DSkin" , percent = 50 },
				{ category = "RandomM97VSkin" , percent = 30 },
				{ class = "M249" , percent = 50 },				
				{ category = "RandomMP5Skin" , percent = 50 },
				{ category = "RandomKrissVSkin" , percent = 50 },
				{ class = "m14", percent = 50 },			
				{ class = "SW29" , percent = 50 },
				{ class = "L1AR" , percent = 50 },
				{ class = "Subjugator" , percent = 50 },	
				{ class = "SCAR-H" , percent = 50 },
				{ class = "M4A1" , percent = 50 },				
				{ class = "M4V5" , percent = 50 },
				{ category = "RandomAK74USkin" , percent = 50 },					
			},
		},

		{
			category = "RandomNormalWeaponMagazines",
			classes =
			{				
				{ class = "762x30", percent = 50 },	
				{ class = "STANAGx30", percent = 50 },	
				{ class = "57x50", percent = 50 },	
				{ class = "acp_45x30", percent = 50 },	
				{ class = "762x20_Akval", percent = 50 },	
				{ class = "556x30_ak5d", percent = 50 },					
				{ class = "10mmx30", percent = 25 },	
				{ class = "10mmx15", percent = 25 },	
				{ class = "g36c_mag", percent = 50 },	
				{ class = "762x30", percent = 50 },					
				{ class = "l1ar_mag", percent = 50 },	
				{ class = "mag_m14", percent = 50 },	
				{ class = "50calx7", percent = 50 },
				{ class = "545x30", percent = 30 },		
				{ class = "556x100", percent = 20 },					
			},
		},
		

		{
			category = "RandomBestSnipersWithMagazines",
			classes =
			{
				{ category = "M40A5WithMagazines", percent = 50 },
				{ category = "ACAWWithMagazines", percent = 50 },
				{ category = "Rem700WithRounds", percent = 50 },
				{ category = "Rem870WithRounds", percent = 50 },
				{ category = "M14WithMagazines", percent = 50 },
				{ category = "M50WithMagazines", percent = 30 },
				{ category = "Sako85WithRounds", percent = 50 },
				{ category = "Model70WithRounds", percent = 50 },
				{ category = "Model1873WithMagazines", percent = 30 },															
			},
		},


		{
			category = "RandomBestSnipers",
			classes =
			{
				{ class = "M40A5", percent = 50 },
				{ class = "ACAW", percent = 50 },
				{ class = "Rem700", percent = 40 },				
				{ class = "m14", percent = 50 },
				{ class = "Sako_85", percent = 40 },
				{ class = "Model70", percent = 40 },	
				{ class = "Model1873", percent = 40 },														
			},
		},

		{
			category = "RandomBestSnipersMagazines",
			classes =
			{
				{ class = "M40x5", percent = 50 },	
				{ class = "762x5", percent = 50 },
				{ class = "762x20_Akval", percent = 50 },	
				{ class = "Pile_308", percent = 10, min = 90, max = 128 },
				{ class = "Pile_357", percent = 4, min = 90, max = 128 },
				{ class = "Pile_223", percent = 5, min = 90, max = 128 },													
				{ class = "50calx7", percent = 50 },																						
			},
		},
	

		{
			category = "RandomBombItems",
			classes =
			{					
				{ class = "PipebombPickup", percent = 10 , min = 2, max = 3 },				
				{ class = "Pile_40mmGrenade", percent = 10 , min = 2, max = 3 },
				{ class = "GrenadeMolotovPickup", percent = 10 , min = 2, max = 3 },
				{ class = "GrenadePickup", percent = 10 , min = 2, max = 3 },
				{ class = "C4TimedPickup", percent = 10, min = 2, max = 3 },
				{ class = "M203", percent = 10 },				
				{ class = "BioFuel", percent = 10, min = 80, max = 100 },
				{ class = "C4Bricks", percent = 10, min = 5, max = 10},
				{ class = "Sulphur", percent = 10, min = 90, max = 128 },
				{ class = "Amalgaduino", percent = 10, min = 5, max = 10 },
				{ class = "Gunpowder", percent = 10, min = 90, max = 128 },				
				{ category = "RandomM97VSkin", percent = 10 },
				{ class = "Sledgehammer", percent = 10 },
				{ class = "Pile_Rocket", percent = 10},
				{ class = "Pile_sticky", percent = 10, min = 1, max = 2}, 
				{ class = "TrapLandminePacked", percent = 10, min = 1, max = 2},
				{ class = "TrapC4Packed", percent = 10, min = 1, max = 2},
				{ class = "TrapC4Packed2m", percent = 10, min = 1, max = 2},
				{ class = "TrapMolotov2mPacked", percent = 10, min = 1, max = 2},																								
			},
		},
		{
			category = "RandomBombItems_new",
			classes =
			{					
				{ class = "PipebombPickup", percent = 10 , min = 2, max = 3 },				
				--{ class = "Pile_40mmGrenade", percent = 10 , min = 2, max = 3 },
				{ class = "GrenadeMolotovPickup", percent = 10 , min = 2, max = 3 },
				{ class = "GrenadePickup", percent = 10 , min = 2, max = 3 },
				--{ class = "C4TimedPickup", percent = 10, min = 2, max = 3 },
				{ class = "M203", percent = 10 },				
				{ class = "BioFuel", percent = 10, min = 80, max = 100 },
				{ class = "C4Bricks", percent = 10, min = 5, max = 10},
				{ class = "Sulphur", percent = 10, min = 90, max = 128 },
				{ class = "Amalgaduino", percent = 10, min = 5, max = 10 },
				{ class = "Gunpowder", percent = 10, min = 90, max = 128 },				
				{ category = "RandomM97VSkin", percent = 10 },
				--{ class = "Sledgehammer", percent = 10 },
				{ class = "Pile_Rocket", percent = 10},
				{ class = "Pile_sticky", percent = 10, min = 1, max = 2}, 
				{ class = "TrapLandminePacked", percent = 10, min = 1, max = 2},
				--{ class = "TrapC4Packed", percent = 10, min = 1, max = 2},
				--{ class = "TrapC4Packed2m", percent = 10, min = 1, max = 2},
				{ class = "TrapMolotov2mPacked", percent = 10, min = 1, max = 2},																								
			},
		},


		{
			category = "RandomSpecialAllItems",
			classes =
			{		
				{ category = "RandomChristmasPresent", percent = 5 },
				{ category = "halloweenBagCommon", percent = 5 },
				{ category = "RandomChristmasClothing", percent = 5 },
				{ category = "HalloweenBagRare", percent = 5 },
				{ category = "RandomSpecialMaskHelmet", percent = 5 },
				{ category = "HalloweenBagCommonLoot", percent = 5 },
				{ category = "RandomChristmasClothing", percent = 5 },
				{ category = "ChristmasPresentCommon", percent = 5 },
				{ category = "ChristmasPresentRare", percent = 5 },
				{ category = "RandomSniperScope_EIZ4_VIII-8", percent = 5 },
				{ category = "RandomSight", percent = 5 },
				{ category = "RandomRifleSilencer", percent = 5 },	
				{ category = "RandomPSOScope", percent = 5 },		
				{ category = "RandomHuntingScope", percent = 5 },
				{ category = "RandomSniperScope", percent = 5 },
				{ category = "RandomOpticScope", percent = 5 },
				{ category = "RandomForeLight", percent = 5 },
			},
		},


		{
			category = "RandomSpecialMaskHelmet",
			classes =
			{				
				{ class = "BanesMask", percent = 10 },				
				{ class = "BlastMask", percent = 10 },
				{ class = "SkullMask", percent = 10 },
				{ class = "AssaultHelmet", percent = 10 },	
				{ class = "SkullMaskSilver", percent = 10 },
				{ class = "SpaceHelmet", percent = 10 },
				{ class = "ScavengerHelmet", percent = 10 },																					
			},
		},

		

	-- --------------------------------------------------------------------
	-- SPACE SUITS
	-- --------------------------------------------------------------------
		{
			category = "RandomSpaceSuits",
			classes =
			{
				{ category = "BloodsplatterSuit", percent = 30 },
				{ category = "BlueligtheningSuit", percent = 30 },
				{ category = "ActivecamoSuit", percent = 30 },
				{ category = "RustySuit", percent = 30 },
				{ category = "PurpleSkullsSuit", percent = 30 },
				{ category = "SkullsSuit", percent = 30 },
				{ category = "GrassCamoSuit", percent = 30 },
				{ category = "PredatorSuit", percent = 30 },
				{ category = "PinkcamoSuit", percent = 30 },
				{ category = "CannibiscamoSuit", percent = 30 },
				{ category = "MagmaSuit", percent = 30 },
				{ category = "SnowcamoSuit", percent = 30 },
			},
		},

	
		{ 
			category = "BloodsplatterSuit",
			group =
			{
				{ class = "BloodsplatterCargoPants", percent = 100 },
				{ class = "BloodsplatterCombatBoots", percent = 100 },
				{ class = "BloodsplatterDuffelBag", percent = 100 },
				{ class = "Bloodsplatterheavyshoulder", percent = 100 },
				{ class = "BloodsplatterMilitaryGloves", percent = 100 },
				{ class = "BloodsplatterMilitaryJacket", percent = 100 },
				{ class = "BloodsplatterScarf", percent = 100 },
				{ class = "BloodsplatterSpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "BlueligtheningSuit",
			group =
			{
				{ class = "BlueligtheningCargoPants", percent = 100 },
				{ class = "BlueligtheningCombatBoots", percent = 100 },
				{ class = "BlueligtheningDuffelBag", percent = 100 },
				{ class = "Blueligtheningheavyshoulder", percent = 100 },
				{ class = "BlueligtheningMilitaryGloves", percent = 100 },
				{ class = "BlueligtheningMilitaryJacket", percent = 100 },
				{ class = "BlueligtheningScarf", percent = 100 },
				{ class = "BlueligtheningSpaceHelmet", percent = 100 },
			},
		},
				
		{ 
			category = "ActivecamoSuit",
			group =
			{
				{ class = "ActivecamoCargoPants", percent = 100 },
				{ class = "ActivecamoCombatBoots", percent = 100 },
				{ class = "ActivecamoDuffelBag", percent = 100 },
				{ class = "Activecamoheavyshoulder", percent = 100 },
				{ class = "ActivecamoMilitaryGloves", percent = 100 },
				{ class = "ActivecamoMilitaryJacket", percent = 100 },
				{ class = "ActivecamoScarf", percent = 100 },
				{ class = "ActivecamoSpaceHelmet", percent = 100 },
			},
		},
		{ 
			category = "RustySuit",
			group =
			{
				{ class = "RustyCargoPants", percent = 100 },
				{ class = "RustyCombatBoots", percent = 100 },
				{ class = "RustyDuffelBag", percent = 100 },
				{ class = "Rustyheavyshoulder", percent = 100 },
				{ class = "RustyMilitaryGloves", percent = 100 },
				{ class = "RustyMilitaryJacket", percent = 100 },
				{ class = "RustyScarf", percent = 100 },
				{ class = "RustySpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "PurpleSkullsSuit",
			group =
			{
				{ class = "PurpleSkullsCargoPants", percent = 100 },
				{ class = "PurpleSkullsCombatBoots", percent = 100 },
				{ class = "PurpleSkullsDuffelBag", percent = 100 },
				{ class = "PurpleSkullsheavyshoulder", percent = 100 },
				{ class = "PurpleSkullsMilitaryGloves", percent = 100 },
				{ class = "PurpleSkullsMilitaryJacket", percent = 100 },
				{ class = "PurpleSkullsScarf", percent = 100 },
				{ class = "PurpleSkullsSpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "SkullsSuit",
			group =
			{
				{ class = "SkullCargoPants", percent = 100 },
				{ class = "SkullCombatBoots", percent = 100 },
				{ class = "SkullDuffelBag", percent = 100 },
				{ class = "Skullheavyshoulder", percent = 100 },
				{ class = "SkullMilitaryGloves", percent = 100 },
				{ class = "SkullMilitaryJacket", percent = 100 },
				{ class = "SkullScarf", percent = 100 },
				{ class = "SkullSpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "GrassCamoSuit",
			group =
			{
				{ class = "GrassCamoCargoPants", percent = 100 },
				{ class = "GrassCamoCombatBoots", percent = 100 },
				{ class = "GrassCamoDuffelBag", percent = 100 },
				{ class = "GrassCamoheavyshoulder", percent = 100 },
				{ class = "GrassCamoMilitaryGloves", percent = 100 },
				{ class = "GrassCamoMilitaryJacket", percent = 100 },
				{ class = "GrassCamoScarf", percent = 100 },
				{ class = "GrassCamoSpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "PredatorSuit",
			group =
			{
				{ class = "PredatorArmor", percent = 100 },
				{ class = "PredatorBoots", percent = 100 },
				{ class = "PredatorDuffelBag", percent = 100 },
				{ class = "PredatorHelmet", percent = 100 },
				{ class = "PredatorGloves", percent = 100 },
				{ class = "PredatorJacket", percent = 100 },
				{ class = "PredatorScarf", percent = 100 },
				{ class = "PredatorPants", percent = 100 },
			},
		},

		{ 
			category = "PinkcamoSuit",
			group =
			{
				{ class = "PinkcamoCargoPants", percent = 100 },
				{ class = "PinkcamoCombatBoots", percent = 100 },
				{ class = "PinkcamoDuffelBag", percent = 100 },
				{ class = "Pinkcamoheavyshoulder", percent = 100 },
				{ class = "PinkcamoMilitaryGloves", percent = 100 },
				{ class = "PinkcamoMilitaryJacket", percent = 100 },
				{ class = "PinkcamoScarf", percent = 100 },
				{ class = "PinkcamoSpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "CannibiscamoSuit",
			group =
			{
				{ class = "CannibiscamoCargoPants", percent = 100 },
				{ class = "CannibiscamoCombatBoots", percent = 100 },
				{ class = "CannibiscamoDuffelBag", percent = 100 },
				{ class = "Cannibiscamoheavyshoulder", percent = 100 },
				{ class = "CannibiscamoMilitaryGloves", percent = 100 },
				{ class = "CannibiscamoMilitaryJacket", percent = 100 },
				{ class = "CannibiscamoScarf", percent = 100 },
				{ class = "CannibiscamoSpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "MagmaSuit",
			group =
			{
				{ class = "MagmaCargoPants", percent = 100 },
				{ class = "MagmaCombatBoots", percent = 100 },
				{ class = "MagmaDuffelBag", percent = 100 },
				{ class = "Magmaheavyshoulder", percent = 100 },
				{ class = "MagmaMilitaryGloves", percent = 100 },
				{ class = "MagmaMilitaryJacket", percent = 100 },
				{ class = "MagmaScarf", percent = 100 },
				{ class = "MagmaSpaceHelmet", percent = 100 },
			},
		},

		{ 
			category = "SnowcamoSuit",
			group =
			{
				{ class = "SnowcamoCargoPants", percent = 100 },
				{ class = "SnowcamoCombatBoots", percent = 100 },
				{ class = "SnowcamoDuffelBag", percent = 100 },
				{ class = "Snowcamoheavyshoulder", percent = 100 },
				{ class = "SnowcamoMilitaryGloves", percent = 100 },
				{ class = "SnowcamoMilitaryJacket", percent = 100 },
				{ class = "SnowcamoScarf", percent = 100 },
				{ class = "SnowcamoSpaceHelmet", percent = 100 },
			},
		},


	-- --------------------------------------------------------------------
	-- LASTSHOT SUITS
	-- --------------------------------------------------------------------


	{
		category = "RandomLastShotSpaceSuits",
		classes =
		{
			{ category = "RandomLastShotSuits", percent = 60 },              --Contains 8 slots!!
			{ category = "RandomSpaceSuits", percent = 40 },              --Contains 8 slots!!
		},
	},



	{
		category = "RandomLastShotSuits",
		classes =
		{
			{ category = "LastShotSuit1", percent = 10 },
			{ category = "LastShotSuit2", percent = 10 },
			{ category = "LastShotSuit3", percent = 10 },
			{ category = "LastShotSuit4", percent = 10 },
			{ category = "LastShotSuit5", percent = 10 },
			{ category = "LastShotSuit6", percent = 10 },
			{ category = "LastShotSuit7", percent = 10 },
			{ category = "LastShotSuit8", percent = 10 },
			{ category = "LastShotSuit9", percent = 10 },
			{ category = "LastShotSuit10", percent = 10 },
			
		},
	},

	{ 
		category = "LastShotSuit1",
		group =
		{
			{ class = "SMScarf1", percent = 100 },
			{ class = "SMBag1", percent = 100 },
			{ class = "SMGloves1", percent = 100 },
			{ class = "SMHelmet1", percent = 100 },
			{ class = "SMVest1", percent = 100 },
			{ class = "SMPants1", percent = 100 },
			{ class = "SMBoots1", percent = 100 },
			{ class = "SMJacket1", percent = 100 },
			{ class = "SMBelt1", percent = 100 },
		},
	},


	{ 
		category = "LastShotSuit2",
		group =
		{
			{ class = "SMScarf2", percent = 100 },
			{ class = "SMBag2", percent = 100 },
			{ class = "SMGloves2", percent = 100 },
			{ class = "SMHelmet2", percent = 100 },
			{ class = "SMVest2", percent = 100 },
			{ class = "SMPants2", percent = 100 },
			{ class = "SMBoots2", percent = 100 },
			{ class = "SMJacket2", percent = 100 },
			{ class = "SMBelt2", percent = 100 },
		},
	},

	{ 
		category = "LastShotSuit3",
		group =
		{
			{ class = "SMScarf3", percent = 100 },
			{ class = "SMBag3", percent = 100 },
			{ class = "SMGloves3", percent = 100 },
			{ class = "SMHelmet3", percent = 100 },
			{ class = "SMVest3", percent = 100 },
			{ class = "SMPants3", percent = 100 },
			{ class = "SMBoots3", percent = 100 },
			{ class = "SMJacket3", percent = 100 },
			{ class = "SMBelt3", percent = 100 },
		},
	},

	{ 
		category = "LastShotSuit4",
		group =
		{
			{ class = "SMScarf4", percent = 100 },
			{ class = "SMBag4", percent = 100 },
			{ class = "SMGloves4", percent = 100 },
			{ class = "SMHelmet4", percent = 100 },
			{ class = "SMVest4", percent = 100 },
			{ class = "SMPants4", percent = 100 },
			{ class = "SMBoots4", percent = 100 },
			{ class = "SMJacket4", percent = 100 },
			{ class = "SMBelt4", percent = 100 },
		},
	},

	{ 
		category = "LastShotSuit5",
		group =
		{
			{ class = "SMScarf5", percent = 100 },
			{ class = "SMBag5", percent = 100 },
			{ class = "SMGloves5", percent = 100 },
			{ class = "SMHelmet5", percent = 100 },
			{ class = "SMVest5", percent = 100 },
			{ class = "SMPants5", percent = 100 },
			{ class = "SMBoots5", percent = 100 },
			{ class = "SMJacket5", percent = 100 },
			{ class = "SMBelt5", percent = 100 },
		},
	},

	{ 
		category = "LastShotSuit6",
		group =
		{
			{ class = "SMScarf6", percent = 100 },
			{ class = "SMBag6", percent = 100 },
			{ class = "SMGloves6", percent = 100 },
			{ class = "SMHelmet6", percent = 100 },
			{ class = "SMVest6", percent = 100 },
			{ class = "SMPants6", percent = 100 },
			{ class = "SMBoots6", percent = 100 },
			{ class = "SMJacket6", percent = 100 },
			{ class = "SMBelt6", percent = 100 },
		},
	},

	{ 
		category = "LastShotSuit7",
		group =
		{
			{ class = "SMScarf7", percent = 100 },
			{ class = "SMBag7", percent = 100 },
			{ class = "SMGloves7", percent = 100 },
			{ class = "SMHelmet7", percent = 100 },
			{ class = "SMVest7", percent = 100 },
			{ class = "SMPants7", percent = 100 },
			{ class = "SMBoots7", percent = 100 },
			{ class = "SMJacket7", percent = 100 },
			{ class = "SMBelt7", percent = 100 },
		},
	},

	{ 
		category = "LastShotSuit8",
		group =
		{
			{ class = "SMScarf8", percent = 100 },
			{ class = "SMBag8", percent = 100 },
			{ class = "SMGloves8", percent = 100 },
			{ class = "SMHelmet8", percent = 100 },
			{ class = "SMVest8", percent = 100 },
			{ class = "SMPants8", percent = 100 },
			{ class = "SMBoots8", percent = 100 },
			{ class = "SMJacket8", percent = 100 },
			{ class = "SMBelt8", percent = 100 },
		},
	},

	{ 
		category = "LastShotSuit9",
		group =
		{
			{ class = "SMScarf9", percent = 100 },
			{ class = "SMBag9", percent = 100 },
			{ class = "SMGloves9", percent = 100 },
			{ class = "SMHelmet9", percent = 100 },
			{ class = "SMVest9", percent = 100 },
			{ class = "SMPants9", percent = 100 },
			{ class = "SMBoots9", percent = 100 },
			{ class = "SMJacket9", percent = 100 },
			{ class = "SMBelt9", percent = 100 },
		},
	},


	{ 
		category = "LastShotSuit10",
		group =
		{
			{ class = "SMScarf10", percent = 100 },
			{ class = "SMBag10", percent = 100 },
			{ class = "SMGloves10", percent = 100 },
			{ class = "SMHelmet10", percent = 100 },
			{ class = "SMVest10", percent = 100 },
			{ class = "SMPants10", percent = 100 },
			{ class = "SMBoots10", percent = 100 },
			{ class = "SMJacket10", percent = 100 },
			{ class = "SMBelt10", percent = 100 },
		},
	},



	-- --------------------------------------------------------------------
	-- BACKPACKS
	-- --------------------------------------------------------------------
		
		{
			category = "RandomMilitaryBackpack",
			classes =
			{
				{ class = "DuffelBag", percent = 15 },
				{ class = "DuffelBagBlack", percent = 15 },
				{ class = "DuffelBagGreen", percent = 15 },
				{ class = "DuffelBagGreenCamo1", percent = 15 },
				{ class = "DuffelBagGreenCamo2", percent = 15 },
				{ class = "DuffelBagGreenCamo3", percent = 15 },
				{ class = "DuffelBagGreenCamo4", percent = 15 },
				{ class = "DuffelBagTanCamo1", percent = 15 },
				{ class = "DuffelBagTanCamo2", percent = 15 },
				{ class = "DuffelBagTanCamo3", percent = 15 },
				{ class = "DuffelBagTanCamo4", percent = 15 },
				{ class = "DuffelBagUrbanCamo1", percent = 15 },
				{ class = "DuffelBagUrbanCamo2", percent = 15 },
				{ class = "DuffelBagUrbanCamo3", percent = 15 },
				{ class = "DuffelBagUrbanCamo4", percent = 15 },
				{ class = "DuffelBagBlue", percent = 15 },
				{ class = "DuffelBagLightBlue", percent = 15 },
				{ class = "DuffelBagOGreen", percent = 15 },
				{ class = "DuffelBagPink", percent = 15 },
				{ class = "DuffelBagPurple", percent = 15 },
				{ class = "DuffelBagRed", percent = 15 },
				{ class = "DuffelBagWhite", percent = 15 },
				{ class = "DuffelBagYellow", percent = 15 },			
				{ class = "RuggedPack", percent = 15 },
				{ class = "RuggedPackBlack", percent = 15 },
				{ class = "RuggedPackBrown", percent = 15 },
				{ class = "RuggedPackCamo1", percent = 15 },
				{ class = "RuggedPackCamo2", percent = 15 },
				{ class = "RuggedPackCamo3", percent = 15 },
				{ class = "RuggedPackCamo4", percent = 15 },
				{ class = "RuggedPackGreen", percent = 15 },
				{ class = "RuggedPackGreenCamo1", percent = 15 },
				{ class = "RuggedPackGreenCamo2", percent = 15 },
				{ class = "RuggedPackGreenCamo3", percent = 15 },
				{ class = "RuggedPackGreenCamo4", percent = 15 },
				{ class = "RuggedPackBlue", percent = 15 },
				{ class = "RuggedPackOGreen", percent = 15 },
				{ class = "RuggedPackPink", percent = 15 },
				{ class = "RuggedPackPurple", percent = 15 },
				{ class = "RuggedPackRed", percent = 15 },
				{ class = "RuggedPackYellow", percent = 15 },
			},
		},	
	

		{
			category = "RandomFlashlight",
			classes =
			{
				{ class = "Flashlight", percent = 1 },
				{ class = "FlashlightPistol", percent = 5 },
				{ class = "FlashlightMounted", percent = 5 },
				{ class = "Headlamp", percent = 5 },
				{ class = "HeadlampRed", percent = 5 },
				{ class = "Maglite", percent = 5 },
				{ class = "MagliteSmall", percent = 5 },
			},
		},
		
		{
			category = "RandomCraftedTools",
			classes =
			{
				{ class = "CraftedHammer", percent = 33 },
				{ class = "CraftedHatchet", percent = 34 },
				{ class = "CraftedPickaxe", percent = 33 },
			},
		},

		{
			category = "RandomCraftedWeapons",
			classes =
			{
				{ category = "CraftedBowWithMagazines", percent = 1 },
				{ class = "CraftedPistol", percent = 1 },
				{ class = "CraftedRifleLong", percent = 1 },
				{ class = "CraftedSMG", percent = 1 },
				{ class = "CraftedLongPistol", percent = 1 },
				{ class = "CraftedPistol556", percent = 1 },
				{ class = "CraftedRifle9mm", percent = 1 },
				{ class = "CraftedShortRifle556", percent = 1 },
				{ class = "CraftedShortShotgun", percent = 1 },
				{ class = "CraftedShotgun", percent = 1 },
			},
		},

		-- --------------------------------------------------------------------
		-- ATTACHMENTS
		-- --------------------------------------------------------------------

		-- --------------------------------------------------------------------
		-- THROWABLES
		-- --------------------------------------------------------------------

		-- --------------------------------------------------------------------
		-- TENT CONTENTS
		-- See tent's XML item file - loot_item_category
		-- --------------------------------------------------------------------

		{
			category = "RandomTentContents",
			classes =
			{
				-- Can add all kinds of stuff to this category - clothes/weapons/etc
				{ category = "RandomUtils", percent = 5 },
				{ category = "RandomConsumable", percent = 50, min = 1, max = 2 },
				{ category = "RandomCraftedTools", percent = 10, min = 1, max = 2 },
				{ category = "RandomMedical", percent = 50 },
				{ category = "RandomCrafting", percent = 50 },
				{ category = "RandomAccessory", percent = 50 },
			},
		},

		-- --------------------------------------------------------------------
		-- VEHICLE CONTENTS
		-- See VehicleSpawnerManager.lua
		-- --------------------------------------------------------------------
		{
			category = "VehicleReady",
			group =
			{
				{ class = "CarBattery", percent = 100 },	
				{ class = "DriveBelt", percent = 100 },
				{ class = "SparkPlugs", percent = 100 },			
				{ class = "Oil", percent = 100 },
				{ class = "JerryCanDiesel", percent = 100 },
				{ class = "LugWrench", percent = 100 },
				{ class = "Oil", percent = 100 },				
				{ class = "JerryCanDiesel", percent = 100 },				
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },	
				{ class = "TowCable", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
			},
		},


		{
			category = "VehicleBasic4Wheels",
			group =
			{
				{ class = "CarBattery", percent = 100 },	
				{ class = "DriveBelt", percent = 100 },
				{ class = "SparkPlugs", percent = 100 },								
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },	
				{ class = "TowCable", percent = 100 },				
			},
		},

		{
			category = "VehicleBasic6Wheels",
			group =
			{
				{ class = "CarBattery", percent = 100 },	
				{ class = "DriveBelt", percent = 100 },
				{ class = "SparkPlugs", percent = 100 },								
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },	
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },			
			},
		},

		{
			category = "VehicleBasic8Wheels",
			group =
			{
				{ class = "CarBattery", percent = 100 },	
				{ class = "DriveBelt", percent = 100 },
				{ class = "SparkPlugs", percent = 100 },								
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },	
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "Wheel", percent = 100 },			
			},
		},
	
		{
			category = "RandomTowcarContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},

		{
			category = "RandomF100TruckContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},

		{
			category = "RandomFishingBoatContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},

		{
			-- We spawn quadbikes as a group so they will have more items because of their 6 hour decay
			category = "RandomQuadBikeContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},

		{
			-- We spawn jetskis as a group so they will have more items because of their 6 hour decay
			category = "RandomJetskiContents",
			group =
			{
				{ class = "CarBattery", percent = 100 },
				{ class = "SparkPlugs", percent = 100 },
			},
		},

		{
			-- We spawn tractors as a group so they will have more items because of their 6 hour decay
			category = "RandomTractorContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},

		{
			category = "RandomTruck5TonContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},

		{
			category = "RandomPartyBusContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},

		{
			category = "RandomPoliceSedanContents",
			classes =
			{
				{ category = "VehicleReady", percent = 100 },
			},
		},


		{
			category = "RandomPoliceSedanSlot",
			classes =
			{
				{ category = "Map", percent = 5 },
				{ category = "RandomFlashlight", percent = 5 },
				{ category = "RandomConsumable", percent = 14 },
				{ category = "RandomIncapacition", percent = 9 },
				{ category = "RandomMedical", percent = 10 },
				{ category = "RandomPoliceItems", percent = 20 },
				{ class = "CarBattery", percent = 100 },
				{ class = "DriveBelt", percent = 100 },
				{ class = "SparkPlugs", percent = 100 },
				{ class = "Wheel", percent = 100 },
				{ class = "AmcoinLedger", percent = 2 },
			},
		},

		-- --------------------------------------------------------------------
		-- AI CONTENTS/LOOT
		-- See AI's XX_x.lua files - esLootItemCategory property
		-- --------------------------------------------------------------------

		-- Animals
		{
			category = "RandomChickenLoot",
			group =
			{
				{ class = "ChickenRaw" },
				{ class = "AnimalFat", percent = 25 },
				{ class = "AnimalGut", percent = 25 },
			},
		},

		{
			category = "RandomPigLoot",
			group =
			{
				{ class = "AnimalFat", min = 4, max = 8 },
				{ class = "AnimalGut" },
				{ class = "HamRaw", min = 2, max = 4 },
			},
		},

		-- AI
		{
			category = "RandomMutantLoot",
			group =
			{				
				{ category = "RandomConsumable", percent = 20 },																			
				{ category = "RandomMushroom", percent = 19,  min = 1, max = 2 },
				{ category = "RandomMedical", percent = 18 },								
				{ category = "RandomCraftingGuide", percent = 17 },																				
				{ category = "RandomRottenAmcoin", percent = 12,  min = 1, max = 2 },				
				{ category = "RandomMelee", percent = 10 },					
				{ category = "RandomPileAmmo", percent = 9 },	
				{ category = "RandomAllNormalWeaponsWithMagazines", percent = 4 },					
				--{ category = "RandomSpecialAllItems", percent = 5 },			
			},
		},

		{
			category = "RandomRottenAmcoin",   -- 1 slots
			classes =
			{	
				{ category = "RandomRottenMeat", percent = 20 },
				{ category = "RandomRottenVeggie", percent = 20 },
				{ class = "AmcoinLedger", percent = 20, min = 5, max = 15 },
			},
		},	

		{
			category = "RandomPileAmmo",   -- 4 slots
			classes =
			{								
				{ category = "PileAmmo1", percent = 10 },
				{ category = "PileAmmo2", percent = 10 },
				{ category = "PileAmmo3", percent = 10 },
				{ category = "PileAmmo4", percent = 10 },
				{ category = "PileAmmo5", percent = 10 },
				{ category = "PileAmmo6", percent = 10 },	
				{ category = "PileAmmo7", percent = 10 },
				{ category = "PileAmmo8", percent = 10 },
				{ category = "PileAmmo9", percent = 10 },
				{ category = "PileAmmo10", percent = 10 },
				{ category = "PileAmmo11", percent = 10 },
				{ category = "PileAmmo12", percent = 10 },
			},
		},	


		{
			category = "PileAmmo1",
			group =
			{				
				{ class = "Pile_22", percent = 50, min = 4, max = 8 },
				{ class = "Pile_Flare", percent = 50, min = 1, max = 2 },
				{ class = "Pile_45ACP_Uranium", percent = 50, min = 4, max = 8 },				
			},
		},	

		{
			category = "PileAmmo2",
			group =
			{				
				{ class = "Pile_545x39", percent = 50, min = 4, max = 8 },
				{ class = "Pile_12GaugeSlug", percent = 50, min = 4, max = 8 },
				{ class = "Pile_357", percent = 50, min = 4, max = 8 },									
			},
		},
		{
			category = "PileAmmo3",
			group =
			{					
				{ category = "RandomBombItems_new", percent = 50 },				
				{ class = "Pile_6PPC", percent = 50, min = 4, max = 8 },
				{ class = "Pile_10mm", percent = 50, min = 4, max = 8 },				
			},
		},
		{
			category = "PileAmmo4",
			group =
			{
				{ category = "RandomBombItems_new", percent = 50 },
				{ class = "Pile_762x39Venom", percent = 50, min = 4, max = 8 },
				{ class = "Pile_762x51", percent = 50, min = 4, max = 8 },
			},
		},
		{
			category = "PileAmmo5",
			group =
			{
				{ class = "Pile_308", percent = 50, min = 4, max = 8 },
				{ category = "RandomBombItems_new", percent = 50 },				
				{ class = "Pile_9mm", percent = 50, min = 4, max = 8  },					
			},
		},

		{
			category = "PileAmmo6",
			group =
			{					
				{ class = "Pile_223", percent = 50, min = 4, max = 8 },				
				{ class = "Pile_45ACP_Venom", percent = 50, min = 4, max = 8 },	
				{ class = "Pile_57x28", percent = 50, min = 4, max = 8 },														
			},
		},

		{
			category = "PileAmmo7",
			group =
			{
				{ category = "RandomBombItems_new", percent = 50 },		
				{ class = "Pile_45ACP", percent = 50, min = 4, max = 8 },				
				{ class = "Pile_9mm_Venom", percent = 50, min = 4, max = 8 },				
				
			},
		},	

		{
			category = "PileAmmo8",
			group =
			{
				{ class = "Pile_556x77", percent = 50, min = 4, max = 6 },					
				{ class = "Pile_9mmIncen", percent = 50, min = 4, max = 8 },				
			},
		},
		{
			category = "PileAmmo9",
			group =
			{				
				{ class = "Pile_50cal", percent = 50, min = 4, max = 8 },				
				{ class = "Pile_9mm_DragonsBreath", percent = 50, min = 4, max = 8 },				
			},
		},
		{
			category = "PileAmmo10",
			group =
			{
				{ class = "Pile_45ACP", percent = 50, min = 4, max = 8 },				
				{ class = "Pile_57x28_Uranium", percent = 50, min = 4, max = 8 },		

			},
		},
		{
			category = "PileAmmo11",
			group =
			{
				{ class = "Pile_556x45", percent = 50, min = 4, max = 6 },				
				{ class = "Pile_45ACP_DragonsBreath", percent = 50, min = 4, max = 8 },						
			},
		},

		{
			category = "PileAmmo12",
			group =
			{	
				{ class = "Pile_762x39", percent = 50, min = 4, max = 8 },				
				{ class = "Pile_44M", percent = 50, min = 4, max = 8 },										
			},
		},



		{
			category = "RandomBearLoot",
			group =
			{
				{ class = "AnimalGut" },
				{ class = "AnimalFat", min = 6, max = 12 },
				{ class = "BearMeatRaw", min = 5, max = 6, },
				{ class = "BearPelt" },
				{ class = "AmcoinLedger", min = 1, max = 10, },
			},
		},

		{
			category = "RandomBruteLoot",
			group =
			{
				{ category = "RandomCraftingGuide", percent = 100 },
				{ category = "RandomConsumable", percent = 100 },
				{ class = "AmcoinLedger", percent = 100, min = 25, max = 50 },
				{ category = "RandomPileAmmo", percent = 100 },				
				{ category = "RandomExtendedMagazines", percent = 50 },				
				{ category = "RandomMushroom", percent = 100 },
				{ category = "RandomPileMax", percent = 100 },
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomMelee", percent = 50 },					
				{ category = "RandomBombItems_new", percent = 50 },					
				{ category = "RandomAmmo", percent = 50 },			
				{ category = "RandomCraftingGuide", percent = 50 },	
				{ category = "RandomBruteWeapons", percent = 50 },			
			},
		},


		{
			category = "RandomPileMax",
			classes =
			{
				{ class = "Pile_45ACP", percent = 5, min = 20, max = 30 },	
				{ class = "Pile_556x45", percent = 5, min = 20, max = 30 },
				{ class = "Pile_762x39", percent = 5, min = 20, max = 30 },
				{ class = "Pile_50cal", percent = 5, min = 10, max = 15 },
				{ class = "Pile_sticky", percent = 5, min = 4, max = 5 },	
				{ class = "Pile_556x77", percent = 5, min = 20, max = 30 },	
				{ class = "Pile_762x39Venom", percent = 5, min = 20, max = 30 },
				{ class = "Pile_762x51", percent = 5, min = 15, max = 15 },
				{ class = "Pile_6PPC", percent = 5, min = 20, max = 30 },
				{ class = "Pile_10mm", percent = 5, min = 20, max = 30 },
				{ class = "Pile_545x39", percent = 5, min = 20, max = 30 },
			},
		},

		{
			category = "RandomBruteWeapons",
			classes =
			{
				{ category = "RandomNormalGoodWeapons", percent = 50 },
				{ category = "RandomNormalWeaponMagazines", percent = 50 },
				{ category = "RandomBestSnipersMagazines", percent = 50 },
			},
		},


		{
			category = "RandomDeerLoot",
			group =
			{
				{ class = "AnimalFat", min = 4, max = 8 },
				{ class = "AnimalGut", min = 1, max = 2 },
				{ class = "DeerMeatSteakRaw", min = 3, max = 4 },
				{ class = "DeerPelt" },
				{ class = "AmcoinLedger", min = 1, max = 5, },
			},
		},

		{
			category = "RandomHumanSpiderLoot",
			group =
			{
				{ class = "AmcoinLedger", percent = 40, min = 15, max = 25 },
				{ category = "RandomAmmoBox", percent = 15 },
				{ category = "RandomBruteWeapons", percent = 50	},			
				{ category = "RandomPileAmmo", percent = 20 },				
				{ category = "RandomCraftingGuide", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomConsumable", percent = 100 },
				{ category = "RandomMushroom", percent = 100 },				
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomMelee", percent = 20 },							
				{ category = "RandomPileMax", percent = 100 },			
			},
		},

		{
			category = "RandomWolfLoot",
			group =
			{
				{ class = "AnimalFat", min = 4, max = 8 },
				{ class = "AnimalGut" },
				{ class = "WolfMeatSteakRaw", min = 2, max = 3 },
				{ class = "WolfPelt" },
			},
		},

		-- --------------------------------------------------------------------
		-- ITEM CONTENTS
		-- --------------------------------------------------------------------

		{
			category = "RandomBackpackContents",  -- 30 slots
			classes =
			{
				{ category = "RandomChristmasPresent", percent = 3 }, --Christmas event
				{ category = "halloweenBagCommon", percent = 3 }, -- Halloween event
				{ category = "RandomUtils", percent = 1 },
				{ category = "RandomCraftingGuide", percent = 10 },
				{ category = "RandomClothes", percent = 50 },
				{ category = "RandomCrafting", percent = 5 },
				{ category = "RandomFlashlight", percent = 5 },
				{ category = "RandomConsumable", percent = 50, min = 1, max = 2 },
				{ category = "RandomMaintenance", percent = 1 },
				{ category = "RandomMedical", percent = 50 },
				{ class = "AmcoinLedger", percent = 1, min = 10, max = 20   },
			},
		},

		{
			category = "RandomTorsoContents",
			classes =
			{
				{ category = "RandomUtils", percent = 1 },
				{ category = "RandomConsumable", percent = 10 },
				{ category = "RandomMedical", percent = 10 },
			},
		},

		{
			category = "RandomWaistContents",
			classes =
			{
				{ category = "RandomConsumable", percent = 10 },
				{ category = "RandomFlashlight", percent = 5 },
				{ class = "AmcoinLedger", percent = 1 , min = 10, max = 20},
			},
		},

		{
			category = "RandomLegsContents",
			classes =
			{
				{ category = "RandomConsumable", percent = 10 },
				{ category = "RandomFlashlight", percent = 5 },
				{ category = "RandomMedical", percent = 10 },
				{ class = "AmcoinLedger", percent = 1 , min = 10, max = 20 },
			},
		},

		-- --------------------------------------------------------------------
		-- POLICE SECTION
		-- --------------------------------------------------------------------
		-- Special Police Spawner
		{
			category = "RandomPoliceItems", 
			classes =
			{
				{ category = "HandcuffsWithKey", percent = 2 },
				{ category = "RandomPoliceClothing", percent = 5 },
				{ category = "RandomCraftingGuide", percent = 4 },
				{ category = "RandomPoliceWeaponWithMagazines", percent = 50 },
				{ category = "RandomPoliceArmor", percent = 5 },
				{ category = "RandomAccessory", percent = 5 },
				{ class = "Cb_radio", percent = 1 },
				{ class = "FlashbangPickup", percent = 1 },
				{ class = "GrenadeGasTearPickup", percent = 1 },
				{ class = "GrenadeGasSleepPickup", percent = 1 },
				{ class = "MagliteSmall", percent = 4 },
				{ class = "PistolSilencer", percent = 3 },
				{ class = "RifleSilencer", percent = 5 },
				{ class = "Megaphone", percent = 1 },
				{ class = "PoliceBaton", percent = 1 },
				{ class = "StunBaton", percent = 1 },
				{ class = "AmcoinLedger", percent = 3 },				
			},
		},

		{
			category = "RandomPoliceClothing",
			classes =
			{
				{ category = "RandomPoliceBodyArmor", percent = 30 },
				{ class = "CargoPantsBlack", percent = 10 },
				{ class = "flexcap_policefrontback_black", percent = 1 },
				{ class = "flexcap_policefrontback_blue", percent = 1 },
				{ class = "flexcap_policefrontback_camo1", percent = 1 },
				{ class = "flexcap_policefrontback_camo2", percent = 1 },
				{ class = "flexcap_policefrontback_camo3", percent = 1 },
				{ class = "flexcap_policefrontback_camo4", percent = 1 },
				{ category = "RandomPoliceHelmet", percent = 30 },
				{ category = "RandomCraftingGuide", percent = 1 },
				{ class = "TacticalVestBlack", percent = 20 },
				{ class = "TshirtPoliceBlack", percent = 1 },
				{ class = "TshirtPoliceBlue", percent = 1 },
				{ class = "AmcoinLedger", percent = 1 },
			},
		},

		{
			category = "RandomPoliceWeaponWithMagazines",
			classes =
			{
				{ category = "G18PistolWithMagazines", percent = 8 },
				{ category = "AKMWithMagazines", percent = 50 },				
				{ category = "AP85WithMagazines", percent = 8 },
				{ category = "Shotgun870TacticalWithMagazines", percent = 8 },
				{ category = "PX4WithMagazines", percent = 5 },
				{ category = "AA12WithMagazines", percent = 10 },
				{ category = "AUMP45WithMagazines", percent = 50 }, 
				{ category = "R90WithMagazines", percent = 20 },
				{ category = "MP5WithMagazines", percent = 20 },				
				{ category = "M4A1WithMagazines", percent = 30 },
				{ category = "SCARWithMagazines", percent = 30 },			
				{ category = "ScorpionWithMagazines", percent = 11 },
				{ category = "MAC10WithMagazines", percent = 5 },
				--{ category = "UZIWithMagazines", percent = 11 }, -- Old Mac-10 Disabled
				{ category = "MAK10WithRounds", percent = 5 },
				{ category = "SAS12WithRounds", percent = 5 },	
				{ category = "RandomAccessory", percent = 5 },
			},
		},

		-- --------------------------------------------------------------------
		-- MILITARY SECTION
		-- --------------------------------------------------------------------
		-- Special Military Spawner
		{
			category = "RandomMilitaryItems", 
			classes =
			{
				{ category = "RandomAccessory", percent = 10 },
				{ category = "RandomCraftingGuide", percent = 35 },
				{ category = "RandomGhillieSuitComplete", percent = 10 },
				{ category = "RandomHazmatSuit", percent = 10 },
				{ category = "RandomMilitaryClothing", percent = 40 },
				{ category = "RandomMilitaryGrenade", percent = 40 },
				{ category = "RandomMilitaryWeaponWithMagazines", percent = 100 },
				{ category = "RandomPoliceWeaponWithMagazines", percent = 100 },					
				{ class = "Binoculars", percent = 1 },
				{ class = "C4Bricks", percent = 10 },
				{ class = "Cb_radio", percent = 1 },
				{ class = "HazmatMask", percent = 10 },
				{ class = "FlashlightPistol", percent = 5 },
				{ class = "PistolSilencer", percent = 2 },
				{ class = "RifleSilencer", percent = 5 },
				{ class = "Maglite", percent = 2 },
				{ class = "MagliteSmall", percent = 2 },
				{ class = "MilitaryCanteenPlastic", percent = 4 },
				{ class = "MilitaryCanteenMetal", percent = 2 },
				{ class = "MRE", percent = 3 },
				{ class = "SurvivalKnife", percent = 2 },
				{ class = "hesco_barrier", percent = 1 },
			},
		},

		{
			category = "RandomMilitaryClothing",
			classes =
			{
				{ category = "RandomMilitaryBodyArmor", percent = 80 },
				{ category = "RandomCamoClothes", percent = 20 },
				{ category = "RandomMilitaryGloves", percent = 30 },
				{ category = "RandomMilitaryHelmet", percent = 30 },
				{ category = "RandomMilitaryJacket", percent = 30 },
				{ category = "RandomMilitaryShoes", percent = 10 },
			},
		},

		{
			category = "RandomMilitaryWeaponWithMagazines",
			classes =
			{
				{ category = "RandomPoliceWeaponWithMagazines", percent = 45 },
				{ category = "M249WithMagazines", percent = 30 },
				{ category = "KrissVWithMagazines", percent = 20 },
				{ category = "M1911WithMagazines", percent = 30 },
				{ category = "M40A5WithMagazines", percent = 50 },
				{ category = "M16WithMagazines", percent = 50 },
				{ category = "AT15WithMagazines", percent = 50 },				
				{ category = "M4A1WithMagazines", percent = 25 },
				{ category = "SCARWithMagazines", percent = 25 },				
				{ category = "AkValWithMagazines", percent = 15 },
				{ category = "AK5DWithMagazines", percent = 15 },
				{ category = "M97WithRounds", percent = 10 },			
			},
		},

		-- --------------------------------------------------------------------
		-- HUNTING SECTION
		-- --------------------------------------------------------------------
		-- Civilian Hunting Items Spawner
		{
			category = "RandomHuntingItems",
			classes =
			{
				{ category = "RandomHuntingWeapons", percent = 40 },
				{ category = "RandomHuntingClothing", percent = 39 },
				{ category = "RandomCraftingGuide", percent = 60 },
				{ class = "Cb_radio", percent = 1 },
				{ class = "Map", percent = 1 },
				{ class = "Binoculars", percent = 2 },
				{ class = "HuntingScope", percent = 20 },
			},
		},

		-- Civilian Hunting Weapons
		{
			category = "RandomHuntingWeapons",
			classes =
			{
				{ category = "Rem700WithRounds", percent = 40 },
				{ category = "RandomPoliceWeaponWithMagazines", percent = 60 },
				{ category = "Rem870WithRounds", percent = 22 },
				{ category = "Sako85WithRounds", percent = 25 },
				{ category = "M14WithRounds", percent = 20 },
				{ category = "CrossbowWithMagazines", percent = 1 },
				{ class = "HuntingKnife", percent = 1 },
			},
		},

		-- Civilian Hunting Clothing 
		-- camo1 is the duck type camo good for civilian use
		{
			category = "RandomHuntingClothing",
			classes =
			{
				{ class = "CargoPantsCamo1", percent = 25 },
				{ class = "WoolGlovesCamo1", percent = 10 },
				{ class = "CottonShirtBrown", percent = 20 },
				{ class = "RuggedPackCamo1", percent = 20 },
				{ class = "TshirtCamo1", percent = 25 },
			},
		},

		-- --------------------------------------------------------------------
		-- HOLIDAY/SEASONAL
		-- --------------------------------------------------------------------

		{
			category = "RandomChristmasPresent",
			classes =
			{
				{ category = "ChristmasPresentCommon", percent = 50 },
				{ category = "ChristmasPresentCommon", percent = 50 },
			},
		},
		
		{
			category = "halloweenBagCommon",
			classes =
			{
				{ class = "HalloweenBagMonster", percent = 50 },
				{ class = "HalloweenBagPumpkin", percent = 50 },
			},
		},

	
		-- Used in presents and easter eggs
		{
			category = "ChristmasPresentCommon",
			classes =
			{
				{ class = "christmas_light_string", percent = 20 },
				{ class = "christmas_candle", percent = 10 },
				{ class = "christmas_gift_pile", percent = 20 },
				{ class = "christmas_rug_01", percent = 10 },
				{ class = "christmas_rug_02", percent = 10 },
				{ class = "SweaterChristmasGreen", percent = 8 },
				{ class = "SweaterChristmasRed", percent = 8 },
				{ class = "ChristmasHat", percent = 6 },
				{ class = "snowman_small", percent = 6 },
				{ class = "Peacemaker", percent = 2 },
			},
		},
		
		{
			category = "ChristmasPresentRare",
			classes =
			{
				{ class = "snowman", percent = 20 },
				{ class = "christmas_rug_03", percent = 20 },
				{ class = "SweaterChristmasGreen2", percent = 15 },
				{ class = "SweaterChristmasRed2", percent = 15 },
				{ class = "christmas_wreath", percent = 12 },
				{ class = "christmas_stocking", percent = 10 },
				{ class = "christmas_snowglobe", percent = 5 },
				{ class = "ScavengerHelmet", percent = 2 },
				{ class = "EggNog", percent = 0.5 },
				{ class = "GingerBreadMan", percent = 0.5 },
			},
		},
		


		{
			category = "RandomChristmasClothing",
			classes =
			{
				{ class = "ChristmasHat", percent = 20 },
				{ class = "SweaterChristmasGreen", percent = 20 },
				{ class = "SweaterChristmasGreen2", percent = 20 },
				{ class = "SweaterChristmasRed", percent = 20 },
				{ class = "SweaterChristmasRed2", percent = 20 },
			},
		},
		
		{
			category = "HalloweenBagCommonLoot",
			classes =
			{
				{ class = "jack_o_lantern", percent = 15 },
				{ class = "halloween_light_string", percent = 24.5 },
				{ class = "halloween_creepy_bunny", percent = 24.9 },
				{ class = "SkullMask", percent = 10 },
				{ class = "SkullMaskSilver", percent = 5 },				
				{ class = "HK416", percent = 5 },
				{ class = "HK416_2", percent = 5 },
				{ class = "Mk18Reaver", percent = 5 },
				{ class = "Milkor", percent = 5 },
				{ class = "Milkor_2", percent = 5 },
				{ class = "AUGA3", percent = 5 },
				{ class = "AUGA3_2", percent = 5 },
				{ class = "SVLK-14S", percent = 5 },
				{ class = "SVLK-14S_2", percent = 5 },
				{ class = "ACR3", percent = 5 },
				{ class = "ACR3_2", percent = 5 },
				{ class = "at15fire", percent = 5 },
			},
		},
		
		{
			category = "HalloweenBagRare",
			classes =
			{
				{ class = "jack_o_lantern", percent = 5 },
				{ class = "halloween_candle", percent = 5 },
				{ class = "halloween_creepy_bear", percent = 5 },
				{ class = "SkullMask", percent = 5 },
				{ class = "SkullMaskGold", percent = 5 },
				{ class = "G36C", percent = 5 },
				{ class = "akmblack", percent = 5 },
				{ class = "AKAlfa", percent = 5 },
				{ class = "SV-98", percent = 5 },
				{ class = "SV-98_3", percent = 5 },
				{ class = "AKAlfa_2", percent = 5 },
				{ class = "SigMPX", percent = 5 },
				{ class = "SigMPX_2", percent = 5 },
				{ class = "Tavor", percent = 5 },
				{ class = "Tavor_2", percent = 5 },
				{ class = "GrimReaperVenom", percent = 5 },				
				{ class = "SpaceHelmet", percent = 5 },
				{ class = "ScavengerPants", percent = 3 },
			},
		},


			-- --------------------------------------------------------------------
		-- BASE PARTS
		-- --------------------------------------------------------------------


		{
			category = "RandomMiniUFO",
			classes =
			{
				{ class = "ufo_tow_packed", percent = 50 },
				{ class = "ufo_tow_packed2", percent = 50 },			
				{ class = "ufo_tow_packed3", percent = 50 },
				{ class = "ufo_tow_packed4", percent = 50 },
			},
		},


		{
			category = "RandomMetalPart",
			classes =
			{
						-- doors (7)
				--{ class = "metal_door_lockable_1m_2m", percent = 7 },

				-- walls (56.99)
				--{ class = "metal_aframe_3m_4m", percent = 5 },
				--{ class = "metal_wall_1_3m_2m", percent = 5 },
				--{ class = "metal_wall_1_3m_4m", percent = 5 }, 
				--{ class = "metal_wall_2m_2m", percent = 5 },
				--{ class = "metal_wall_2m_4m", percent = 10 },
				--{ class = "metal_wall_3m_2m", percent = 5 },
				--{ class = "metal_wall_3m_4m", percent = 14.99 },

				-- special walls (20)
				--{ class = "metal_wall_door_3m_4m", percent = 6.0 }, 
				--{ class = "metal_wall_window_3m_2m", percent = 4 },
				--{ class = "metal_wall_window_3m_4m", percent = 10 },

				-- gatehouse (9)
				--{ class = "metal_gatehouse_4m_8m", percent = 4 },				
				--{ class = "metal_gate_lockable_3m_5_4m", percent = 5 },
				
				--platforms
				--{ class = "metal_platform_3m_4m_4m", percent = 5 },

				--Crates
				{ class = "metal_safe", percent = 1.6 },
				{ class = "safe_large", percent = 1.6 },
				{ class = "safedoor_large2", percent = 1.6 },
				
								

				-- custom (6.01)
				--{ class = "metal_steam_stand", percent = 1.6 },
				--{ class = "metal_kiosk", percent = 2 }, disabled
					
			
				{ class = "gnome_giant_c", percent = 1.6 },	
				{ class = "gnome_giant_scot", percent = 1.6 },				
				{ class = "christmas_tree", percent = 1.6 }, -- disabled until christmas

				{ class = "arcade_cabinet", percent = 1.6 },
				{ class = "arcade_cabinet_simpsons", percent = 1.6 },
				{ class = "arcade_cabinet_miscreated", percent = 1.6 },
				{ class = "arcade_cabinet_twitch", percent = 1.6 },
				{ class = "arcade_cabinet_mrspacman", percent = 1.6 },

				--towables
				{ class = "toolbox_storage_crate_packed",  percent = 1.6 },
				{ class = "powered_generator_diesel",  percent = 1.6 },
				{ class = "airdrop_storage_crate_packed", percent = 1.6 },
				{ class = "mailbox_storage_packed", percent = 1.6 },
				{ class = "umbrella_open_tow_packed", percent = 1.6 },
				{ class = "iron_sons_storage_crate_packed", percent = 1.6 },
				{ class = "electric_stove_storage_packed",  percent = 1.6 },
				{ class = "barrel_storage_packed", percent = 1.6 },
				{ class = "hospital_bed_tow_packed", percent = 1.6 },
				{ class = "atm_storage_packed", percent = 1.6 },
				{ class = "firehydrant_tow_packed", percent = 1.6 },
				{ class = "oil_rack_storage_packed", percent = 1.6 },
				{ class = "oil_tank_tow_packed", percent = 1.6 },
				{ class = "payphone_tow_packed", percent = 1.6 },
				{ class = "toilet_tow_packed", percent = 1.6 },
				{ class = "hospital_standingcurtain_tow_packed", percent = 1.6 },
				{ class = "decontam_shower_tow_packed", percent = 1.6 },
				{ class = "bodybag_tow_packed", percent = 1.6 },
				{ class = "trashcan_tow_packed", percent = 1.6 },
				{ class = "whiteboard_tow_packed", percent = 1.6 },
				{ class = "hospital_drugcart_tow_packed", percent = 1.6 },
				{ class = "folding_cot_tow_packed", percent = 1.6 },
				{ class = "green_tent_tow_packed", percent = 1.6 },
				{ class = "display_counter_tow_packed", percent = 1.6 },
				{ class = "wheelchair_tow_packed", percent = 1.6 },
				{ class = "vendingmachine_1_tow_packed", percent = 1.6 },
				{ class = "vendingmachine_2_tow_packed", percent = 1.6 },
				{ class = "mapsign_tow_packed", percent = 1.6 },
				{ class = "hospital_medicalcabinet_tow_packed", percent = 1.6 },
				{ class = "airdrop_storage_tow_packed", percent = 1.6 },
				{ class = "alien_crate_tow_packed", percent = 1.6 },
				{ class = "small_plane_a_tow_packed", percent = 1.6 },
				{ class = "small_plane_b_tow_packed", percent = 1.6 },
				{ class = "small_plane_c_tow_packed", percent = 1.6 },
				{ class = "small_plane_d_tow_packed", percent = 1.6 },
				{ class = "small_plane_e_tow_packed", percent = 1.6 },
				{ class = "hospital_gascart_tow_packed", percent = 1.6 },
				{ class = "hospital_supplycart_tow_packed", percent = 1.6 },
				{ class = "hospital_vital_signs_monitor_tow_packed", percent = 1.6 },
				{ class = "fridge_modern_tow_packed", percent = 1.6 },
				{ class = "shopping_cart_tow_packed", percent = 1.6 },
				{ class = "stone_grave_tow_packed", percent = 1.6 },
				{ class = "water_dispenser_tow_packed", percent = 1.6 },
				{ class = "hospital_supplycabinet_tow_packed", percent = 1.6 },
				{ class = "hospital_ecg_monitor_tow_packed", percent = 1.6 },
				{ class = "hospital_bodybag_tow_packed", percent = 1.6 },
				{ class = "icemachine_tow_packed", percent = 1.6 },
				{ class = "office_desk_tow_packed", percent = 1.6 },
				{ class = "filecab_01_tow_packed", percent = 1.6 },		
				{ class = "carlift_tow_packed", percent = 1.6 },
				{ class = "bathroom_sink_tow_packed", percent = 1.6 },
				{ class = "bathtub_tow_packed", percent = 1.6 },				
				
			},
		},

		{
			category = "RandomBpartPresent",
			classes =
			{
				{ class = "wood_watchtower", percent = 17 },
				{ class = "wood_watchtower_tire", percent = 17 },
				{ class = "wood_gate_lockable_3m_4m", percent = 17 },
				{ class = "wood_gatehouse", percent = 17 },
				{ class = "wood_door_lockable_1m_2m", percent = 16 },
			},
		},

		-- --------------------------------------------------------------------
		-- CLOTHING
		-- --------------------------------------------------------------------

		-- Back
		{
			category = "RuggedPack",
			classes =
			{
				{ class = "RuggedPack", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackBlack", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackBrown", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackCamo1", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackCamo2", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackCamo3", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackCamo4", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackGreen", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackGreenCamo1", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackGreenCamo2", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackGreenCamo3", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackGreenCamo4", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackBlue", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackOGreen", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackPink", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackPurple", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackRed", contents="RandomBackpackContents", percent = 20 },
				{ class = "RuggedPackYellow", contents="RandomBackpackContents", percent = 20 },
			},
		},

		{
			category = "RandomRuggedPackAirPlane",
			classes =
			{
				{ class = "RuggedPack", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackBlack", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackBrown", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackCamo1", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackCamo2", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackCamo3", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackCamo4", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackGreen", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackGreenCamo1", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackGreenCamo2", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackGreenCamo3", contents="RandomSmallBackpackAirPlaneContents", percent = 5 },
				{ class = "RuggedPackGreenCamo4", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackBlue", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackOGreen", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackPink", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackPurple", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackRed", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
				{ class = "RuggedPackYellow", contents="RandomSmallBackpackAirPlaneContents", percent = 15 },
			},
		},

		{
			category = "RandomRuckSack",
			classes =
			{
				{ class = "RuckSack", contents="RandomBackpackContents", percent = 100 },
			},
		},

		{
			category = "RandomRuckSackAirPlane",
			classes =
			{
				{ class = "RuckSack", contents="RandomBigBackpackAirPlaneContents", percent = 100 },
			},
		},

		{
			category = "RandomDuffelBag",
			classes =
			{
				{ class = "DuffelBag", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagBlack", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagGreen", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagGreenCamo1", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagGreenCamo2", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagGreenCamo3", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagGreenCamo4", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagTanCamo1", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagTanCamo2", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagTanCamo3", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagTanCamo4", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo1", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo2", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo3", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo4", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagBlue", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagLightBlue", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagOGreen", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagPink", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagPurple", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagRed", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagWhite", contents="RandomBackpackContents", percent = 15 },
				{ class = "DuffelBagYellow", contents="RandomBackpackContents", percent = 15 },
			},
		},

		{
			category = "RandomDuffelBagAirPlane",
			classes =
			{
				{ class = "DuffelBag", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagBlack", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagGreen", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagGreenCamo1", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagGreenCamo2", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagGreenCamo3", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagGreenCamo4", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagTanCamo1", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagTanCamo2", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagTanCamo3", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagTanCamo4", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo1", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo2", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo3", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagUrbanCamo4", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagBlue", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagLightBlue", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagOGreen", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagPink", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagPurple", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagRed", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagWhite", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "DuffelBagYellow", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
			},
		},

		{
			category = "RandomLastShotBagAirPlane",
			classes =
			{
				{ class = "SMBag1", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag2", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag3", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag4", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag5", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag6", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag7", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag8", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag9", contents="RandomBigBackpackAirPlaneContents", percent = 15 },
				{ class = "SMBag10", contents="RandomBigBackpackAirPlaneContents", percent = 15 },				
			},
		},		


		{
			category = "RandomStowPack",
			classes =
			{
				{ class = "StowPackBlack", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackBlue", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackGreen", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackOrange", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackPink", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackPurple", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackRed", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackWhite", contents="RandomBackpackContents", percent = 15 },
				{ class = "StowPackYellow", contents="RandomBackpackContents", percent = 15 },
			},
		},

		-- Face
		{
			category = "RandomBandana",
			classes =
			{
				{ class = "BandanaBlack", percent = 7 },
				{ class = "BandanaBrown", percent = 6 },
				{ class = "BandanaCamo1", percent = 7 },
				{ class = "BandanaCamo2", percent = 7 },
				{ class = "BandanaCamo3", percent = 7 },
				{ class = "BandanaCamo4", percent = 7 },
				{ class = "BandanaGray", percent = 7 },
				{ class = "BandanaGreen", percent = 7 },
				{ class = "BandanaKhaki", percent = 7 },
				{ class = "BandanaOrange", percent = 6 },
				{ class = "BandanaPink", percent = 7 },
				{ class = "BandanaRed", percent = 6 },
				{ class = "BandanaPurple", percent = 7 },
				{ class = "BandanaYellow", percent = 6 },
				{ class = "BandanaYellowHex", percent = 6 },
			},
		},

		{
			category = "RandomBalaclava",
			classes =
			{
				{ class = "BalaclavaBlack", percent = 20 },
				{ class = "BalaclavaGray", percent = 20 },
				{ class = "BalaclavaGreen", percent = 20 },
				{ class = "BalaclavaPink", percent = 20 },
				{ class = "BalaclavaYellow", percent = 20 },
			},
		},


		-- Feet
		{
			category = "RandomCombatBoots",
			classes =
			{
				{ class = "CombatBootsBlack", percent = 45 },
				{ class = "CombatBootsCamo", percent = 45 },
				{ class = "CombatBootsTan", percent = 45 },
			},
		},

		{
			category = "RandomHitops",
			classes =
			{
				{ class = "HitopsBlack", percent = 16 },
				{ class = "HitopsBlue", percent = 14 },
				{ class = "HitopsGreen", percent = 14 },
				{ class = "HitopsPink", percent = 14 },
				{ class = "HitopsPurple", percent = 14 },
				{ class = "HitopsRed", percent = 14 },
				{ class = "HitopsYellow", percent = 14 },
			},
		},

		{
			category = "RandomSneakers",
			classes =
			{
				{ class = "Sneakers", percent = 6.25 },
				{ class = "SneakersBlack", percent = 6.25 },
				{ class = "SneakersBlackBlue", percent = 6.25 },
				{ class = "SneakersBlackGreen", percent = 6.25 },
				{ class = "SneakersBlackPink", percent = 6.25 },
				{ class = "SneakersBlackRed", percent = 6.25 },
				{ class = "SneakersBlueBlack", percent = 6.25 },
				{ class = "SneakersBrown", percent = 6.25 },
				{ class = "SneakersGreenBlack", percent = 6.25 },
				{ class = "SneakersPinkBlack", percent = 6.25 },
				{ class = "SneakersRedBlack", percent = 6.25 },
				{ class = "SneakersSilver", percent = 6.25 },
				{ class = "SneakersWhite", percent = 6.25 },
				{ class = "SneakersWhiteBlue", percent = 6.25 },
				{ class = "SneakersWhiteGreen", percent = 6.25 },
				{ class = "SneakersWhitePink", percent = 6.25 },
			},
		},

		{
			category = "RandomSteeltoedBoots",
			classes =
			{
				{ class = "SteeltoedBootsBlack", percent = 65 },
				{ class = "SteeltoedBootsBrown", percent = 65 },
			},
		},


		-- Hands
		{
			category = "RandomMilitaryGloves",
			classes =
			{
				{ class = "MilitaryGlovesBlack", percent = 35 },
				{ class = "MilitaryGlovesBrown", percent = 35 },
				{ class = "MilitaryGlovesGreen", percent = 5 },
				{ class = "MilitaryGloves", percent = 35 },
			},
		},

		{
			category = "RandomWoolGloves",
			classes =
			{
				{ class = "WoolGlovesBlack", percent = 15 },
				{ class = "WoolGlovesBlue", percent = 20 },
				{ class = "WoolGlovesBrown", percent = 20 },
				{ class = "WoolGlovesGreen", percent = 10 },
				{ class = "WoolGlovesCamo1", percent = 5 },
				{ class = "WoolGlovesCamo2", percent = 5 },
				{ class = "WoolGlovesCamo3", percent = 5 },
				{ class = "WoolGlovesCamo4", percent = 5 },
				{ class = "WoolGlovesWhite", percent = 15 },
			},
		},


		-- Hat
		{
			category = "BandanaHat",
			classes =
			{
				{ class = "BandanaHat", percent = 20 },
				{ class = "BandanaHatCamo1", percent = 20 },
				{ class = "BandanaHatCamo2", percent = 20 },
				{ class = "BandanaHatCamo3", percent = 20 },
				{ class = "BandanaHatCamo4", percent = 20 },
			},
		},

		{
			category = "RandomCowboyHat",
			classes =
			{
				{ class = "CowboyHat", percent = 34 },
				{ class = "CowboyHatLeather", percent = 33 },
				{ class = "CowboyHatStraw", percent = 33 },
			},
		},

		{
			category = "RandomMilitaryHelmet",
			classes = 
			{
				{ class = "MilitaryHelmetGreen", percent = 20 },
				{ class = "MilitaryHelmetGreenCamo1", percent = 20 },
				{ class = "MilitaryHelmetGreenCamo2", percent = 20 },
				{ class = "MilitaryHelmetGreenCamo3", percent = 20 },
				{ class = "MilitaryHelmetGreenCamo4", percent = 20 },
				{ class = "MilitaryHelmetTan", percent = 20 },
				{ class = "MilitaryHelmetTanCamo1", percent = 20 },
				{ class = "MilitaryHelmetTanCamo2", percent = 20 },
				{ class = "MilitaryHelmetTanCamo3", percent = 20 },
				{ class = "MilitaryHelmetTanCamo4", percent = 20 },
				{ class = "MilitaryHelmetUrbanCamo1", percent = 20 },
				{ class = "MilitaryHelmetUrbanCamo2", percent = 20 },
				{ class = "MilitaryHelmetUrbanCamo3", percent = 20 },
				{ class = "MilitaryHelmetUrbanCamo4", percent = 20 },
				{ class = "MilitaryHelmetBlack", percent = 20 },
				{ class = "MilitaryHelmetBlue", percent = 20 },
				{ class = "MilitaryHelmetOGreen", percent = 20 },
				{ class = "MilitaryHelmetPink", percent = 20 },
				{ class = "MilitaryHelmetPurple", percent = 20 },
				{ class = "MilitaryHelmetRed", percent = 20 },
				{ class = "MilitaryHelmetWhite", percent = 20 },
				{ class = "MilitaryHelmetYellow", percent = 20 },
			},
		},
		
		{
			category = "RandomCivilianHelmet",
			classes = 
			{
				{ class = "FootballHelmet", percent = 3 },
				{ class = "FootballHelmetAmerica", percent = 3 },
				{ class = "FootballHelmetBlack", percent = 3 },
				{ class = "FootballHelmetBlue", percent = 4 },
				{ class = "FootballHelmetFabulous", percent = 3 },
				{ class = "FootballHelmetGold", percent = 3 },
				{ class = "FootballHelmetGreen", percent = 4 },
				{ class = "FootballHelmetRed", percent = 3 },
				{ class = "FootballHelmetStripedBlack", percent = 3 },
				{ class = "FootballHelmetStripedBlue", percent = 3 },
				{ class = "FootballHelmetStripedGreen", percent = 4 },
				{ class = "FootballHelmetStripedRed", percent = 3 },
				{ class = "FootballHelmetStripedTeal", percent = 3 },
				{ class = "FootballHelmetStripedYellow", percent = 4 },
				{ class = "FootballHelmetWhiteStripedBlack", percent = 3 },
				{ class = "FootballHelmetWhiteStripedBlue", percent = 3 },
				{ class = "FootballHelmetWhiteStripedGreen", percent = 3 },
				{ class = "FootballHelmetWhiteStripedRed", percent = 3 },
				{ class = "FootballHelmetWhiteStripedTeal", percent = 3 },
				{ class = "FootballHelmetWhiteStripedYellow", percent = 3 },
				{ class = "FootballHelmetYellow", percent = 3 },
				{ class = "BikeHelmetBlack", percent = 3 },
				{ class = "BikeHelmetBlue", percent = 3 },
				{ class = "BikeHelmetGreen", percent = 3 },
				{ class = "BikeHelmetPink", percent = 3 },
				{ class = "BikeHelmetPurple", percent = 3 },
				{ class = "BikeHelmetRed", percent = 3 },
				{ class = "BikeHelmetWhite", percent = 3 },
				{ class = "BikeHelmetYellow", percent = 3 },
				{ class = "MotorcycleHelmetCarbon", percent = 10 },
				{ class = "MotorcycleHelmetGold", percent = 10 },
				{ class = "MotorcycleHelmetWhite", percent = 10 },	
			},
		},

		-- Legs
		{
			category = "RandomBlueJeans2",
			classes =
			{
				{ class = "BlueJeans", contents="RandomLegsContents", percent = 25 },
				{ class = "BlueJeans2", contents="RandomLegsContents", percent = 25 },
				{ class = "BlueJeans2Brown", contents="RandomLegsContents", percent = 25 },
				{ class = "BlueJeans2Green", contents="RandomLegsContents", percent = 25 },
			},
		},

		{
			category = "RandomCargoPants",
			classes =
			{
				{ class = "CargoPantsBlack", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoPantsCamo1", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsCamo2", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsCamo3", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsCamo4", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsGreen", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsGreenCamo1", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoPantsGreenCamo2", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoPantsGreenCamo3", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoPantsGreenCamo4", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoPantsTan", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsUrbanCamo1", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsUrbanCamo2", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsUrbanCamo3", contents="RandomLegsContents", percent = 10 },
				{ class = "CargoPantsUrbanCamo4", contents="RandomLegsContents", percent = 10 },
			},
		},

		{
			category = "RandomCargoShorts",
			classes =
			{
				{ class = "CargoShortsBlack", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsBlue", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsBrightBlue", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsBrightGreen", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsBrightPink", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsBrightRed", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsBrown", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsCamo1", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsCamo2", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsCamo3", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsCamo4", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsDarkGrey", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsGreen", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsGrey", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsTan", contents="RandomLegsContents", percent = 20 },
				{ class = "CargoShortsYellow", contents="RandomLegsContents", percent = 20 },
			},
		},

		{
			category = "RandomTrackPants",
			classes =
			{
				{ class = "TrackPantsBlack", percent = 20 },
				{ class = "TrackPantsBlue", percent = 20 },
				{ class = "TrackPantsGreen", percent = 20 },
				{ class = "TrackPantsOrange", percent = 20 },
				{ class = "TrackPantsPink", percent = 10 },
				{ class = "TrackPantsYellow", percent = 10 },
			},
		},

		{
			category = "RandomWandererPants",
			classes =
			{
				{ class = "WandererPantsBlack", contents="RandomLegsContents", percent = 17 },
				{ class = "WandererPantsBlue", contents="RandomLegsContents", percent = 17 },
				{ class = "WandererPantsBrown", contents="RandomLegsContents", percent = 17 },
				{ class = "WandererPantsGreen", contents="RandomLegsContents", percent = 17 },
				{ class = "WandererPantsRed", contents="RandomLegsContents", percent = 16 },
				{ class = "WandererPantsTan", contents="RandomLegsContents", percent = 16 },
			},
		},


		-- Torso
		{
			category = "RandomButtonUpShirt",
			classes = 
			{
				{ class = "ButtonUpShirtBlack", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtBlackChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtBlackDots", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtBlackStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtBlue", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtBlueChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtBlueDots", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtBlueHawaiian", contents="RandomTorsoContents", percent = 4},
				{ class = "ButtonUpShirtBlueStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtDarkGreenChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtDarkGreenStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtDarkGrey", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtDarkGreyChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtDarkGreyDots", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtDarkGreyStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtGreen", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtGreenChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtGreenHawaiian", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtGreenStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtGrey", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtGreyChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtGreyStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtPink", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtPinkChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtPinkStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtPurple", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtPurpleChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtPurpleHawaiian", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtPurpleStriped", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtRed", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtRedChekered", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtRedHawaiian", contents="RandomTorsoContents", percent = 3},
				{ class = "ButtonUpShirtRedDots", contents="RandomTorsoContents", percent = 3},
			},
		},

		{
			category = "RandomCottonShirt",
			classes =
			{
				{ class = "CottonShirtBlue", contents="RandomTorsoContents", percent = 17 },
				{ class = "CottonShirtBrown", contents="RandomTorsoContents", percent = 17 },
				{ class = "CottonShirtGreen", contents="RandomTorsoContents", percent = 17 },
				{ class = "CottonShirtGrey", contents="RandomTorsoContents", percent = 17 },
				{ class = "CottonShirtRed", contents="RandomTorsoContents", percent = 16 },
				{ class = "CottonShirtTan", contents="RandomTorsoContents", percent = 16 },
			},
		},

		{
			category = "RandomHazmatSuit",
			classes = 
			{
				{ class = "HazmatSuitBrownCamo", percent = 5.0 },
				{ class = "HazmatSuitGreenCamo", percent = 5.0 },
				{ class = "HazmatSuitPurple", percent = 8.0 },
				{ class = "HazmatSuitRed", percent = 8.0 },
				{ category = "RandomHazmatSuitColored", percent = 20.0 },
				{ category = "RandomHazmatMaskColored", percent = 20.0 },
				{ category = "RandomGasCanisterPackColored", percent = 20.0 },
				{ category = "RandomHazmatSuitHood", percent = 14.0 },
			}	
		},
		
		{
			category = "RandomHazmatSuitColored",
			classes = 
			{
				{ class = "HazmatSuitBlack", percent = 15 },
				{ class = "HazmatSuitBlue", percent = 14 },
				{ class = "HazmatSuitGreen", percent = 14 },
				{ class = "HazmatSuitPink", percent = 14 },
				{ class = "HazmatSuitOrange", percent = 14 },
				{ class = "HazmatSuitWhite", percent = 15 },
				{ class = "HazmatSuitYellow", percent = 14 },
			}	
		},
		
		{
			category = "RandomHazmatMaskColored",
			classes = 
			{
				{ class = "HazmatMask", percent = 17.0 },
				{ class = "HazmatMaskBlack", percent = 12.5 },
				{ class = "HazmatMaskBlue", percent = 12.5 },
				{ class = "HazmatMaskGreen", percent = 12.5 },
				{ class = "HazmatMaskPink", percent = 12.5 },
				{ class = "HazmatMaskOrange", percent = 12.5 },
				{ class = "HazmatMaskWhite", percent = 12.5 },
				{ class = "HazmatMaskYellow", percent = 12.5 },
			}	
		},
		
		{
			category = "RandomGasCanisterPackColored",
			classes = 
			{
				{ class = "GasCanisterPack", percent = 12.5 },
				{ class = "GasCanisterPackBlack", percent = 12.5 },
				{ class = "GasCanisterPackBlue", percent = 12.5 },
				{ class = "GasCanisterPackGreen", percent = 12.5 },
				{ class = "GasCanisterPackPink", percent = 12.5 },
				{ class = "GasCanisterPackOrange", percent = 12.5 },
				{ class = "GasCanisterPackWhite", percent = 12.5 },
				{ class = "GasCanisterPackYellow", percent = 12.5 },
			}	
		},
		
		{
			category = "RandomHazmatSuitHood",
			classes = 
			{
				{ class = "HazmatSuitBlackUp", percent = 12.5 },
				{ class = "HazmatSuitBlueUp", percent = 12.5 },
				{ class = "HazmatSuitGreenUp", percent = 12.5 },
				{ class = "HazmatSuitOrangeUp", percent = 12.5 },
				{ class = "HazmatSuitPinkUp", percent = 12.5 },
				{ class = "HazmatSuitRedUp", percent = 12.5 },
				{ class = "HazmatSuitWhiteUp", percent = 12.5 },
				{ class = "HazmatSuitYellowUp", percent = 12.5 },
			}	
		},
		
		{
			category = "RandomFullHazmatSet",
			group = 
			{
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ category = "RandomHazmatMaskColored", percent = 100 },
				{ category = "RandomGasCanisterPackColored", percent = 100 },
			}	
		},
		

		{
			category = "RandomHoodie",
			classes = 
			{
				{ class = "Hoodie", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodieBlackGreyDesign1", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodieBlackWhiteDesign4", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodieBlueBlackDesign4", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodieBlueDesign2", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieBlueWhiteDesign4", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodieCapitalMunch", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieEagle", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieGreenBlackDesign4", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodieGreenDesign2", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieGreenWhiteDesign4", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodieGrey", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieGreyDarkGreyDesign1", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieOrangeBlackDesign4", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePinkDesign2", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodiePixel", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelBlackGreyDesign5", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodiePixelBlueBlackDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelGreenBlackDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelGreyBlueDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelGreyDesign5", contents="RandomTorsoContents", percent = 4},
				{ class = "HoodiePixelGreyGreenDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelGreyOrangeDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelGreyRedDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelOrangeBlackDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodiePixelRedBlackDesign5", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieRedBlackDesign4", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieRedDesign2", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieRedWhiteDesign4", contents="RandomTorsoContents", percent = 3},
				{ class = "HoodieSerk", contents="RandomTorsoContents", percent = 3},
			},
		},

		{
			category = "RandomLeatherJacket",
			classes =
			{
				{ class = "LeatherJacketBrown", contents="RandomTorsoContents", percent = 25},
				{ class = "LeatherJacketBlack", contents="RandomTorsoContents", percent = 25},
				{ class = "LeatherJacketYellow", contents="RandomTorsoContents", percent = 25},
				{ class = "LeatherJacketRed", contents="RandomTorsoContents", percent = 25},
			},
		},

		{
			category = "RandomMilitaryJacket",
			classes = 
			{
				{ class = "MilitaryJacketBlack", contents="RandomTorsoContents", percent = 20 },
				{ class = "MilitaryJacketGreen", contents="RandomTorsoContents", percent = 20 },
				{ class = "MilitaryJacketGreenCamo1", contents="RandomTorsoContents", percent = 20 },
				{ class = "MilitaryJacketGreenCamo2", contents="RandomTorsoContents", percent = 20 },
				{ class = "MilitaryJacketGreenCamo3", contents="RandomTorsoContents", percent = 20 },
				{ class = "MilitaryJacketGreenCamo4", contents="RandomTorsoContents", percent = 20 },
				{ class = "MilitaryJacketTan", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketTanCamo1", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketTanCamo2", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketTanCamo3", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketTanCamo4", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketUrbanCamo1", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketUrbanCamo2", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketUrbanCamo3", contents="RandomTorsoContents", percent = 10 },
				{ class = "MilitaryJacketUrbanCamo4", contents="RandomTorsoContents", percent = 10 },
			},
		},

		{
			category = "RandomPuffyJacket",
			classes =
			{
				{ class = "PuffyJacketEaster", contents="RandomTorsoContents", percent = 0.5 },
				{ class = "PuffyJacketGold", contents="RandomTorsoContents", percent = 1.0 },
				{ class = "PuffyJacketSilver", contents="RandomTorsoContents", percent = 1 },
				{ class = "PuffyJacketAmerica", contents="RandomTorsoContents", percent = 1 },
				{ class = "PuffyJacketCanada", contents="RandomTorsoContents", percent = 1 },
				{ class = "PuffyJacketCamo1", contents="RandomTorsoContents", percent = 4 },
				{ class = "PuffyJacketCamo2", contents="RandomTorsoContents", percent = 4 },
				{ class = "PuffyJacketCamo3", contents="RandomTorsoContents", percent = 4 },
				{ class = "PuffyJacketWhiteCamo1", contents="RandomTorsoContents", percent = 4 },
				{ class = "PuffyJacketBlack", contents="RandomTorsoContents", percent = 4.5 },
				{ class = "PuffyJacketBlueWhite", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketGreenWhite", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketGrey", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketGreyBlack", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketGreyBlack2", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketKaki", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketOrangeGreen", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketOrangeTeal", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketOrangeWhite", contents="RandomTorsoContents", percent = 5 },
				{ class = "PuffyJacketPinkWhite", contents="RandomTorsoContents", percent = 6 },
				{ class = "PuffyJacketPurpleFushia", contents="RandomTorsoContents", percent = 6 },
				{ class = "PuffyJacketRedBlue", contents="RandomTorsoContents", percent = 6 },
				{ class = "PuffyJacketRedWhite", contents="RandomTorsoContents", percent = 6 },
				{ class = "PuffyJacketWhite", contents="RandomTorsoContents", percent = 6 },
			},
		},

		{
			category = "RandomRainJacket",
			classes =
			{
				{ class = "RainJacketBlack", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketBlue", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketBlueGrey", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketCamo1", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketCamo2", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketCamo3", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketDarkGrey", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGreen", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGreenGrey", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGrey", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGreyBlack", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketKaki", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketLightDarkGrey", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketMarine", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketOrangeBlue", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketPinkPurple", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketRed", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketRedBlue", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketRedGrey", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketYellow", contents="RandomTorsoContents", percent = 5},
				
			},
		},
		
		{
			category = "RandomRainJacketHood",
			classes =
			{
				{ class = "RainJacketBlackUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketBlueUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketBlueGreyUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketCamo1Up", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketCamo2Up", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketCamo3Up", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketDarkGreyUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGreenUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGreenGreyUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGreyUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketGreyBlackUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketKakiUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketLightDarkGreyUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketMarineUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketOrangeBlueUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketPinkPurpleUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketRedUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketRedBlueUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketRedGreyUp", contents="RandomTorsoContents", percent = 5},
				{ class = "RainJacketYellowUp", contents="RandomTorsoContents", percent = 5},
			},
		},

		-- --------------------------------------------------------------------
		-- Ghillie Suits
		-- --------------------------------------------------------------------

	
		{
			category = "RandomGhillieSuitParts",
			classes = 
			{
				{ class = "GhillieSuit1", percent= 20.5 },
				{ class = "GhillieHood1", percent= 20.5 },
				{ class = "GhillieSuit2", percent= 20.5 },
				{ class = "GhillieHood2", percent= 20.5 },
				{ class = "GhillieSuit3", percent= 20.5 },
				{ class = "GhillieHood3", percent= 20.5 },
				{ class = "GhillieSuit4", percent= 20.5 },
				{ class = "GhillieHood4", percent= 20.5 },
			},
		},
		
		{
			category = "RandomGhillieSuitColored",
			classes = 
			{
				{ class = "GhillieSuitBlack", percent= 12 },
				{ class = "GhillieSuitBlue", percent= 11 },
				{ class = "GhillieSuitGreen", percent= 11 },
				{ class = "GhillieSuitLightBlue", percent= 11 },
				{ class = "GhillieSuitPink", percent= 11 },
				{ class = "GhillieSuitPurple", percent= 11 },
				{ class = "GhillieSuitRed", percent= 11 },
				{ class = "GhillieSuitWhite", percent= 11 },
				{ class = "GhillieSuitYellow", percent= 11 },
			},
		},

		{
			category = "RandomGhillieHoodColored",
			classes = 
			{
				{ class = "GhillieHoodBlack", percent= 12 },
				{ class = "GhillieHoodBlue", percent= 11 },
				{ class = "GhillieHoodGreen", percent= 11 },
				{ class = "GhillieHoodLightBlue", percent= 11 },
				{ class = "GhillieHoodPink", percent= 11 },
				{ class = "GhillieHoodPurple", percent= 11 },
				{ class = "GhillieHoodRed", percent= 11 },
				{ class = "GhillieHoodWhite", percent= 11 },
				{ class = "GhillieHoodYellow", percent= 11 },
			},
		},



		{
			category = "RandomGhillieSuitComplete",
			classes = 
			{			
				{ category = "GhillieSuit0Full", percent= 10 },
				{ category = "GhillieSuit1Full", percent= 10 },
				{ category = "GhillieSuit2Full", percent= 10 },
				{ category = "GhillieSuit3Full", percent= 10 },
				{ category = "GhillieSuit4Full", percent= 10 },
				{ category = "GhillieSuit5Full", percent= 10 },
				{ category = "GhillieSuit6Full", percent= 10 },
				{ category = "GhillieSuit7Full", percent= 10 },
				{ category = "GhillieSuit8Full", percent= 10 },
				{ category = "GhillieSuit9Full", percent= 10 },
				{ category = "GhillieSuit10Full", percent= 10 },
				{ category = "GhillieSuit11Full", percent= 10 },
				{ category = "GhillieSuit12Full", percent= 10 },
				{ category = "GhillieSuit13Full", percent= 10 },
			},
		},


		{
			category = "GhillieSuit0Full",
			group =
			{
				{ class = "ArmoredGhillieSuit", percent = 100 },
				{ class = "ArmoredGhillieHood", percent = 100 },
			},
		},


		{
			category = "GhillieSuit1Full",
			group =
			{
				{ class = "GhillieSuit1", percent = 100 },
				{ class = "GhillieHood1", percent = 100 },
			},
		},

		{
			category = "GhillieSuit2Full",
			group =
			{
				{ class = "GhillieSuit2", percent = 100 },
				{ class = "GhillieHood2", percent = 100 },
			},
		},

		{
			category = "GhillieSuit3Full",
			group =
			{
				{ class = "GhillieSuit3", percent = 100 },
				{ class = "GhillieHood3", percent = 100 },
			},
		},

		{
			category = "GhillieSuit4Full",
			group =
			{
				{ class = "GhillieSuit4", percent = 100 },
				{ class = "GhillieHood4", percent = 100 },
			},
		},

		{
			category = "GhillieSuit5Full",
			group =
			{
				{ class = "GhillieSuitBlack", percent = 100 },
				{ class = "GhillieHoodBlack", percent = 100 },
			},
		},

		{
			category = "GhillieSuit6Full",
			group =
			{
				{ class = "GhillieSuitBlue", percent = 100 },
				{ class = "GhillieHoodBlue", percent = 100 },
			},
		},

		{
			category = "GhillieSuit7Full",
			group =
			{
				{ class = "GhillieSuitGreen", percent = 100 },
				{ class = "GhillieHoodGreen", percent = 100 },
			},
		},

		{
			category = "GhillieSuit8Full",
			group =
			{
				{ class = "GhillieSuitLightBlue", percent = 100 },
				{ class = "GhillieHoodLightBlue", percent = 100 },
			},
		},

		{
			category = "GhillieSuit9Full",
			group =
			{
				{ class = "GhillieSuitPink", percent = 100 },
				{ class = "GhillieHoodPink", percent = 100 },
			},
		},

		{
			category = "GhillieSuit10Full",
			group =
			{
				{ class = "GhillieSuitPurple", percent = 100 },
				{ class = "GhillieHoodPurple", percent = 100 },
			},
		},

		{
			category = "GhillieSuit11Full",
			group =
			{
				{ class = "GhillieSuitRed", percent = 100 },
				{ class = "GhillieHoodRed", percent = 100 },
			},
		},

		{
			category = "GhillieSuit12Full",
			group =
			{
				{ class = "GhillieSuitWhite", percent = 100 },
				{ class = "GhillieHoodWhite", percent = 100 },
			},
		},

		{
			category = "GhillieSuit13Full",
			group =
			{
				{ class = "GhillieSuitYellow", percent = 100 },
				{ class = "GhillieHoodYellow", percent = 100 },
			},
		},






		---------------------------------------------------------
		--Military Clothes
		---------------------------------------------------------
		{
			category = "RandomMilitaryBodyArmor",
			classes = 
			{
				{ class = "FlakVestTanCamo1", percent = 15 },
				{ class = "FlakVestGreen", percent = 55 },
				{ class = "FlakVestGreenCamo1", percent = 35 },
				{ class = "FlakVestTan", percent = 15 },
				{ class = "FlakVestBlack", percent = 5 },
				{ class = "FlakVestBlackWhite", percent = 5 },
				{ class = "FlakVestBlue", percent = 5 },
				{ class = "FlakVestLightBlue", percent = 5 },
				{ class = "FlakVestOGreen", percent = 5 },
				{ class = "FlakVestPink", percent = 5 },
				{ class = "FlakVestPurple", percent = 5 },
				{ class = "FlakVestRed", percent = 5 },
				{ class = "FlakVestWhite", percent = 5 },
				{ class = "FlakVestWhiteBlack", percent = 5 },
				{ class = "FlakVestYellow", percent = 5 },
			},
		},

		{
			category = "RandomPoliceBodyArmor",
			classes = 
			{
				{ class = "PoliceVestBlack", percent = 50 },
				{ class = "PoliceVestBlue", percent = 50 },
			},
		},

		{
			category = "RandomPoliceHelmet",
			classes = 
			{
				{ class = "SwatHelmet", percent = 12 },
				{ class = "SwatHelmetBlue", percent = 11 },
				{ class = "SwatHelmetGreen", percent = 11 },
				{ class = "SwatHelmetLightBlue", percent = 11 },
				{ class = "SwatHelmetPink", percent = 11 },
				{ class = "SwatHelmetPurple", percent = 11 },
				{ class = "SwatHelmetRed", percent = 11 },
				{ class = "SwatHelmetWhite", percent = 11 },
				{ class = "SwatHelmetYellow", percent = 11 },
			},
		},


		{
			category = "RandomNoSleevesVest",
			classes = 
			{
				{ class = "NoSleevesVestBlack", contents="RandomTorsoContents", percent = 17 },
				{ class = "NoSleevesVestBlue", contents="RandomTorsoContents", percent = 17 },
				{ class = "NoSleevesVestBrown", contents="RandomTorsoContents", percent = 17 },
				{ class = "NoSleevesVestGreen", contents="RandomTorsoContents", percent = 17 },
				{ class = "NoSleevesVestRed", contents="RandomTorsoContents", percent = 16 },
				{ class = "NoSleevesVestTan", contents="RandomTorsoContents", percent = 16 },
			},
		},

		{
			category = "RandomSweater",
			classes = 
			{
				{ class = "Sweater", contents="RandomTorsoContents", percent = 10 },
				{ class = "SweaterBlack", contents="RandomTorsoContents", percent = 15 },
				{ class = "SweaterBlue", contents="RandomTorsoContents", percent = 15 },
				-- disabled until christmas
				-- { class = "SweaterChristmasGreen", contents="RandomTorsoContents", percent = 3 },
				-- { class = "SweaterChristmasGreen2", contents="RandomTorsoContents", percent = 3 },
				-- { class = "SweaterChristmasRed", contents="RandomTorsoContents", percent = 3 },
				-- { class = "SweaterChristmasRed2", contents="RandomTorsoContents", percent = 3 },
				{ class = "SweaterGreen", contents="RandomTorsoContents", percent = 15 },
				{ class = "SweaterOrange", contents="RandomTorsoContents", percent = 15 },
				{ class = "SweaterPink", contents="RandomTorsoContents", percent = 15 },
				{ class = "SweaterRed", contents="RandomTorsoContents", percent = 15 },
			}

		},

		{
			category = "RandomTacticalVest",
			classes = 
			{
				{ class = "TacticalVestBlack", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestGreen", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestGreenCamo1",contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestGreenCamo2",contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestGreenCamo3",contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestGreenCamo4",contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestTan", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestTanCamo1", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestTanCamo2", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestTanCamo3", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestTanCamo4", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestUrbanCamo1", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestUrbanCamo2", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestUrbanCamo3", contents="RandomTorsoContents", percent = 20 },
				{ class = "TacticalVestUrbanCamo4", contents="RandomTorsoContents", percent = 20 },
			},
		},

		{
			category = "RandomTacticalVestPure",
			classes = 
			{
				{ class = "TacticalVestBlack", percent = 6 },
				{ class = "TacticalVestGreen", percent = 6 },
				{ class = "TacticalVestGreenCamo1", percent = 6 },
				{ class = "TacticalVestGreenCamo2", percent = 6 },
				{ class = "TacticalVestGreenCamo3", percent = 6 },
				{ class = "TacticalVestGreenCamo4", percent = 7 },
				{ class = "TacticalVestTan", percent = 7 },
				{ class = "TacticalVestTanCamo1", percent = 7 },
				{ class = "TacticalVestTanCamo2", percent = 7 },
				{ class = "TacticalVestTanCamo3", percent = 7 },
				{ class = "TacticalVestTanCamo4", percent = 7 },
				{ class = "TacticalVestUrbanCamo1", percent = 7 },
				{ class = "TacticalVestUrbanCamo2", percent = 7 },
				{ class = "TacticalVestUrbanCamo3", percent = 7 },
				{ class = "TacticalVestUrbanCamo4", percent = 7 },
			},
		},

		{
			category = "RandomTshirt",
			classes =
			{
				{ class = "TshirtAmalgamatedGreen", percent = 1 },
				{ class = "TshirtAmalgamatedGrey", percent = 1 },
				{ class = "TshirtAmalgamatedPink", percent = 1 },
				{ class = "TshirtAmalgamatedRed", percent = 1 },
				{ class = "TshirtBBGBlack", percent = 1 },
				{ class = "TshirtBBGBlue", percent = 1 },
				{ class = "TshirtBBGGreen", percent = 1 },
				{ class = "TshirtBBGGrey", percent = 1 },
				{ class = "TshirtBBGPink", percent = 1 },
				{ class = "TshirtBBGRed", percent = 1 },
				{ class = "TshirtCamo1", percent = 1 },
				{ class = "TshirtCamo2", percent = 2 },
				{ class = "TshirtCamo3", percent = 1 },
				{ class = "TshirtCamo4", percent = 1 },
				{ class = "TshirtCatBlack", percent = 1 },
				{ class = "TshirtCatBlue", percent = 1 },
				{ class = "TshirtCatGreen", percent = 1 },
				{ class = "TshirtCatGrey", percent = 1 },
				{ class = "TshirtCatPink", percent = 1 },
				{ class = "TshirtCatRed", percent = 1 },
				{ class = "TshirtCryengineBlack", percent = 1 },
				{ class = "TshirtCryengineBlue", percent = 1 },
				{ class = "TshirtCryengineGreen", percent = 1 },
				{ class = "TshirtCryengineGrey", percent = 1 },
				{ class = "TshirtCryenginePink", percent = 1 },
				{ class = "TshirtCryengineRed", percent = 1 },
				{ class = "TshirtEntradaBlack", percent = 1 },
				{ class = "TshirtEntradaBlue", percent = 1 },
				{ class = "TshirtEntradaGreen", percent = 1 },
				{ class = "TshirtEntradaGrey", percent = 1 },
				{ class = "TshirtEntradaPink", percent = 1 },
				{ class = "TshirtEntradaRed", percent = 1 },
				{ class = "TshirtFirefighterBlack", percent = 1 },
				{ class = "TshirtFirefighterBlue", percent = 1 },
				{ class = "TshirtFlipflopBlack", percent = 1 },
				{ class = "TshirtFlipflopBlue", percent = 1 },
				{ class = "TshirtFlipflopGreen", percent = 1 },
				{ class = "TshirtFlipflopGrey", percent = 1 },
				{ class = "TshirtFlipflopPink", percent = 1 },
				{ class = "TshirtFlipflopRed", percent = 1 },
				{ class = "TshirtKstarBlack", percent = 1 },
				{ class = "TshirtKstarBlue", percent = 1 },
				{ class = "TshirtKstarGreen", percent = 1 },
				{ class = "TshirtKstarGrey", percent = 1 },
				{ class = "TshirtKstarPink", percent = 1 },
				{ class = "TshirtKstarRed", percent = 1 },
				{ class = "TshirtMaskBlack", percent = 1 },
				{ class = "TshirtMaskBlue", percent = 1 },
				{ class = "TshirtMaskGreen", percent = 1 },
				{ class = "TshirtMaskGrey", percent = 1 },
				{ class = "TshirtMaskPink", percent = 1 },
				{ class = "TshirtMaskRed", percent = 1 },
				{ class = "TshirtNoImageBlack", percent = 1 },
				{ class = "TshirtNoImageBlue", percent = 1 },
				{ class = "TshirtNoImageGreen", percent = 1 },
				{ class = "TshirtNoImageGrey", percent = 1 },
				{ class = "TshirtNoImagePink", percent = 1 },
				{ class = "TshirtNoImageRed", percent = 1 },
				{ class = "TshirtNuclearBlack", percent = 1 },
				{ class = "TshirtNuclearBlue", percent = 1 },
				{ class = "TshirtNuclearGreen", percent = 1 },
				{ class = "TshirtNuclearGrey", percent = 1 },
				{ class = "TshirtNuclearPink", percent = 1 },
				{ class = "TshirtNuclearRed", percent = 1 },
				{ class = "TshirtPlebsiBlack", percent = 1 },
				{ class = "TshirtPlebsiBlue", percent = 1 },
				{ class = "TshirtPlebsiGreen", percent = 1 },
				{ class = "TshirtPlebsiGrey", percent = 1 },
				{ class = "TshirtPlebsiPink", percent = 1 },
				{ class = "TshirtPlebsiRed", percent = 1 },
				{ class = "TshirtPoliceBlack", percent = 1 },
				{ class = "TshirtPoliceBlue", percent = 1 },
				{ class = "TshirtPolycountBlack", percent = 1 },
				{ class = "TshirtPolycountBlue", percent = 1 },
				{ class = "TshirtPolycountGreen", percent = 1 },
				{ class = "TshirtPolycountGrey", percent = 2 },
				{ class = "TshirtPolycountPink", percent = 1 },
				{ class = "TshirtPolycountRed", percent = 1 },
				{ class = "TshirtSecurityBlack", percent = 1 },
				{ class = "TshirtSecurityBlue", percent = 1 },
				{ class = "TshirtSuckersBlack", percent = 1 },
				{ class = "TshirtSuckersBlue", percent = 1 },
				{ class = "TshirtSuckersGreen", percent = 1 },
				{ class = "TshirtSuckersGrey", percent = 1 },
				{ class = "TshirtSuckersPink", percent = 1 },
				{ class = "TshirtSuckersRed", percent = 1 },
				{ class = "TshirtTargetBlack", percent = 2 },
				{ class = "TshirtTargetBlue", percent = 2 },
				{ class = "TshirtTargetGreen", percent = 2 },
				{ class = "TshirtTargetGrey", percent = 2 },
				{ class = "TshirtTargetPink", percent = 1 },
				{ class = "TshirtTargetRed", percent = 1 },
				{ class = "TshirtAmalgamatedBlack", percent = 1 },
				{ class = "TshirtAmalgamatedBlue", percent = 1 },
			}
		},

		-- Neck
		{
			category = "RandomScarf",
			classes =
			{
				{ class = "ScarfBlack", percent = 10 },
				{ class = "ScarfCamo1", percent = 15 },
				{ class = "ScarfCamo2", percent = 10 },
				{ class = "ScarfCamo3", percent = 10 },
				{ class = "ScarfCamo4", percent = 10 },
				{ class = "ScarfGray", percent = 10 },
				{ class = "ScarfOrange", percent = 10 },
				{ class = "ScarfRed", percent = 10 },
				{ class = "ScarfShemagh", percent = 15 },
			}
		},

		-- --------------------------------------------------------------------
		-- RECIPE GUIDES
		-- --------------------------------------------------------------------

		{
			category = "RandomCraftingGuide",
			classes =
			{
				-- generic (18) 
				{ class = "guide_medical_bandages", percent = 25 },
				{ class = "guide_weapons_melee", percent = 25 },
				{ class = "guide_structures_tire_stacks", percent = 25 },
				--{ class = "guide_structures_wood_storage", percent = 25 },  unnecessary un last version

				-- basic (37)
				{ class = "guide_structures_wood_bridges_1", percent = 25 },
				{ class = "guide_structures_wood_ramps_1", percent = 25 },
				{ class = "guide_structures_wood_stairs_1", percent = 25 },
				{ class = "guide_structures_wood_traps_1", percent = 25 },
				{ class = "guide_structures_wood_walkways_1", percent = 25 },
				{ class = "guide_structures_wood_walls_1", percent = 25 },
				{ class = "guide_structures_wood_roofs", percent = 25 },
				{ class = "guide_powered_parts_1", percent = 25 },
				{ class = "guide_traps_1", percent = 25 },
				{ class = "guide_explosives_1", percent = 25 },
				{ class = "guide_weapons_ranged_1", percent = 25 },
				{ class = "guide_concrete", percent = 25 },
				{ class = "guide_plastered", percent = 25 },
				{ class = "guide_titanium", percent = 25 },
				{ class = "guide_marble", percent = 25 },

				-- advanced (37)
				{ class = "guide_structures_wood_storage_2", percent = 20 },
				{ class = "guide_structures_wood_bridges_2", percent = 20 },
				{ class = "guide_structures_wood_ramps_2", percent = 20 },
				{ class = "guide_structures_wood_stairs_2", percent = 20 },
				{ class = "guide_structures_wood_traps_2", percent = 20 },
				{ class = "guide_structures_wood_walkways_2", percent = 20 },
				{ class = "guide_structures_wood_walls_2", percent = 20 },
				{ class = "guide_traps_2", percent = 20 },	
				
				-- special 
				{ class = "guide_cooking_1", percent = 10 },
				{ class = "guide_cooking_2", percent = 10 },
				{ class = "guide_cooking_3", percent = 10 },
				{ class = "guide_cooking_4", percent = 10 },
				{ class = "guide_weapons_ranged_2", percent = 10 },
				{ class = "guide_weapons_ranged_3", percent = 10 },					
				{ class = "guide_explosives_2", percent = 10 },
				{ class = "guide_hazmat", percent = 10 },				
				{ class = "guide_special", percent = 10 },
				{ class = "guide_medical_bandages", percent = 10},
				{ class = "guide_ammo_1", percent = 10 },
				{ class = "guide_ammo_2", percent = 10 },
				{ class = "guide_ammo_3", percent = 10 },
				{ class = "guide_ammo_4", percent = 10 },
				{ class = "guide_ammo_5", percent = 10 },
				{ class = "guide_military", percent = 10 },
				{ class = "guide_civilian", percent = 10 },					
				{ class = "guide_police", percent = 10 },
					
				
				-- specialized (8)
				{ class = "guide_structures_wood_curves", percent = 10 },
				{ class = "guide_structures_wood_gallows", percent = 10 },
				{ class = "guide_structures_wood_watchtower", percent = 10 },
				{ class = "guide_structures_wood_gatehouse", percent = 10 },			
		
			},
		},

		{
			category = "RandomTraderCraftingGuides",
			classes =
			{
				{ class = "guide_medical_bandages", percent = 4 },
				{ class = "guide_weapons_melee", percent = 4 },
				{ class = "guide_structures_tire_stacks", percent = 4 },
				{ class = "guide_structures_wood_bridges_1", percent = 4 },
				{ class = "guide_structures_wood_ramps_1", percent = 4 },
				{ class = "guide_structures_wood_stairs_1", percent = 4 },
				{ class = "guide_structures_wood_traps_1", percent = 4 },
				{ class = "guide_structures_wood_walkways_1", percent = 4 },
				{ class = "guide_structures_wood_walls_1", percent = 4 },
				{ class = "guide_structures_wood_roofs", percent = 4 },
				{ class = "guide_powered_parts_1", percent = 4 },
				{ class = "guide_traps_1", percent = 4 },
				{ class = "guide_structures_wood_storage_2", percent = 4 },
				{ class = "guide_structures_wood_bridges_2", percent = 4 },
				{ class = "guide_structures_wood_ramps_2", percent = 4 },
				{ class = "guide_structures_wood_stairs_2", percent = 4 },
				{ class = "guide_structures_wood_traps_2", percent = 4 },
				{ class = "guide_structures_wood_walkways_2", percent = 4 },
				{ class = "guide_structures_wood_walls_2", percent = 4 },
				{ class = "guide_traps_2", percent = 4 },
				{ class = "guide_structures_wood_curves", percent = 4 },
				{ class = "guide_structures_wood_gallows", percent = 4 },
				{ class = "guide_structures_wood_watchtower", percent = 4 },
				{ class = "guide_structures_wood_gatehouse", percent = 4 },
			},
		},

		-- --------------------------------------------------------------------
		-- CONSUMABLES
		-- --------------------------------------------------------------------

		{
			category = "RandomUtils",
			classes =
			{
				{ category = "RandomFireStarter", percent = 30 },
				{ class = "Binoculars", percent = 15 },
				{ class = "Cb_radio", percent = 35 },
				{ class = "GridMap", percent = 1 },
				{ class = "Map", percent = 1 },
			},
		},
		-- Refillables

		-- Drinks

		-- Food
		{
			category = "Egg",
			classes =
			{
					
			},
		},

		{
			category = "SaltAndPepper", -- basically cooking ingredients
			classes =
			{
				-- only salt for now pepper has no use
				-- Add more smaller spices and stuff like ketchup etc here

				{ class = "Salt", percent = 100 },
				-- { class = "Pepper", percent = 1 },
			},
		},

		-- --------------------------------------------------------------------
		-- CRAFTING
		-- --------------------------------------------------------------------
         
		-- --------------------------------------------------------------------
		-- EQUIPMENT
		-- --------------------------------------------------------------------

		{
			category = "RandomFireStarter",
			classes =
			{
				{ class = "Matches", percent = 90 },
				{ class = "Lighter", percent = 90 },
			},
		},

		{
			category = "StickPileOrThatch",
			classes =
			{
				{ class = "StickPile", percent = 30 },
				{ class = "Thatch", percent = 70 },
			},
		},

		{
			category = "RandomMaintenance",
			classes =
			{
				{ class = "CarBattery", percent = 5 },
				{ class = "TowCable", percent = 5 },
				{ class = "DriveBelt", percent = 5 },
				{ class = "DuctTape", percent = 10 },
				{ class = "ElectricalParts", percent = 10 },
				{ class = "Oil", percent = 10 },
				{ class = "JerryCanDiesel", percent = 10 },
				{ class = "SparkPlugs", percent = 5 },
				{ class = "WorkLight", percent = 5 },
			},
		},

		{
			category = "Wheel",
			classes =
			{
				{ class = "Wheel", percent = 100 },
			},
		},

		-- --------------------------------------------------------------------
		-- MEDICAL
		-- --------------------------------------------------------------------

		-- ====================================================================
		-- ADVANCED CATEGORIES
		-- ====================================================================

		-- contains all the parts needed to craft a backpack
		{
			category = "BackpackComponents",
			classes =
			{
				{ class = "Rope", percent = 50 },
				{ class = "Rags", percent = 65 },
			},
		},


		-- Back
		{
			category = "RandomBackpack",
			classes =
			{
				{ category = "BackpackComponents", percent = 40 },
				{ category = "RandomDuffelBag", percent = 15 },
				{ category = "RandomStowPack", percent = 50 },
				{ category = "RuggedPack", percent = 35 },
				{ category = "RandomRuckSack", percent = 30 },
			},
		},


		-- Eyes
		{
			category = "RandomEyes",
			classes =
			{
				{ class = "Aviators", percent = 15 },
				{ class = "EyepatchLeft", percent = 15 },
				{ class = "EyepatchRight", percent = 15 },
				{ class = "SunglassesABlack", percent = 7 },
				{ class = "SunglassesAGold", percent = 12 },
				{ class = "SunglassesASilver", percent = 7 },
				{ class = "SunglassesBBlack", percent = 15 },
				{ class = "SunglassesBMaroon", percent = 7 },
				{ class = "SunglassesBSilver", percent = 7 },
			},
		},


		-- Face
		{
			category = "RandomFace",
			classes =
			{
				{ category = "RandomBalaclava", percent = 5 },
				{ category = "RandomBandana", percent = 5 },
				{ class = "GasMask", percent = 5 },
				{ class = "DustMask", percent = 5 },
				{ class = "HeadSack", percent = 1 },
				{ class = "HockeyMask", percent = 5 },
				{ class = "HockeyMaskDp", percent = 5 },
				{ class = "HockeyMaskBlue", percent = 5 },
				{ class = "HockeyMaskBluePink", percent = 5 },
				{ class = "HockeyMaskGold", percent = 5 },
				{ class = "HockeyMaskGreen", percent = 5 },
				{ class = "HockeyMaskPurplePink", percent = 5 },
				{ class = "HockeyMaskSilver", percent = 5 },
				{ class = "HockeyMaskOhOd03", percent = 5 },
				{ class = "HockeyMaskOhOd04", percent = 5 },
				{ class = "HockeyMaskOhOd05", percent = 5 },
				{ class = "HockeyMaskOhOd06", percent = 5 },
				{ class = "HockeyMaskOhOd07", percent = 5 },
				{ class = "HockeyMaskOhOd08", percent = 5 },
				{ class = "HockeyMaskOhOd09", percent = 5 },
				{ class = "HockeyMaskOhOd10", percent = 5 },
				{ class = "HockeyMaskOhOd11", percent = 5 },
				{ class = "HockeyMaskOhOd12", percent = 5 },
				{ class = "HockeyMaskOhOd13", percent = 5 },
				{ class = "HockeyMaskOhOd14", percent = 5 },
				{ class = "HockeyMaskOhOd15", percent = 5 },
				{ class = "HockeyMaskOhOd16", percent = 5 },
				{ class = "HockeyMaskOhOd17", percent = 5 },
				{ class = "HockeyMaskOhOd18", percent = 5 },
				{ class = "HockeyMaskOhOd19", percent = 5 },
				{ class = "HockeyMaskOhOd20", percent = 5 },
				{ class = "JackOLanternHelmet", percent = 5 },				
			},
		},


			-- Protection Face
			{
				category = "RandomProtectionFace",
				classes =
				{					
					{ class = "HockeyMaskOhOd03", percent = 5 },
					{ class = "HockeyMaskOhOd04", percent = 5 },
					{ class = "HockeyMaskOhOd05", percent = 5 },
					{ class = "HockeyMaskOhOd06", percent = 5 },
					{ class = "HockeyMaskOhOd07", percent = 5 },
					{ class = "HockeyMaskOhOd08", percent = 5 },
					{ class = "HockeyMaskOhOd09", percent = 5 },
					{ class = "HockeyMaskOhOd10", percent = 5 },
					{ class = "HockeyMaskOhOd11", percent = 5 },
					{ class = "HockeyMaskOhOd12", percent = 5 },
					{ class = "HockeyMaskOhOd13", percent = 5 },
					{ class = "HockeyMaskOhOd14", percent = 5 },
					{ class = "HockeyMaskOhOd15", percent = 5 },
					{ class = "HockeyMaskOhOd16", percent = 5 },
					{ class = "HockeyMaskOhOd17", percent = 5 },
					{ class = "HockeyMaskOhOd18", percent = 5 },
					{ class = "HockeyMaskOhOd19", percent = 5 },
					{ class = "HockeyMaskOhOd20", percent = 5 },							
				},
			},

			

		-- Feet
		{
			category = "RandomShoes",
			classes =
			{
				{ category = "RandomCombatBoots", percent = 40 },
				{ category = "RandomHitops", percent = 15 },
				{ category = "RandomSneakers", percent = 15 },
				{ category = "RandomSteeltoedBoots", percent = 35 },
				{ class = "CanvasShoes", percent = 5 },
				{ class = "FlipFlops", percent = 5 },
				{ class = "TennisShoes", percent = 5 },
			},
		},

		{
			category = "RandomMilitaryShoes",
			classes =
			{
				{ category = "RandomCombatBoots", percent = 65 },
				{ category = "RandomSteeltoedBoots", percent = 65 },
			},
		},

		{
			category = "RandomFeet",
			classes =
			{
				{ category = "RandomShoes", percent = 100 },
			},
		},


		-- Hands
		{
			category = "RandomHands",
			classes =
			{
				{ category = "RandomCamoGloves", percent = 20 },
				{ category = "RandomWoolGloves", percent = 80 },
			},
		},


		-- Hat
		{
			category = "RandomBeanie",
			classes =
			{
				{ class = "BeanieBrown", percent = 5 },
				{ class = "BeanieBrownWhite", percent = 20 },
				{ class = "BeanieGreenGreen", percent = 25 },
				{ class = "BeanieOrangeYellow", percent = 25 },
				{ class = "BeaniePinkPink", percent = 5 },
				{ class = "BeanieWhite", percent = 20 },
			},
		},

		{
			category = "RandomBeret",
			classes =
			{
				{ class = "BeretBlack", percent = 4 },
				{ class = "BeretBlackFlagAu", percent = 1 },
				{ class = "BeretBlackFlagBelgium", percent = 1 },
				{ class = "BeretBlackFlagCanada", percent = 2 },
				{ class = "BeretBlackFlagGermany", percent = 1 },
				{ class = "BeretBlackFlagIsrael", percent = 1 },
				{ class = "BeretBlackFlagUk", percent = 1 },
				{ class = "BeretBlackFlagUsa", percent = 2 },
				{ class = "BeretBlue", percent = 4 },
				{ class = "BeretBlueFlagAu", percent = 1 },
				{ class = "BeretBlueFlagBelgium", percent = 1 },
				{ class = "BeretBlueFlagCanada", percent = 1 },
				{ class = "BeretBlueFlagGermany", percent = 1 },
				{ class = "BeretBlueFlagIsrael", percent = 1 },
				{ class = "BeretBlueFlagUk", percent = 1 },
				{ class = "BeretBlueFlagUsa", percent = 1 },
				{ class = "BeretBrown", percent = 4 },
				{ class = "BeretBrownFlagAu", percent = 1 },
				{ class = "BeretBrownFlagBelgium", percent = 1 },
				{ class = "BeretBrownFlagCanada", percent = 1 },
				{ class = "BeretBrownFlagGermany", percent = 1 },
				{ class = "BeretBrownFlagIsrael", percent = 1 },
				{ class = "BeretBrownFlagUk", percent = 1 },
				{ class = "BeretBrownFlagUsa", percent = 1 },
				{ class = "BeretGreen", percent = 4 },
				{ class = "BeretGreenFlagAu", percent = 1 },
				{ class = "BeretGreenFlagBelgium", percent = 1 },
				{ class = "BeretGreenFlagCanada", percent = 1 },
				{ class = "BeretGreenFlagGermany", percent = 1 },
				{ class = "BeretGreenFlagIsrael", percent = 1 },
				{ class = "BeretGreenFlagUk", percent = 1 },
				{ class = "BeretGreenFlagUsa", percent = 1 },
				{ class = "BeretRed", percent = 4 },
				{ class = "BeretRedFlagAu", percent = 1 },
				{ class = "BeretRedFlagBelgium", percent = 1 },
				{ class = "BeretRedFlagCanada", percent = 1 },
				{ class = "BeretRedFlagGermany", percent = 1 },
				{ class = "BeretRedFlagIsrael", percent = 1 },
				{ class = "BeretRedFlagUk", percent = 1 },
				{ class = "BeretRedFlagUsa", percent = 1 },
				{ class = "BeretSkyBlue", percent = 4 },
				{ class = "BeretSkyBlueFlagAu", percent = 1 },
				{ class = "BeretSkyBlueFlagBelgium", percent = 1 },
				{ class = "BeretSkyBlueFlagCanada", percent = 1 },
				{ class = "BeretSkyBlueFlagGermany", percent = 1 },
				{ class = "BeretSkyBlueFlagIsrael", percent = 1 },
				{ class = "BeretSkyBlueFlagUk", percent = 1 },
				{ class = "BeretSkyBlueFlagUsa", percent = 1 },
				{ class = "BeretLightBlue", percent = 4 },
				{ class = "BeretOBlue", percent = 4 },
				{ class = "BeretOGreen", percent = 4 },
				{ class = "BeretORed", percent = 4 },
				{ class = "BeretPink", percent = 4 },
				{ class = "BeretPurple", percent = 4 },
				{ class = "BeretWhite", percent = 4 },
				{ class = "BeretYellow", percent = 4 },
			},
		},


		{
			category = "RandomBikeHelmet",
			classes =
			{
				{ class = "BikeHelmetBlack", percent = 10 },
				{ class = "BikeHelmetBlue", percent = 10 },
				{ class = "BikeHelmetGreen", percent = 10 },
				{ class = "BikeHelmetPink", percent = 10 },
				{ class = "BikeHelmetPurple", percent = 10 },
				{ class = "BikeHelmetRed", percent = 10 },
				{ class = "BikeHelmetWhite", percent = 20 },
				{ class = "BikeHelmetYellow", percent = 20 },
			},
		},

		{
			category = "RandomFlexCap",
			classes =
			{
				{ class = "flexcap_acfrontback_black", percent = 2 },
				{ class = "flexcap_acfrontback_blue", percent = 2 },
				{ class = "flexcap_acfrontback_camo1", percent = 2 },
				{ class = "flexcap_acfrontback_camo2", percent = 2 },
				{ class = "flexcap_acfrontback_camo3", percent = 2 },
				{ class = "flexcap_acfrontback_camo4", percent = 2 },
				{ class = "flexcap_aclogofrontacback_black", percent = 1 },
				{ class = "flexcap_aclogofrontacback_blue", percent = 2 },
				{ class = "flexcap_aclogofrontacback_camo1", percent = 1 },
				{ class = "flexcap_aclogofrontacback_camo2", percent = 1 },
				{ class = "flexcap_aclogofrontacback_camo3", percent = 1 },
				{ class = "flexcap_aclogofrontacback_camo4", percent = 1 },
				{ class = "flexcap_crytekfront_black", percent = 2 },
				{ class = "flexcap_crytekfront_brown", percent = 2 },
				{ class = "flexcap_crytekfront_camo1", percent = 1 },
				{ class = "flexcap_crytekfront_camo2", percent = 1 },
				{ class = "flexcap_crytekfront_camo3", percent = 1 },
				{ class = "flexcap_crytekfront_camo4", percent = 1 },
				{ class = "flexcap_dopefishfront_black", percent = 2 },
				{ class = "flexcap_dopefishfront_blue", percent = 2 },
				{ class = "flexcap_dopefishfront_green", percent = 2 },
				{ class = "flexcap_dopefishfront_orange", percent = 2 },
				{ class = "flexcap_dopefishfront_pink", percent = 2 },
				{ class = "flexcap_dopefishfront_red", percent = 2 },
				{ class = "flexcap_eilogo_black", percent = 2 },
				{ class = "flexcap_eilogo_blue", percent = 2 },
				{ class = "flexcap_eilogo_khaki", percent = 2 },
				{ class = "flexcap_eilogo_pink", percent = 2 },
				{ class = "flexcap_firefrontback_black", percent = 1 },
				{ class = "flexcap_firefrontback_blue", percent = 2 },
				{ class = "flexcap_flagfrontback_pink_camo1", percent = 2 },
				{ class = "flexcap_flagfrontback_pink_camo2", percent = 2 },
				{ class = "flexcap_flagfrontback_pink_camo3", percent = 2 },
				{ class = "flexcap_flagfrontback_pink_camo4", percent = 2 },
				{ class = "flexcap_nobranding_black", percent = 2 },
				{ class = "flexcap_nobranding_blue", percent = 2 },
				{ class = "flexcap_nobranding_green", percent = 2 },
				{ class = "flexcap_nobranding_orange", percent = 2 },
				{ class = "flexcap_nobranding_pink", percent = 2 },
				{ class = "flexcap_nobranding_red", percent = 2 },
				{ class = "flexcap_policefrontback_black", percent = 2 },
				{ class = "flexcap_policefrontback_blue", percent = 2 },
				{ class = "flexcap_policefrontback_camo1", percent = 2 },
				{ class = "flexcap_policefrontback_camo2", percent = 2 },
				{ class = "flexcap_policefrontback_camo3", percent = 2 },
				{ class = "flexcap_policefrontback_camo4", percent = 2 },
				{ class = "flexcap_polycountfront_black", percent = 2 },
				{ class = "flexcap_polycountfront_blue", percent = 2 },
				{ class = "flexcap_polycountfront_pink", percent = 1 },
				{ class = "flexcap_usfrontback_black", percent = 1 },
				{ class = "flexcap_usfrontback_blue", percent = 1 },
				{ class = "flexcap_usfrontback_green", percent = 1 },
				{ class = "flexcap_usfrontback_orange", percent = 1 },
				{ class = "flexcap_usfrontback_pink", percent = 1 },
				{ class = "flexcap_usfrontback_red", percent = 1 },
				{ class = "flexcap_ausfront_camo4", percent = 1 },
				{ class = "flexcap_usfront_camo4", percent = 1 },
				{ class = "flexcap_gerfront_camo4", percent = 1 },
				{ class = "flexcap_belfront_camo4", percent = 1 },
				{ class = "flexcap_isrealfront_camo4", percent = 1 },
				{ class = "flexcap_canadafront_camo4", percent = 1 },
				{ class = "flexcap_gbfront_camo4", percent = 1 },
			 },
		},

		{
			category = "RandomFootballHelmet",
			classes =
			{
				{ class = "FootballHelmetFabulous", percent = 0.25 },
				{ class = "FootballHelmetAmerica", percent = 0.25 },
				{ class = "FootballHelmetGold", percent = 2 },
				{ class = "FootballHelmet", percent = 2 },
				{ class = "FootballHelmetBlack", percent = 7.5 },
				{ class = "FootballHelmetBlue", percent = 5 },
				{ class = "FootballHelmetRed", percent = 5 },
				{ class = "FootballHelmetStripedBlack", percent = 5 },
				{ class = "FootballHelmetStripedBlue", percent = 5 },
				{ class = "FootballHelmetStripedGreen", percent = 5 },
				{ class = "FootballHelmetStripedRed", percent = 5 },
				{ class = "FootballHelmetStripedTeal", percent = 5 },
				{ class = "FootballHelmetStripedYellow", percent = 5 },
				{ class = "FootballHelmetTeal", percent = 5 },
				{ class = "FootballHelmetWhiteStripedBlack", percent = 5 },
				{ class = "FootballHelmetWhiteStripedBlue", percent = 5 },
				{ class = "FootballHelmetWhiteStripedGreen", percent = 5 },
				{ class = "FootballHelmetWhiteStripedRed", percent = 5 },
				{ class = "FootballHelmetWhiteStripedTeal", percent = 5 },
				{ class = "FootballHelmetWhiteStripedYellow", percent = 5 },
				{ class = "FootballHelmetYellow", percent = 5 },
				{ class = "FootballHelmetGreen", percent = 8 },
			},
		},

		{
			category = "RandomFootballPads",
			classes =
			{
				{ class = "FootballPads", percent = 100 },
			},
		},

		{
			category = "RandomHeadband",
			classes =
			{
				{ class = "HeadbandBlack", percent = 34 },
				{ class = "HeadbandRed", percent = 33 },
				{ class = "HeadbandWhite", percent = 33 },
			},
		},

		{
			category = "RandomMotorcycleHelmet",
			classes =
			{
				{ class = "MotorcycleHelmetCarbon", percent = 45 },
				{ class = "MotorcycleHelmetGold", percent = 45 },
				{ class = "MotorcycleHelmetWhite", percent = 10 },
			},
		},

		{
			category = "RandomHat",
			classes =
			{
				{ category = "RandomBeanie", percent = 8 },
				{ category = "RandomBeret", percent = 10 },
				{ category = "RandomBikeHelmet", percent = 10 },
				{ category = "RandomCowboyHat", percent = 11 },
				{ category = "RandomFlexCap", percent = 8 },
				{ category = "RandomHeadband", percent = 11 },
				{ category = "RandomMotorcycleHelmet", percent = 6 },
				{ category = "RandomFootballHelmet", percent = 6 },
				{ class = "BandanaHat", percent = 6 },
				{ class = "BaseballCap", percent = 7 },
				-- { class = "ChristmasHat", percent = 2 }, -- disabled until christmas
				{ class = "DorfmanPacific", percent = 10 },
				{ class = "WeldersMask", percent = 7 },
			},
		},


		-- Legs
		{
			category = "RandomLegs",
			classes =
			{
				{ category = "RandomBlueJeans2", percent = 10 },
				{ category = "RandomCargoPants", percent = 35 },
				{ category = "RandomCargoShorts", percent = 35 },
				{ category = "RandomTrackPants", percent = 15 },
				{ category = "RandomWandererPants", percent = 25 },
			},
		},


		-- Neck
		{
			category = "RandomNeck",
			classes =
			{
				{ category = "RandomScarf", percent = 45 },
				{ class = "NecklaceCrossChrome", percent = 10 },
				{ class = "ShoulderPadOneSide", percent = 10 },
				{ class = "ShoulderPadOneSideLeft", percent = 10 },
				{ class = "NecklaceCrossGold", percent = 10 },
				{ class = "NecklaceCrossSilver", percent = 15 },
			},
		},


		-- Torso
		{
			category = "RandomTorso",
			classes =
			{
				{ category = "RandomButtonUpShirt", percent = 8 },
				{ category = "RandomSweater", percent = 7 },
				{ category = "RandomCottonShirt", percent = 10 },
				{ category = "RandomHoodie", percent = 15 },
				{ category = "RandomFootballPads", percent = 5 },
				{ category = "RandomLeatherJacket", percent = 15 },
				{ category = "RandomNoSleevesVest", percent = 10 },
				{ category = "RandomTacticalVest", percent = 25 },
				{ category = "RandomTshirt", percent = 15 },
				{ category = "RandomRainJacket", percent = 5 },
				{ category = "RandomRainJacket", percent = 5 },
				{ category = "RandomPuffyJacket", percent = 5 },
			},
		},

		-- Waist
		{
			category = "RandomWaist",
			classes =
			{
				{ class = "FannyPackBlack", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackBlueOrange", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackCamo1", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackCamo2", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackCamo3", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackGray", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackGreenGray", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackMaroonGray", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackPurplePink", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackRed", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackRedBlue", contents="RandomWaistContents", percent = 20 },
				{ class = "FannyPackYellow", contents="RandomWaistContents", percent = 20 },
			},
		},


		-- Clothes
		{
			category = "RandomClothes",
			classes =
			{
				{ category = "RandomCraftingGuide", percent = 50 },
				{ category = "RandomChristmasPresent", percent = 5 }, -- Christmas event
				{ category = "halloweenBagCommon", percent = 5 }, -- halloween
				{ category = "RandomEyes", percent = 7 },
				{ category = "RandomFace", percent = 10 },
				{ category = "RandomHands", percent = 12 },
				{ category = "RandomHat", percent = 12 },
				{ category = "RandomLegs", percent = 15 },
				{ category = "RandomNeck", percent = 7 },
				{ category = "RandomShoes", percent = 10 },
				{ category = "RandomTorso", percent = 15 },
				{ category = "RandomWaist", percent = 4 },
			},
		},

		{
			category = "RandomCamoFace",
			classes =
			{
				{ class = "BandanaCamo1", percent = 25 },
				{ class = "BandanaCamo2", percent = 25 },
				{ class = "BandanaCamo3", percent = 25 },
				{ class = "BandanaCamo4", percent = 25 },
			},
		},

		{
			category = "RandomCamoHats",
			classes =
			{
				{ class = "BandanaHatCamo1", percent = 25 },
				{ class = "BandanaHatCamo2", percent = 25 },
				{ class = "BandanaHatCamo3", percent = 25 },
				{ class = "BandanaHatCamo4", percent = 25 },
			},
		},

		{
			category = "RandomCamoPants",
			classes =
			{
				{ class = "CargoPantsCamo1", contents="RandomLegsContents", percent = 25 },
				{ class = "CargoPantsCamo2", contents="RandomLegsContents", percent = 25 },
				{ class = "CargoPantsCamo3", contents="RandomLegsContents", percent = 25 },
				{ class = "CargoPantsCamo4", contents="RandomLegsContents", percent = 25 },
			},
		},

		{
			category = "RandomCamoShirts",
			classes =
			{
				{ class = "MilitaryJacketTanCamo1", contents="RandomTorsoContents", percent = 15 },
				{ class = "MilitaryJacketTanCamo2", contents="RandomTorsoContents", percent = 15 },
				{ class = "MilitaryJacketTanCamo3", contents="RandomTorsoContents", percent = 15 },
				{ class = "MilitaryJacketTanCamo4", contents="RandomTorsoContents", percent = 15 },
				{ class = "TshirtCamo1", percent = 15 },
				{ class = "TshirtCamo2", percent = 15 },
				{ class = "TshirtCamo3", percent = 5 },
				{ class = "TshirtCamo4", percent = 5 },
			},
		},

		{
			category = "RandomCamoGloves",
			classes =
			{
				{ class = "WoolGlovesCamo1", percent = 25 },
				{ class = "WoolGlovesCamo2", percent = 25 },
				{ class = "WoolGlovesCamo3", percent = 25 },
				{ class = "WoolGlovesCamo4", percent = 25 },
			},
		},

		{
			category = "RandomCamoClothes",
			classes =
			{
				{ category = "RandomCamoFace", percent = 20 },
				{ category = "RandomCamoGloves", percent = 20 },
				{ category = "RandomCamoHats", percent = 20 },
				{ category = "RandomCamoPants", percent = 20 },
				{ category = "RandomCamoShirts", percent = 20 },
			},
		},


		-- Magazines/Rounds (with varying capacity/type)
		{
			category = "12GaugeAA12Mags",
			classes =
			{
				{ class = "12Gaugex8_Beanbag_AA12", percent = 1 },
				{ class = "12Gaugex8_Pellet_AA12", percent = 65 },
				{ class = "12Gaugex8_Slug_AA12", percent = 60 },
				{ class = "12Gaugex16_Beanbag_AA12", percent = 1 },
				{ class = "12Gaugex16_Pellet_AA12", percent = 65 },
				{ class = "12Gaugex16_Slug_AA12", percent = 60 },
			},
		},

		{
			category = "12GaugeShells",
			classes =
			{
				{ class = "Pile_12GaugePellet", percent = 75 },
				{ class = "Pile_12GaugeSlug", percent = 65 },
			},
		},

		{
			category = "12GaugeShellsPolice",
			classes =
			{
				{ class = "Pile_12GaugeBeanbag", percent = 1 },
				{ class = "Pile_12GaugePellet", percent = 55 },
				{ class = "Pile_12GaugeSlug", percent = 50 },
			},
		},

		{
			category = "9mmMagazine",
			classes =
			{
				{ class = "9mmx10", percent = 89 },
				{ class = "9mmx19", percent = 75 },
				{ class = "9mmx33", percent = 65 },
			},
		},


		-- Weapons with Magazines/Rounds
		{
			category = "AA12WithMagazines",
			group =
			{
				{ category = "12GaugeAA12Mags" },
				{ category = "RandomAA12Skin" },
			},
		},

		{
			category = "AKMWithMagazines",
			group =
			{
				{ category = "RandomAKMSkin" },
				{ class = "762x30" },
			},
		},

		{
			category = "AKMGoldWithMagazines",
			group =
			{
				{ class = "AKMGold" },
				{ class = "762x30" },
			},
		},

		{
			category = "AP85WithMagazines",
			group =
			{
				{ class = "AP85" },
				{ class = "9mmx19_ap85" },
			},
		},

		{
			category = "AT15WithMagazines",
			group =
			{
				{ category = "RandomAT15Skin" },
				{ class = "STANAGx30" },
				{ class = "IronsightKit" },
			},
		},

		{
			category = "BulldogWithMagazines",
			group =
			{
				{ category = "RandomBulldogSkin" },
				{ class = "STANAGx30" },
			},
		},

		{
			category = "ColtPytonWithRounds",
			group =
			{
				{ class = "ColtPython" },
				{ class = "Pile_357" },
			},
		},

		{
			category = "ColtPythonGrimeyRickWithRounds",
			group =
			{
				{ class = "ColtPythonGrimeyRick" },
				{ class = "Pile_357" },
			},
		},

		{
			category = "CraftedBowWithMagazines",
			group =
			{
				{ class = "CraftedBow" },
				{ class = "Arrowx8" },
			},
		},

		{
			category = "CraftedPistolWithMagazines",
			group =
			{
				{ category = "9mmMagazine" },
				{ class = "CraftedPistol" },
			},
		},

		{
			category = "CraftedSMGWithMagazines",
			group =
			{
				{ category = "9mmMagazine" },
				{ class = "CraftedSMG" },
			},
		},

		{
			category = "CraftedRifleWithMagazines",
			group =
			{
				{ class = "CraftedRifleLong" },
				{ class = "STANAGx30" },
			},
		},

		{
			category = "CrossbowWithMagazines",
			group =
			{
				{ class = "Crossbow" },
				{ class = "Boltx5_0000" },
			},
		},

		{
			category = "FlareGunWithRounds",
			group =
			{
				{ class = "FlareGun" },
				{ class = "Pile_Flare" },
			},
		},

		{
			category = "G18PistolWithMagazines",
			group =
			{
				{ category = "9mmMagazine" },
				{ class = "G18Pistol" },
			},
		},

		{
			category = "HK45WithMagazines",
			group =
			{
				{ class = "hk45" },
				{ class = "acp_45x10_hk" },
			},
		},

		{
			category = "M16WithMagazines",
			group =
			{
				{ category = "RandomM16Skin" },
				{ class = "STANAGx30" },
			},
		},

		{
			category = "M1911WithMagazines",
			group =
			{
				{ class = "m1911a1" },
				{ class = "acp_45x7" },
			},
		},

		{
			category = "M40A5WithMagazines",
			group =
			{
				{ class = "M40A5" },
				{ class = "M40x5" },
			},
		},

		{
			category = "ACAWWithMagazines",
			group =
			{
				{ class = "ACAW" },
				{ class = "762x5" },
			},
		},

		{
			category = "Mk18WithMagazines",
			group =
			{
				{ category = "RandomMk18Skin" },
				{ class = "STANAGx30" },
			},
		},

		{
			category = "Mk18ReaverWithMagazines",
			group =
			{
				{ class = "Mk18Reaver" },
				{ class = "STANAGx30" },
			},
		},

		{
			category = "Model70WithRounds",
			group =
			{
				{ class = "Model70" },
				{ class = "Pile_223" },
			},
		},

		{
			category = "P350WithMagazines",
			group =
			{
				{ class = "P350" },
				{ class = "357x14" },
			},
		},

		{
			category = "PX4WithMagazines",
			group =
			{
				{ class = "PX4" },
				{ class = "acp_45x10_hk" },
			},
		},

		{
			category = "R90WithMagazines",
			group =
			{
				{ category = "RandomR90Skin" },
				{ class = "57x50" },
			},
		},

		{
			category = "CX4StormWithMagazines",
			group =
			{
				{ category = "RandomCX4StormSkin" },
				{ class = "acp_45x20" },
			},
		},

		{
			category = "M16VietnamWithMagazines",
			group =
			{
				{ class = "M16Vietnam" },
				{ class = "STANAGx30" },
			},
		},

		{
			category = "AUMP45WithMagazines",
			group =
			{
				{ category = "RandomAUMP45Skin" },
				{ class = "acp_45x30" },
			},
		},

		{
			category = "AkValWithMagazines",
			group =
			{
				{ category = "RandomAKValSkin" },
				{ class = "762x20_Akval" },
			},
		},

		{
			category = "AK5DWithMagazines",
			group =
			{
				{ category = "RandomAK5DSkin" },
				{ class = "556x30_ak5d" },
			},
		},

		{
			category = "SAS12WithRounds",
			group =
			{
				{ category = "RandomSAS12Skin" },
				{ class = "Pile_12GaugePellet" },
			},
		},

		{
			category = "MAK10WithRounds",
			group =
			{
				{ class = "MAK10" },
				{ class = "9x19_mac10" },
			},
		},

		{
			category = "M97WithRounds",
			group =
			{
				{ category = "RandomM97VSkin" },
				{ class = "Pile_40mmGrenade" },
			},
		},

		{
			category = "RecurveBowWithMagazines",
			group =
			{
				{ class = "RecurveBow" },
				{ class = "Arrowx8" },
			},
		},

		{
			category = "Rem700WithRounds",
			group =
			{
				{ class = "Rem700" },
				{ class = "Pile_308" },
			},
		},

		{
			category = "Rem870WithRounds",
			group =
			{
				{ category = "12GaugeShells" },
				{ class = "Rem870" },
			},
		},

		{
			category = "Ruger22WithMagazines",
			group =
			{
				{ class = "ruger22" },
				{ class = "22x10_ruger" },
			},
		},

		{
			category = "Sako85WithRounds",
			group =
			{
				{ class = "Sako_85" },
				{ class = "Pile_308" },
			},
		},

		{
			category = "Shotgun870TacticalWithMagazines",
			group =
			{
				{ category = "12GaugeShellsPolice" },
				{ class = "Shotgun870Tactical" },
				{ class = "IronsightKit" },
			},
		},

		{
			category = "Wasteland22WithRounds",
			group =
			{
				{ class = "Wasteland22" },
				{ class = "Pile_22" },
			},
		},
	

		{
			category = "M249WithMagazines",
			group =
			{
				{ class = "M249" },
				{ class = "556x100" },
			},
		},

		{
			category = "MP5WithMagazines",
			group =
			{
				{ category = "RandomMP5Skin" },
				{ class = "10mmx30" },
			},
		},

		{
			category = "KrissVWithMagazines",
			group =
			{
				{ category = "RandomKrissVSkin" },
				{ class = "10mmx15" },
			},
		},
		
		{
			category = "M14WithMagazines",
			group =
			{
				{ class = "m14" },
				{ class = "mag_m14" },
			},
		},
		
		{
			category = "MAC10WithMagazines",
			group =
			{
				{ class = "mac10" },
				{ class = "mac10_mag" },
			},
		},
		
		{
			category = "UZIWithMagazines",
			group =
			{
				{ class = "uzi" },
				{ class = "uzi_mag" },
			},
		},
		
		{
			category = "ScorpionWithMagazines",
			group =
			{
				{ class = "scorpion" },
				{ class = "scorpion_mag" },
			},
		},
		
		{
			category = "G36CWithMagazines",
			group =
			{
				{ class = "G36C" },
				{ class = "g36c_mag" },
			},
		},
		
		{
			category = "PeacemakerWithMagazines",
			group =
			{
				{ class = "Peacemaker" },
				{ class = "Pile_357" },
			},
		},
		
		{
			category = "Model1873WithMagazines",
			group =
			{
				{ class = "Model1873" },
				{ class = "Pile_357" },
			},
		},

		{
			category = "RPKWithMagazines",
			group =
			{
				{ class = "RPK" },
				{ class = "762x30" },
			},
		},
		
		{
			category = "SW29WithMagazines",
			group =
			{
				{ class = "SW29" },
				{ class = "Pile_44M" },
			},
		},
		
		{
			category = "L1ARWithMagazines",
			group =
			{
				{ class = "L1AR" },
				{ class = "l1ar_mag" },
			},
		},
		
		{
			category = "SubjugatorWithMagazines",
			group =
			{
				{ class = "Subjugator" },
				{ class = "mag_m14" },
			},
		},
		
		{
			category = "DeagleWithMagazines",
			group =
			{
				{ class = "Deagle" },
				{ class = "deagle_mag" },
			},
		},
		
		{
			category = "JackalWithMagazines",
			group =
			{
				{ class = "Jackal" },
				--{ class = "T1MicroJackal" },
				{ class = "9mmx33" },
			},
		},

		{
			category = "VSSWithMagazines",
			group =
			{
				{ class = "VSS" },
				{ class = "762x20_Akval" },
			},
		},
		
		{
			category = "SCARWithMagazines",
			group =
			{
				{ class = "SCAR-H" },
				{ class = "STANAGx30" },
			},
		},

		{
			category = "M4A1WithMagazines",
			group =
			{
				{ class = "M4A1" },
				{ class = "STANAGx30" },
			},
		},
		
		{
			category = "M50WithMagazines",
			group =
			{
				{ class = "M50" },
				{ class = "50calx7" },
			},
		},

		{
			category = "M4V5WithMagazines",
			group =
			{
				{ class = "M4V5" },
				{ class = "STANAGx30" },
			},
		},

		-- Throwables
		{
			category = "RandomChemlight",
			classes =
			{
				{ class = "ChemlightBluePickup", percent = 20 },
				{ class = "ChemlightGreenPickup", percent = 20 },
				{ class = "ChemlightRedPickup", percent = 20 },
				{ class = "ChemlightWhitePickup", percent = 20 },
				{ class = "ChemlightYellowPickup", percent = 20 },
			},
		},

		{
			category = "RandomSmokeGrenade",
			classes =
			{
				{ class = "GrenadeGasSleepPickup", percent = 20 },
				{ class = "GrenadeSmokeGreenPickup", percent = 20 },
				{ class = "GrenadeSmokeMagentaPickup", percent = 20 },
				{ class = "GrenadeSmokeRedPickup", percent = 20 },
				{ class = "GrenadeSmokeWhitePickup", percent = 30 },
				{ class = "GrenadeSmokeYellowPickup", percent = 15 },
				
			},
		},

		{
			category = "RandomMilitaryGrenade",
			classes =
			{
				{ class = "FlashbangPickup", percent = 30 },
				{ class = "GrenadeGasNervePickup", percent = 20 },
				{ class = "GrenadeGasSleepPickup", percent = 20 },
				{ class = "GrenadeGasTearPickup", percent = 20 },
				{ class = "GrenadePickup", percent = 20 },
				{ class = "TrapLandminePacked", percent = 10 },
			},
		},

		-- Consumables
		{
			category = "RandomDrink",
			classes =
			{
				-- To reduce food/water in the world these only add up to 50%
				{ category = "RandomRottenVeggie", percent = 1 }, 
				{ category = "RandomSeeds", percent = 2 }, 
				{ category = "RandomAlcohol", percent = 2},
				{ class = "WaterPurificationTablets", percent = 6 },
				{ class = "CivCanteen01", percent = 4 },
				{ class = "CokeCan", percent = 7 },
				{ class = "DrPepperCan", percent = 7 },
				{ class = "EnergyDrinkCan", percent = 7 },
				{ class = "MilitaryCanteenPlastic", percent = 5 },
				{ class = "MilitaryCanteenMetal", percent = 5 },
				{ class = "PepsiCan", percent = 7 },
				{ class = "SpriteCan", percent = 7 },
				{ class = "TomatoJuiceCan", percent = 7 },
				{ class = "WaterBottle", percent = 10 },
			},
		},

		{
			category = "RandomAlcohol",
			classes =
			{
				{ class = "BeerCan", percent = 25 },
				{ class = "MiniBottleGin", percent = 25 },
				{ class = "MiniBottleVodka", percent = 25 },
				{ class = "MiniBottleWhiskey", percent = 25 },
			},
		},

		{
			category = "RandomFood",
			classes =
			{
				-- To reduce food/water in the world these only add up to 50%

				{ class = "WolfMeatSteakRaw", percent = 8 },
				{ class = "ChickenPotatoes", percent = 8 },
				{ class = "VegetableStew", percent = 8 },
				{ class = "DeerStew", percent = 8 },
				{ class = "WolfBeans", percent = 8 },
				{ class = "NordicWolf", percent = 8 },
				{ class = "PumpkinSoup", percent = 8 },
				{ class = "BearBeer", percent = 8 },
				{ class = "ShroomSoup", percent = 8 },
				{ class = "ShroomEggs", percent = 8 },
				{ class = "BaconEggs", percent = 8 },
				{ class = "StrangePorridge", percent = 8 },
				{ class = "FruitSalad", percent = 8 },
				{ class = "SeaSalad", percent = 8 },
				{ class = "TomatoesFarcies", percent = 8 },
				{ class = "ApplesNormande", percent = 8 },
				{ class = "BearSandwich", percent = 7 },
				{ class = "ChickenSandwich", percent = 7 },
				{ class = "DeerSandwich", percent = 7 },
				{ class = "HamSandwich", percent = 7 },
				{ class = "WolfSandwich", percent = 7 },
				{ class = "JellySandwich", percent = 7 },
				{ class = "PBJSandwich", percent = 7 },
				{ class = "PeanutButterSandwich", percent = 7 },
				{ class = "RawSeasonedBearSteaks", percent = 5 },
				{ class = "RawSeasonedChicken", percent = 5 },
				{ class = "RawSeasonedDeerSteaks", percent = 5 },
				{ class = "RawSeasonedHamSteaks", percent = 5 },
				{ class = "RawSeasonedWolfSteaks", percent = 5 },
				{ class = "BearStewRaw", percent = 5 },
				{ class = "ChickenStewRaw", percent = 5 },
				{ class = "DeerStewRaw", percent = 5 },
				{ class = "HamStewRaw", percent = 5 },
				{ class = "WolfStewRaw", percent = 5 },
				{ class = "ClamChowderRaw", percent = 5 },
				{ class = "MushroomStewRaw", percent = 5 },
				{ class = "SeaweedSoupRaw", percent = 5 },
				{ class = "VeggieStewRaw", percent = 5 },				
				{ category = "RandomRottenVeggie", percent = 5 }, 
				{ category = "RandomSeeds", percent = 5 }, 
				{ category = "SaltAndPepper", percent = 5 },
				{ class = "BeefStew", percent = 5 },
				{ class = "CannedMeat", percent = 5 },
				{ class = "CerealBox", percent = 5 },
				{ class = "CornCan", percent = 5 },
				{ class = "DogFoodCan", percent = 5 },
				{ class = "HersheysBar", percent = 5 },
				{ class = "MRE", percent = 5 },
				{ class = "NutSpread", percent = 5 },
				{ class = "PeachesCan", percent = 5 },
				{ class = "PearsCan", percent = 5 },
				{ class = "PeasCan", percent = 5 },
				{ class = "RavioliCan", percent = 5 },
				{ class = "SoupCan", percent = 5 },
				{ class = "TunaCan", percent = 5 },
				{ class = "ChocolateBox", percent = 5 }, --valentines
				{ class = "Champagne", percent = 5 }, --valentines		
			},
		},

		{
			category = "RandomVeggie",
			classes =
			{
				{ class = "Watermelon", percent = 10, min = 2, max = 3  },
				{ class = "strawberry_HMS", percent = 10, min = 2, max = 3 },
				{ class = "pineapple_HMS", percent = 10, min = 2, max = 3 },
				{ class = "PricklyPear", percent = 10, min = 2, max = 3 },				
				{ class = "Beets", percent = 10, min = 2, max = 3 },
				{ class = "BrushPeas", percent = 10, min = 2, max = 3 },
				{ class = "Pumpkin", percent = 10, min = 2, max = 3 },
				{ class = "Carrots", percent = 10, min = 2, max = 3 },
				{ class = "Potatoes", percent = 10, min = 2, max = 3 },
				{ class = "Radishes", percent = 10, min = 2, max = 3 },
				{ class = "SnapPeas", percent = 10, min = 2, max = 3 },
				{ class = "Tomatoes", percent = 10, min = 2, max = 3 },			
			},
		},

		{
			category = "RandomRottenVeggie", 
			classes = 
			{
				{ class = "WatermelonRotten", percent = 10 },
				{ class = "strawberry_HMS_Rotten", percent = 10 },
				{ class = "pineapple_HMS_Rotten", percent = 10 },
				{ class = "PricklyPearRotten", percent = 10 },	
				{ class = "BeetsRotten", percent = 10}, 
				{ class = "AppleRotten", percent = 10}, 
				{ class = "PumpkinRotten", percent = 10},
				{ class = "BrushPeasRotten", percent = 10}, 
				{ class = "CarrotsRotten", percent = 10}, 
				{ class = "PotatoesRotten", percent = 10}, 
				{ class = "RadishesRotten", percent = 10}, 
				{ class = "SnapPeasRotten", percent = 10}, 
				{ class = "TomatoesRotten", percent = 10}, 
		
			}, 
		}, 

		{
			category = "RandomConsumable", 
			classes = 
			{
				{ category = "RandomDrink", percent = 50}, 
				{ category = "RandomFood", percent = 50}, 
				{ category = "RandomRottenVeggie", percent = 1}, 
				{ category = "RandomVeggie", percent = 10},
				{ category = "RandomSeeds", percent = 7}, 
			}, 
		}, 

		{
			category = "RandomRottenMeat", 
			classes = 
			{
				{ class = "BearMeatRotten", percent = 10}, 
				{ class = "ChickenRotten", percent = 40},
				{ class = "DeerMeatSteakRotten", percent = 20}, 
				{ class = "HamRotten", percent = 20}, 
				{ class = "WolfMeatSteakRotten", percent = 10}, 
			}, 
		}, 

		{
			category = "RandomBurnedMeat", 
			classes = 
			{
				{ class = "BearMeatBurned", percent = 10}, 
				{ class = "ChickenBurned", percent = 40},
				{ class = "DeerMeatSteakBurned", percent = 20}, 
				{ class = "HamBurned", percent = 20}, 
				{ class = "WolfMeatSteakBurned", percent = 10}, 
			}, 
		}, 


		-- Random Mushrooms in Caves
		{
			category = "RandomMushroom",
			classes =
			{
				{ class = "MushroomAntiRad", percent = 45 },
				{ class = "MushroomFood", percent = 45 },
				{ class = "MushroomHeal", percent = 45 },
			},
		},


		-- Medical
		{
			category = "RandomMedical",
			classes =
			{
				{ class = "AdrenalineSyringe", percent = 1 },
				{ class = "AntiradiationPills", percent = 20 },
				{ class = "medcan", percent = 10, min = 2, max = 3 },
				{ class = "PotassiumIodidePills", percent = 5 },
				{ class = "Antibiotics", percent = 20 },
				{ class = "HeatPack", percent = 8 },				
				{ class = "Aspirin", percent = 1 },
				{ class = "Bandage", percent = 20 },
				{ class = "HeatPack", percent = 20 },
				{ class = "WaterPurificationTablets", percent = 5 },
				{ class = "Rags", percent = 5 },
				{ class = "RubbingAlcohol", percent = 1 },
				{ class = "Salt", percent = 1 },
			},
		},


		-- Tents
		{
			category = "RandomTent",
			classes =
			{
				{ category = "RandomCampingTent", percent = 20 },
				{ category = "RandomEasyCampTent", percent = 20 },
				{ category = "RandomPupTent", percent = 20 },
				{ category = "RandomTrekkingTent", percent = 20 },
				{ category = "RandomTwoPersonTent", percent = 20 },
			},
		},

		{
			category = "RandomPupTent",
			classes =
			{
				{ class = "PackedPupTentBlue", percent = 15 },
				{ class = "PackedPupTentBrown", percent = 25 },
				{ class = "PackedPupTentGreen", percent = 25 },
				{ class = "PackedPupTentRed", percent = 10 },
				{ class = "PackedPupTentTan", percent = 25 },
			},
		},

		{
			category = "RandomCampingTent",
			classes =
			{
				{ class = "PackedCampingTentBlue", percent = 14 },
				{ class = "PackedCampingTentBrown", percent = 14 },
				{ class = "PackedCampingTentGreen", percent = 14 },
				{ class = "PackedCampingTentOrange", percent = 14 },
				{ class = "PackedCampingTentPurple", percent = 14 },
				{ class = "PackedCampingTentRed", percent = 15 },
				{ class = "PackedCampingTentYellow", percent = 15 },
			},
		},

		{
			category = "RandomEasyCampTent",
			classes =
			{
				{ class = "PackedEasyCampTentBlue", percent = 15 },
				{ class = "PackedEasyCampTentBrown", percent = 15 },
				{ class = "PackedEasyCampTentGreen", percent = 14 },
				{ class = "PackedEasyCampTentOrange", percent = 14 },
				{ class = "PackedEasyCampTentPurple", percent = 14 },
				{ class = "PackedEasyCampTentRed", percent = 14 },
				{ class = "PackedEasyCampTentYellow", percent = 14 },
			},
		},

		{
			category = "RandomTrekkingTent",
			classes =
			{
				{ class = "PackedTrekkingTentBlue", percent = 14 },
				{ class = "PackedTrekkingTentBrown", percent = 14 },
				{ class = "PackedTrekkingTentGreen", percent = 14 },
				{ class = "PackedTrekkingTentOrange", percent = 14 },
				{ class = "PackedTrekkingTentPurple", percent = 14 },
				{ class = "PackedTrekkingTentRed", percent = 15 },
				{ class = "PackedTrekkingTentYellow", percent = 15 },
			},
		},

		{
			category = "RandomTwoPersonTent",
			classes =
			{
				{ class = "PackedTwoPersonTentBlue", percent = 14 },
				{ class = "PackedTwoPersonTentBrown", percent = 14 },
				{ class = "PackedTwoPersonTentGreen", percent = 14 },
				{ class = "PackedTwoPersonTentOrange", percent = 14 },
				{ class = "PackedTwoPersonTentPurple", percent = 14 },
				{ class = "PackedTwoPersonTentRed", percent = 15 },
				{ class = "PackedTwoPersonTentYellow", percent = 15 },
			},
		},


		-- Incapacitation
		{
			category = "HandcuffsWithKey",
			group =
			{
				{ class = "PoliceHandcuffs" },
				{ class = "PoliceHandcuffKey" },
			},
		},

		{
			category = "RandomIncapacition",
			classes =
			{
				{ category = "HandcuffsWithKey", percent = 34 },
				{ class = "DuctTape", percent = 33 },
				{ class = "Rope", percent = 20 },
				{ class = "HeadSack", percent = 13 },
			},
		},


		-- Crafting
		{
			category = "RandomCrafting",
			classes =
			{
				{ class = "CupidArrowx8", percent = 1 }, --valentines
				{ class = "flower_vase", percent = 3 }, --valentines
				{ class = "heart_candle", percent = 3 }, --valentines
				{ class = "heart_balloon", percent = 2 }, --valentines
				{ category = "RandomChristmasPresent", percent = 2 }, -- christmas
				{ category = "halloweenBagCommon", percent = 2 }, -- halloween
				{ category = "RandomIncapacition", percent = 5 },
				{ category = "RandomPaintCan", percent = 4 },
				{ category = "RandomFireStarter", percent = 4 },
				{ class = "Amalgaduino", percent = 5 },
				{ class = "BarbedWireCoil", percent = 10 },
				{ class = "CamoNetting", percent = 7 },
				{ class = "DuctTape", percent = 6.9 },
				{ class = "ElectricalParts", percent = 25 },
				{ class = "EmptyBottle", percent = 6 },
				{ class = "Nails", percent = 20 },
				{ class = "PipeMetal", percent = 5 },
				{ class = "Rags", percent = 30 },
				{ class = "PropaneHeaterTop", percent = 7 },
				{ class = "Rope", percent = 15 },
				{ class = "SawBlade", percent = 15 },
				-- Waiting on https://entrada.atlassian.net/browse/MIS-3150
				-- { class = "SolarPanelPiece", percent = 4 },
				{ class = "TargetPaper", percent = 3 },
				{ class = "Tarp", percent = 15 },
				{ class = "WorkLight", percent = 15 },
				{ class = "Hacksaw", percent = 15 },
				{ category = "RandomCraftingGuide", percent = 1 },
			},
		},

		{
			category = "RandomPaintCan",
			classes =
			{
				{ class = "PaintCan_Aqua", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Black", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Blue", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Brown", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Gold", percent = 6, min = 10, max = 30 },
				{ class = "PaintCan_Green", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Orange", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Pink", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Purple", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Red", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Silver", percent = 6, min = 10, max = 30 },
				{ class = "PaintCan_White", percent = 8, min = 10, max = 30 },
				{ class = "PaintCan_Yellow", percent = 8, min = 10, max = 30 },
			},
		},


		-- Forest stuff (that isnt actionable, so no sticks/rocks as those are now handled through awm)
		{
			category = "RandomForest",
			classes =
			{
				{ category = "RandomMushroom", percent = 100 },
			},
		},


		-- Fuel
		{
			category = "RandomFuel",
			classes =
			{
				{ class = "JerryCanDiesel", percent = 95 },
				{ class = "PropaneTank", percent = 25 },
				{ class = "small_generator", percent = 10 },
			},
		},


		-- Lubricant
		{
			category = "RandomLubricant",
			classes =
			{
				{ class = "Oil", percent = 100 },
			},
		},


		-- Gnomes
		{
			category = "RandomGnome",
			classes =
			{
				{ category = "RandomCraftingGuide", percent = 1 },
				{ class = "gnome_bronze", percent = 3 },
				{ class = "gnome_creep", percent = 14 },
				{ class = "gnome_gold", percent = 1 },
				{ class = "gnome_silver", percent = 2 },
				{ class = "gnome_standard_a", percent = 4 },
				{ class = "gnome_standard_b", percent = 4 },
				{ class = "gnome_standard_c", percent = 4 },
				{ class = "jerry", percent = 6 },
				{ class = "painting_landscape_01", percent = 4 },
				{ class = "painting_landscape_02", percent = 3 },
				{ class = "painting_landscape_03", percent = 3 },
				{ class = "painting_landscape_04", percent = 3 },
				{ class = "painting_landscape_05", percent = 3 },
				{ class = "painting_landscape_06", percent = 3 },
				{ class = "painting_landscape_07", percent = 3 },
				{ class = "painting_landscape_08", percent = 3 },
				{ class = "painting_landscape_09", percent = 3 },
				{ class = "painting_landscape_10", percent = 3 },
				{ class = "painting_square_01", percent = 4 },
				{ class = "painting_square_02", percent = 3 },
				{ class = "painting_vertical_landscape_01", percent = 3 },
				{ class = "painting_vertical_landscape_02", percent = 3 },
				{ class = "painting_vertical_landscape_03", percent = 3 },
				{ class = "painting_vertical_landscape_04", percent = 3 },
				{ class = "painting_vertical_landscape_05", percent = 3 },
				{ class = "poster_vertical_01", percent = 3 },
				{ class = "painting_map", percent = 5 },
				{ class = "CupidArrowx8", percent = 1 }, -- valentines
				{ class = "flower_vase", percent = 3 }, -- valentines
				{ class = "heart_candle", percent = 3 }, -- valentines
				{ class = "heart_balloon", percent = 3 }, -- valentines
				{ category = "halloweenBagCommon", percent = 2 }, -- halloween
				{ category = "RandomChristmasPresent", percent = 2 }, -- Christmas event
			},
		},

		{
			category = "RandomPainting",
			classes =
			{
				{ class = "painting_landscape_01", percent = 5 },
				{ class = "painting_landscape_02", percent = 5 },
				{ class = "painting_landscape_03", percent = 5 },
				{ class = "painting_landscape_04", percent = 5 },
				{ class = "painting_landscape_05", percent = 5 },
				{ class = "painting_landscape_06", percent = 5 },
				{ class = "painting_landscape_07", percent = 5 },
				{ class = "painting_landscape_08", percent = 5 },
				{ class = "painting_landscape_09", percent = 5 },
				{ class = "painting_landscape_10", percent = 5 },
				{ class = "painting_square_01", percent = 5 },
				{ class = "painting_square_02", percent = 5 },
				{ class = "painting_vertical_landscape_01", percent = 5 },
				{ class = "painting_vertical_landscape_02", percent = 5 },
				{ class = "painting_vertical_landscape_03", percent = 5 },
				{ class = "painting_vertical_landscape_04", percent = 5 },
				{ class = "painting_vertical_landscape_05", percent = 5 },
				{ class = "painting_map_canyonlands", percent = 5 },
				{ class = "poster_vertical_01", percent = 5 },
				{ class = "painting_map", percent = 5 },
			},
		},

		-- Basebuilding Items
		{
			category = "RandomBPart", 
			classes =
			{
				{ category = "RandomCampingBPart", percent = 95 },
				{ category = "RandomGnome", percent = 5 },
			},
		},

		-- Camping basebuilding Items
		
		{
			category = "RandomCampingBPart", 
			classes =
			{
				{ class = "camping_chair", percent = 20 },
				{ class = "propane_heater", percent = 5 },
				{ class = "camping_lantern", percent = 10 },				
				{ class = "camping_lantern_aqua", percent = 10 },
				{ class = "camping_lantern_blue", percent = 10 },
				{ class = "camping_lantern_green", percent = 10 },
				{ class = "camping_lantern_orange", percent = 10 },
				{ class = "camping_lantern_pink", percent = 10 },
				{ class = "camping_lantern_purple", percent = 10 },
				{ class = "camping_lantern_red", percent = 10 },
				{ class = "camping_lantern_yellow", percent = 10 },		
				{ class = "HeatPack", percent = 20 },
				{ class = "camping_pop_up_canopy", percent = 10 },
				{ class = "camping_table", percent = 10 },
				{ class = "camping_water_jug", percent = 20 },
				{ category = "RandomTent", percent = 1 },
			},
		},

		-- ====================================================================
		-- MORE ADVANCED CATEGORIES
		-- ====================================================================

		{
			category = "RandomExplosiveBarrel",
			classes =
			{
				{ class = "ExplosiveOilBarrel", percent = 100 },
			},
		},

		{
			category = "RandomExplosivePropaneTank",
			classes =
			{
				{ class = "PropaneTank", percent = 100 },
			},
		},

		{
			category = "RandomMelee",
			classes =
			{
				{ category = "RandomCamoClothes", percent = 6 },
				{ category = "RandomFlashlight", percent = 5 },
				{ class = "Axe", percent = 30 },
				{ class = "AxePatrick", percent = 10 },
				{ class = "BaseballBat", percent = 10 },
				{ class = "BaseballBatNails", percent = 7 },
				{ class = "BaseballBatSawBlade", percent = 5 },
				{ class = "BaseballBatSawBladeNails", percent = 5 },
				{ class = "BaseballBatScrapNails", percent = 5 },
				{ class = "BaseballBatHerMajesty", percent = 5 },
				{ class = "Cleaver", percent = 7 },
				{ class = "Crowbar", percent = 7 },
				{ class = "Guitar", percent = 10 },
				{ class = "Hammer", percent = 15 },
				{ class = "Hatchet", percent = 30 },
				{ class = "HuntingKnife", percent = 10 },
				{ class = "Katana", percent = 7 },
				{ class = "KatanaBlackWidow", percent = 3 },
				{ class = "LugWrench", percent = 8 },
				{ class = "Machete", percent = 10 },
				{ class = "StunBaton", percent = 10 },
				{ class = "MannequinArm", percent = 1 },
				{ class = "Pickaxe", percent = 30 },
				{ class = "PipeWrench", percent = 1 },
				{ class = "PoliceBaton", percent = 10 },
				{ class = "SurvivalKnife", percent = 10 },
				{ class = "TrapBearTrapPacked", percent = 5 },
				{ class = "Sledgehammer", percent = 0.5 },
				
			},
		},

		{
			category = "RandomSqueegee",
			classes =
			{
				{ class = "Squeegee", percent = 100 },
			},
		},

		-- largly based on random ranged weapon, rest from crafted
		{
			category = "RandomWeaponRepairKit",
			classes =
			{
				{ class = "RK_AA12", percent = 0.1 },
				{ class = "RK_ACAW", percent = 1 },
				{ class = "RK_AK74U", percent = 1 },
				{ class = "RK_AKM", percent = 1.01 },
				{ class = "RK_RocketLauncher", percent = 1.01 },
				{ class = "RK_AP85", percent = 1 },
				{ class = "RK_AT15", percent = 2 },
				{ class = "RK_AUMP45", percent = 1.5 },
				{ class = "RK_Bulldog", percent = 1 },
				{ class = "RK_ColtPython", percent = 8 },
				{ class = "RK_Crossbow", percent = 4 },
				{ class = "RK_CX4Storm", percent = 1 },
				{ class = "RK_DT12", percent = 1 },
				{ class = "RK_FlareGun", percent = 3 },
				{ class = "RK_G18Pistol", percent = 4 },
				{ class = "RK_hk45", percent = 6 },
				{ class = "RK_KrissV", percent = 1 },
				{ class = "RK_Kripton", percent = 1 },				
				{ class = "RK_M16", percent = 1.5 },
				{ class = "RK_m1911a1", percent = 7 },
				{ class = "RK_M249", percent = 0.01 },
				{ class = "RK_M40A5", percent = 0.48 },
				{ class = "RK_M9A1", percent = 1 },
				{ class = "RK_Makarov", percent = 1 },
				{ class = "RK_MeleePrimary", percent = 5 },
				{ class = "RK_MeleeSecondary", percent = 5 },
				{ class = "RK_Mk18", percent = 1.5 },
				{ class = "RK_Model70", percent = 1 },
				{ class = "RK_MP5", percent = 1 },
				{ class = "RK_P350", percent = 1.5 },
				{ class = "RK_PX4", percent = 1.5 },
				{ class = "RK_R90", percent = 1 },
				{ class = "RK_RecurveBow", percent = 3 },
				{ class = "RK_Rem700", percent = 2.5 },
				{ class = "RK_Rem870", percent = 4 },
				{ class = "RK_ruger22", percent = 5 },
				{ class = "RK_Sako_85", percent = 2 },
				{ class = "RK_Shotgun870Tactical", percent = 5.5 },
				{ class = "RK_Wasteland22", percent = 4.9 },
			},
		},

		{
			category = "RandomNormalRepairKit",
			classes =
			{
				{ class = "RK_Canvas", percent = 20 },
				{ class = "RK_Cloth", percent = 38 },
				{ class = "RK_ClothingHelmet", percent = 10 },
				{ class = "RK_ClothingHelmetBallistic", percent = 2 },
				{ class = "RK_Equipment", percent = 10 },
				{ class = "RK_Leather", percent = 15 },
				{ class = "RK_Teflon", percent = 5 },
			},
		},

		{
			category = "RandomCraftedWeaponPure",
			classes = 
			{
				{ class = "CraftedBow", percent = 17 },
				{ class = "CraftedPistol", percent = 17 },
				{ class = "CraftedRifleLong", percent = 10 },
				{ class = "CraftedSMG", percent = 5 },
				{ class = "CraftedLongPistol", percent = 12 },
				{ class = "CraftedPistol556", percent = 9 },
				{ class = "CraftedRifle9mm", percent = 5 },
				{ class = "CraftedShortRifle556", percent = 5 },
				{ class = "CraftedShortShotgun", percent = 10 },
				{ class = "CraftedShotgun", percent = 10 },
			},
		},

		{
			category = "RandomRangedPure",
			classes =
			{
				-- { category = "RandomCraftedWeaponPure", percent= 8 },
				{ category = "RandomAA12Skin", percent = 0.5 },
				{ class = "ACAW", percent = 0.5 },
				{ category = "RandomDT12Skin", percent = 1 },	
				{ category = "RandomAK74USkin", percent = 1 },
				{ category = "RandomAKMSkin", percent = 1 },
				{ class = "AKMGold", percent = 0.01 },
				{ class = "AP85", percent = 1 },
				{ category = "RandomAT15Skin", percent = 1 },
				{ category = "RandomAUMP45Skin", percent = 1 },
				{ category = "RandomBulldogSkin", percent = 1 },
				{ class = "ColtPython", percent = 1 },
				{ class = "ColtPythonGrimeyRick", percent = 0.1 },
				{ class = "CraftedBow", percent = 0.5 },
				{ class = "CraftedPistol", percent = 0.5 },
				{ class = "CraftedRifleLong", percent = 0.5 },
				{ class = "CraftedSMG", percent = 0.5 },
				{ class = "CraftedLongPistol", percent = 1 },
				{ class = "CraftedPistol556", percent = 1 },
				{ class = "CraftedRifle9mm", percent = 1 },
				{ class = "CraftedShortRifle556", percent = 1 },
				{ class = "CraftedShortShotgun", percent = 1 },
				{ class = "CraftedShotgun", percent = 1 },
				{ class = "Crossbow", percent = 0.5 },
				{ category = "RandomCX4StormSkin", percent = 1 },
				{ class = "FlareGun", percent = 0.5 },
				{ class = "G18Pistol", percent = 0.5 },
				{ class = "hk45", percent = 0.5 },
				{ category = "RandomKrissVSkin", percent = 1 },
				{ category = "RandomM16Skin", percent = 1 },
				{ class = "m1911a1", percent = 1 },
				{ class = "M249", percent = 0.01 },
				{ class = "M40A5", percent = 0.48 },
				{ class = "M9A1", percent = 0.5 },
				{ class = "Makarov", percent = 0.5 },
				{ category = "RandomMk18Skin", percent = 1 },
				{ class = "M4V5", percent = 1 },	
				{ class = "Model70", percent = 1 },
				{ category = "RandomMP5Skin", percent = 1 },
				{ class = "P350", percent = 1 },
				{ class = "PX4", percent = 1 },
				{ category = "RandomR90Skin", percent = 1 },
				{ class = "RecurveBow", percent = 0.5 },
				{ class = "Rem700", percent = 1 },
				{ class = "Rem870", percent = 1 },							
				{ class = "SawedShotgun", percent = 1 },				
				{ class = "ruger22", percent = 0.5 },
				{ class = "Sako_85", percent = 1 },
				{ class = "Shotgun870Tactical", percent = 0.5 },
				{ class = "Wasteland22", percent = 0.5 },
				{ category = "RandomAKValSkin", percent = 1 },
				{ category = "RandomSAS12Skin", percent = 1 },
				{ class = "MAK10", percent = 0.5 },
				{ category = "RandomAK5DSkin", percent = 1 },
				{ category = "RandomM97VSkin", percent = 1 },
			},
		},
		
		{
			category = "RandomRangedCivilianPure",
			classes =
			{
				{ category = "RandomAT15Skin", percent = 5 },
				{ class = "Crossbow", percent = 1 },
				{ category = "RandomCX4StormSkin", percent = 3 },
				{ class = "Model70", percent = 1 },
				{ class = "RecurveBow", percent = 1 },
				{ class = "Rem700", percent = 3 },
				{ class = "Rem870", percent = 3 },
				{ category = "RandomDT12Skin", percent = 3 },
				{ class = "SawedShotgun", percent = 3 },
				{ class = "Sako_85", percent = 3 },
				{ class = "m14", percent = 4 },
				{ class = "Shotgun870Tactical", percent = 3 },
				{ class = "Wasteland22", percent = 1 },
				{ category = "RandomAA12Skin", percent = 1 },
				{ category = "RandomSAS12Skin", percent = 1 },
				{ category = "RandomAK5DSkin", percent = 5 },
				{ class = "MAK10", percent = 1 },
				{ category = "RandomAccessory", percent = 3 },	
			},
		},
		
		{
		    category = "RandomRangedMilitaryPure",
			classes =
			{
				{ category = "RandomAA12Skin", percent = 1 },
				{ class = "ACAW", percent = 3 },
				{ category = "RandomAK74USkin", percent = 3 },
				{ category = "RandomAKMSkin", percent = 3 },
				{ category = "RandomAT15Skin", percent = 3 },
				{ category = "RandomAUMP45Skin", percent = 3 },
				{ category = "RandomBulldogSkin", percent = 3 },
				{ category = "RandomCX4StormSkin", percent = 3 },
				{ category = "RandomKrissVSkin", percent = 3 },
				{ category = "RandomM16Skin", percent = 3 },	
				{ class = "M249", percent = 4 },
				{ class = "M40A5", percent = 4 },
				{ category = "RandomMk18Skin", percent = 4 },
				{ class = "RPK", percent = 1 },
				{ category = "RandomMP5Skin", percent = 2 },		
				{ category = "RandomR90Skin", percent = 2 },
				{ class = "Shotgun870Tactical", percent = 2 },
				{ class = "AKMGold", percent = 0.5 },
				{ class = "ColtPythonGrimeyRick", percent = 1 },				
				{ class = "M4A1", percent = 4 },
				{ class = "SCAR-H", percent = 4 },			
				{ category = "RandomAKValSkin", percent = 4 },
				{ category = "RandomSAS12Skin", percent = 4 },
				{ category = "RandomAK5DSkin", percent = 4 },
				{ class = "MAK10", percent = 4 },
				{ category = "RandomM97VSkin", percent = 2 },
				{ category = "RandomAccessory", percent = 2 },
			},
		},
		
		{
		    category = "RandomRangedPolicePure",
			classes =
			{
				{ class = "ACAW", percent = 5 },
				{ category = "RandomAT15Skin", percent = 5 },
				{ category = "RandomAUMP45Skin", percent = 5 },
				{ category = "RandomCX4StormSkin", percent = 4 },
				{ category = "RandomMP5Skin", percent = 4 },
				{ class = "M4V5", percent = 5 },
				{ category = "RandomR90Skin", percent = 4 },
				{ class = "Shotgun870Tactical", percent = 3 },
				{ class = "AKMGold", percent = 0.5 },
				{ class = "ColtPythonGrimeyRick", percent = 2 },
				{ category = "RandomMk18Skin", percent = 4 },		
				{ class = "SW29", percent = 3 },
				{ class = "MAK10", percent = 1 }, -- UZI disabled for new MAK10
				{ class = "scorpion", percent = 3 },
				{ category = "RandomAKValSkin", percent = 5 },
				{ category = "RandomSAS12Skin", percent = 3 },				
				{ category = "RandomAK5DSkin", percent = 5 },
				{ category = "RandomM97VSkin", percent = 3 },
				{ category = "RandomAccessory", percent = 3 },
			},
		},
		
		{
		    category = "RandomMilitaryArmor",
			classes =
			{
				{ class = "FlakVestGreen", percent = 35 },
				{ class = "FlakVestGreenCamo1", percent = 35 },
				{ class = "FlakVestTan", percent = 35 },
				{ class = "FlakVestTanCamo1", percent = 35 },
				{ class = "ArmoredGhillieSuit", percent = 3 },
				{ class = "ArmoredGhillieHood", percent = 15 },
			},
		},
		
		{
		    category = "RandomPoliceArmor",
			classes =
			{
				{ class = "PoliceVestBlack", percent = 50 },
				{ class = "PoliceVestBlue", percent = 50 },
			},
		},

		{
			category = "RandomRanged",
			classes =
			{
				{ category = "RandomRangedPure", percent = 90 },
				--{ category = "RandomWeaponRepairKit", percent = 10 },
				{ category = "RandomCamoClothes", percent = 10 },
			},
		},

		{
			category = "RandomPistol",
			classes =
			{
				{ class = "ColtPython", percent = 8 },
				{ class = "ColtPythonGrimeyRick", percent = 1 },
				{ class = "FlareGun", percent = 6 },
				{ class = "G18Pistol", percent = 8 },
				{ class = "hk45", percent = 9 },
				{ class = "ruger22", percent = 8 },
				{ class = "Makarov", percent = 9 },
				{ class = "M9A1", percent = 9 },
				{ class = "m1911a1", percent = 9 },
				{ class = "PX4", percent = 9 },
				{ class = "P350", percent = 9 },
				{ class = "AP85", percent = 9 },
				{ class = "Glock18C", percent = 9 },
				{ class = "mp7", percent = 9 },
				{ category = "SW29WithMagazines", percent = 9 },
				{ category = "JackalWithMagazines", percent = 9 },
				{ category = "DeagleWithMagazines", percent = 3 },
				
			},
		},

		{
			category = "RandomAccessory",
			classes =
			{
				{ class = "HuntingScope", percent = 5 },
				{ class = "LaserSight", percent = 2 },
				{ class = "LaserSightGreen", percent = 2 },
				{ class = "LaserSightBlue", percent = 2 },
				{ class = "OpticScope", percent = 5 },
				{ class = "OpticScopeBow", percent = 1 },
				{ class = "PistolSilencer", percent = 1 },
				{ class = "ReflexSight", percent = 5 },
				{ class = "T1Micro", percent = 5 },
				{ class = "ReflexSightBow", percent = 1 },
				{ class = "RifleSilencer", percent = 5 },
				{ class = "ForegripVertical", percent = 5 },
				{ class = "OPKSight", percent = 5 },
				{ class = "R3Sight", percent = 5 },
				{ class = "PSOScope", percent = 4 },
				{ class = "BayonetRifle", percent = 1 },
				{ class = "IronsightKit", percent = 3 },
				{ class = "ReddotSight", percent = 5 },
				{ class = "FlashlightMounted", percent = 3 },
			},
		},

		{
			category = "RandomAmmo",
			classes =
			{
				{ category = "12GaugeAA12Mags", percent = 4 },
				{ category = "12GaugeShells", percent = 4 },
				{ category = "9mmMagazine", percent = 3 },
				{ category = "RandomAccessory", percent = 7 },
				{ category = "RandomChemlight", percent = 1 },
				{ category = "RandomSmokeGrenade", percent = 1 },	
				{ class = "545x30", percent = 7 },
				{ class = "57x50", percent = 4 },
				{ class = "762x5", percent = 7 },
				{ class = "9mmx10_makarov", percent = 2 },
				{ class = "9mmx15_m9a1", percent = 2 },
				{ class = "9mmx19_ap85", percent = 2 },
				{ class = "acp_45x20", percent = 1 },
				{ class = "acp_45x30", percent = 7 },
				{ class = "10mmx15", percent = 4 },
				{ class = "10mmx30", percent = 4 },
				{ class = "22x10_ruger", percent = 1 },
				{ class = "acp_45x10_hk", percent = 2 },
				{ class = "acp_45x7", percent = 1 },
				{ class = "762x30", percent = 7 },
				{ class = "Arrowx8", percent = 1 },			
				{ class = "Boltx5_0000", percent = 1 },
				{ class = "M40x5", percent = 7 },
				{ class = "Pile_10mm", percent = 7 },
				{ class = "Pile_22", percent = 1 },
				{ class = "Pile_545x39", percent = 4 },
				{ class = "Pile_57x28", percent = 4 },
				{ class = "Pile_223", percent = 2 },
				{ class = "Pile_308", percent = 4 },
				{ class = "Pile_357", percent = 4 },
				{ class = "Pile_44M", percent = 4 },
				{ class = "Pile_45ACP", percent = 7 },
				{ class = "Pile_556x45", percent = 7 },
				{ class = "Pile_762x39", percent = 7 },
				{ class = "Pile_sticky", percent = 7 },
				{ class = "Pile_762x51", percent = 7 },
				{ class = "Pile_9mm", percent = 3 },
				{ class = "Pile_Flare", percent = 1 },		
				{ class = "STANAGx30", percent = 15 },
				{ class = "50calx7", percent = 5 },
				{ class = "g36c_mag", percent = 10 },
				{ class = "Pile_50cal", percent = 3 },
				{ class = "g36cx50", percent = 7 },	
				{ class = "GrenadePickup", percent = 7 },		
				{ class = "C4TimedPickup", percent = 0.75, min = 1, max = 1 },
				{ class = "M203", percent = 4 },
				{ class = "556x30_ak5d", percent = 4 },
				{ class = "762x20_Akval", percent = 4 },
				{ class = "9x19_mac10", percent = 2 },
				{ class = "Pile_40mmGrenade", percent = 1 },
				{ class = "acp_45x30_cx8", percent = 10 },				
				{ class = "acp_45x15_hk", percent = 10 },
				{ class = "acp_45x14", percent = 10 },
				{ class = "357x20", percent = 7 },
				{ class = "22x15_ruger", percent = 3 },
				{ class = "9mmx20_makarov", percent = 4 },
				{ class = "9mmx25_m9a1", percent = 4 },
				{ class = "9mmx25_ap85", percent = 4 },	
				{ class = "Pile_40mmGrenade", percent = 3, min = 2, max = 3 },
			},
		},

		--{
		--	category = "RandomRockets",
		--	classes =
		--	{
		--		{ class = "Pile_Rocket", percent = 50 },
		--		{ class = "Pile_Rocket_HE", percent = 15 },
		--		{ class = "Pile_Rocket_AP", percent = 35 },
		--	},
		--},

		{
			category = "RandomWeaponWithMagsPure",
			classes =
			{
				{ category = "AA12WithMagazines", percent = 1},
				{ category = "AKMWithMagazines", percent = 25 },
				{ category = "AP85WithMagazines", percent = 5 },
				{ category = "AT15WithMagazines", percent = 15 },
				{ category = "BulldogWithMagazines", percent = 5 },
				{ category = "ColtPytonWithRounds", percent = 5 },
				{ category = "CraftedPistolWithMagazines", percent = 5 },
				{ category = "CraftedSMGWithMagazines", percent = 7 },
				{ category = "CraftedBowWithMagazines", percent = 5 },
				{ category = "CraftedRifleWithMagazines", percent = 7 },
				{ category = "CrossbowWithMagazines", percent = 4 },
				{ category = "FlareGunWithRounds", percent = 3 },
				{ category = "G18PistolWithMagazines", percent = 8 },
				{ category = "HK45WithMagazines", percent = 8 },
				{ category = "KrissVWithMagazines", percent = 8 },
				{ category = "M16WithMagazines", percent = 8 },
				{ category = "M1911WithMagazines", percent = 6 },
				{ category = "M249WithMagazines", percent = 3 },
				{ category = "M40A5WithMagazines", percent = 5 },
				{ category = "Mk18WithMagazines", percent = 7 },
				{ category = "Model70WithRounds", percent = 7 },
				{ category = "MP5WithMagazines", percent = 5 },
				{ category = "P350WithMagazines", percent = 7 },
				{ category = "PX4WithMagazines", percent = 7 },
				{ category = "RecurveBowWithMagazines", percent = 7 },
				{ category = "Rem700WithRounds", percent = 7 },
				{ category = "Rem870WithRounds", percent = 7 },
				{ category = "Ruger22WithMagazines", percent = 7 },
				{ category = "Sako85WithRounds", percent = 5 },
				{ category = "M14WithRounds", percent = 2 },
				{ category = "Shotgun870TacticalWithMagazines", percent = 5 },
				{ category = "Wasteland22WithRounds", percent = 6 },
				{ category = "M4A1WithMagazines", percent = 8 },
				{ category = "SCARWithMagazines", percent = 8 },			
				{ category = "L1ARWithMagazines", percent = 10 },
				{ category = "AkValWithMagazines", percent = 5 },
				{ category = "SAS12WithRounds", percent = 5 },
				{ category = "AK5DWithMagazines", percent = 5 },
				{ category = "MAK10WithRounds", percent = 4 },
				{ category = "M97WithRounds", percent = 3 },
			},
		},

		{
			category = "RandomAmmoBox",
			classes =
			{
				{ class = "AmmoBox_10mm", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_22", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_308", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_357", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_223", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_5_45x39", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_5_56x45", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_6PPC", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_5_70x28", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_7_62x39", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_7_62x51", percent = 10, min = 50, max = 100 },						
				{ class = "AmmoBox_9mm", percent = 10, min = 50, max = 100 },
				{ class = "AmmoBox_acp_45", percent = 10, min = 50, max = 100 },
				{ class = "Crafted_AmmoBox_7_62x39Venom", percent = 10, min = 50, max = 100 },				
				{ class = "Crafted_AmmoBox_556x77", percent = 10, min = 50, max = 100 },	
				{ class = "AmmoBox_44M", percent = 10, min = 20, max = 100 },
				{ class = "AmmoBox_50cal", percent = 10, min = 10, max = 25 },
				{ class = "Pile_40mmGrenade", percent = 10, min = 2, max = 3 },
			},
		},

		{
			category = "RandomWeaponWithMags",
			classes =
			{
				{ category = "RandomWeaponWithMagsPure", percent = 100 },
				--{ category = "RandomWeaponRepairKit", percent = 10 },
			},
		},

		{
			category = "RandomWeapon",
			classes =
			{
				{ category = "RandomMelee", percent = 40 },
				{ category = "RandomRanged", percent = 10 },
				{ category = "RandomWeaponWithMags", percent = 60 },
			},
		},

		{
			category = "RandomSeeds",
			classes =
			{				
				{ class = "SeedsPineapple", percent = 10 },
				{ class = "SeedsStrawberry", percent = 10 },
				{ class = "SeedsBeets", percent = 10 },
				{ class = "SeedsBrushPeas", percent = 10 },
				{ class = "SeedsCarrots", percent = 10 },
				{ class = "SeedsPotatoes", percent = 10 },
				{ class = "SeedsWatermelons", percent = 10 },
				{ class = "SeedsPumpkins", percent = 10 },
				{ class = "SeedsRadishes", percent = 10 },
				{ class = "SeedsSnapPeas", percent = 10 },
				{ class = "SeedsTomatoes", percent = 10 },			
				{ class = "SeedsMedcan", percent = 10 },
			},
		},

		-- Actionable contents (note that the actual chance of something being present is controlled in ActionableWorldManager.lua)

		{
			category = "RandomAppleTreeContent",
			classes =
			{
				{ class = "AppleFresh", percent = 100 },
				{ class = "AppleRotten", percent = 15 },
			},
		},

		{
			category = "RandomCactiContent",
			classes =
			{
				{ class = "PricklyPear", percent = 80 },
				{ class = "PricklyPearRotten", percent = 20 },
			},
		},
		
		{
			category = "RandomBeehiveContent",
			classes =
			{
				{ class = "Honeycomb", percent = 100 },
				-- { class = "QueenBee", percent = 5 },
			},
		},

		{
			category = "RandomCouchContent",
			classes =
			{
				{ category = "RandomCraftingGuide", percent = 8 },	
				{ class = "AmcoinLedger", percent = 5 },
				{ category = "RandomAmmo", percent = 40 },
				{ category = "RandomMedical", percent = 20 },
				{ class = "Rags", percent = 15 },
				{ class = "zipzap", percent = 10},
				{ class = "HersheysBar", percent = 10 },
				{ class = "MagliteSmall", percent = 1 },
			},
		},

		{
			category = "CheckoutContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 100 },
			},
		},

		{
			category = "SmallHidingPlaceContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 10 },
				{ category = "RandomTrashContent", percent = 1 },
				{ category = "RandomAccessory", percent = 25 },				
				{ category = "RandomCraftingGuide", percent = 25 },				
			},
		},

		{
			category = "MediumHidingPlaceContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 10 },
				{ category = "RandomAmmo", percent = 50 },
				{ category = "RandomTrashContent", percent = 1 },
				{ category = "RandomAccessory", percent = 25 },
				{ category = "RandomPistol", percent = 10 },
				{ category = "RandomCraftingGuide", percent = 45 },
			},
		},

		{
			category = "RandomToolboxContent",
			classes =
			{
				--{ category = "RandomWeaponRepairKit", percent = 4 },
				{ category = "RandomToolRepairKit", percent = 6 },
				{ class = "Nails", percent = 48 },
				{ class = "DuctTape", percent = 10 },
				{ class = "PipeMetal", percent = 5 },
				{ class = "Hammer", percent = 10 },
				{ class = "LugWrench", percent = 10 },
				{ class = "Sledgehammer", percent = 0.5 },
				{ class = "RK_Sledgehammer", percent = 0.5 },
				{ category = "RandomCraftingGuide", percent = 5 },				
			},
		},

		{
			category = "RandomToolRepairKit",
			classes =
			{
				{ class = "RK_MeleePrimary", percent = 50 },
				{ class = "RK_MeleeSecondary", percent = 50 },
			},
		},

		{
			category = "RandomDrinkVendingMachineContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 2 },
				{ class = "CokeCan", percent = 28 },
				{ class = "DrPepperCan", percent = 25 },
				{ class = "EnergyDrinkCan", percent = 25 },
				{ class = "PepsiCan", percent = 25 },
				{ class = "SpriteCan", percent = 30 },
				{ class = "WaterBottle", percent = 35 },
			},
		},

		{
			category = "RandomStoveContent",
			classes =
			{
				{ category = "RandomRottenMeat", percent = 50 },
				{ category = "RandomBurnedMeat", percent = 50 },
			},
		},

		{
			category = "RandomFridgeContent",
			classes =
			{
				{ category = "RandomConsumable", percent = 40 },
				{ category = "RandomRottenVeggie", percent = 20 },
				{ category = "RandomRottenMeat", percent = 40 },
			},
		},

		{
			category = "RandomTrashContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 2 },
				{ category = "RandomCraftingGuide", percent = 37 },
				{ category = "RandomRottenVeggie", percent = 6 },
				{ category = "RandomRottenMeat", percent = 1 },
				{ category = "RandomBurnedMeat", percent = 1 },
				{ class = "EmptyBottle", percent = 1 },
				{ class = "Rags", percent = 5 },
				{ class = "BalaclavaBlack", percent = 5 },
				{ class = "Rope", percent = 10 },
				{ class = "DuctTape", percent = 17 },
				{ class = "PipeMetal", percent = 5 },
				{ category = "RandomSeeds", percent = 10 },
			},
		},

		{
			category = "RandomCommercialCrateContent",
			classes =
			{
				{ category = "RandomMaintenance", percent = 10 },
				{ class = "Amalgaduino", percent = 8 },
				{ category = "RandomSeeds", percent = 6 },
				{ category = "RandomCampingBPart", percent = 15 },
				{ category = "RandomNormalRepairKit", percent = 3 },
				--{ category = "RandomWeaponRepairKit", percent = 3 },
				{ category = "RandomFuel", percent = 20 },
				{ class = "small_generator", percent = 8 },
				{ category = "RandomTent", percent = 2 },
				{ class = "Wheel", percent = 20 },
				{ class = "WorkLight", percent = 8 },
			},
		},

		{
			category = "RandomMilitaryFootlockerContent",
			classes =
			{
				{ category = "RandomChristmasPresent", percent = 2 },-- Christmas event
				{ category = "halloweenBagCommon", percent = 2 },-- halloween
				{ category = "RandomRangedPolicePure", percent = 10 },
				{ category = "RandomMilitaryClothing", percent = 10 },
				--{ category = "RandomWeaponRepairKit", percent = 5 },
				{ category = "RandomMedical", percent = 10 },
				{ category = "RandomHospitalBandage", percent = 5 },
				{ category = "RandomMilitaryGrenade", percent = 15 },
				{ category = "RandomAccessory", percent = 7 },
				{ category = "RandomCraftingGuide", percent = 30 },
				{ class = "AmcoinLedger", percent = 3 },
				{ class = "Amalgaduino", percent = 2 },
				{ class = "MilitaryCanteenPlastic", percent = 4 },
				{ class = "GasMask", percent = 2 },
				{ class = "MilitaryCanteenMetal", percent = 2 },
				{ class = "MagliteSmall", percent = 2 },
				{ class = "Maglite", percent = 2 },
				{ class = "MRE", percent = 5 },
				{ class = "Cb_radio", percent = 1 },
				{ class = "GridMap", percent = 1 },
				{ class = "Binoculars", percent = 3 },
				{ class = "SurvivalKnife", percent = 3 },				
				{ class = "BanesMask", percent = 0.3 },
				{ class = "Batmansbelt", percent = 0.3 },
				{ category = "RandomTent", percent = 0.3 },
			},
		},

		{
			category = "RandomMilitaryFootlockerIronSonsContent",
			classes =
			{
				{ category = "RandomMilitaryBodyArmor", percent = 14 },
				{ category = "RandomMilitaryHelmet", percent = 13 },
				{ category = "RandomAmmo", percent = 20 },
				{ class = "Pile_556x45", percent = 10 },
				{ class = "Pile_762x39", percent = 10 },
				{ class = "Pile_sticky", percent = 7 },
				{ class = "Pile_762x51", percent = 5 },
				{ class = "acp_45x30", percent = 5 },
				{ category = "RandomChristmasPresent", percent = 3 },-- Christmas event
				{ category = "halloweenBagCommon", percent = 3 },-- halloween
				{ category = "RandomRangedMilitaryPure", percent = 27 },
				{ category = "RandomAmmoBox", percent = 6 },
				{ category = "RandomAccessory", percent = 10 },
				{ category = "RandomMilitaryFootlockerContent", percent = 10 },
				{ class = "ArmoredGhillieSuit", percent = 1.5 },
				{ class = "ArmoredGhillieHood", percent = 1.5 },
				{ class = "BanesMask", percent = 0.3 },
				{ class = "Batmansbelt", percent = 0.3 },
				{ class = "SpaceHelmet", percent = 2 },
				{ category = "RandomCraftingGuide", percent = 1.5 },
				--{ category = "RocketLauncherNewComplete", percent = 1 },
			},
		},

		{
			category = "RandomMilitaryDeskContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 3 },
				{ class = "Amalgaduino", percent = 2 },
				{ category = "RandomAccessory", percent = 25 },
				{ category = "RandomCraftingGuide", percent = 33 },
				{ category = "RandomMedical", percent = 10 },
				{ category = "RandomHospitalBandage", percent = 1 },
				{ category = "RandomAmmo", percent = 19 },
				{ class = "Cb_radio", percent = 1 },
				{ class = "MagliteSmall", percent = 5 },
				{ class = "GridMap", percent = 1 },				
				{ class = "BanesMask", percent = 0.3 },
				{ class = "Batmansbelt", percent = 0.3 },
			},
		},

		{
			category = "RandomSwitchboardContent",
			classes =
			{
				{ category = "RandomElectronicsContent", percent = 15 },
				{ class = "Amalgaduino", percent = 25 },
				{ class = "Cb_radio", percent = 10 },
				{ class = "MagliteSmall", percent = 20 },
				{ class = "DuctTape", percent = 5 },
				{ class = "PipeMetal", percent = 5 },
				{ category = "RandomEyes", percent = 5 },
				{ category = "RandomTrashContent", percent = 15 },
			},
		},

		{
			category = "RandomLockerContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 2 },
				{ category = "RandomClothes", percent = 44 },
				{ category = "RandomFireStarter", percent = 6 },
				{ category = "RandomNormalRepairKit", percent = 5 },
				--{ category = "RandomWeaponRepairKit", percent = 5 },
				{ category = "RandomMedical", percent = 5 },
				{ category = "RandomTrashContent", percent = 5 },
				{ category = "RandomPistol", percent = 8 },	
				{ category = "RandomCraftingGuide", percent = 25 },
				{ category = "RandomTent", percent = 1 },
			},
		},

		{
			category = "RandomSinkContent",
			classes =
			{
				{ category = "RandomNormalRepairKit", percent = 5 },
				{ category = "RandomMedical", percent = 15 },
				{ category = "RandomFireStarter", percent = 5 },
				{ category = "RandomTrashContent", percent = 5 },
				{ class = "PipeMetal", percent = 5 },
				{ category = "RandomCraftingGuide", percent = 23 },
				{ category = "RandomFlashlight", percent = 5 },
				{ class = "HeatPack", percent = 7 },
				{ class = "Rope", percent = 5 },
				{ class = "RubbingAlcohol", percent = 10 },
				{ class = "Oil", percent = 7.5 },
				{ class = "DuctTape", percent = 5 },
				{ class = "DogFoodCan", percent = 5 },
				{ class = "CupidArrowx8", percent = 1 }, --valentines
			},
		},

		{
			category = "RandomDeskContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 4 },
				{ category = "RandomCraftingGuide", percent = 29 },
				{ class = "Amalgaduino", percent = 1 },
				{ class = "HeatPack", percent = 5 },
				{ category = "RandomFireStarter", percent = 10 },
				{ class = "AppleRotten", percent = 5 },
				{ class = "HersheysBar", percent = 5 },
				{ category = "RandomUtils", percent = 1 },
				{ category = "RandomHands", percent = 1 },
				{ category = "RandomEyes", percent = 1 },
				{ category = "RandomAccessory", percent = 5 },
				{ category = "RandomMedical", percent = 15 },
				{ category = "RandomAmmo", percent = 14 },
				{ category = "RandomSeeds", percent = 5 },
				{ class = "WaterPurificationTablets", percent = 1 },		
			},
		},

		{
			category = "RandomKitchenContent",
			classes =
			{
				{ class = "HeatPack", percent = 8 },
				{ category = "RandomMedical", percent = 1 },
				{ category = "RandomWoolGloves", percent = 5 },
				{ category = "BandanaHat", percent = 1 },
				{ category = "RandomCraftingGuide", percent = 11 },
				{ category = "RandomAmmo", percent = 1 },
				{ class = "AmcoinLedger", percent = 1 },
				{ category = "RandomFood", percent = 12 },
				{ category = "RandomSeeds", percent = 10 },
				{ category = "RandomFireStarter", percent = 25 },
				{ category = "SaltAndPepper", percent = 25 },
			},
		},

		{
			category = "RandomHospitalClothesSmall",
			classes =
			{
				{ category = "RandomHazmatSuit", percent = 6 },
				{ category = "RandomHazmatMaskColored", percent = 6 },
				{ category = "RandomHazmatSuitColored", percent = 6 },
				{ category = "RandomGasCanisterPackColored", percent = 6 },
				{ category = "RandomFullHazmatSet", percent = 1 },
				{ category = "RandomCraftingGuide", percent = 5 },
				{ class = "DustMask", percent = 5 },
				{ class = "HazmatMask", percent = 6 },
				{ class = "GasMask", percent = 5 },
				{ category = "RandomEyes", percent = 5 },
				{ class = "FannyPackGray", percent = 5 },
				{ class = "FannyPackRed", percent = 5 },
				{ class = "FannyPackRedBlue", percent = 5 },
				{ class = "SneakersWhite", percent = 5 },
				{ class = "HitopsBlue", percent = 5 },
				{ class = "WoolGlovesBlue", percent = 5 },
				{ class = "WoolGlovesWhite", percent = 5 },
			},
		},

		{
			category = "RandomHospitalClothes",
			classes =
			{
				{ category = "RandomHospitalClothesSmall", percent = 22 },
				{ category = "RandomClothes", percent = 14 },
				{ category = "RandomHazmatSuitColored", percent = 14 },
				{ category = "RandomGasCanisterPackColored", percent = 14 },
				{ class = "RainJacketOrangeBlue", percent = 5 },
				{ class = "RainJacketYellow", percent = 5 },
				{ class = "RainJacketRed", percent = 5 },
				{ class = "ButtonUpShirtBlue", percent = 4 },
				{ class = "ButtonUpShirtGrey", percent = 4 },
				{ class = "CottonShirtBlue", percent = 4 },
				{ class = "CottonShirtTan", percent = 4 },	
				{ category = "RandomCraftingGuide", percent = 5 },
			},
		},

		{
			category = "RandomHospitalBandage",
			classes =
			{
				{ class = "Bandage", percent = 20 },
				{ class = "AntibioticBandage", percent = 30 },
				{ class = "AdvancedBandage", percent = 50 },
			},
		},

		{
			category = "RandomHospitalMedical",
			classes =
			{
				{ category = "RandomMedical", percent = 75 },
				{ category = "RandomHospitalBandage", percent = 20 },
				{ category = "RandomCraftingGuide", percent = 5 },				
			},
		},

		{
			category = "RandomHospitalContentSmall",
			classes =
			{
				{ category = "RandomHospitalMedical", percent = 51 },
				{ category = "RandomHospitalClothesSmall", percent = 30 },
				{ category = "RandomConsumable", percent = 5 },
				{ category = "RandomChemlight", percent = 2 },
				{ category = "RandomFireStarter", percent = 2 },
				{ category = "RandomCraftingGuide", percent = 3 },
				{ class = "Cb_radio", percent = 2 },
				{ class = "MagliteSmall", percent = 2 },
				{ class = "Headlamp", percent = 2 },
				{ class = "HeadlampRed", percent = 1 },
			},
		},

		{
			category = "RandomHospitalContentMedium",
			classes =
			{
				{ category = "RandomHospitalContentSmall", percent = 50 },
				{ category = "RandomHospitalClothes", percent = 25 },
				{ category = "RandomCraftingGuide", percent = 2 },
				{ class = "WaterBottle", percent = 8 },
				{ class = "camping_lantern", percent = 2 },
				{ class = "camping_lantern_aqua", percent = 10 },
				{ class = "camping_lantern_blue", percent = 10 },
				{ class = "camping_lantern_green", percent = 10 },
				{ class = "camping_lantern_orange", percent = 10 },
				{ class = "camping_lantern_pink", percent = 10 },
				{ class = "camping_lantern_purple", percent = 10 },
				{ class = "camping_lantern_red", percent = 10 },
				{ class = "camping_lantern_yellow", percent = 10 },	
				{ class = "camping_water_jug", percent = 10 },
				{ class = "Hammer", percent = 3 },
				{ class = "Hatchet", percent = 2 },
				{ class = "StunBaton", percent = 3 },
				{ class = "SurvivalKnife", percent = 2 },
			},
		},

		{
			category = "RandomHospitalContentBig",
			classes =
			{
				{ category = "RandomHospitalContentMedium", percent = 63 },
				{ category = "RandomHospitalClothes", percent = 20 },
				{ category = "RandomCraftingGuide", percent = 2 },
				{ class = "JerryCanDiesel", percent = 5 },
				{ class = "PropaneTank", percent = 5 },
				{ class = "WorkLight", percent = 3 },
				{ class = "small_generator", percent = 1.75 },
				{ class = "powered_generator_small", percent = 0.25 },
			},
		},

		{
			category = "RandomLivingAreaContent",
			classes =
			{
				{ category = "RandomAmmo", percent = 13 },
				{ category = "RandomPistol", percent = 2 },
				{ class = "AmcoinLedger", percent = 20 },
				{ category = "RandomCraftingGuide", percent = 3 },
				{ category = "RandomCraftingGuide", percent = 40 },
				{ category = "RandomClothes", percent = 20 },
				{ category = "RandomNormalRepairKit", percent = 2 },
			},
		},

		{
			category = "RandomOfficeContent",
			classes =
			{
				{ category = "RandomAmmo", percent = 2 },
				{ category = "RandomPistol", percent = 2 },
				{ class = "AmcoinLedger", percent = 1 },
				{ category = "RandomCraftingGuide", percent = 3 },
				{ category = "RandomTrashContent", percent = 92 },
			},
		},

		{
			category = "RandomSuitcaseContent",
			classes =
			{
				{ class = "AmcoinLedger", percent = 2 },
				{ category = "RandomEyes", percent = 10 },
				{ category = "RandomTorso", percent = 35 },
				{ category = "RandomLegs", percent = 50 },
				{ category = "RandomCraftingGuide", percent = 3 },
			},
		},

		{
			category = "RandomWashingContent",
			classes =
			{
				{ category = "RandomTorso", percent = 50 },
				{ category = "RandomLegs", percent = 50 },
			},
		},

		{
			category = "RandomFoodBoxContent",
			classes =
			{
				{ category = "RandomConsumable", percent = 100 },
			},
		},

		{
			category = "RandomElectronicsContent",
			classes =
			{
				{ class = "ElectricalParts", percent = 70 },
				{ class = "Amalgaduino", percent = 20 },
				{ class = "AmcoinLedger", percent = 1 },

			},
		},
		
		{
			category = "RandomSilencer",
			classes =
			{
				{ class = "RifleSilencer", percent = 50 },
				{ class = "PistolSilencer", percent = 50 },
			},
		},

		-- --------------------------------------------------------------------
		-- AIRDROPS, PLANECRASH, UFO CONTENTS
		-- 
		-- --------------------------------------------------------------------

		-- AirDrops
		{			
			category = "RandomAirDropCrate",
			classes =
			{
				{ category = "RandomAirDropCratePolice", percent = 20 },
				{ category = "RandomAirDropCrateMilitary", percent = 20 },
				{ category = "RandomAirDropCrateCivilian", percent = 20 },
				{ category = "RandomAirDropCrateExplosives", percent = 20 },
				{ category = "RandomAirDropCrateBaseBuilding", percent = 20 },
				{ category = "RandomAirDropCrateRadiation", percent = 20 },
			},
		},
		
		-- AirPlane Crash
		{
			category = "AirPlaneCrashCrate", -- We need both categories.
			classes =
			{			
				{ class = "PlaneCrashCrate", contents="RandomCrateAirPlaneContents", percent = 100 },										
			},
		},

		-- Crates For Spawn
		{
			category = "CratesForSpawn", -- We need both categories.
			classes =			{			
				--PLANECRASH CRATE
				{ class = "PlaneCrashCrateSpawn", contents="RandomCrateAirPlaneContents", percent = 9 },
				--UFO  CRATE
				{ class = "UFOCrateSpawn", contents="RandomUFOContents", percent = 9 },				
				--SANTA CRATE 
				{ class = "UFOSantaCrate", contents="RandomAirDropSantaCrate", percent = 9 },			
				{ class = "UFOSantaCrateBlue", contents="RandomAirDropSantaCrate", percent = 9 },
				{ class = "AirDropSantaCrateSpawn", contents="RandomAirDropSantaCrate", percent = 9 },
				--AIRDROPS  CRATE
				{ class = "AirDropCrateSpawn", contents="RandomAirDropCrate", percent = 10 },	-- this is implemented by the 6 random different crates			 				
				{ class = "AirDropCrateSpawnPolice", contents="RandomAirDropCratePolice", percent = 9 },
				{ class = "AirDropCrateSpawnMilitary", contents="RandomAirDropCrateMilitary", percent = 9 },
				{ class = "AirDropCrateSpawnCivilian", contents="RandomAirDropCrateCivilian", percent = 9 },
				{ class = "AirDropCrateSpawnExplosives", contents="RandomAirDropCrateExplosives", percent = 9 },
				{ class = "AirDropCrateSpawnBaseBuilding", contents="RandomAirDropCrateBaseBuilding", percent = 9 },
				{ class = "AirDropCrateSpawnRadiation", contents="RandomAirDropCrateRadiation", percent = 9 },
			},
		},
	
		-- UFO Crash
		{
			category = "UFOCrashCrate",
			classes =
			{
				{ class = "UFOCrate", contents="RandomUFOContents", percent = 100 },		
			},
		},		
	
		-- UFO Crash
		{
			category = "RandomUFOSantaCrate",
			classes =
			{
				{ class = "AirDropSantaCrateSpawn", contents="RandomAirDropSantaCrate", percent = 50 },		
				{ class = "UFOSantaCrate", contents="RandomAirDropSantaCrate", percent = 50 },	
			},
		},	

		
		-- --------------------------------------------------------------------
		-- AIRDROPS CRATES LOOT
		-- 
		-- --------------------------------------------------------------------
				
		{
			category = "RandomAirDropCrateMilitary",  --Only up to 50 slots - no Items with accesories inside!
			group =
			{				
				{ category = "RandomRangedMilitaryPure", percent = 100 },
				{ category = "RandomCraftingGuide", percent = 100 },
				{ category= "RandomPistolXComplete", percent = 100 },																			
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomFood", percent = 100 },							
				{ category = "RandomBestWeaponsCompleteAll", percent = 100 },     	--Contains 6 slots!!
				{ category = "RandomLastShotSuits", percent = 100 },              --Contains 8 slots!!
				{ category = "RandomProtectionFace", percent = 100 },								
				{ category = "RandomNormalWeaponMagazines", percent = 100 },
				{ category = "RandomGhillieSuitComplete", percent = 100 },
				{ category = "RandomNormalWeaponMagazines", percent = 100 },
				{ category = "RandomBestSnipers", percent = 100 },
				{ category = "RandomBestSnipersMagazines", percent = 100 },	
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomSpecialAllItems", percent = 100 },
				{ category = "RandomNormalGoodWeapons", percent = 100 },
				{ category = "RandomLastInvokers", percent = 30 },											
				{ category = "RandomAmmoBox", percent = 100 },								
				{ category = "RandomMilitaryArmor", percent = 100 },
				{ category = "RandomMilitaryHelmet", percent = 100 },				
				{ category = "RandomProtectionFace", percent = 100 },
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBackpack", percent = 100 },
				{ category = "RandomAllNormalWeaponsWithMagazines", percent = 100 },														
				{ category = "RandomBombItems", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomConsumable", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },				
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomConsumable", percent = 100 },				
				{ category = "RandomNormalWeaponMagazines", percent = 100 },				
				{ category = "RandomBestSnipersMagazines", percent = 100 },				
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomMushroom", percent = 100 },						
				{ category = "RandomSpecialAllItems", percent = 100 },				
				{ category = "RandomNormalWeaponMagazines", percent = 100 },	
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },								
			},
		},
		
		{
			category = "RandomAirDropCrateRadiation", --Only up to 50 slots - no Items with accesories inside!
			group =
			{
				{ category = "RandomRangedMilitaryPure", percent = 100 },
				{ category = "RandomCraftingGuide", percent = 100 },										
				{ category = "RandomHazmatMaskColored", percent = 100 }, 	-- Changed the Hazmat Gear to Random New Colored Pieces (The following categories can be found in HazmatGearISM.lua)
				{ category = "RandomFace", percent = 100 },	
				{ category= "RandomPistolXComplete", percent = 100 },				
				{ category = "RandomBestWeaponsCompleteAll", percent = 100 },     	--Contains 6 slots!!
				{ category = "RandomLastShotSuits", percent = 100 },              --Contains 8 slots!!
				{ category = "RandomProtectionFace", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },						
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomSpecialAllItems", percent = 100 },		
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ category = "RandomGhillieSuitComplete", percent = 100 },				
				{ category = "RandomHazmatSuitHood", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },				
				{ category = "RandomGasCanisterPackColored", percent = 100 },				
				{ class = "AntiradiationPills", percent = 100, min = 3, max = 5 },			
				{ category = "RandomFood", percent = 100 },			
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },
				{ class = "AntiradiationPills", percent = 100, min = 3, max = 5 },	
				{ category = "RandomMilitaryHelmet", percent = 100 },		
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBackpack", percent = 100 },				
				{ category = "RandomSpecialAllItems", percent = 100 },
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },							
				{ category = "RandomExtendedMagazines", percent = 100 },					
				{ category = "RandomFlashlight", percent = 100 },
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },
				{ category = "RandomNormalGoodWeapons", percent = 100 },
				{ category = "RandomNormalWeaponMagazines", percent = 100 },
				{ category = "RandomBestSnipers", percent = 100 },
				{ category = "RandomBestSnipersMagazines", percent = 100 },	
			},
		},
		
		{
			category = "RandomAirDropCrateBaseBuilding", --Only up to 50 slots - no Items with accesories inside!
			group =
			{				
				{ category= "RandomWoodOtherPartBuilding", percent = 100 },
				{ class = "SheetMetal", percent = 100, min = 64, max = 128 },
				{ class = "Lumber", percent = 100, min = 64, max = 128},	
				{ category = "RandomConcretePartBuilding", percent = 100 },											
				{ class = "ConcreteBag", percent = 100, min = 5, max = 10 },
				{ category = "RandomDoorPartBuilding", percent = 100 },     	
				{ category = "RandomRockPartBuilding", percent = 100 },              
				{ category = "RandomGlassPartBuilding", percent = 100 },
				{ category = "RandomCCTV", percent = 100 },				
				{ category = "RandomMarblePartBuilding", percent = 100 },			
				{ class = "SheetMetal", percent = 100, min = 64, max = 128 },
				{ class = "Lumber", percent = 100, min = 64, max = 128 },				
		    	{ class = "MarbleBag", percent = 100, min = 4, max = 7 },
				{ class = "TitaniumBag", percent = 100, min = 3, max = 6 },
				{ category = "RandomPlasteredPartBuilding", percent = 100 },				
				{ class = "WoodPile", percent = 100, min = 164, max = 220 },
				{ class = "Rocks", percent = 100, min = 64, max = 128 },
				{ class = "Nails", percent = 100, min = 64, max = 90 },				
				{ class = "BarbedWireCoil", percent = 100, min = 20, max = 30 },
				{ class = "CamoNetting", percent = 100, min = 5, max = 15  },
				{ class = "DuctTape", percent = 100, min = 15, max = 25  },
				{ class = "ElectricalParts", percent = 100, min = 1, max = 5 },
				{ class = "ScrapMetal", percent = 100, min = 64, max = 84 },
				{ class = "Tarp", percent = 100, min = 1, max = 5 },
				{ class = "TitaniumBag", percent = 100, min = 3, max = 6 },
				{ class = "Rags", percent = 100, min = 20, max = 30 },
				{ class = "PlasteredBag", percent = 100, min = 5, max = 8 },
				{ class = "IronIngot", percent = 100, min = 200, max = 250 },
				{ class = "IronOre", percent = 100, min = 200, max = 250 },
				{ class = "MarbleBag", percent = 100, min = 4, max = 7 },
				{ class = "Rocks", percent = 100, min = 64, max = 128 },	
				{ class = "WoodPile", percent = 100, min = 164, max = 220 },
				{ class = "Nails", percent = 100, min = 64, max = 90 },				
				{ class = "ScrapMetal", percent = 100, min = 64, max = 84 },												
				{ class = "PlasteredBag", percent = 100, min = 5, max = 8 },
				{ class = "sandbag_crafted_single", percent = 100, min = 45, max = 60 },
				{ class = "Gunpowder", percent = 100, min = 155, max = 200 },	
				{ class = "SheetMetal", percent = 100, min = 64, max = 128 },		
				{ class = "Rope", percent = 100, min = 5, max = 25 },							
				{ category = "RandomCraftingGuide", percent = 100 },
				{ class = "Lumber", percent = 100, min = 64, max = 128 },				
				{ category = "RandomTitanPartBuilding", percent = 100 },
				{ category = "RandomConcretePartBuilding", percent = 100 },
				{ category = "RandomWoodOtherPartBuilding", percent = 100 },
				{ class = "BarbedWireCoil", percent = 100, min = 20, max = 30 },
				{ class = "CamoNetting", percent = 100, min = 5, max = 15  },
				{ class = "ScrapMetal", percent = 100, min = 64, max = 84 },
				{ class = "ConcreteBag", percent = 100, min = 5, max = 10 },
				
									
			},
		},
	
		{
			category = "RandomAirDropCratePolice", --Only up to 50 slots - no Items with accesories inside!
			group =
			{
				{ category = "RandomRangedPolicePure", percent = 100 },
				{ category = "RandomCraftingGuide", percent = 100 },						
				{ category = "RandomProtectionFace", percent = 100 },	
				{ category= "RandomPistolXComplete", percent = 100 },	
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomLastInvokers", percent = 30 },									
				{ category = "RandomSilencer", percent = 100 },		
				{ category = "RandomGhillieSuitComplete", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomPoliceArmor", percent = 100 },
				{ category = "RandomPoliceHelmet", percent = 100 },				
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomBestWeaponsCompleteAll", percent = 100 },     	--Contains 6 slots!!
				{ category = "RandomLastShotSuits", percent = 100 },              --Contains 8 slots!!
				{ category = "RandomProtectionFace", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomSpecialAllItems", percent = 100 },							
				{ class = "camping_water_jug", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },
				{ category = "RandomMilitaryHelmet", percent = 100 },
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBackpack", percent = 100 },	
				{ category = "RandomFood", percent = 100 },			
				{ category = "RandomAllNormalWeaponsWithMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },
				{ category = "RandomNormalGoodWeapons", percent = 100 },
				{ category = "RandomNormalWeaponMagazines", percent = 100 },
				{ category = "RandomBestSnipers", percent = 100 },
				{ category = "RandomBestSnipersMagazines", percent = 100 },			
			},
		},
		
	
		{
			category = "RandomAirDropCrateCivilian", --Only up to 50 slots - no Items with accesories inside!
			group =
			{
				{ category = "RandomRangedCivilianPure", percent = 100 },
				{ category = "RandomCraftingGuide", percent = 100 },			
				{ category = "RandomBestWeaponsCompleteAll", percent = 100 },     	--Contains 6 slots!!	
				{ category = "RandomLastShotSuits", percent = 100 },              --Contains 8 slots!!
				{ category = "RandomAmmoBox", percent = 100 },
				{ category= "RandomPistolXComplete", percent = 100 },
				{ category = "RandomLastInvokers", percent = 30 },	
				{ category = "RandomProtectionFace", percent = 100 },				
				{ category = "RandomGhillieSuitComplete", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 50 },				
				{ category = "RandomAmmoBox", percent = 100 },									
				{ category = "RandomFood", percent = 100 },			
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomMushroom", percent = 100 },
				{ category = "RandomFace", percent = 100 },	
				{ category = "RandomExtendedMagazines", percent = 100 },				
				{ class = "Lumber", percent = 100, min = 64, max = 128 },
				{ category = "RandomSpecialAllItems", percent = 100 },				
				{ category = "RandomAllNormalWeaponsWithMagazines", percent = 100 },		
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ category = "RandomHazmatMaskColored", percent = 100 },
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ category = "RandomGasCanisterPackColored", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },
				{ category = "RandomNormalGoodWeapons", percent = 100 },
				{ category = "RandomSpecialAllItems", percent = 100 },
				{ category = "RandomMilitaryHelmet", percent = 100 },
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBackpack", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },				
				{ category = "RandomNormalWeaponMagazines", percent = 100 },						
			},
		},
		
	
		{
			category = "RandomAirDropCrateExplosives", --Only up to 50 slots - no Items with accesories inside!
			group =
			{
				{ class = "C4Bricks", percent = 100, min = 5, max = 10 },
				{ class = "C4Bricks", percent = 100, min = 5, max = 10 },
				{ class = "Sulphur", percent = 100, min = 64, max = 128 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category= "RandomPistolXComplete", percent = 100 },
				{ category = "RandomBestWeaponsCompleteAll", percent = 100 },     	--Contains 6 slots!!
				{ category = "RandomLastShotSuits", percent = 100 },              --Contains 8 slots!!
				{ category = "RandomProtectionFace", percent = 100 },				
				{ class = "Sulphur", percent = 100, min = 64, max = 128 },
				{ class = "Gunpowder", percent = 100, min = 64, max = 128 },
				{ class = "Gunpowder", percent = 100, min = 64, max = 128},
				{ class = "Gunpowder", percent = 100, min = 64, max = 128},
				{ category = "RandomGhillieSuitComplete", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ class = "BioFuel", percent = 100, min = 50, max = 128 },
				{ class = "BioFuel", percent = 100, min = 50, max = 128 },
				{ class = "BioFuel", percent = 100, min = 50, max = 128 },
				{ category = "RandomExtendedMagazines", percent = 50 },	
				{ class = "GrenadeMolotovPickup", percent = 100, min = 2, max = 3 },
				{ class = "GrenadeMolotovPickup", percent = 100, min = 2, max = 3 },
				{ class = "GrenadePickup", percent = 100, min = 2, max = 3 },
				{ category = "RandomFood", percent = 100 },	
				{ class = "GrenadePickup", percent = 100, min = 2, max = 3 },				
				{ class = "PipebombPickup", percent = 100, min = 2, max = 3 },
				{ class = "PipebombPickup", percent = 100, min = 2, max = 3 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ class = "Amalgaduino", percent = 100, min = 5, max = 10 },
				{ class = "Amalgaduino", percent = 100, min = 5, max = 10 },
				{ class = "C4TimedPickup", percent = 100, min = 2, max = 3 },
				{ category = "RocketLauncherNewComplete", percent = 100 },  --Contains 6 slots!!			
				{ class = "TrapLandminePacked", percent = 100, min = 2, max = 3 },
				{ class = "TrapLandminePacked", percent = 100, min = 2, max = 3 },					
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomAllNormalWeaponsWithMagazines", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ category = "RandomHazmatMaskColored", percent = 100 },
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },
				{ category = "RandomMilitaryHelmet", percent = 100 },
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBackpack", percent = 100 },					
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },	
			},
		},


		-- --------------------------------------------------------------------
		-- PLANECRASH & UFO CRATES LOOT
		-- 
		-- --------------------------------------------------------------------

		{
			category = "RandomCrateAirPlaneContents", --PLANECRASH  - Only up to 50 slots - no Items with accesories inside!
			group =
			{	
				{ category= "RandomPistolXComplete", percent = 100 },
				{ category = "RandomNormalGoodWeapons", percent = 100 },
				{ category = "RandomCCTV", percent = 100 },	
				{ category = "RandomLastInvokers", percent = 60 },				
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomBestWeaponsCompleteNew", percent = 100 },     	--Contains 6 slots!!		
				{ category = "RandomLastShotSpaceSuits", percent = 100 },              --Contains 8 slots!!
				{ category = "RandomProtectionFace", percent = 100 },
				{ category = "RandomSpecialAllItems", percent = 100 },
				{ category = "RandomBestWeaponsComplete", percent = 100 },     	--Contains 6 slots!!				
				{ category = "RandomNormalWeaponMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomGhillieSuitComplete", percent = 100 },			
				{ category = "RandomAllNormalWeaponsWithMagazines", percent = 100 },										
				{ category = "RandomExtendedMagazines", percent = 100 },				
				{ category = "RandomSpecialMaskHelmet", percent = 100 },				
				{ category = "RandomBestSnipers", percent = 100 },			
				{ category = "RandomBestWeaponsCompleteAll", percent = 100 }, 			--Contains 6 slots!!
				{ category = "RandomBestSnipersMagazines", percent = 100 },		
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomFood", percent = 100 },
				{ category = "RandomNormalWeaponMagazines", percent = 100 },					
				{ category = "RandomProtectionFace", percent = 100 },				
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomHazmatMaskColored", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomHazmatSuitColored", percent = 100 },				
				{ category = "RandomSpecialAllItems", percent = 100 },																							
				{ category = "RandomBombItems", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },		
			},
		},


		{
            category = "RandomUFOContents", --Only up to 40 slots in Special UFO Crate - no Items with accesories inside!
            group =
            {             								             
                { category = "RandomSword", percent = 100 },	
				{ category= "RandomBestWeaponsComplete", percent = 100 },     	--Contains 4 slots!!				             							
				{ category = "RandomLastInvokers", percent = 100 },																		
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomHazmatMaskColored", percent = 100 },			
				{ category = "RandomBestWeaponsCompleteNew", percent = 100 },     	--Contains 6 slots!!
				{ category= "RandomPistolXComplete", percent = 100 },
				{ category = "RandomLastShotSpaceSuits", percent = 100 },              --Contains 8 slots!!
				{ category = "RandomProtectionFace", percent = 100 },	
				{ category = "RandomAmmoBox", percent = 100 },					
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ category = "RandomGasCanisterPackColored", percent = 100 },
				{ category = "RandomGhillieSuitComplete", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },				
				{ category = "RandomBestWeaponsCompleteAll", percent = 100 }, 		--Contains 4 slots!!  						
				{ category = "RandomFood", percent = 100 },	
				{ category = "RandomAmmoBox", percent = 100 },	
				{ category = "RandomSpecialMaskHelmet", percent = 100 },										
				{ category = "RandomBombItems", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },			
				{ category = "RandomBestSnipers", percent = 100 },
				{ category = "RandomBestSnipersMagazines", percent = 100 },
				{ category = "RandomAllNormalWeaponsWithMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomNormalWeaponMagazines", percent = 100 },				
				{ category = "RandomBestSnipersMagazines", percent = 100 },
				{ category = "RandomProtectionFace", percent = 100 },  			
				{ category = "RandomAmmoBox", percent = 100 },											
				{ category = "RandomNormalWeaponMagazines", percent = 100 },			
				{ category = "RandomSpecialAllItems", percent = 100 },			
				{ category = "RandomExtendedMagazines", percent = 100 },				
            },
		},

		

		-- --------------------------------------------------------------------
		-- PLANECRASH & UFO BackPack
		-- 
		-- --------------------------------------------------------------------



		{
			category = "AirPlaneCrashBackpack",
			classes =
			{
				-- no stowpacks - only better backpacks
				{ category = "RandomLastShotBagAirPlane", percent = 100 },				
				--{ category = "RandomDuffelBagAirPlane", percent =  25 },								
				--{ category = "RandomRuckSackAirPlane", percent = 15 },
				--{ category = "RandomRuggedPackAirPlane", percent = 15 },
			},
		},
	
		{
			category = "RandomSmallBackpackAirPlaneContents", --Only up to 30 slots in RuggedPack - no Weapons or items with accesories inside!
			group =
			{				
				{ category = "RandomFlashlight", percent = 100 },
				{ category = "RandomConsumable", percent = 100 },
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomCraftingGuide", percent = 100 },
				{ category = "RandomClothes", percent = 100 },
				{ category = "RandomGhillieSuitComplete", percent = 100 },
				{ category = "RandomCrafting", percent = 100 },
				{ category = "RandomFace", percent = 100 },					
				{ category = "RandomMaintenance", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },		
				{ class = "SpaceHelmet", percent = 100 },
				{ class = "PredatorPants", percent = 100 },
				{ class = "PredatorBoots", percent = 100 },
				{ class = "PredatorDuffelBag", percent = 100 },
				{ class = "PredatorArmor", percent = 100 },
				{ class = "PredatorGloves", percent = 100 },
				{ class = "PredatorJacket", percent = 100 },
				{ class = "PredatorScarf", percent = 100 },
				{ class = "PredatorHelmet", percent = 100 },
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ class = "HazmatMask", percent = 100 },				
				{ category = "RandomHazmatMaskColored", percent = 100 },
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ class = "camping_water_jug", percent = 100 },
				{ category = "RandomFood", percent = 100}, 
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },	
			},
		},

		{
			category = "RandomBigBackpackAirPlaneContents", --Only up to 50 slots in DuffelBag or RuckSack - no weapons or items with accesories inside!
			group =
			{				
				{ category = "RandomFlashlight", percent = 100 }, 
				{ category = "RandomConsumable", percent = 100 },
				{ category = "RandomMedical", percent = 100 },
				{ category = "RandomCraftingGuide", percent = 100 },
				{ category = "RandomClothes", percent = 100 },
				{ category = "RandomGhillieSuitComplete", percent = 100 },
				{ category = "RandomCrafting", percent = 100 },
				{ category = "RandomMaintenance", percent = 100 },
				{ category = "RandomFace", percent = 100 },					
				{ category = "RandomAmmoBox", percent = 100 },		
				{ class = "SpaceHelmet", percent = 100 },
				{ class = "SnowcamoCargoPants", percent = 100 },
				{ class = "SnowcamoCombatBoots", percent = 100 },
				{ class = "SnowcamoDuffelBag", percent = 100 },
				{ class = "Snowcamoheavyshoulder", percent = 100 },
				{ class = "SnowcamoMilitaryGloves", percent = 100 },
				{ class = "SnowcamoMilitaryJacket", percent = 100 },
				{ class = "SnowcamoScarf", percent = 100 },
				{ class = "SnowcamoSpaceHelmet", percent = 100 },				
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ class = "HazmatMask", percent = 100 },				
				{ category = "RandomHazmatMaskColored", percent = 100 },
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ class = "MilitaryCanteenMetal", percent = 100 },
				{ category = "RandomFood", percent = 100},
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },
				{ category = "RandomNormalGoodWeapons", percent = 100 },
				{ category = "RandomNormalWeaponMagazines", percent = 100 },
				{ category = "RandomBestSnipers", percent = 100 },
				{ category = "RandomBestSnipersMagazines", percent = 100 },
				{ category = "RandomHuntingClothing", percent = 100 },
				{ category = "RandomMilitaryClothing", percent = 100 },
				{ category = "RandomPoliceClothing", percent = 100 },
				{ category = "RandomMilitaryJacket", percent = 100 },
				{ category = "RandomMilitaryBodyArmor", percent = 100 },
				{ category = "RandomExtendedMagazines", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "RandomBombItems", percent = 100 },
				{ category = "RandomNormalGoodWeapons", percent = 100 },
				{ category = "RandomNormalWeaponMagazines", percent = 100 },
				{ category = "RandomBestSnipers", percent = 100 },
				{ category = "RandomBestSnipersMagazines", percent = 100 },
				{ category = "RandomSpecialAllItems", percent = 100 },
			},
		},		

	
		
	--------------------------------------------------------------


		{
			category = "RandomAirDropSantaCrate",
			group =
			{			
				{ category = "ChristmasPresentCommon", percent = 100 },
				{ class = "EggNog", percent = 100 },
				{ category = "halloweenBagCommon", percent = 100 },	
				{ category = "RandomChristmasClothing", percent = 100 },				
				{ category = "RandomChristmasPresent", percent = 100 },				
				{ category = "HalloweenBagCommonLoot", percent = 100 },	
				{ category = "RandomRangedMilitaryPure", percent = 100 },	
				{ category = "halloweenBagCommon", percent = 100 },				
				{ category = "ChristmasPresentCommon", percent = 100 },														
				{ category = "ChristmasPresentRare", percent = 100 },
				{ category = "HalloweenBagCommonLoot", percent = 100 },
				{ category = "RandomAmmoBox", percent = 100 },
				{ category = "ChristmasPresentCommon", percent = 100 },
				{ class = "ScavengerHelmet", percent = 100 },
				{ category = "RandomChristmasPresent", percent = 100 },				
				{ class = "GingerBreadMan", percent = 100, min = 2, max = 5 },
				{ category = "ChristmasPresentCommon", percent = 100 },
				{ category = "HalloweenBagRare", percent = 100 },					
				{ class = "EggNog", percent = 100 },
				{ category = "ChristmasPresentRare", percent = 100 },				
				{ class = "EggNog", percent = 100 },
				{ class = "GingerBreadMan", percent = 100, min = 2, max = 5 },				
				{ category = "ChristmasPresentRare", percent = 100 },				                								             
                { category= "RandomBestWeaponsCompleteAll", percent = 100 },     	--Contains 4 slots!!				             			
				{ category= "RandomPistolXComplete", percent = 100 },	
				{ class = "SpaceHelmet", percent = 100 },										
				{ category = "RandomAmmoBox", percent = 100 },											
				{ category = "RandomChristmasClothing", percent = 100 },				
				{ category = "RandomProtectionFace", percent = 100 },											
				{ category = "ChristmasPresentCommon", percent = 100 },          
				{ category = "RandomHazmatSuitColored", percent = 100 },
				{ category = "ChristmasPresentRare", percent = 100 },
				{ category = "HalloweenBagRare", percent = 100 },
				{ category = "RandomGhillieSuitComplete", percent = 100 },				
			},
		},
		

		-- --------------------------------------------------------------------
		-- Trader Inventory
		-- 
		-- --------------------------------------------------------------------
				 
				{
					-- Will select a random themed inventory from the array.
					category = "RandomVendorInventory",
								--classes =
								--{
									--{ category = "VendorAKM", percent = 100 },
									--{ category = "VendorAR", percent = 20 },
									--{ category = "VendorSniper", percent = 20 },
									--{ category = "VendorShotgun", percent = 20 },
									--{ category = "VendorSMG", percent = 20 },
								--},
					group =
					{				
						{ category = "RandomAA12Skin", percent = 100 },
						{ class = "ACAW", percent = 100 },							
						{ category = "RandomAK5DSkin", percent = 100 },
						{ category = "RandomAK74USkin", percent = 100 },
						{ category = "RandomAKMSkin", percent = 100 },
						{ category = "RandomAKValSkin", percent = 100 },
						{ class = "AP85", percent = 100 },
						{ category = "RandomAT15Skin", percent = 100 },						
						{ category = "RandomAUMP45Skin", percent = 100 },
						{ category = "RandomBulldogSkin", percent = 100 },
						{ class = "ColtPython", percent = 100 },
						{ class = "ColtPythonGrimeyRick", percent = 100 },
						{ class = "CraftedBow", percent = 100 },
						{ class = "CraftedLongPistol", percent = 100 },
						{ class = "CraftedPistol", percent = 100 },
						{ class = "CraftedPistol556", percent = 100 },
						{ class = "CraftedRifle9mm", percent = 100 },
						{ class = "CraftedRifleLong", percent = 100 },
						{ class = "CraftedShortRifle556", percent = 100 },
						{ class = "CraftedShortShotgun", percent = 100 },
						{ class = "CraftedShotgun", percent = 100 },
						{ class = "CraftedSMG", percent = 100 },
						{ class = "Crossbow", percent = 100 },
						{ category = "RandomCX4StormSkin", percent = 100 },
						{ class = "Deagle", percent = 100 },	
						{ class = "FlareGun", percent = 100 },
						{ class = "G18Pistol", percent = 100 },															
						{ class = "hk45", percent = 100 },					
						{ category = "RandomKrissVSkin", percent = 100 },
						{ class = "L1AR", percent = 100 },
						{ class = "m14", percent = 100 },						
						{ category = "RandomM16Skin", percent = 100 },									
						{ class = "m1911a1", percent = 100 },
						{ class = "M249", percent = 100 },
						{ class = "M40A5", percent = 100 },								
						{ class = "M4A1", percent = 100 },					
						{ class = "M4V5", percent = 100 },						
						{ category = "RandomM97VSkin", percent = 100 },
						{ class = "M9A1", percent = 100 },
						{ class = "MAK10", percent = 100 },
						{ class = "Makarov", percent = 100 },
						{ category = "RandomMk18Skin", percent = 100 },					
						{ class = "Glock18C", percent = 100 },				
						{ class = "Model1873", percent = 100 },
						{ class = "Model70", percent = 100 },
						{ category = "RandomMP5Skin", percent = 100 },				
						{ class = "mp7", percent = 100 },
						{ class = "mutantsilencer", percent = 100 },			
						{ class = "P350", percent = 100 },
						{ class = "Peacemaker", percent = 100 },				
						{ class = "PX4", percent = 100 },
						{ category = "RandomR90Skin", percent = 100 },
						{ class = "RecurveBow", percent = 100 },
						{ class = "Rem700", percent = 100 },
						{ class = "Rem870", percent = 100 },
						{ category = "RandomDT12Skin", percent = 100 },
						{ class = "SawedShotgun", percent = 100 },
						--[[ { class = "GrimReaperVenom", percent = 100 },
						{ class = "Kripton", percent = 100 },										
						{ class = "RPK", percent = 100 },												
						{ class = "m4a1Leki", percent = 100 },
						{ class = "M50", percent = 100 },				
						{ class = "m40a5dark", percent = 100 },					
						{ class = "Mk18Reaver", percent = 100 },
						{ class = "mk18extreme", percent = 100 },
						{ class = "KrissVK10", percent = 100 },
						{ class = "BulldogSA80", percent = 100 },
						{ class = "m14ebr", percent = 100 },
						{ class = "M16Vietnam", percent = 100 },						
						{ class = "M249Flare", percent = 100 },
						{ class = "AUMP45Wars", percent = 100 },
						{ class = "akmblack", percent = 100 },
						{ class = "AKMGold", percent = 100 },
						{ class = "startergun", percent = 100 },
						{ class = "acawghillie", percent = 100 },
						{ class = "at15fire", percent = 100 },
						{ class = "R90Tactical", percent = 100 },
						{ class = "G36C", percent = 100 },
						{ class = "AK5C", percent = 100 },
						{ class = "M16Colt", percent = 100 },	 ]]
						{ class = "ruger22", percent = 100 },
						{ class = "Sako_85", percent = 100 },
						{ category = "RandomSAS12Skin", percent = 100 },				
						{ class = "SCAR-H", percent = 100 },
						{ class = "scorpion", percent = 100 },
						{ class = "Shotgun870Tactical", percent = 100 },					
						{ class = "SW29", percent = 100 },
						{ class = "Jackal", percent = 100 },
						{ class = "Subjugator", percent = 100 },
						{ class = "uzi", percent = 100 },			
						{ class = "Wasteland22", percent = 100 },	
						{ class = "10mmx60", percent = 100 },
						{ class = "10mmx60MP", percent = 100 },
						{ class = "50calx15", percent = 100 },
						{ class = "50calx7", percent = 100 },						
						{ class = "50calx7x", percent = 100 },
						{ class = "545x60", percent = 100 },
						{ class = "556x175", percent = 100 },
						{ class = "556x50_ak5d", percent = 100 },
						{ class = "57x80", percent = 100 },
						{ class = "762x10", percent = 100 },
						{ class = "762x50", percent = 100 },
						{ class = "762x50_Akval", percent = 100 },
						{ class = "acp_45x60", percent = 100 },
						{ class = "acp_45x60_cx8", percent = 100 },
						{ class = "deaglex15", percent = 100 },
						{ class = "ext_556x75", percent = 100 },
						{ class = "ext_762x75", percent = 100 },
						{ class = "g36cx50", percent = 100 },
						{ class = "l1arx50", percent = 100 },
						{ class = "m14x40", percent = 100 },		
						{ class = "STANAGx50", percent = 100 },
						{ class = "ReflexSight", percent = 100 },
						{ class = "scorpion_mag", percent = 100 },				
						{ class = "762x30Venom", percent = 100 },
						{ class = "762x75Venom", percent = 100 },										
						{ class = "STANAGx77", percent = 100 },
						{ class = "STANAGx6PPC", percent = 100 },
						{ class = "M40x10", percent = 100 },	
						{ class = "762x30", percent = 100 },
						{ class = "545x30", percent = 100 },						
						{ class = "AmmoBox_7_62x39", percent = 100 },
						{ class = "AmmoBox_5_45x39", percent = 100 },
						{ class = "57x50", percent = 100 },
						{ class = "10mmx30", percent = 100 },
						{ class = "10mmx15", percent = 100 },						
						{ class = "acp_45x30", percent = 100 },						
						{ class = "9x19_mac10", percent = 100 },					
						{ class = "AmmoBox_10mm", percent = 100 },
						{ class = "AmmoBox_acp_45", percent = 100 },
						{ class = "AmmoBox_9mm", percent = 100 },
						{ class = "AmmoBox_5_70x28", percent = 100 },
						{ class = "STANAGx30", percent = 100 },						
						{ class = "AmmoBox_5_56x45", percent = 100 },	
						{ class = "AmmoBox_6PPC", percent = 100 },										
						{ class = "762x5", percent = 100 },					
						{ class = "12Gaugex8_Pellet_AA12", percent = 100 },
						{ class = "12Gaugex8_Slug_AA12", percent = 100 },
						{ class = "12Gaugex8_Beanbag_AA12", percent = 100 },					
						{ class = "AmmoBox_12Gauge_Pellet", percent = 100 },
						{ class = "AmmoBox_12Gauge_Slug", percent = 100 },
						{ class = "AmmoBox_12Gauge_Beanbag", percent = 100 },
						{ class = "762x20_Akval", percent = 100 },						
						{ class = "556x30_ak5d", percent = 100 },									
						{ class = "556x100", percent = 100 },
						{ class = "556x150", percent = 100 },						
						{ class = "Pile_22", percent = 100 },
						{ class = "Pile_9mm", percent = 100 },
						{ class = "Pile_10mm", percent = 100 },
						{ class = "Pile_44M", percent = 100 },
						{ class = "Pile_357", percent = 100 },
						{ class = "Pile_Flare", percent = 100 },																
						{ class = "Pile_762x39", percent = 100 },
						{ class = "Pile_762x39Venom", percent = 100 },
						{ class = "Pile_556x77", percent = 100 },
						{ class = "Pile_50cal", percent = 100 },
						{ class = "Pile_50calx", percent = 100 },
						{ class = "Pile_545x39", percent = 100 },				
						{ class = "Pile_57x28", percent = 100 },
						{ class = "Pile_45ACP", percent = 100 },
						{ class = "Pile_556x45", percent = 100 },
						{ class = "Pile_6PPC", percent = 100 },
						{ class = "Pile_762x51", percent = 100 },					
						{ class = "Pile_308", percent = 100 },									
						{ class = "Pile_223", percent = 100 },
						{ class = "Pile_12GaugePellet", percent = 100 },
						{ class = "Pile_12GaugeSlug", percent = 100 },
						{ class = "Pile_12GaugeBeanbag", percent = 100 },
						{ class = "SMVest1", percent = 100 },
						{ class = "SMVest2", percent = 100 },
						{ class = "SMVest3", percent = 100 },
						{ class = "SMVest4", percent = 100 },
						{ class = "SMVest5", percent = 100 },
						{ class = "SMVest6", percent = 100 },
						{ class = "SMVest7", percent = 100 },
						{ class = "SMVest8", percent = 100 },
						{ class = "SMVest9", percent = 100 },
						{ class = "SMVest10", percent = 100 },
						{ class = "SMScarf1", percent = 100 },
						{ class = "SMScarf2", percent = 100 },
						{ class = "SMScarf3", percent = 100 },
						{ class = "SMScarf4", percent = 100 },
						{ class = "SMScarf5", percent = 100 },
						{ class = "SMScarf6", percent = 100 },
						{ class = "SMScarf7", percent = 100 },
						{ class = "SMScarf8", percent = 100 },
						{ class = "SMScarf9", percent = 100 },
						{ class = "SMScarf10", percent = 100 },
						{ class = "SMBag1", percent = 100 },
						{ class = "SMBag2", percent = 100 },
						{ class = "SMBag3", percent = 100 },
						{ class = "SMBag4", percent = 100 },
						{ class = "SMBag5", percent = 100 },
						{ class = "SMBag6", percent = 100 },
						{ class = "SMBag7", percent = 100 },
						{ class = "SMBag8", percent = 100 },
						{ class = "SMBag9", percent = 100 },
						{ class = "SMBag10", percent = 100 },
						{ class = "SMBoots1", percent = 100 },
						{ class = "SMBoots2", percent = 100 },
						{ class = "SMBoots3", percent = 100 },
						{ class = "SMBoots4", percent = 100 },
						{ class = "SMBoots5", percent = 100 },
						{ class = "SMBoots6", percent = 100 },
						{ class = "SMBoots7", percent = 100 },
						{ class = "SMBoots8", percent = 100 },
						{ class = "SMBoots9", percent = 100 },
						{ class = "SMBoots10", percent = 100 },
						{ class = "SMGloves1", percent = 100 },
						{ class = "SMGloves2", percent = 100 },
						{ class = "SMGloves3", percent = 100 },
						{ class = "SMGloves4", percent = 100 },
						{ class = "SMGloves5", percent = 100 },
						{ class = "SMGloves6", percent = 100 },
						{ class = "SMGloves7", percent = 100 },
						{ class = "SMGloves8", percent = 100 },
						{ class = "SMGloves9", percent = 100 },
						{ class = "SMGloves10", percent = 100 },
						{ class = "SMHelmet1", percent = 100 },
						{ class = "SMHelmet2", percent = 100 },
						{ class = "SMHelmet3", percent = 100 },
						{ class = "SMHelmet4", percent = 100 },
						{ class = "SMHelmet5", percent = 100 },
						{ class = "SMHelmet6", percent = 100 },
						{ class = "SMHelmet7", percent = 100 },
						{ class = "SMHelmet8", percent = 100 },
						{ class = "SMHelmet9", percent = 100 },
						{ class = "SMHelmet10", percent = 100 },										
						{ class = "SMPants1", percent = 100 },
						{ class = "SMPants2", percent = 100 },
						{ class = "SMPants3", percent = 100 },
						{ class = "SMPants4", percent = 100 },
						{ class = "SMPants5", percent = 100 },
						{ class = "SMPants6", percent = 100 },
						{ class = "SMPants7", percent = 100 },
						{ class = "SMPants8", percent = 100 },
						{ class = "SMPants9", percent = 100 },
						{ class = "SMPants10", percent = 100 },
						{ class = "SMJacket1", percent = 100 },
						{ class = "SMJacket2", percent = 100 },
						{ class = "SMJacket3", percent = 100 },
						{ class = "SMJacket4", percent = 100 },
						{ class = "SMJacket5", percent = 100 },
						{ class = "SMJacket6", percent = 100 },
						{ class = "SMJacket7", percent = 100 },
						{ class = "SMJacket8", percent = 100 },
						{ class = "SMJacket9", percent = 100 },
						{ class = "SMJacket10", percent = 100 },
						{ class = "SMBelt1", percent = 100 },
						{ class = "SMBelt2", percent = 100 },
						{ class = "SMBelt3", percent = 100 },
						{ class = "SMBelt4", percent = 100 },
						{ class = "SMBelt5", percent = 100 },
						{ class = "SMBelt6", percent = 100 },						
						{ class = "SMBelt7", percent = 100 },
						{ class = "SMBelt8", percent = 100 },
						{ class = "SMBelt9", percent = 100 },
						{ class = "SMBelt10", percent = 100 },
					},	
				},	

				{
					category = "PaintVendorInventory",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo					
						{ class = "DuctTape", percent = 100 },
						{ class = "Flashlight", percent = 100 },
						{ class = "Guitar", percent = 100 },
						{ class = "Maglite", percent = 100 },
						{ class = "MagliteSmall", percent = 100 },
						{ class = "Megaphone", percent = 100 },
						{ class = "PoliceHandcuffs", percent = 100 },
						{ class = "Rope", percent = 100 },
						{ class = "ConcreteBag", percent = 100 },
						{ class = "MarbleBag", percent = 100 },
						{ class = "PlasteredBag", percent = 100 },
						{ class = "TitaniumBag", percent = 100 },
						{ class = "SheetMetal", percent = 100 },
						{ class = "ScrapMetal", percent = 100 },
						{ class = "Nails", percent = 100 },
						{ class = "Lumber", percent = 100 },	
						{ class = "Axe", percent = 100 },
						{ class = "AxePatrick", percent = 100 },
						{ class = "BaseballBat", percent = 100 },
						{ class = "BaseballBatHerMajesty", percent = 100 },
						{ class = "BaseballBatNails", percent = 100 },
						{ class = "BaseballBatSawBlade", percent = 100 },
						{ class = "BaseballBatSawBladeNails", percent = 100 },
						{ class = "BaseballBatScrapNails", percent = 100 },
						{ class = "Cleaver", percent = 100 },
						{ class = "CraftedHammer", percent = 100 },
						{ class = "CraftedHatchet", percent = 100 },
						{ class = "CraftedPickaxe", percent = 100 },
						{ class = "Crowbar", percent = 100 },
						{ class = "FahQPaddle", percent = 100 },
						{ class = "Hammer", percent = 100 },
						{ class = "Hatchet", percent = 100 },
						{ class = "HuntingKnife", percent = 100 },
						{ class = "Katana", percent = 100 },
						{ class = "KatanaBlackWidow", percent = 100 },
						{ class = "LugWrench", percent = 100 },
						{ class = "Machete", percent = 100 },
						{ class = "MannequinArm", percent = 100 },
						{ class = "NailKnuckles", percent = 100 },
						{ class = "NailsPaddle", percent = 100 },
						{ class = "Pickaxe", percent = 100 },
						{ class = "PipeWrench", percent = 100 },
						{ class = "PoliceBaton", percent = 100 },
						{ class = "Sledgehammer", percent = 100 },
						{ class = "C4TimedPickup", percent = 100 },
						{ class = "Squeegee", percent = 100 },
						{ class = "StunBaton", percent = 100 },
						{ class = "SurvivalKnife", percent = 100 },
						{ class = "Tetsaiga", percent = 100 },
						{ class = "Torch", percent = 100 },
						{ class = "WoodPaddle", percent = 100 },
						{ class = "ChemlightBluePickup", percent = 100 },
						{ class = "ChemlightGreenPickup", percent = 100 },
						{ class = "ChemlightRedPickup", percent = 100 },
						{ class = "ChemlightWhitePickup", percent = 100 },
						{ class = "ChemlightYellowPickup", percent = 100 },
						{ class = "EmptyBottle", percent = 100 },
						{ class = "FlashbangPickup", percent = 100 },
						{ class = "GrenadeGasNervePickup", percent = 100 },
						{ class = "GrenadeGasSleepPickup", percent = 100 },
						{ class = "GrenadeGasTearPickup", percent = 100 },
						{ class = "GrenadeMolotovPickup", percent = 100 },
						{ class = "GrenadePickup", percent = 100 },
						{ class = "GrenadeSmokeGreenPickup", percent = 100 },
						{ class = "GrenadeSmokeMagentaPickup", percent = 100 },
						{ class = "GrenadeSmokeRedPickup", percent = 100 },
						{ class = "GrenadeSmokeWhitePickup", percent = 100 },
						{ class = "GrenadeSmokeYellowPickup", percent = 100 },	
						{ class = "PipebombPickup", percent = 100 },
						{ class = "BlastMask", percent = 100 },
						{ class = "FlakVestTanCamo1", percent = 100 },
						{ class = "FlakVestGreen", percent = 100 },
						{ class = "FlakVestGreenCamo1", percent = 100 },
						{ class = "FlakVestTan", percent = 100 },
						{ class = "FlakVestBlack", percent = 100 },
						{ class = "FlakVestBlackWhite", percent = 100 },
						{ class = "FlakVestBlue", percent = 100 },
						{ class = "FlakVestLightBlue", percent = 100 },
						{ class = "FlakVestOGreen", percent = 100 },
						{ class = "FlakVestPink", percent = 100 },
						{ class = "FlakVestPurple", percent = 100 },
						{ class = "FlakVestRed", percent = 100 },
						{ class = "FlakVestWhite", percent = 100 },
						{ class = "FlakVestWhiteBlack", percent = 100 },
						{ class = "FlakVestYellow", percent = 100 },
						{ class = "HockeyMaskOhOd03", percent = 100 },	
						{ class = "HockeyMaskOhOd04", percent = 100 },	
						{ class = "HockeyMaskOhOd05", percent = 100 },	
						{ class = "HockeyMaskOhOd06", percent = 100 },	
						{ class = "HockeyMaskOhOd07", percent = 100 },	
						{ class = "HockeyMaskOhOd08", percent = 100 },	
						{ class = "HockeyMaskOhOd09", percent = 100 },	
						{ class = "HockeyMaskOhOd10", percent = 100 },	
						{ class = "HockeyMaskOhOd11", percent = 100 },	
						{ class = "HockeyMaskOhOd12", percent = 100 },	
						{ class = "HockeyMaskOhOd13", percent = 100 },	
						{ class = "HockeyMaskOhOd14", percent = 100 },	
						{ class = "HockeyMaskOhOd15", percent = 100 },	
						{ class = "HockeyMaskOhOd16", percent = 100 },	
						{ class = "HockeyMaskOhOd17", percent = 100 },	
						{ class = "HockeyMaskOhOd18", percent = 100 },	
						{ class = "HockeyMaskOhOd19", percent = 100 },	
						{ class = "HockeyMaskOhOd20", percent = 100 },							
						{ class = "BalaclavaBlack", percent = 100 },
						{ class = "BalaclavaGray", percent = 100 },
						{ class = "BalaclavaGreen", percent = 100 },
						{ class = "BalaclavaPink", percent = 100 },
						{ class = "BalaclavaYellow", percent = 100 },							
						{ class = "PaintCan_Aqua", percent = 100 },
						{ class = "PaintCan_Black", percent = 100 },
						{ class = "PaintCan_Blue", percent = 100 },
						{ class = "PaintCan_Brown", percent = 100 },
						{ class = "PaintCan_Gold", percent = 100 },
						{ class = "PaintCan_Green", percent = 100 },
						{ class = "PaintCan_Orange", percent = 100 },
						{ class = "PaintCan_Pink", percent = 100 },
						{ class = "PaintCan_Purple", percent = 100 },
						{ class = "PaintCan_Red", percent = 100 },
						{ class = "PaintCan_Silver", percent = 100 },
						{ class = "PaintCan_White", percent = 100 },
						{ class = "PaintCan_Yellow", percent = 100 },
						{ class = "DuffelBag", percent = 100 },
						{ class = "DuffelBagBlack", percent = 100 },
						{ class = "DuffelBagGreen", percent = 100 },
						{ class = "DuffelBagGreenCamo1", percent = 100 },
						{ class = "DuffelBagGreenCamo2", percent = 100 },
						{ class = "DuffelBagGreenCamo3", percent = 100 },
						{ class = "DuffelBagGreenCamo4", percent = 100 },
						{ class = "DuffelBagTanCamo1", percent = 100 },
						{ class = "DuffelBagTanCamo2", percent = 100 },
						{ class = "DuffelBagTanCamo3", percent = 100 },
						{ class = "DuffelBagTanCamo4", percent = 100 },
						{ class = "DuffelBagUrbanCamo1", percent = 100 },
						{ class = "DuffelBagUrbanCamo2", percent = 100 },
						{ class = "DuffelBagUrbanCamo3", percent = 100 },
						{ class = "DuffelBagUrbanCamo4", percent = 100 },
						{ class = "DuffelBagBlue", percent = 100 },
						{ class = "DuffelBagLightBlue", percent = 100 },
						{ class = "DuffelBagOGreen", percent = 100 },
						{ class = "DuffelBagPink", percent = 100 },
						{ class = "DuffelBagPurple", percent = 100 },
						{ class = "DuffelBagRed", percent = 100 },
						{ class = "DuffelBagWhite", percent = 100 },
						{ class = "DuffelBagYellow", percent = 100 },			
						{ class = "RuggedPack", percent = 100 },
						{ class = "RuggedPackBlack", percent = 100 },
						{ class = "RuggedPackBrown", percent = 100 },
						{ class = "RuggedPackCamo1", percent = 100 },
						{ class = "RuggedPackCamo2", percent = 100 },
						{ class = "RuggedPackCamo3", percent = 100 },
						{ class = "RuggedPackCamo4", percent = 100 },
						{ class = "RuggedPackGreen", percent = 100 },
						{ class = "RuggedPackGreenCamo1", percent = 100 },
						{ class = "RuggedPackGreenCamo2", percent = 100 },
						{ class = "RuggedPackGreenCamo3", percent = 100 },
						{ class = "RuggedPackGreenCamo4", percent = 100 },
						{ class = "RuggedPackBlue", percent = 100 },
						{ class = "RuggedPackOGreen", percent = 100 },
						{ class = "RuggedPackPink", percent = 100 },
						{ class = "RuggedPackPurple", percent = 100 },
						{ class = "RuggedPackRed", percent = 100 },
						{ class = "RuggedPackYellow", percent = 100 },						
						{ class = "GhillieSuit1", percent= 100 },
						{ class = "GhillieHood1", percent= 100 },
						{ class = "GhillieSuit2", percent= 100 },
						{ class = "GhillieHood2", percent= 100 },
						{ class = "GhillieSuit3", percent= 100 },
						{ class = "GhillieHood3", percent= 100 },
						{ class = "GhillieSuit4", percent= 100 },
						{ class = "GhillieHood4", percent= 100 },
						{ class = "GhillieSuitBlack", percent= 100 },
						{ class = "GhillieSuitBlue", percent = 100 },
						{ class = "GhillieSuitGreen", percent = 100 },
						{ class = "GhillieSuitLightBlue", percent = 100 },
						{ class = "GhillieSuitPink", percent = 100 },
						{ class = "GhillieSuitPurple", percent = 100 },
						{ class = "GhillieSuitRed", percent = 100 },
						{ class = "GhillieSuitWhite", percent = 100 },
						{ class = "GhillieSuitYellow", percent = 100 },
					},
				},
				
				{
					category = "CraftingVendorInventory",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo
						{ class = "MilitaryHelmetGreen", percent = 100 },
						{ class = "MilitaryHelmetGreenCamo1", percent = 100 },
						{ class = "MilitaryHelmetGreenCamo2", percent = 100 },
						{ class = "MilitaryHelmetGreenCamo3", percent = 100 },
						{ class = "MilitaryHelmetGreenCamo4", percent = 100 },
						{ class = "MilitaryHelmetTan", percent = 100 },
						{ class = "MilitaryHelmetTanCamo1", percent = 100 },
						{ class = "MilitaryHelmetTanCamo2", percent = 100 },
						{ class = "MilitaryHelmetTanCamo3", percent = 100 },
						{ class = "MilitaryHelmetTanCamo4", percent = 100 },
						{ class = "MilitaryHelmetUrbanCamo1", percent = 100 },
						{ class = "MilitaryHelmetUrbanCamo2", percent = 100 },
						{ class = "MilitaryHelmetUrbanCamo3", percent = 100 },
						{ class = "MilitaryHelmetUrbanCamo4", percent = 100 },
						{ class = "MilitaryHelmetBlack", percent = 100 },
						{ class = "MilitaryHelmetBlue", percent = 100 },
						{ class = "MilitaryHelmetOGreen", percent = 100 },
						{ class = "MilitaryHelmetPink", percent = 100 },
						{ class = "MilitaryHelmetPurple", percent = 100 },
						{ class = "MilitaryHelmetRed", percent = 100 },
						{ class = "MilitaryHelmetWhite", percent = 100 },
						{ class = "MilitaryHelmetYellow", percent = 100 },
						{ class = "SwatHelmet", percent = 100 },
						{ class = "SwatHelmetBlue", percent = 100 },
						{ class = "SwatHelmetGreen", percent = 100 },
						{ class = "SwatHelmetLightBlue", percent = 100 },
						{ class = "SwatHelmetPink", percent = 100 },
						{ class = "SwatHelmetPurple", percent = 100 },
						{ class = "SwatHelmetRed", percent = 100 },
						{ class = "SwatHelmetWhite", percent = 100 },
						{ class = "SwatHelmetYellow", percent = 100 },				
						{ class = "RK_AA12", percent = 100 },
						{ class = "RK_ACAW", percent = 100 },
						{ class = "RK_AK5D", percent = 100 },
						{ class = "RK_AK74U", percent = 100 },
						{ class = "RK_AKM", percent = 100 },
						{ class = "RK_RocketLauncher", percent = 100 },
						{ class = "RK_AKVal", percent = 100 },				
						{ class = "RK_AP85", percent = 100 },
						{ class = "RK_AT15", percent = 100 },
						{ class = "RK_AUMP45", percent = 100 },
						{ class = "RK_Bulldog", percent = 100 },
						{ class = "RK_Canvas", percent = 100 },
						{ class = "RK_Kripton", percent = 100 },
						{ class = "RK_Cloth", percent = 100 },
						{ class = "RK_ClothingHelmet", percent = 100 },
						{ class = "RK_ClothingHelmetBallistic", percent = 100 },					
						{ class = "RK_ColtPython", percent = 100 },
						{ class = "RK_Crossbow", percent = 100 },
						{ class = "RK_CX4Storm", percent = 100 },
						{ class = "RK_DEAGLE", percent = 100 },
						{ class = "RK_DT12", percent = 100 },
						{ class = "RK_Equipment", percent = 100 },
						{ class = "RK_FlareGun", percent = 100 },
						{ class = "RK_G18Pistol", percent = 100 },
						{ class = "RK_G36C", percent = 100 },
						{ class = "RK_hk45", percent = 100 },
						{ class = "RK_JACKAL", percent = 100 },
						{ class = "RK_KrissV", percent = 100 },
						{ class = "RK_L1AR", percent = 100 },
						{ class = "RK_Leather", percent = 100 },
						{ class = "RK_M14", percent = 100 },
						{ class = "RK_M14EBR", percent = 100 },
						{ class = "RK_M16", percent = 100 },
						{ class = "RK_m1911a1", percent = 100 },
						{ class = "RK_M249", percent = 100 },
						{ class = "RK_M40A5", percent = 100 },
						{ class = "RK_M4A1", percent = 100 },
						{ class = "RK_M50", percent = 100 },
						{ class = "RK_M97", percent = 100 },
						{ class = "RK_M9A1", percent = 100 },
						{ class = "RK_MAK10", percent = 100 },					
						{ class = "RK_Makarov", percent = 100 },
						{ class = "RK_MeleePrimary", percent = 100 },
						{ class = "RK_MeleeSecondary", percent = 100 },
						{ class = "RK_Mk18", percent = 100 },
						{ class = "RK_Model70", percent = 100 },
						{ class = "RK_Model1873", percent = 100 },
						{ class = "RK_MP5", percent = 100 },
						{ class = "RK_P350", percent = 100 },
						{ class = "RK_PEACEMAKER", percent = 100 },
						{ class = "RK_PX4", percent = 100 },
						{ class = "RK_R90", percent = 100 },
						{ class = "RK_RecurveBow", percent = 100 },
						{ class = "RK_Rem700", percent = 100 },
						{ class = "RK_Rem870", percent = 100 },
						{ class = "RK_ruger22", percent = 100 },
						{ class = "RK_Sako_85", percent = 100 },
						{ class = "RK_SAS12", percent = 100 },
						{ class = "RK_SCAR-H", percent = 100 },
						{ class = "RK_SCORPION", percent = 100 },
						{ class = "RK_Sledgehammer", percent = 100 },
						{ class = "RK_SUBJUGATOR", percent = 100 },
						{ class = "RK_SW29", percent = 100 },
						{ class = "RK_Teflon", percent = 100 },
						{ class = "RK_Shotgun870Tactical", percent = 100 },			
						{ class = "RK_UZI", percent = 100 },
						{ class = "RK_Wasteland22", percent = 100 },						
						{ class = "CombatBootsBlack", percent = 100 },
						{ class = "CombatBootsCamo", percent = 100 },
						{ class = "CombatBootsTan", percent = 100 },
						{ class = "SteeltoedBootsBlack", percent = 100 },
						{ class = "SteeltoedBootsBrown", percent = 100 },
						{ class = "MilitaryGlovesBlack", percent = 100 },
						{ class = "MilitaryGlovesBrown", percent = 100 },
						{ class = "MilitaryGlovesGreen", percent = 5 },
						{ class = "MilitaryGloves", percent = 100 },	
						{ class = "WoolGlovesBlack", percent = 100 },
						{ class = "WoolGlovesBlue", percent = 100 },
						{ class = "WoolGlovesBrown", percent = 100 },
						{ class = "WoolGlovesGreen", percent = 100 },
						{ class = "WoolGlovesCamo1", percent = 100 },
						{ class = "WoolGlovesCamo2", percent = 100 },
						{ class = "WoolGlovesCamo3", percent = 100 },
						{ class = "WoolGlovesCamo4", percent = 100 },
						{ class = "WoolGlovesWhite", percent = 100 },
						{ class = "BandanaHat", percent = 100 },
						{ class = "BandanaHatCamo1", percent = 100 },
						{ class = "BandanaHatCamo2", percent = 100 },
						{ class = "BandanaHatCamo3", percent = 100 },
						{ class = "BandanaHatCamo4", percent = 100 },
						{ class = "CowboyHat", percent = 100 },
						{ class = "CowboyHatLeather", percent = 100 },
						{ class = "CowboyHatStraw", percent = 100 },					
						{ class = "Batmansbelt", percent = 100 },
						{ class = "BanesMask", percent = 100 },				
						{ class = "SkullMask", percent = 100 },
						{ class = "SkullMaskSilver", percent = 100 },						
						{ class = "SpaceHelmet", percent = 100 },
						{ class = "ScavengerHelmet", percent = 100 },
						{ class = "ArmoredGhillieSuit", percent = 25 },							
						{ class = "HazmatSuitBlack", percent = 100 },
						{ class = "HazmatSuitBlue", percent = 100 },
						{ class = "HazmatSuitGreen", percent = 100 },
						{ class = "HazmatSuitPink", percent = 100 },
						{ class = "HazmatSuitOrange", percent = 100 },
						{ class = "HazmatSuitWhite", percent = 100 },
						{ class = "HazmatSuitYellow", percent = 100 },
						{ class = "GasMask", percent = 100 },
						{ class = "HazmatMask", percent = 100 },
						{ class = "HazmatMaskBlack", percent = 100 },
						{ class = "HazmatMaskBlue", percent = 100 },
						{ class = "HazmatMaskGreen", percent = 100 },
						{ class = "HazmatMaskPink", percent = 100 },
						{ class = "HazmatMaskOrange", percent = 100 },
						{ class = "HazmatMaskWhite", percent = 100 },
						{ class = "HazmatMaskYellow", percent = 100 },
						{ class = "GasCanisterPack", percent = 100 },
						{ class = "GasCanisterPackBlack", percent = 100 },
						{ class = "GasCanisterPackBlue", percent = 100 },
						{ class = "GasCanisterPackGreen", percent = 100 },
						{ class = "GasCanisterPackPink", percent = 100 },
						{ class = "GasCanisterPackOrange", percent = 100 },
						{ class = "GasCanisterPackWhite", percent = 100 },
						{ class = "GasCanisterPackYellow", percent = 100 },									
								
		
					},
				},


				{
					category = "FoodVendorInventory",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo												
						{ class = "Jelly", percent = 100 },
						{ class = "CoffeeBag", percent = 100 },
						{ class = "Bread", percent = 100 },
						{ class = "MRE", percent = 100 },
						{ class = "BeerCan", percent = 100 },
						{ class = "MiniBottleGin", percent = 100 },
						{ class = "MiniBottleVodka", percent = 100 },
						{ class = "MiniBottleWhiskey", percent = 100 },																		
						{ class = "FlashlightPistol", percent = 100 },
						{ class = "Maglite", percent = 100 },
						{ class = "MagliteSmall", percent = 100 },
						{ class = "ConcreteBag", percent = 100 },
						{ class = "MarbleBag", percent = 100 },
						{ class = "PlasteredBag", percent = 100 },
						{ class = "TitaniumBag", percent = 100 },
						{ class = "MilitaryCanteenPlastic", percent = 100 },
						{ class = "MilitaryCanteenMetal", percent = 100 },
						{ class = "SurvivalKnife", percent = 100 },
						{ class = "hesco_barrier", percent = 100 },
						{ class = "OpticScopeBow", percent = 100 },
						{ class = "BayonetRifle", percent = 100 },
						{ class = "IronsightKit", percent = 100 },
						{ class = "ReddotSight", percent = 100 },
						{ class = "T1Micro", percent = 100 },
						{ class = "OPKSight", percent = 100 },
						{ class = "R3Sight", percent = 100 },
						{ class = "PSOScope", percent = 100 },	
						{ class = "HuntingScope", percent = 100 },
						{ class = "OpticScope", percent = 100 },
						{ class = "ReflexSight", percent = 100 },
						{ class = "LaserSight", percent = 100 },
						{ class = "LaserSightGreen", percent = 100 },
						{ class = "LaserSightBlue", percent = 100 },				
						{ class = "RifleSilencer", percent = 100 },						
						{ class = "ForegripVertical", percent = 100 },						
						{ class = "FlashlightMounted", percent = 100 },
						{ class = "AntiradiationPills", percent = 100 },
						{ class = "Antibiotics", percent = 100 },
						{ class = "PotassiumIodidePills", percent = 100 },
						{ class = "WaterPurificationTablets", percent = 100 },		
						{ class = "Champagne", percent = 100 },
						{ class = "ChocolateBox", percent = 100 },
						{ class = "GingerBreadMan", percent = 100 },
						{ class = "SeedsBeets", percent = 100 },
						{ class = "SeedsBrushPeas", percent = 100 },
						{ class = "SeedsCarrots", percent = 100 },
						{ class = "SeedsPotatoes", percent = 100 },
						{ class = "SeedsWatermelons", percent = 100 },
						{ class = "SeedsPumpkins", percent = 100 },
						{ class = "SeedsRadishes", percent = 100 },
						{ class = "SeedsSnapPeas", percent = 100 },
						{ class = "SeedsTomatoes", percent = 100 },
						{ class = "SeedsMedcan", percent = 100 },				
						{ class = "PeanutButter", percent = 100 },
						{ class = "Matches", percent = 100 },
						{ class = "Lighter", percent = 100 },									
						{ class = "Salt", percent = 100 },
						{ class = "EggChicken", percent = 100 },
						{ class = "StickPile", percent = 100 },		
						{ class = "CarBattery", percent = 100 },
						{ class = "TowCable", percent = 100 },
						{ class = "DriveBelt", percent = 100 },
						{ class = "DuctTape", percent = 100 },
						{ class = "ElectricalParts", percent = 100 },
						{ class = "Oil", percent = 100 },
						{ class = "JerryCanDiesel", percent = 100 },
						{ class = "SparkPlugs", percent = 100 },
						{ class = "WorkLight", percent = 100 },
						{ class = "AdrenalineSyringe", percent = 100 },					
						{ class = "medcan", percent = 100 },			
						{ class = "Aspirin", percent = 100 },
						{ class = "Bandage", percent = 100 },
						{ class = "HeatPack", percent = 100 },			
						{ class = "Rags", percent = 100 },
						{ class = "FannyPackBlack", percent = 100 },
						{ class = "FannyPackBlueOrange", percent = 100 },
						{ class = "FannyPackCamo1", percent = 100 },
						{ class = "FannyPackCamo2", percent = 100 },
						{ class = "FannyPackCamo3", percent = 100 },
						{ class = "FannyPackGray", percent = 100 },
						{ class = "FannyPackGreenGray", percent = 100 },
						{ class = "FannyPackMaroonGray", percent = 100 },
						{ class = "FannyPackPurplePink", percent = 100 },
						{ class = "FannyPackRed", percent = 100 },
						{ class = "FannyPackRedBlue", percent = 100 },
						{ class = "FannyPackYellow", percent = 100 },
						{ class = "RubbingAlcohol", percent = 100 },						
						{ class = "gnome_bronze", percent = 100 },
						{ class = "gnome_creep", percent = 100 },
						{ class = "gnome_gold", percent = 100 },
						{ class = "gnome_silver", percent = 100 },
						{ class = "gnome_standard_a", percent = 100 },
						{ class = "gnome_standard_b", percent = 100 },
						{ class = "gnome_standard_c", percent = 100 },
						{ class = "jerry", percent = 100 },									
						{ class = "painting_landscape_01", percent = 100 },
						{ class = "painting_landscape_02", percent = 100 },
						{ class = "painting_landscape_03", percent = 100 },
						{ class = "painting_landscape_04", percent = 100 },
						{ class = "painting_landscape_05", percent = 100 },
						{ class = "painting_landscape_06", percent = 100 },
						{ class = "painting_landscape_07", percent = 100 },
						{ class = "painting_landscape_08", percent = 100 },
						{ class = "painting_landscape_09", percent = 100 },
						{ class = "painting_landscape_10", percent = 100 },
						{ class = "painting_square_01", percent = 100 },
						{ class = "painting_square_02", percent = 100 },
						{ class = "painting_vertical_landscape_01", percent = 100 },
						{ class = "painting_vertical_landscape_02", percent = 100 },
						{ class = "painting_vertical_landscape_03", percent = 100 },
						{ class = "painting_vertical_landscape_04", percent = 100 },
						{ class = "painting_vertical_landscape_05", percent = 100 },
						{ class = "poster_vertical_01", percent = 100},
						{ class = "painting_map", percent = 100 },
						{ class = "camping_chair", percent = 100 },			
						{ class = "camping_lantern", percent = 100 },				
						{ class = "camping_lantern_aqua", percent = 100 },
						{ class = "camping_lantern_blue", percent = 100 },
						{ class = "camping_lantern_green", percent = 100 },
						{ class = "camping_lantern_orange", percent = 100 },
						{ class = "camping_lantern_pink", percent = 100 },
						{ class = "camping_lantern_purple", percent = 100 },
						{ class = "camping_lantern_red", percent = 100 },
						{ class = "camping_lantern_yellow", percent = 100 },								
						{ class = "camping_pop_up_canopy", percent = 100 },
						{ class = "camping_table", percent = 100 },
						{ class = "camping_water_jug", percent = 100 },	
					},
				},

				--##################################################################################################
				--##################################################################################################
				--##################################################################################################
			
				{
					category = "VendorAKM",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo												
						{ category = "RandomAKMSkin", percent = 100 },						
						{ category = "RandomAK74USkin", percent = 100 },
						{ class = "762x30", percent = 100 },
						{ class = "545x30", percent = 100 },
						{ class = "Pile_762x39", percent = 100 },
						{ class = "Pile_545x39", percent = 100 },
						{ class = "AmmoBox_7_62x39", percent = 100 },
						{ class = "AmmoBox_5_45x39", percent = 100 },
						{ category = "RandomAccessoryTrader", percent = 100 },
						{ category = "RandomEquipmentTrader", percent = 50 },
						{ category = "RandomMilitaryHelmet", percent = 10 },
						{ category = "RandomMilitaryArmor", percent = 10 },
						{ category = "RandomPoliceBodyArmor", percent = 10 },
						{ category = "RandomTacticalVestPure", percent = 10 },
						{ class = "SwatHelmet", percent = 10 },
					},
				},
				
				{
					category = "VendorSMG",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo
						{ category = "RandomR90Skin", percent = 100 },						
						{ category = "RandomMP5Skin", percent = 100 },
						{ category = "RandomKrissVSkin", percent = 100 },
						{ category = "RandomAUMP45Skin", percent = 100 },
						{ class = "MAK10", percent = 100 },						
						{ class = "57x50", percent = 100 },
						{ class = "10mmx30", percent = 100 },
						{ class = "10mmx15", percent = 100 },						
						{ class = "acp_45x30", percent = 100 },						
						{ class = "9x19_mac10", percent = 100 },
						{ class = "Pile_10mm", percent = 100 },
						{ class = "Pile_9mm", percent = 100 },
						{ class = "Pile_57x28", percent = 100 },
						{ class = "Pile_45ACP", percent = 100 },
						{ class = "AmmoBox_10mm", percent = 100 },
						{ class = "AmmoBox_acp_45", percent = 100 },
						{ class = "AmmoBox_9mm", percent = 100 },
						{ class = "AmmoBox_5_70x28", percent = 100 },
						{ category = "RandomAccessoryTrader", percent = 100 },
						{ category = "RandomEquipmentTrader", percent = 50 },
						{ category = "RandomMilitaryHelmet", percent = 10 },
						{ category = "RandomMilitaryArmor", percent = 10 },
						{ category = "RandomPoliceBodyArmor", percent = 10 },
						{ category = "RandomTacticalVestPure", percent = 10 },
						{ class = "SwatHelmet", percent = 10 },
					},
				},
				
				{
					category = "VendorAR",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo
						{ category = "RandomAT15Skin", percent = 100 },
						{ category = "RandomAK5DSkin", percent = 10 },
						{ category = "RandomBulldogSkin", percent = 100 },
						{ category = "RandomM16Skin", percent = 100 },
						{ category = "RandomMk18Skin", percent = 100 },
						{ class = "STANAGx30", percent = 100 },
						{ class = "Pile_556x45", percent = 100 },
						{ class = "AmmoBox_5_56x45", percent = 100 },
						{ class = "Pile_762x51", percent = 100 },
						{ class = "acp_45x30", percent = 100 },
						{ class = "IronsightKit", percent = 100 },
						{ category = "RandomAccessoryTrader", percent = 100 },
						{ category = "RandomEquipmentTrader", percent = 50 },
						{ category = "RandomMilitaryHelmet", percent = 10 },
						{ category = "RandomMilitaryArmor", percent = 10 },
						{ category = "RandomPoliceBodyArmor", percent = 10 },
						{ category = "RandomTacticalVestPure", percent = 10 },
						{ class = "SwatHelmet", percent = 10 },
					},
				},
				
				{
					category = "VendorSniper",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo
						{ class = "M40A5", percent = 100 },
						{ class = "M40x5", percent = 100 },
						{ class = "ACAW", percent = 100 },
						{ class = "Rem700", percent = 100 },
						{ class = "Model70", percent = 100 },
						{ class = "762x5", percent = 100 },
						{ class = "Pile_762x51", percent = 100 },					
						{ class = "Pile_308", percent = 100 },
						{ class = "Sako_85", percent = 100 },					
						{ class = "Pile_223", percent = 100 },
						{ class = "GhillieHood1", percent = 100 },
						{ class = "GhillieSuit1", percent = 100 },
						{ class = "GhillieHood2", percent = 100 },
						{ class = "GhillieSuit2", percent = 100 },
						{ class = "GhillieHood3", percent = 100 },
						{ class = "GhillieSuit3", percent = 100 },
						{ class = "GhillieHood4", percent = 100 },
						{ class = "GhillieSuit4", percent = 100 },
						{ class = "HuntingScope", percent = 100 },
						{ category = "RandomAccessoryTrader", percent = 100 },
						{ category = "RandomEquipmentTrader", percent = 50 },
					},
				},
				
				{
					category = "VendorShotgun",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo
						{ category = "RandomSAS12Skin", percent = 10 },
						{ class = "Shotgun870Tactical", percent = 100 },
						{ category = "RandomAA12Skin", percent = 100 },
						{ class = "12Gaugex8_Pellet_AA12", percent = 100 },
						{ class = "12Gaugex8_Slug_AA12", percent = 100 },
						{ class = "12Gaugex8_Beanbag_AA12", percent = 100 },
						{ class = "Pile_12GaugePellet", percent = 100 },
						{ class = "Pile_12GaugeSlug", percent = 100 },
						{ class = "Pile_12GaugeBeanbag", percent = 100 },
						{ class = "AmmoBox_12Gauge_Pellet", percent = 100 },
						{ class = "AmmoBox_12Gauge_Slug", percent = 100 },
						{ class = "AmmoBox_12Gauge_Beanbag", percent = 100 },
						{ class = "IronsightKit", percent = 100 },
						{ category = "RandomAccessoryTrader", percent = 100 },
						{ category = "RandomEquipmentTrader", percent = 50 },
						{ category = "RandomMilitaryHelmet", percent = 10 },
						{ category = "RandomMilitaryArmor", percent = 10 },
						{ category = "RandomPoliceBodyArmor", percent = 10 },
						{ category = "RandomTacticalVestPure", percent = 10 },
						{ class = "SwatHelmet", percent = 10 },
					},
				},
				
				{
					category = "ShadyVendorInventory",
					group =
					{
						-- If you use a category it must only spawn 1 item from it
						-- For example, it can't spawn a weapon and ammo
						{ category = "RandomEpicWeaponTrader", percent = 25 },
						{ category = "RandomEpicAttachmentTrader", percent = 25 },
						{ category = "RandomEquipmentTrader", percent = 100 },
						{ category = "RandomMilitaryHelmet", percent = 50 },
						{ category = "RandomMilitaryArmor", percent = 50 },
						{ category = "RandomPoliceBodyArmor", percent = 75 },
						{ category = "RandomTacticalVestPure", percent = 100 },
						{ category = "RandomAKValSkin", percent = 100 },
						{ category = "RandomAK5DSkin", percent = 100 },
						{ class = "SwatHelmet", percent = 75 },
						{ class = "762x20_Akval", percent = 100 },						
						{ class = "556x30_ak5d", percent = 100 },
						{ category = "RandomSAS12Skin", percent = 100 },
						{ class = "Pile_12GaugePellet", percent = 100 },
						{ class = "Pile_12GaugeSlug", percent = 100 },
						{ class = "Pile_12GaugeBeanbag", percent = 100 },						
						{ class = "Pile_556x45", percent = 100 },
						{ class = "Pile_762x39", percent = 100 },
						{ class = "Pile_762x51", percent = 100 },
						{ class = "acp_45x30", percent = 100 },
						{ class = "Pile_545x39", percent = 100 },
						{ class = "556x100", percent = 100 },
						{ class = "STANAGx30", percent = 100 },
						{ category = "RandomAccessoryTrader", percent = 100 },
						{ class = "M249", percent = 5 },
						{ category = "RandomM97VSkin", percent = 5 },
					},
				},
				
			
				
			
				
				{
					category = "RandomEpicWeaponTrader",
					classes =
					{						
						{ class = "M4A1", percent = 12.5 },			
						{ class = "VSS", percent = 5 },		
						{ class = "M4V5", percent = 12.5 },
						{ class = "Mk18Reaver", percent = 5 },
						{ class = "AKMGold", percent = 5 },
						{ class = "ColtPythonGrimeyRick", percent = 12.5 },
					},
				},
				
				{
					category = "RandomVendorClothing",
					classes =
					{
						{ category = "RandomMilitaryBodyArmor", percent = 80 },
						{ category = "RandomCamoClothes", percent = 20 },
						{ category = "RandomMilitaryGloves", percent = 30 },
						{ category = "RandomMilitaryHelmet", percent = 30 },
						{ category = "RandomMilitaryJacket", percent = 30 },
						{ category = "RandomMilitaryShoes", percent = 10 },
					},
				},
				
				{
					category = "RandomEpicAttachmentTrader",
					classes =
					{
						{ class = "OPKSight", percent = 17 },
						{ class = "R3Sight", percent = 17 },
						{ class = "PSOScope", percent = 17 },		
					},
				},
				
				{
					category = "RandomEquipmentTrader",
					classes =
					{
						{ class = "AntiradiationPills", percent = 5 },
						{ class = "Antibiotics", percent = 10 },
						{ class = "PotassiumIodidePills", percent = 5 },
						{ class = "WaterPurificationTablets", percent = 10 },
						{ class = "Amalgaduino", percent = 10 },
						{ class = "Champagne", percent = 10 },
						{ class = "ChocolateBox", percent = 10 },
						{ class = "GingerBreadMan", percent = 10 },
					},
				},
				
				{
					category = "RandomAccessoryTrader",
					classes =
					{
						{ class = "LaserSight", percent = 9 },
						{ class = "LaserSightGreen", percent = 9 },
						{ class = "LaserSightBlue", percent = 9 },
						{ class = "OpticScope", percent = 9 },
						{ class = "PistolSilencer", percent = 9 },
						{ class = "ReflexSight", percent = 9 },
						{ class = "T1Micro", percent = 9 },
						{ class = "RifleSilencer", percent = 9 },
						{ class = "ForegripVertical", percent = 9 },
						{ class = "ReddotSight", percent = 9 },
						{ class = "FlashlightMounted", percent = 10 },
					},
				},
		
		-- recursion testing (start at Rec3 and work back to Rec1)
		{
			category = "Rec1",
			classes =
			{
				{ class = "HersheysBar", percent = 20 }, -- this is an *extremely* rare candy bar!!
				{ class = "PepsiCan", percent = 80 },
			},
		},
		
		{
            category = "RocksAndPyrite",
            classes =
            {
                { class = "Rocks", percent = 100 },
            },
        },
		
		{
            category = "IronAndRocks",
            classes =
            {
                { class = "Rocks", percent = 5 },
                { class = "IronOre", percent = 95 },
            },
        },
		
		{
            category = "CoalAndRocks",
            classes =
            {
                { class = "Rocks", percent = 5 },
                { class = "Charcoal", percent = 95 },
            },
        },
		
		{
            category = "PyriteAndRocks",
            classes =
            {
                { class = "Rocks", percent = 5 },
                { class = "Pyrite", percent = 95 },
            },
        },
		
		{
			category = "Rec2",
			classes =
			{
				{ category = "Rec1", percent = 100 },
			},
		},
		{
			category = "Rec3",
			classes =
			{
				{ category = "Rec2", percent = 100 },
			},
		},

		-- really rare testing (start at Rare3 and work back to Rare1)
		{
			category = "Rare1",
			classes =
			{
				{ class = "HersheysBar", percent = 0.001 }, -- this is an *extremely* rare candy bar (1 in 1,000,000,000)!! Golden ticket inside?
			},
		},
		{
			category = "Rare2",
			classes =
			{
				{ category = "Rare1", percent = 0.001 }, -- 1 in 1,000
			},
		},
		{
			category = "Rare3",
			classes =
			{
				{ category = "Rare2", percent = 0.001 }, -- 1 in 1,000
			},
		},
	},
}

--------------------------------------------------------------------------
-- Functions called from C++
--------------------------------------------------------------------------
function ItemSpawnerManager:OnInit()
	--Log("ItemSpawnerManager:OnInit");
	self:OnReset();
end

------------------------------------------------------------------------------------------------------
-- OnPropertyChange called only by the editor.
------------------------------------------------------------------------------------------------------
function ItemSpawnerManager:OnPropertyChange()
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnReset called only by the editor.
------------------------------------------------------------------------------------------------------
function ItemSpawnerManager:OnReset()
	--Log("ItemSpawnerManager:OnReset");
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnSpawn called Editor/Game.
------------------------------------------------------------------------------------------------------
function ItemSpawnerManager:OnSpawn()
	self:Reset();
end

function ItemSpawnerManager:Reset()
	--Log("ItemSpawnerManager:Reset");
end

-- Load mods
Script.LoadScriptFolder("scripts/spawners/ism_mods", true, true)