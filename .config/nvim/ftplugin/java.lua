local os = vim.loop.os_uname().sysname -- 'Windows_NT', 'Linux', 'Darwin'
local home = os.getenv("HOME")
local java21 = os.getenv("JAVA_21")
local nvim_app_data_dir = home .. "/.local/share/nvim"
local jdtls_workspace_dir = nvim_app_data_dir .. "/jdtls-workspace"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = jdtls_workspace_dir .. "/" .. project_name


local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

if os == "Windows_NT" then
	os = "win"
elseif os == "Linux" then
	os = "linux"
else
	os = "mac"
end

local config = {
	cmd = {
        java21,
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
		nvim_app_data_dir .. "/mason/packages/jdtls/config_"..os,
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
	on_attach = require("vamshidhar.plugins.lsp-config.lsp_config_on_attach").on_attach_java,

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
require("jdtls").start_or_attach(config)
