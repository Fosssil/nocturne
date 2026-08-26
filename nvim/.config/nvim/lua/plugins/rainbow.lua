-- ~/.config/nvim/lua/plugins/rainbow.lua
return {
	{
		"HiPhish/rainbow-delimiters.nvim",

		event = {
			"BufReadPost",
			"BufNewFile",
		},

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},

		init = function()
			---@type rainbow_delimiters.config
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = "rainbow-delimiters.strategy.global",
					vim = "rainbow-delimiters.strategy.local",
				},

				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},

				priority = {
					[""] = 110,
					lua = 210,
				},

				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
}
