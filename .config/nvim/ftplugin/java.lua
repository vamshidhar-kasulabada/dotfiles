local os_type = require("lib.detectOs")

local home = os.getenv("HOME")
local nvim_app_data_dir = home .. "/.local/share/nvim"
local jdtls_workspace_dir = nvim_app_data_dir .. "/jdtls-workspace"

-- local workspace_path
--
--
-- if os_type == "Windows" then
-- 	home = os.getenv("HOMEPATH")
-- 	workspace_path = home .. "\\AppData\\Local\\nvim-data"
-- else
-- 	home = os.getenv("HOME")
-- 	workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
-- end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = jdtls_workspace_dir .. "/" .. project_name

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
	cmd = {
		-- "java",
		-- java_home .. "/bin/java",
        "/opt/jvm/amazon-corretto-17.jdk/Contents/Home/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. nvim_app_data_dir .. "/mason/packages/jdtls/lombok.jar",
		"-jar",
		vim.fn.glob(nvim_app_data_dir .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		nvim_app_data_dir .. "/mason/packages/jdtls/config_mac",
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
	on_attach = require("vamshidhar.plugins.lsp-config.lsp_config_on_attach").on_attach_java(),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			extendedClientCapabilities = extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
			format = {
				enabled = true,
			},
		},
	},

	init_options = {
		bundles = {},
	},
}

--on_attach()
require("jdtls").start_or_attach(config)

-- Function to format Java files using the binary
local function format_java()
	local filename = vim.fn.expand("%:p")
	local command = string.format("google-java-format -i -a %s", filename)
	vim.cmd(string.format("silent !%s", command))
	vim.cmd("e") -- Refresh the buffer to show changes
end

-- Create a command in Neovim to format Java files
vim.api.nvim_create_user_command("JavaFormat", format_java, { nargs = 0 })
