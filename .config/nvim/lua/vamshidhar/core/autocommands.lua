-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     local bufname = vim.api.nvim_buf_get_name(0)
--     if bufname then
--       print("Hello, my name is", bufname)
--     end
--   end
-- })
vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = "YankHighlight",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })
    end
})

vim.api.nvim_create_augroup("UserLspCommands",{clear=true})
vim.api.nvim_create_autocmd("LspAttach",{
    group="UserLspCommands",
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gk", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "gH", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, {
            buffer = bufnr,
            silent = true,
            desc = "Toggle Inlay Hints",
        })

  end,
})
