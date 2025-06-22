local  lib  = require("vamshidhar.core.lib")
return {
	cmd = { lib.getHomePath().."/opt/lsp/lua-language-server-3.14.0-darwin-arm64/bin/lua-language-server" },
	root_markers = { ".luarc.json" },
	filetypes = { "lua" },
}
