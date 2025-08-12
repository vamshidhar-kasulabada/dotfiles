return {
	plugin = {
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	-- config = function()
	-- 	local old_select = vim.ui.select
	-- 	vim.ui.select = function(items, opts, on_choice)
	-- 		vim.cmd("SmearCursorToggle") -- pause smear
	-- 		old_select(items, opts, function(choice, idx)
	-- 			vim.cmd("SmearCursorToggle") -- resume smear
	-- 			on_choice(choice, idx)
	-- 		end)
	-- 	end
	-- end,
}
