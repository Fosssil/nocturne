return {
	"saghen/blink.pairs",
	dependencies = "saghen/blink.lib",
	version = "*",
	build = function()
		require("blink.pairs").download():pwait(60000)
	end,
	-- OR build from source
	-- build = function() require('blink.pairs').build():pwait(60000) end,

	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {
		debug = false,
		mappings = {
			enabled = true,
			cmdline = true,
			pairs = {},
			disabled_filetypes = {},
			wrap = {
				-- set to 'treesitter' or 'treesitter_reverse' to use treesitter instead of motions
				-- set to nil, '' or false to disable the mapping
				["<C-b>"] = "treesitter",
				["<C-S-b>"] = "treesitter_reverse",
			},
		},
		highlights = {
			enabled = true,
			cmdline = true,
			unmatched_group = "BlinkPairsUnmatched",
			groups = {
				"BlinkPairsRed",
				"BlinkPairsYellow",
				"BlinkPairsBlue",
				"BlinkPairsOrange",
				"BlinkPairsGreen",
				"BlinkPairsPurple",
				"BlinkPairsCyan",
			},
			matchparen = {
				enabled = true,
				cmdline = false,
				include_surrounding = true,
				group = "BlinkPairsMatchParen",
				priority = 250,
			},
		},
	},
}
