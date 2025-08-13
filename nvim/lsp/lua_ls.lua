local  lib  = require("vamshidhar.core.lib")
return {
	cmd = { lib.getHomePath().."/.local/share/nvim/mason/bin/lua-language-server" },
	root_markers = { ".luarc.json" },
	filetypes = { "lua" },
}
