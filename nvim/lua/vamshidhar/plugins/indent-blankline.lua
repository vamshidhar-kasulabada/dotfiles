return {
	plugin = {
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "│",
				tab_char = "→",
				smart_indent_cap = true,
			},
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = false,
			highlight = { "Function", "Label", "String", "Comment", "Identifier" },
		},
		exclude = {
			filetypes = { "help", "dashboard", "neo-tree" },
			buftypes = { "terminal", "nofile" },
		},
	},
}
