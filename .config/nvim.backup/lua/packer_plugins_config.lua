return require("packer").startup(function(use)

    use "wbthomason/packer.nvim"
    use "nvim-tree/nvim-tree.lua"
    use "nvim-treesitter/nvim-treesitter"


    use { "catppuccin/nvim", as = "catppuccin" }


    use "neovim/nvim-lspconfig"

    use "windwp/nvim-autopairs"

    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --[[
    
    use "akinsho/bufferline.nvim"

    use "nvim-lualine/lualine.nvim"

    --]]




end)
