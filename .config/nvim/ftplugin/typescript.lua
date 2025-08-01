local lib = require("vamshidhar.core.lib")
local homePath = lib.getHomePath()

-- print("Buffer name: " .. vim.api.nvim_buf_get_name(0))

local function is_dir_exist(path)
	local stat = vim.loop.fs_stat(path)
	return stat and stat.type == "directory"
end

-- local util = require("lspconfig.util")
-- local anulgarRoot = util.root_pattern("angular.json")(vim.fn.expand("%:p"))
local anulgarRoot = vim.fs.root(0, { "angular.json" })

if anulgarRoot then
	if is_dir_exist(anulgarRoot .. "/node_modules") then
		local package_json_path = anulgarRoot .. "/package.json"
		local file = io.open(package_json_path, "r")
		if file then
			local content = file:read("*a")
			file:close()

			-- Parse JSON (requires vim.fn.json_decode in Neovim or a Lua JSON lib)
			local ok, data = pcall(vim.fn.json_decode, content)
			if ok and data then
				local cli_version = data["devDependencies"] and data["devDependencies"]["@angular/cli"]
				if cli_version then
					-- Extract the main version number (e.g., 14 from ^14.2.12)
					local main_version = cli_version:match("(%d+)%p?%d*%.?%d*")
					print(main_version)
					vim.lsp.start({
						name = "ng_ls_" .. main_version,
						cmd = {
							homePath .. "/opt/lsp/ng_ls_14/node_modules/.bin/ngserver",
							"--stdio",
							"--tsProbeLocations",
							homePath .. "/opt/lsp/ng_ls_14/node_modules",
							"--ngProbeLocations",
							homePath .. "/opt/lsp/ng_ls_14/node_modules",
						},

						root_dir = anulgarRoot,
					})
				else
					print("Angular CLI not found in devDependencies")
				end
			else
				print("Failed to parse JSON")
			end
		else
			print("Failed to open package.json")
		end
	end
end
