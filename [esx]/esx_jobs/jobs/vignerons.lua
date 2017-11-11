Config.Jobs.vignerons = {
  BlipInfos = {
    Sprite = 93,
    Color = 2
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "sadler",
      Trailer = "none",
      HasCaution = false
    }
  },
  Zones = {
    CloakRoom = {
      Pos   = {x = -1888.20, y = 2048.66, z = 139.98},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 207, g = 94, b = 6},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_vignerons_locker'),
      Type  = "cloakroom",
      Hint  = _U('cloak_change'),
      GPS = {x = -1883.14, y = 2030.19, z = 139.53}
    },

    Vigne = {
      Pos   = {x = -1782.62, y = 2326.24, z = 61.51},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 207, g = 94, b = 6},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_raisin'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_raisin'),
          db_name= "raisin",
          time   = 3000,
          max    = 7,
          add    = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop   = 100
        }
      },
      Hint  = _U('m_recoltraisin'),
      GPS = {x = 496.167, y = -1970.3, z = 23.7993},
    },

    Cave = {
      Pos   = {x = 496.167, y = -1970.3, z = 23.7993},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 207, g = 94, b = 6},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_raisin_smelting'),
      Type  = "work",
      Item  = {
        {
          name   = _U('m_vinblanc'),
          db_name= "vinblanc",
          time   = 4000,
          max    = 100,
          add    = 3,
          remove = 1,
          requires = "raisin",
          requires_name = _U('raisin'),
          drop   = 100
        },
        {
          name   = _U('m_vinrouge'),
          db_name= "vinrouge",
          max    = 100,
          add    = 3,
          drop   = 100
        },
        {
          name   = _U('m_grand_crue'),
          db_name= "grandcru",
          max    = 50,
          add    = 1,
          drop   = 5
        },
      },
      Hint  = _U('m_raisin_button'),
      GPS = {x = -1433.33, y = 208.43, z = 56.82}
    },

    VehicleSpawner = {
      Pos   = {x = -1883.14, y = 2030.19, z = 139.53},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 207, g = 94, b = 6},
      Marker= 1,
      Blip  = false,
      Name  = _U('spawn_veh'),
      Type  = "vehspawner",
      Spawner = 1,
      Hint  = _U('spawn_veh_button'),
      Caution = 2000,
      GPS = {x = -1782.62, y = 2326.24, z = 42.398}
    },

    VehicleSpawnPoint = {
      Pos   = {x = -1903.65, y = 2058.53, z = 140.75},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Marker= -1,
      Blip  = false,
      Name  = _U('service_vh'),
      Type  = "vehspawnpt",
      Spawner = 1,
      Heading = 47.0,
      GPS = 0
    },

    VehicleDeletePoint = {
      Pos   = {x = -1918.09, y = 2056.57, z = 139.73},
      Size  = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r=255,g=0,b=0},
      Marker= 1,
      Blip  = false,
      Name  = _U('return_vh'),
      Type  = "vehdelete",
      Hint  = _U('return_vh_button'),
      Spawner = 1,
      Caution = 2000,
      GPS = 0,
      Teleport = 0
    },

    Vinblanc = {
      Pos   = {x = -1433.33, y = 208.43, z = 56.82},
      Color = {r = 207, g = 94, b = 6},
      Size  = {x = 5.0, y = 5.0, z = 3.0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_vinblanc'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price  = 70,
          requires = "vinblanc",
          requires_name = _U('m_vinblanc'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_vinblanc'),
      GPS = {x = -1481.13, y = 199.26, z = 55.68},
    },

    Vinrouge = {
      Pos   = {x = -1481.13, y = 199.26, z = 55.68},
      Color = {r = 207, g = 94, b = 6},
      Size  = {x = 5.0, y = 5.0, z = 3.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_vinrouge'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price  = 70,
          requires = "vinrouge",
          requires_name = _U('m_vinrouge'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_vinrouge'),
      GPS = {x = 248.88, y = 212.11, z = 105.28}
    },


    grandcru = {
      Pos   = {x = 248.88, y = 212.11, z = 105.28},
      Color = {r = 207, g = 94, b = 6},
      Size  = {x = 5.0, y = 5.0, z = 3.0},
      Color = {r = 0, g = 0, b = 0},
      Marker= 1,
      Blip  = true,
      Name  = _U('m_sell_grand_crue'),
      Type  = "delivery",
      Spawner = 1,
      Item  = {
        {
          name   = _U('delivery'),
          time   = 500,
          remove = 1,
          max    = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price  = 500,
          requires = "grandcru",
          requires_name = _U('m_grand_crue'),
          drop   = 100
        }
      },
      Hint  = _U('m_deliver_grand_crue'),
      GPS = {x = -1782.62, y = 2326.24, z = 42.398}
    },

  },
}
