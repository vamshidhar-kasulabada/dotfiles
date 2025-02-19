require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls" },
})

local on_attach = require("vamshidhar.plugins.lsp-config.lsp_config_on_attach").on_attach()

require("lspconfig").pyright.setup({
	on_attach = on_attach,
})

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- Love2D uses LuaJIT by default
				path = vim.split(package.path, ";"), -- Set up your Lua path
			},
			diagnostics = {
				globals = { "vim", "love" }, -- Recognize 'vim' and 'love' as global variables
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true, -- Neovim runtime files
					--[vim.fn.expand('$HOME/.luarocks/share/lua/5.1')] = true, -- LuaRocks Lua files for 5.1
					--[vim.fn.expand('$HOME/.luarocks/share/lua/5.3')] = true, -- LuaRocks Lua files for 5.3
					--[vim.fn.expand("$HOME/.bin/love-api/")] = true, -- Path to Love2D API definitions
					["/Users/vamshidhar/.bin/love2d/library"] = true,
				},
			},
			telemetry = {
				enable = false, -- Disable telemetry data
			},
		},
	},
})

require("lspconfig").ts_ls.setup({
	on_attach = on_attach,
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
})

require("lspconfig").cssls.setup({
	on_attach = on_attach,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "eruby", "html", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "vue" , "htmlangular"},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

require("lspconfig").angularls.setup({
	on_attach = on_attach,
})

-- require("lspconfig").angularls.setup({
-- 	cmd = {
-- 		"node",
-- 		vim.fn.getcwd() .. "/node_modules/@angular/language-server/index.js",
-- 		"--ngProbeLocations",
-- 		vim.fn.getcwd() .. "/node_modules",
-- 		"--tsProbeLocations",
-- 		vim.fn.getcwd() .. "/node_modules",
-- 		"--logToConsole",
-- 	},
-- 	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" }, -- Add "htmlangular"
-- 	root_dir = require("lspconfig.util").root_pattern("angular.json", ".git"),
-- 	on_attach = on_attach,
-- })

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("Spawning language server with cmd") then
		return
	end
	notify(msg, ...)
end

require("lspconfig").gopls.setup({
	on_attach = on_attach,
})

-- Function to modify the border for LSP hover and signature help with rounded corners

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- Options: "none", "single", "double", "rounded", "solid", "shadow"
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

require("lspconfig.ui.windows").default_options.border = "rounded"
