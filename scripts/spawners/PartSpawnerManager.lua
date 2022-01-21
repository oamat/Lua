PartSpawnerManager = {

--[[
	We should make the spawn percents match about what would be used on a real base:
	Walls being very common, doors not as much, gatehouse rare (only used once or twice per base)
--]]

	categories =
	{
		{
			category = "metal_part",
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
	},
}

--------------------------------------------------------------------------
-- Functions called from C++
--------------------------------------------------------------------------
function PartSpawnerManager:OnInit()
	--Log("PartSpawnerManager:OnInit");

	self:OnReset();
end

------------------------------------------------------------------------------------------------------
-- OnPropertyChange called only by the editor.
------------------------------------------------------------------------------------------------------
function PartSpawnerManager:OnPropertyChange()
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnReset called only by the editor.
------------------------------------------------------------------------------------------------------
function PartSpawnerManager:OnReset()
	--Log("PartSpawnerManager:OnReset");
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnSpawn called Editor/Game.
------------------------------------------------------------------------------------------------------
function PartSpawnerManager:OnSpawn()
	self:Reset();
end

function PartSpawnerManager:Reset()
	--Log("PartSpawnerManager:Reset");
end

-- Load mods
Script.LoadScriptFolder("scripts/spawners/part_mods", true, true)