---@type vim.lsp.Config
local config = {}

config.settings = {
	gopls = {
		semanticTokens = true,
	},
}

return config
