local  lib  = require("vamshidhar.core.lib")
return {
	cmd = {
        lib.getHomePath().."/opt/lsp/ng_ls/node_modules/.bin/ngserver",
        '--stdio',
        '--tsProbeLocations',
        "--tsProbeLocations",
        "/Users/vamshidhar/opt/lsp/ng_ls/node_modules",
        "--ngProbeLocations",
        "/Users/vamshidhar/opt/lsp/ng_ls/node_modules"
    },
	root_markers = {"angular.json", "package.json", "tsconfig.json", ".git"},
    filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' },
}
