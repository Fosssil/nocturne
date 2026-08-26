---@type vim.lsp.Config
local config = {}

config.init_options = {
	provideFormatter = false,

	embeddedLanguages = {
		css = true,
		javascript = true,
	},

	configurationSection = {
		"html",
		"css",
		"javascript",
	},
}

return config
