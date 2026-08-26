---@type vim.lsp.Config
local config = {}

local schemastore = require("schemastore")

config.settings = {
	json = {
		validate = {
			enable = true,
		},
		schemas = schemastore.json.schemas(),
	},
}

return config
