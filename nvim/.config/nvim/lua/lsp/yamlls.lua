--                SchemaStore.nvim
--                     │
--                     ▼
--             YAML Schemas Catalog
--                     │
--                     ▼
--                 YAML Language Server
--        ┌────────────┴────────────┐
--        │                         │
--        ▼                         ▼
-- Validation & Completion      Hover & Symbols
--
--                 Formatting
--                      │
--                      ▼
--             Conform → yamlfmt

---@type vim.lsp.Config
local config = {}

local schemastore = require("schemastore")

config.settings = {
	yaml = {
		format = {
			enable = false,
		},

		validate = true,

		schemaStore = {
			enable = false,
			url = "",
		},

		schemas = schemastore.yaml.schemas(),
	},

	redhat = {
		telemetry = {
			enabled = false,
		},
	},
}

return config
