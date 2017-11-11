Config = {}
Config.Locale = 'fr'

Config.Price = 150

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 1

Config.Zones = {}

Config.access = {
  {x = -161.48622131348,y = -302.29824829102,z = 38.733276367188 },

}

for i=1, #Config.access, 1 do

	Config.Zones['Shop_' .. i] = {
	 	Pos   = Config.access[i],
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end
