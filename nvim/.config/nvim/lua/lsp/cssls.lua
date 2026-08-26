---@type vim.lsp.Config
local config = {}

config.init_options = {
	provideFormatter = false,
}

config.settings = {
	css = {
		validate = true,
	},

	scss = {
		validate = true,
	},

	less = {
		validate = true,
	},
}

return config
