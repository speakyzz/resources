Citizen.CreateThread(function()
-- these two do nothing.
--	Citizen.InvokeNative(0x9BAE5AD2508DF078, 1)
--	Citizen.InvokeNative(0x0888C3502DBBEEF5, 1)

	-- Simeon: -47.16170 -1115.3327 26.5
		Citizen.InvokeNative(0x41B4893843BBDB74, "shr_int")

	-- Trevor: 1985.48132, 3828.76757, 32.5
	-- Trash or Tidy. Only choose one.
		Citizen.InvokeNative(0x41B4893843BBDB74, "TrevorsTrailerTrash")
		--Citizen.InvokeNative(0x41B4893843BBDB74, "trevorstrailertidy")
	
	-- Heist Jewel: -637.20159 -239.16250 38.1
		Citizen.InvokeNative(0x41B4893843BBDB74, "post_hiest_unload")
	
	-- Max Renda: -585.8247, -282.72, 35.45475
		Citizen.InvokeNative(0x41B4893843BBDB74, "refit_unload")
  
	-- Heist Union Depository: 2.69689322, -667.0166, 16.1306286
		Citizen.InvokeNative(0x41B4893843BBDB74, "FINBANK")

	-- Morgue: 239.75195, -1360.64965, 39.53437
		Citizen.InvokeNative(0x41B4893843BBDB74, "Coroner_Int_on")
		Citizen.InvokeNative(0x41B4893843BBDB74, "coronertrash")
	
	-- Cluckin Bell: -146.3837, 6161.5, 30.2062
		Citizen.InvokeNative(0x41B4893843BBDB74, "CS1_02_cf_onmission1")
		Citizen.InvokeNative(0x41B4893843BBDB74, "CS1_02_cf_onmission2")
		Citizen.InvokeNative(0x41B4893843BBDB74, "CS1_02_cf_onmission3")
		Citizen.InvokeNative(0x41B4893843BBDB74, "CS1_02_cf_onmission4")
	
	-- Grapeseed's farm: 2447.9, 4973.4, 47.7
		Citizen.InvokeNative(0x41B4893843BBDB74, "farm")
		Citizen.InvokeNative(0x41B4893843BBDB74, "farmint")
		Citizen.InvokeNative(0x41B4893843BBDB74, "farm_lod")
		Citizen.InvokeNative(0x41B4893843BBDB74, "farm_props")
		Citizen.InvokeNative(0x41B4893843BBDB74, "des_farmhouse")
	
	-- FIB lobby: 105.4557, -745.4835, 44.7548
		Citizen.InvokeNative(0x41B4893843BBDB74, "FIBlobby")
	
	-- Billboard: iFruit
		Citizen.InvokeNative(0x41B4893843BBDB74, "FruitBB")
		Citizen.InvokeNative(0x41B4893843BBDB74, "sc1_01_newbill")
		Citizen.InvokeNative(0x41B4893843BBDB74, "hw1_02_newbill")
		Citizen.InvokeNative(0x41B4893843BBDB74, "hw1_emissive_newbill")
		Citizen.InvokeNative(0x41B4893843BBDB74, "sc1_14_newbill")
		Citizen.InvokeNative(0x41B4893843BBDB74, "dt1_17_newbill")

	-- Lester's factory: 716.84, -962.05, 31.59
		Citizen.InvokeNative(0x41B4893843BBDB74, "id2_14_during_door")
		Citizen.InvokeNative(0x41B4893843BBDB74, "id2_14_during1")
	
	-- Life Invader lobby: -1047.9, -233.0, 39.0
		Citizen.InvokeNative(0x41B4893843BBDB74, "facelobby")
	
	-- Tunnels
		Citizen.InvokeNative(0x41B4893843BBDB74, "v_tunnel_hole")

	-- Carwash: 55.7, -1391.3, 30.5
		Citizen.InvokeNative(0x41B4893843BBDB74, "Carwash_with_spinners")
	
	-- Stadium "Fame or Shame": -248.49159240722656, -2010.509033203125, 34.57429885864258
		Citizen.InvokeNative(0x41B4893843BBDB74, "sp1_10_real_interior")
		Citizen.InvokeNative(0x41B4893843BBDB74, "sp1_10_real_interior_lod")
	
	-- House in Banham Canyon: -3086.428, 339.2523, 6.3717
		Citizen.InvokeNative(0x41B4893843BBDB74, "ch1_02_open")
		
	-- Garage in La Mesa (autoshop): 970.27453, -1826.56982, 31.11477
		Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_bi_id1_23_door")
		
	-- Hill Valley church - Grave: -282.46380000, 2835.84500000, 55.91446000
		Citizen.InvokeNative(0x41B4893843BBDB74, "lr_cs6_08_grave_closed")
	
	-- Lost's trailer park: 49.49379000, 3744.47200000, 46.38629000
		Citizen.InvokeNative(0x41B4893843BBDB74, "methtrailer_grp1")
		
	-- Lost safehouse: 984.1552, -95.3662, 74.50
		Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_bi_hw1_13_int")
			
	-- Raton Canyon river: -1652.83, 4445.28, 2.52
		Citizen.InvokeNative(0x41B4893843BBDB74, "CanyonRvrShallow")
		
	-- Zancudo Gates (GTAO like): -1600.30100000, 2806.73100000, 18.79683000
		Citizen.InvokeNative(0x41B4893843BBDB74, "CS3_07_MPGates")
		
	-- Pillbox hospital:
		Citizen.InvokeNative(0x41B4893843BBDB74, "rc12b_default")

	-- Josh's house: -1117.1632080078, 303.090698, 66.52217
		Citizen.InvokeNative(0x41B4893843BBDB74, "bh1_47_joshhse_unburnt")
		Citizen.InvokeNative(0x41B4893843BBDB74, "bh1_47_joshhse_unburnt_lod")
		
	-- Zancudo River (need streamed content): 86.815, 3191.649, 30.463
		Citizen.InvokeNative(0x41B4893843BBDB74, "cs3_05_water_grp1")
		Citizen.InvokeNative(0x41B4893843BBDB74, "cs3_05_water_grp1_lod")
		Citizen.InvokeNative(0x41B4893843BBDB74, "cs3_05_water_grp2")
		Citizen.InvokeNative(0x41B4893843BBDB74, "cs3_05_water_grp2_lod")
	
	-- Cassidy Creek (need streamed content): -425.677, 4433.404, 27.3253
		Citizen.InvokeNative(0x41B4893843BBDB74, "canyonriver01")
		Citizen.InvokeNative(0x41B4893843BBDB74, "canyonriver01_lod")
		
	-- Optional
		-- Graffitis
			Citizen.InvokeNative(0x41B4893843BBDB74, "ch3_rd2_bishopschickengraffiti") -- 1861.28, 2402.11, 58.53
			Citizen.InvokeNative(0x41B4893843BBDB74, "cs5_04_mazebillboardgraffiti") -- 2697.32, 3162.18, 58.1
			Citizen.InvokeNative(0x41B4893843BBDB74, "cs5_roads_ronoilgraffiti") -- 2119.12, 3058.21, 53.25
			
		-- Heist Carrier: 3082.3117 -4717.1191 15.2622
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_carrier")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_carrier_distantlights")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_Carrier_int1")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_Carrier_int2")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_Carrier_int3")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_Carrier_int4")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_Carrier_int5")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_Carrier_int6")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_carrier_lodlights")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_carrier_slod")
		
		-- Heist Yatch: -2043.974,-1031.582, 11.981
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist_Bar")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist_Bedrm")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist_Bridge")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist_DistantLights")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist_enginrm")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist_LODLights")
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_yacht_heist_Lounge")
			
		-- Bunkers - Exteriors
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case0_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case1_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case2_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case3_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case4_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case5_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case6_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case7_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case9_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case10_bunkerclosed")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_case11_bunkerclosed")
			
		-- Bunkers - Interior: 892.6384, -3245.8664, -98.2645
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_entrance_placement")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_grdlc_interior_placement")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_grdlc_interior_placement_interior_0_grdlc_int_01_milo_")
			Citizen.InvokeNative(0x41B4893843BBDB74, "gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_")
			
		-- Bahama Mamas: -1388.0013, -618.41967, 30.819599
			Citizen.InvokeNative(0x41B4893843BBDB74, "hei_sm_16_interior_v_bahama_milo_")
		
		-- Red Carpet: 300.5927, 199.7589, 104.3776
			--Citizen.InvokeNative(0x41B4893843BBDB74, "redCarpet") 

		-- UFO
		-- Zancudo: -2051.99463, 3237.05835, 1456.97021
		-- Hippie base: 2490.47729, 3774.84351, 2414.035
		-- Chiliad: 501.52880000, 5593.86500000, 796.23250000
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "ufo")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "ufo_eye")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "ufo_lod")
			
		-- North Yankton: 3217.697, -4834.826, 111.8152
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01c")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01d")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01e")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01f")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01g")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01h")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01i")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01j")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01k")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue01z")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue02")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue03")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue03b")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue04")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue04b")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue05")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue05b")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue06")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue06b")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue06_int")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologuerd")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologuerdb ")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue_DistantLights")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue_LODLights")
			-- Citizen.InvokeNative(0x41B4893843BBDB74, "prologue_m2_door")
			
		-- CEO Offices :
			-- Arcadius Business Centre
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_02b")	-- Executive Rich
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_02c")	-- Executive Cool
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_02a")	-- Executive Contrast
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_01a")	-- Old Spice Warm
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_01b")	-- Old Spice Classical
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_01c")	-- Old Spice Vintage
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_03a")	-- Power Broker Ice
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_03b")	-- Power Broker Conservative
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_02_office_03c")	-- Power Broker Polished
				
			-- Maze Bank Building
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_02b")	-- Executive Rich
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_02c")	-- Executive Cool
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_02a")	-- Executive Contrast
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_01a")	-- Old Spice Warm
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_01b")	-- Old Spice Classical
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_01c")	-- Old Spice Vintage
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_03a")	-- Power Broker Ice
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_03b")	-- Power Broker Conservative
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_dt1_11_office_03c")	-- Power Broker Polished
				
			-- Lom Bank
				citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_02b")	-- Executive Rich
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_02c")	-- Executive Cool
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_02a")	-- Executive Contrast
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_01a")	-- Old Spice Warm
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_01b")	-- Old Spice Classical
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_01c")	-- Old Spice Vintage
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_03a")	-- Power Broker Ice
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_03b")	-- Power Broker Conservative
				Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_13_office_03c")	-- Power Broker Polished
				
			-- Maze Bank West
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_02b")	-- Executive Rich
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_02c")	-- Executive Cool
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_02a")	-- Executive Contrast
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_01a")	-- Old Spice Warm
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_01b")	-- Old Spice Classical
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_01c")	-- Old Spice Vintage
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_03a")	-- Power Broker Ice
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_03b")	-- Power Broker Convservative
				 Citizen.InvokeNative(0x41B4893843BBDB74, "ex_sm_15_office_03c")	-- Power Broker Polished

		-- Biker
			Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo")
			Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo")
			
			Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo")
			Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_biker_interior_placement_interior_2_biker_dlc_int_ware02_milo")
			Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_biker_interior_placement_interior_2_biker_dlc_int_ware03_milo")
			Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_biker_interior_placement_interior_2_biker_dlc_int_ware04_milo")
			Citizen.InvokeNative(0x41B4893843BBDB74, "bkr_biker_interior_placement_interior_2_biker_dlc_int_ware05_milo")
			
			Citizen.InvokeNative(0x41B4893843BBDB74, "ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo ")
			Citizen.InvokeNative(0x41B4893843BBDB74, "ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo ")
			Citizen.InvokeNative(0x41B4893843BBDB74, "ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo ")
		
		-- IMPORT/EXPORT
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_02_modgarage")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_02_cargarage_a")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_02_cargarage_b")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_02_cargarage_c")
			 
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_11_modgarage")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_11_cargarage_a")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_11_cargarage_b")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_dt1_11_cargarage_c")
			 
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_13_modgarage")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_13_cargarage_a")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_13_cargarage_b")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_13_cargarage_c")
			 
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_15_modgarage")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_15_cargarage_a")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_15_cargarage_b")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_sm_15_cargarage_c")
			 
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_impexp_interior_placement")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_impexp_interior_placement_interior_0_impexp_int_01_milo_")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_impexp_interior_placement_interior_3_impexp_int_02_milo_")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_impexp_interior_placement_interior_1_impexp_intwaremed_milo_")
			Citizen.InvokeNative(0x41B4893843BBDB74, "imp_impexp_interior_placement_interior_2_imptexp_mod_int_01_milo_")
			
end)