local lib = require("vamshidhar.core.lib")
local homePath = lib.getHomePath()
local util = require('lspconfig.util')
local root = util.root_pattern('angular.json')(vim.fn.expand('%:p'))
print(root)
return {
	cmd = {
		homePath .. "/opt/lsp/ng_ls/node_modules/.bin/ngserver",
		"--stdio",
		"--tsProbeLocations",
		homePath .. "/opt/lsp/ng_ls/node_modules",
		"--ngProbeLocations",
		homePath .. "/opt/lsp/ng_ls/node_modules",
	},
	root_markers = { "angular.json", "package.json", "tsconfig.json", ".git" },
	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
}
