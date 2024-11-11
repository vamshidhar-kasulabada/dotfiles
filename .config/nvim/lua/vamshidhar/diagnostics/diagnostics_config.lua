

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

-- vim.keymap.set('n', '<leader>r', ':source $myvimrc<cr>', {
--     noremap = true,
--     silent = true,
--     desc = "reload neovim configuration"  -- optional description for the mapping
-- })



