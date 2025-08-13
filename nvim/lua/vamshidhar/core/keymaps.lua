local opts = { noremap = true, silent = true }



-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- leader
vim.g.mapleader = " "

-- Insert Mode--
-- Press jk fast to enter normal mode
keymap("i", "kj", "<ESC>", opts)


-- Normal Mode --
-- Windown managment 
keymap("n", "<C-h>", "<C-w>h",opts)
keymap("n", "<C-j>", "<C-w>j",opts)
keymap("n", "<C-l>", "<C-w>l",opts)
keymap("n", "<C-k>", "<C-w>k",opts)

-- Buffers Navigation
keymap("n","H",":bprevious<CR>", opts)
keymap("n","L",":bnext<CR>", opts)




-- Visual Mode --
keymap("v", "<leader>y","\"+yy",opts);
