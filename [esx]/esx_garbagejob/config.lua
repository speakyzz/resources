Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 1500
Config.Locale       = 'fr'

Config.Trucks = {
	"trash",
	"trash2",
	"biff",	
	"scrap"
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -321.70, y = -1545.94, z = 30.02},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -316.16, y = -1536.08, z = 26.65},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -328.50, y = -1520.99, z = 27.53},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}

Config.Livraison = {
-------------------------------------------Los Santos
	-- South Arsenal St
	Delivery1LS = {
			Pos   = {x = -544.61, y = -1774.83, z = 20.63},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 150
		},
	-- Munity Rd North
	Delivery2LS = {
			Pos   = {x = -607.91, y = -1790.05, z = 22.61},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 200
		},
	-- Davis Ave
	Delivery3LS = {
			Pos   = {x = -366.38, y = -1865.80, z = 19.53},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Carson Ave west
	Delivery4LS = {
			Pos   = {x = -195.84, y = -1530.86, z = 32.67},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 300
		},
	-- Carson Ave west2
	Delivery5LS = {
			Pos   = {x = -238.30, y = -1684.13, z = 32.58},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--Grove Street North
	Delivery6LS = {
			Pos   = {x = -13.60, y = -1816.64, z = 24.83},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 150
		},
	--Grove Street Circle
	Delivery7LS = {
			Pos   = {x = 115.04, y = -1944.09, z = 19.64},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 200
		},
	--Roy Lowenstein Blvd
	Delivery8LS = {
			Pos   = {x = 242.27, y = -1946.02, z = 22.30},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	--Carson Ave South
	Delivery9LS = {
			Pos   = {x = 374.74, y = -1977.97, z = 23.09},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 300
		},
	--Carson Ave South
	Delivery10LS = {
			Pos   = {x = 413.64, y = -2008.34, z = 21.88},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--el Rancho Blvd east
	Delivery11LS = {
			Pos   = {x = 718.66, y = -2022.64, z = 28.29},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--Chupacabra st east
	Delivery12LS = {
			Pos   = {x = -45.02, y = -2529.65, z = 5.01},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--plaice pl north
	Delivery13LS = {
			Pos   = {x = -380.13, y = -2733.28, z = 5.03},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--new empire way south airport
	Delivery14LS = {
			Pos   = {x = -895.51, y = -2745.56, z = 12.93},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--new empire way south airport
	Delivery15LS = {
			Pos   = {x = -895.51, y = -2745.56, z = 12.93},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--greenwich pkwy east airport
	Delivery16LS = {
			Pos   = {x = -1053.52, y = -2082.84, z = 12.36},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--Heritage way north
	Delivery17LS = {
			Pos   = {x = -1076.11, y = -478.89, z = 35.63},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--North Rockford Dr East
	Delivery18LS = {
			Pos   = {x = -1255.50, y = -659.87, z = 25.38},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--North Rockford Dr South
	Delivery19LS = {
			Pos   = {x = -1170.35, y = -748.96, z = 18.37},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--steele way south
	Delivery20LS = {
			Pos   = {x = -940.72, y = 167.39, z = 64.83},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--picture perfect drive west
	Delivery21LS = {
			Pos   = {x = -971.43, y = 394.99, z = 74.35},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--South Mo Milton Dr West
	Delivery22LS = {
			Pos   = {x = -763.15, y = 360.23, z = 86.86},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--Cancer Way South - Mechanic shop
	Delivery23LS = {
			Pos   = {x = -363.15, y = -145.61, z = 37.25},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--Occupation Ave west - Job Center
	Delivery24LS = {
			Pos   = {x = 260.84, y = -379.10, z = 43.63},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
    --yes, here is where you want to return the truck, in the end of all deliveries		
	RetourCamion = {
			Pos   = {x = -301.47, y = -1522.68, z = 26.87},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	-- and here his where you want to cancel the mission or delete the truck and pick another one
	AnnulerMission = {
			Pos   = {x = -332.71, y = -1516.60, z = 26.57},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
