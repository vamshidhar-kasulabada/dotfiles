local lib = require("vamshidhar.core.lib")
return {
	cmd = { lib.getHomePath() .. "/.local/share/nvim/mason/bin/gopls" },
	root_markers = { "go.mod", ".git",".root_marker" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
}
