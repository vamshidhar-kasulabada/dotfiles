local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	require("vamshidhar.plugins.oil").plugin,
	require("vamshidhar.plugins.lualine").plugin,
	require("vamshidhar.plugins.markdown_preview").plugin,
	require("vamshidhar.plugins.theme-plugins.my_theme").plugin,
	require("vamshidhar.plugins.copilot").plugin,
	require("vamshidhar.plugins.presense-nvim").plugin,
    require("vamshidhar.plugins.telescope").plugin,
    -- require("vamshidhar.plugins.neocord").plugin,
	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-autopairs",
	{
		-- mason
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- neovim native lsp
		"neovim/nvim-lspconfig",
		-- nvim-jdtls for java lsp
		"mfussenegger/nvim-jdtls",
	},
	{
		"mfussenegger/nvim-lint",
	},
	-- [[Code Formating]]
	{
		"mhartington/formatter.nvim",
	},
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
	-- [[Code Completion]]
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		"rafamadriz/friendly-snippets",
	},
}

require("lazy").setup(plugins, opts)
