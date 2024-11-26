
local function on_attach_all()
	local keymap = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }
	keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "gk", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "gr", "<Cmd> lua vim.lsp.buf.rename()<CR>", opts)
	keymap("n", "ga", "<Cmd> lua vim.lsp.buf.code_action()<CR>", opts)
	keymap("n", "gs", "<Cmd> lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap("n", "gH", "<Cmd> lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", {
		desc = "Toggle Inlay Hints",
	})
end

local function on_attach_java()
	local keymap = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }
	keymap("n", "<leader>co", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = "Organize Imports" })
	keymap("n", "<leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Extract Variable" })
	keymap(
		"v",
		"<leader>crv",
		"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
		{ desc = "Extract Variable" }
	)
	keymap("n", "<leader>crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Extract Constant" })
	keymap(
		"v",
		"<leader>crc",
		"<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
		{ desc = "Extract Constant" }
	)
	keymap("v", "<leader>crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = "Extract Method" })
end

return{
    on_attach = on_attach_all,
    on_attach_java = on_attach_java
}
