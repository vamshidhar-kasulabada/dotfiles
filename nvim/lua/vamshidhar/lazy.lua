vim = vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		require("vamshidhar.plugins.oil").plugin,
		require("vamshidhar.plugins.lualine").plugin,
		require("vamshidhar.plugins.markdown_preview").plugin,
		require("vamshidhar.plugins.theme-plugins.my_theme").plugin,
		require("vamshidhar.plugins.copilot").plugin,
		require("vamshidhar.plugins.presense-nvim").plugin,
		require("vamshidhar.plugins.indent-blankline").plugin,
		require("vamshidhar.plugins.telescope").plugin,
		require("vamshidhar.plugins.completion").plugin,
		require("vamshidhar.plugins.mason").plugin,
        require("vamshidhar.plugins.gitsigns").plugin,
        require("vamshidhar.plugins.typr").plugin,
        require("vamshidhar.plugins.smear").plugin,
		"mfussenegger/nvim-jdtls",
		"nvim-treesitter/nvim-treesitter",
		"windwp/nvim-autopairs",
		-- "williamboman/mason.nvim",
		-- "williamboman/mason-lspconfig.nvim",
		-- "neovim/nvim-lspconfig",
		"mfussenegger/nvim-lint",
		"mhartington/formatter.nvim",
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})
