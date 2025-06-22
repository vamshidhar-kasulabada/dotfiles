local  lib  = require("vamshidhar.core.lib")
return {
	cmd = {lib.getHomePath().."/opt/lsp/ts_ls/node_modules/.bin/typescript-language-server","--stdio" },
	root_markers = { "package.json","tsconfig.json",".git" },
	filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
}
