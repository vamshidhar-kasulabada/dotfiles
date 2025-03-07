-- Modules in basic folder have nothing to do with lazy.nvim of any other plugins
require("vamshidhar.basic.options")
--
require("vamshidhar.basic.keymaps")

-- require("vamshidhar.basic.autocommands")

-- Lazy should be loaded before any other plugin
require("vamshidhar.lazy")

require("vamshidhar.plugins.theme-plugins.my_theme").config()

require("vamshidhar.plugins.lualine").config()

require("vamshidhar.plugins.nvim-treesitter")

require("vamshidhar.plugins.oil").config()

require("vamshidhar.plugins.telescope").config()

require("vamshidhar.plugins.nvim-autopairs")

require("vamshidhar.plugins.lsp-config.lsp_config")

require("vamshidhar.plugins.formatter")

require("vamshidhar.plugins.cmp")

require("vamshidhar.diagnostics.diagnostics_config")
