local catppuccin = require("plugins.catppuccin")
-- Faster startup
vim.loader.enable()
vim.o.synmaxcol = 240

-- Set leader key
vim.g.mapleader = " "

-- Garbage collection
vim.schedule(function()
	collectgarbage("setpause", 100)
	collectgarbage("setstepmul", 200)
end)
-- Bootstrap lazy.nvim and load plugins
require("core.keymaps")
require("core.lazy")
require("lazy").setup("plugins")

-- Load core settings
require("core.options")
require("core.disable")
require("core.diagnostics")

vim.o.termguicolors = true
