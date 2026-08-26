---@type vim.lsp.Config
local config = {}

config.settings = {
	bashIde = {
		globPattern = "*@(.sh|.inc|.bash|.command)",
	},
}

return config
