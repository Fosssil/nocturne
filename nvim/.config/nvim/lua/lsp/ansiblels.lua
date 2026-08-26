---@type vim.lsp.Config
local config = {}

config.settings = {
	ansible = {
		ansible = {
			path = "ansible",
		},

		executionEnvironment = {
			enabled = false,
		},

		python = {
			interpreterPath = "python",
		},

		validation = {
			enabled = true,

			lint = {
				enabled = false,
			},
		},
	},
}

return config
