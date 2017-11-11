Citizen.CreateThread(function()
--load unloaded ipl's
LoadMpDlcMaps()
EnableMpDlcMaps(true)

RequestIpl("chop_props")
--
RemoveIpl("v_carshowroom")
RemoveIpl("shutter_open")
RemoveIpl("shutter_closed")
RemoveIpl("shr_int")
RemoveIpl("csr_inMission")
RequestIpl("v_carshowroom")
RequestIpl("shutter_closed")
--
RequestIpl("TrevorsMP")
--RequestIpl("TrevorsTrailer")
RequestIpl("TrevorsTrailerTidy")
--
RequestIpl("post_hiest_unload")
--
RequestIpl("refit_unload")
--
RequestIpl("FINBANK")
--
RemoveIpl("Coroner_Int_off")
RequestIpl("coronertrash")
RequestIpl("Coroner_Int_on")
--
RemoveIpl("CS1_02_cf_offmission")
RequestIpl("CS1_02_cf_onmission1")
RequestIpl("CS1_02_cf_onmission2")
RequestIpl("CS1_02_cf_onmission3")
RequestIpl("CS1_02_cf_onmission4")
--
RemoveIpl("farm_burnt")
RemoveIpl("farm_burnt_lod")
RemoveIpl("farm_burnt_props")
RemoveIpl("farmint_cap")
RemoveIpl("farmint_cap_lod")
RequestIpl("farm")
RequestIpl("farmint")
RequestIpl("farm_lod")
RequestIpl("farm_props")
RequestIpl("des_farmhouse")
--
RemoveIpl("FIBlobbyfake")
RequestIpl("FIBlobby")
RequestIpl("FBI_colPLUG")
RequestIpl("FBI_repair")
--
RequestIpl("FruitBB")
RequestIpl("sc1_01_newbill")
RequestIpl("hw1_02_newbill")
RequestIpl("hw1_emissive_newbill")
RequestIpl("sc1_14_newbill")
RequestIpl("dt1_17_newbill")
--
RemoveIpl("id2_14_during_door")
RemoveIpl("id2_14_during1")
RemoveIpl("id2_14_during2")
RemoveIpl("id2_14_on_fire")
RemoveIpl("id2_14_post_no_int")
RemoveIpl("id2_14_pre_no_int")
RemoveIpl("id2_14_during_door")
RequestIpl("id2_14_during1")
--
RequestIpl("facelobby")
--
RequestIpl("v_tunnel_hole")
--
RequestIpl("Carwash_with_spinners")
--
RemoveIpl("sp1_10_fake_interior")
RemoveIpl("sp1_10_fake_interior_lod")
RequestIpl("sp1_10_real_interior")
RequestIpl("sp1_10_real_interior_lod")
--
RemoveIpl("ch1_02_closed")
RequestIpl("ch1_02_open")
-- Garage in La Mesa (autoshop): 970.27453, -1826.56982, 31.11477
RequestIpl("bkr_bi_id1_23_door")
-- Hill Valley church - Grave: -282.46380000, 2835.84500000, 55.91446000
RequestIpl("lr_cs6_08_grave_closed")
-- Lost's trailer park: 49.49379000, 3744.47200000, 46.38629000
RequestIpl("methtrailer_grp1")
-- Raton Canyon river: -1652.83, 4445.28, 2.52
RequestIpl("CanyonRvrShallow")	
-- Zancudo Gates (GTAO like): -1600.30100000, 2806.73100000, 18.79683000
RequestIpl("CS3_07_MPGates")
--
RemoveIpl("RC12B_Default")
RemoveIpl("RC12B_Fixed")
RequestIpl("RC12B_Destroyed")
RequestIpl("RC12B_HospitalInterior")
--
RequestIpl("bh1_47_joshhse_unburnt")
RequestIpl("bh1_47_joshhse_unburnt_lod")
-- Bahama Mamas: -1388.0013, -618.41967, 30.819599
RequestIpl("hei_sm_16_interior_v_bahama_milo_")
-- Lost safehouse: 984.1552, -95.3662, 74.50
RemoveIpl("hei_bi_hw1_13_door")
RequestIpl("bkr_bi_hw1_13_int")
-- Heist Carrier: 3082.3117 -4717.1191 15.2622
RequestIpl("hei_carrier")
RequestIpl("hei_carrier_distantlights")
RequestIpl("hei_Carrier_int1")
RequestIpl("hei_Carrier_int2")
RequestIpl("hei_Carrier_int3")
RequestIpl("hei_Carrier_int4")
RequestIpl("hei_Carrier_int5")
RequestIpl("hei_Carrier_int6")
RequestIpl("hei_carrier_lodlights")
RequestIpl("hei_carrier_slod")
-- Heist Yatch: -2043.974,-1031.582, 11.981
RequestIpl("hei_yacht_heist")
RequestIpl("hei_yacht_heist_Bar")
RequestIpl("hei_yacht_heist_Bedrm")
RequestIpl("hei_yacht_heist_Bridge")
RequestIpl("hei_yacht_heist_DistantLights")
RequestIpl("hei_yacht_heist_enginrm")
RequestIpl("hei_yacht_heist_LODLights")
RequestIpl("hei_yacht_heist_Lounge")
--
-- Red Carpet: 300.5927, 199.7589, 104.3776
--RequestIpl("redCarpet") 

-- UFO
-- Zancudo: -2051.99463, 3237.05835, 1456.97021
-- Hippie base: 2490.47729, 3774.84351, 2414.035
-- Chiliad: 501.52880000, 5593.86500000, 796.23250000
-- RequestIpl("ufo")
-- RequestIpl("ufo_eye")
-- RequestIpl("ufo_lod")

-- North Yankton: 3217.697, -4834.826, 111.8152
-- RequestIpl("prologue01")
-- RequestIpl("prologue01c")
-- RequestIpl("prologue01d")
-- RequestIpl("prologue01e")
-- RequestIpl("prologue01f")
-- RequestIpl("prologue01g")
-- RequestIpl("prologue01h")
-- RequestIpl("prologue01i")
-- RequestIpl("prologue01j")
-- RequestIpl("prologue01k")
-- RequestIpl("prologue01z")
-- RequestIpl("prologue02")
-- RequestIpl("prologue03")
-- RequestIpl("prologue03b")
-- RequestIpl("prologue04")
-- RequestIpl("prologue04b")
-- RequestIpl("prologue05")
-- RequestIpl("prologue05b")
-- RequestIpl("prologue06")
-- RequestIpl("prologue06b")
-- RequestIpl("prologue06_int")
-- RequestIpl("prologuerd")
-- RequestIpl("prologuerdb ")
-- RequestIpl("prologue_DistantLights")
-- RequestIpl("prologue_LODLights")
-- RequestIpl("prologue_m2_door")

--
RequestIpl("v_rockclub")
--
RequestIpl("cargoship")
RequestIpl("railing_start")
--
RemoveIpl("bh1_16_refurb")
RemoveIpl("jewel2fake")
RemoveIpl("bh1_16_doors_shut")
--
RequestIpl("ferris_finale_Anim")
--
RequestIpl("AP1_04_TriAf01")
RequestIpl("CS2_06_TriAf02")
RequestIpl("CS4_04_TriAf03")
--
RemoveIpl("scafstartimap")
RequestIpl("scafendimap")
--
RemoveIpl("DT1_05_HC_REMOVE")
RequestIpl("DT1_05_HC_REQ")
RequestIpl("DT1_05_REQUEST")
--
RemoveIpl("DT1_03_Shutter")
RemoveIpl("DT1_03_Gr_Closed")
--
RequestIpl("ex_sm_13_office_01a")
RequestIpl("ex_sm_13_office_01b")
RequestIpl("ex_sm_13_office_02a")
RequestIpl("ex_sm_13_office_02b")
--
RequestIpl("v_hospital")
--
-- RequestIpl("redCarpet")
-- online appartments
RequestIpl("apa_v_mp_h_01_a")
RequestIpl("apa_v_mp_h_01_c")
RequestIpl("apa_v_mp_h_01_b")

RequestIpl("apa_v_mp_h_02_a")
RequestIpl("apa_v_mp_h_02_c")
RequestIpl("apa_v_mp_h_02_b")

RequestIpl("apa_v_mp_h_03_a")
RequestIpl("apa_v_mp_h_03_c")
RequestIpl("apa_v_mp_h_03_b")

RequestIpl("apa_v_mp_h_04_a")
RequestIpl("apa_v_mp_h_04_c")
RequestIpl("apa_v_mp_h_04_b")

RequestIpl("apa_v_mp_h_05_a")
RequestIpl("apa_v_mp_h_05_c")
RequestIpl("apa_v_mp_h_05_b")

RequestIpl("apa_v_mp_h_06_a")
RequestIpl("apa_v_mp_h_06_c")
RequestIpl("apa_v_mp_h_06_b")

RequestIpl("apa_v_mp_h_07_a")
RequestIpl("apa_v_mp_h_07_c")
RequestIpl("apa_v_mp_h_07_b")

RequestIpl("apa_v_mp_h_08_a")
RequestIpl("apa_v_mp_h_08_c")
RequestIpl("apa_v_mp_h_08_b")

-- arcadius building center
RequestIpl("ex_dt1_02_office_02b")
-- RequestIpl("ex_dt1_02_office_02a")
-- RequestIpl("ex_dt1_02_office_02c")
-- RequestIpl("ex_dt1_02_office_01a")
RequestIpl("ex_dt1_02_office_01b")
-- RequestIpl("ex_dt1_02_office_01c")
-- RequestIpl("ex_dt1_02_office_03a")
RequestIpl("ex_dt1_02_office_03b")
-- RequestIpl("ex_dt1_02_office_03c")

-- maze bank
RequestIpl("ex_dt1_11_office_02b")
-- RequestIpl("ex_dt1_11_office_02c")
-- RequestIpl("ex_dt1_11_office_02c")
RequestIpl("ex_dt1_11_office_01a")
-- RequestIpl("ex_dt1_11_office_01b")
-- RequestIpl("ex_dt1_11_office_01c")
RequestIpl("ex_dt1_11_office_03a")
-- RequestIpl("ex_dt1_11_office_03b")
-- RequestIpl("ex_dt1_11_office_03c")

-- Lom Bank Corp Towers
RequestIpl("ex_dt1_13_office_02b")
-- RequestIpl("ex_dt1_13_office_02a")
-- RequestIpl("ex_dt1_13_office_02c")
RequestIpl("ex_dt1_13_office_01a")
-- RequestIpl("ex_dt1_13_office_01b")
-- RequestIpl("ex_dt1_13_office_01c")
RequestIpl("ex_dt1_13_office_03a")
-- RequestIpl("ex_dt1_13_office_03b")
-- RequestIpl("ex_dt1_13_office_03c")

-- maze bank west
RequestIpl("ex_dt1_15_office_02b")
-- RequestIpl("ex_dt1_15_office_02a")
-- RequestIpl("ex_dt1_15_office_02c")
RequestIpl("ex_dt1_15_office_01a")
-- RequestIpl("ex_dt1_15_office_01b")
-- RequestIpl("ex_dt1_15_office_01c")
-- RequestIpl("ex_dt1_15_office_03a")
RequestIpl("ex_dt1_15_office_03b")
-- RequestIpl("ex_dt1_15_office_03c")

-- biker clubhouses and warehouses
RequestIpl("bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo")
RequestIpl("bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo")
RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo")
RequestIpl("bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo")
RequestIpl("bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo")
RequestIpl("bkr_biker_interior_placement_interior_5_biker_dlc_int_ware04_milo")
RequestIpl("bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo")
RequestIpl("ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo")
RequestIpl("ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo")
RequestIpl("ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo")
  
end)

-- http://pastebin.com/FyV5mMma for list if you want to add more

