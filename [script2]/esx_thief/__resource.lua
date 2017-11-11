resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Script created specially for KryOn by the developers Izio and Deediezi.'

client_scripts {
	'functions.lua',
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'@es_extended/locales/en.lua',
	'@es_extended/config.lua',
	'@es_extended/config.weapons.lua',
	'server.lua'
}