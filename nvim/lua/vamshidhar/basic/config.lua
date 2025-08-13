if vim.fn.has('wsl') == 1 and vim.fn.has('mac') == 0 then
  vim.g.clipboard = {
    name = 'win32yank',
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf"
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf"
    },
    cache_enabled = 0,
  }
end
