return {
	plugin = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		require("gitsigns").setup()
        vim.keymap.set("n", "<leader>h]", ":Gitsigns next_hunk<CR>", { desc = "Go to next hunk" })
        vim.keymap.set("n", "<leader>h[", ":Gitsigns prev_hunk<CR>", { desc = "Go to previous hunk" })
        vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "Preview the current hunk" })
        vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "Preview the current hunk" })
        vim.keymap.set("n", "<leader>hpl", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview the current hunk" })
        vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage the current hunk" })
        vim.keymap.set("n", "<leader>hu", ":Gitsigns stage_hunk<CR>", { desc = "Unstage the current hunk" })
        vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset the current hunk" })
	end,
}
