Config.Jobs.btp = {
  BlipInfos = {
    Sprite = 436,
    Color = 6
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "mixer",
      Trailer = "none",
      HasCaution = false
    }
  },
  Zones = {
    CloakRoom = { -- 1
      Pos   = {x = 474.154, y = -1951.69, z = 23.6259},
      Size  = {x = 3.0, y = 3.0, z = 2.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('b_oil_refiner'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = 499.412, y = -1963.8, z = 23.9851}
    },

    ChampMine = { -- 4 -- 8
      Pos   = {x = 2942.87, y = 2777.37, z = 38.2509},
      Size  = {x = 20.0, y = 20.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('b_drill_oil'),
      Type  = "work",
      Item  = {
        {
          name   = _U('b_fuel'),
          db_name= "gravier",
          time   = 5000,
          max    = 24,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('b_drillbutton'),
      GPS = {x = 1099.13, y = -2000.54, z = 29.3549	}
    },

    Raffinerie = { -- 5
      Pos   = {x = 1099.13, y = -2000.54, z = 29.3549},
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('b_fuel_refine'),
      Type  = "work",
      Item  = {
        {
          name   = _U('b_fuel_refine'),
          db_name= "sable",
          time   = 5000,
          max    = 20,
          add    = 1,
          remove = 2,
          requires = "gravier",
          requires_name = _U('b_fuel'),
          drop   = 100
        }
      },
      Hint  = _U('b_refine_fuel_button'),
      GPS = {x = -160.821, y = 6273.43, z = 30.5182}
    },

    Melange = { -- 6
      Pos   = {x = -160.821, y = 6273.43, z = 30.5182},
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('b_fuel_mixture'),
      Type  = "work",
      Item  = {
        {
          name   = _U('b_gas'),
          db_name= "ciment",
          time   = 5000,
          max    = 20,
          add    = 2,
          remove = 1,
          requires = "sable",
          requires_name = _U('b_fuel_refine'),
          drop   = 100
        }
      },
      Hint  = _U('b_fuel_mixture_button'),
      GPS = {x = 491.406, y = -2163.37, z = 3.91827}
    },

    VehicleSpawner = { -- 2
      Pos   = {x = 499.412, y = -1963.8, z = 23.9851},
      Size  = {x = 3.0, y = 3.0, z = 2.0},
      Color = {r = 204, g = 204, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_truck_button'),
      Caution = 0,
      GPS = {x = 492.25, y = -1972.86, z = 23.8592}
    },

    VehicleSpawnPoint = {
      Pos   = {x = 492.25, y = -1972.86, z = 23.8592},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('service_vh'),
      Type  = "vehspawnpt",
      Spawner = 1,
      GPS = 0,
      Heading = 0
    },

    VehicleDeletePoint = {
      Pos   = {x = 481.897, y = -1977.05, z = 23.5806},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 255, g = 0, b = 0},
      Marker= 1,
      Blip  = false,
      Name  = _U('return_vh'),
      Type  = "vehdelete",
      Hint  = _U('return_vh_button'),
      Spawner = 1,
      Caution = 0,
      GPS = 0,
      Teleport = 0
    },

    Delivery = { -- 7
      Pos   = {x = 93.4058, y = -387.665, z = 40.2653},
      Color = {r = 204, g = 204, b = 0},
      Size  = {x = 10.0, y = 10.0, z = 1.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('b_deliver_gas'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price  = 61,
          requires = "ciment",
          requires_name = _U('b_gas'),
          drop   = 100
        }
      },
      Hint  = _U('b_deliver_gas'),
      GPS = {x = 2942.87, y = 2777.37, z = 38.2509}
    }
  }
}
