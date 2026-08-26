-- ~/.config/nvim/lua/plugins/spider.lua
return {
	"chrisgrieser/nvim-spider",

	opts = {
		-- Split camelCase, snake_case and kebab-case into subwords.
		subwordMovement = true,

		-- Skip insignificant punctuation like :, ., (), [], etc.
		-- Makes code navigation much smoother.
		skipInsignificantPunctuation = true,

		-- Keep Vim's original operator-pending behavior.
		-- (So we don't surprise ourselves.)
		consistentOperatorPending = false,

		-- No custom movement rules for now.
		customPatterns = {},
	},

	keys = {
		{
			"w",
			"<cmd>lua require('spider').motion('w')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider forward word",
		},
		{
			"e",
			"<cmd>lua require('spider').motion('e')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider forward end",
		},
		{
			"b",
			"<cmd>lua require('spider').motion('b')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider backward word",
		},
		{
			"ge",
			"<cmd>lua require('spider').motion('ge')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider backward end",
		},
	},
}
