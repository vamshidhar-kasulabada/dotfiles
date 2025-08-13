local lib = require("vamshidhar.core.lib")
return {
	cmd = {
		lib.getHomePath() .. "/.local/share/nvim/mason/bin/omnisharp",
		"-z",
		"--hostPID",
		"12345",
		"DotNet:enablePackageRestore=false",
		"--encoding",
		"utf-8",
		"--languageserver",
	},
	-- cmd = {
	-- 	"/Users/vamshidhar/.local/share/nvim/mason/bin/omnisharp",
	-- 	"--languageserver",
	-- 	"--hostPID",
	-- 	tostring(vim.fn.getpid()),
	-- 	"--msbuildPath",
	-- 	"/Library/Frameworks/Mono.framework/Versions/Current/Commands/msbuild",
	-- },
	root_markers = { "omnisharp.json", "*.csproj", ".git" },
	filetypes = { "cs", "vb" },
}
