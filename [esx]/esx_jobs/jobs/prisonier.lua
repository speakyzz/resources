Config.Jobs.prisonnier = {
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
			Pos   = {x = 459.201324, y = -1001.7951, z = 22.91},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 0, g = 0, b = 0},
			Marker= 1,
			Blip  = false,
			Name  = _U('m_prisonier_locker'),
			Type  = "cloakroom",
			Hint  = _U('cloak_change'),
			GPS = {x = -1883.14, y = 2030.19, z = 139.53}
		},

		Patates = {
			Pos   = {x = 1660.44, y = 2510.56, z = 45.56},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 255, g = 255, b = 255},
			Marker= 1,
			Blip  = false,
			Name  = _U('m_patates'),
			Type  = "work",
			Item  = {
				{
					name   = _U('m_patates'),
					db_name= "patates",
					time   = 3000,
					max    = 7,
					add    = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop   = 100
				}
		    },
		    Hint  = _U('m_recoltpatates'),
		    GPS = {x = 496.167, y = -1970.3, z = 23.7993},
		},

  },
}

