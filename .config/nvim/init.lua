-- Modules in basic folder have nothing to do with lazy.nvim of any other plugins
require("vamshidhar.core.options")
--
require("vamshidhar.core.keymaps")

require("vamshidhar.core.autocommands")

require("vamshidhar.core.lsp")

-- Lazy should be loaded before any other plugin
require("vamshidhar.lazy")

require("vamshidhar.plugins.theme-plugins.my_theme").config()

require("vamshidhar.plugins.lualine").config()

require("vamshidhar.plugins.nvim-treesitter")

require("vamshidhar.plugins.oil").config()

require("vamshidhar.plugins.telescope").config()

require("vamshidhar.plugins.mason").config()

require("vamshidhar.plugins.gitsigns").config()

require("vamshidhar.plugins.nvim-autopairs")

require("vamshidhar.plugins.formatter")

require("vamshidhar.diagnostics.diagnostics_config")
