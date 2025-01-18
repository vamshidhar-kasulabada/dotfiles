vim.diagnostic.config({
    virtual_text = false,  -- Disables inline virtual text for diagnostics
    signs = true,          -- Enables signs in the gutter for diagnostics
    update_in_insert = false,  -- Prevent diagnostics from updating in insert mode
    float = { border = "rounded" }  -- Sets a single-line border for floating diagnostic windows
})


vim.keymap.set("n","<leader>df","<cmd>lua vim.diagnostic.open_float()<CR>",{
    noremap= true,
    silent = true,
    desc = "Show Error"
})

-- Go to next error
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Next Error"
})

-- Go to next warning
vim.keymap.set("n", "<leader>dw", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Next Warning"
})

-- Go to next info
vim.keymap.set("n", "<leader>di", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.INFO})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Next Information"
})

-- Go to next hint
vim.keymap.set("n", "<leader>dh", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.HINT})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Next Hint"
})

-- Go to previous error
vim.keymap.set("n", "<leader>dpe", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Previous Error"
})

-- Go to previous warning
vim.keymap.set("n", "<leader>dpw", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Previous Warning"
})

-- Go to previous info
vim.keymap.set("n", "<leader>dpi", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.INFO})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Previous Information"
})

-- Go to previous hint
vim.keymap.set("n", "<leader>dph", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.HINT})<CR>", {
    noremap = true,
    silent = true,
    desc = "Go to Previous Hint"
})


-- vim.keymap.set('n', '<leader>r', ':source $myvimrc<cr>', {
--     noremap = true,
--     silent = true,
--     desc = "reload neovim configuration"  -- optional description for the mapping
-- })
