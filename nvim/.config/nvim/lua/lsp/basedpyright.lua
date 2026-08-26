---@type vim.lsp.Config
local config = {}

config.settings = {
	basedpyright = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "openFilesOnly",
		},

		disableTaggedHints = true,
	},
}

return config
