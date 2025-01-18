
local opts = { noremap = true, silent = true }


-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap
-- Telescope
keymap("n", "<leader>ff","<cmd>Telescope find_files<CR>",opts)
keymap("n", "<leader>fd","<cmd>Telescope diagnostics<CR>",opts)
keymap("n", "<leader>fm","<cmd>Telescope marks<CR>",opts)
keymap("n", "<leader>fg","<cmd>Telescope live_grep<CR>",opts)


return {
	plugin = {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical", -- Change to vertical layout
				layout_config = {
					preview_height = 0.7, -- Height of the preview area
					width = 0.9, -- Width of the Telescope window
					height = 0.9, -- Height of the Telescope window
				},
			},
		})
	end,
}
