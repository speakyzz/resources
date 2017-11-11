--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 09/05/2017
-- Time: 09:55
-- To change this template use File | Settings | File Templates.
--

ui_page 'ui/ui.html'
files {
    'ui/ui.html',
    'ui/animate.css',
    'ui/pdown.ttf',
    'ui/voice_of_the_highlander.ttf'
}

server_scripts {
    '../../resources/essentialmode/config.lua',
    'server.lua'
}
client_script {
    'client.lua',
    'GUI.lua'
}

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/style.css',
	'html/script.js',
	'html/ci_h.png',
	'html/ci_f.png',
	'html/cursor.png'
}

export 'getQuantity'
export 'notFull'