local  lib  = require("vamshidhar.core.lib")
return {
	cmd = {lib.getHomePath().."/.local/share/nvim/mason/bin/typescript-language-server","--stdio" },
	root_markers = { "package.json","tsconfig.json",".git" },
	filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
}
