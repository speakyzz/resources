
description 'FiveM es_freeroam'


-- Requiring essentialmode
dependency 'essentialmode'

-- General
client_scripts {
  'client.lua',
  'player/scoreboard.lua',
}

server_scripts {
  'config.lua',
  'server.lua',
  '@mysql-async/lib/MySQL.lua',
}
