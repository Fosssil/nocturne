-- ~/.config/nvim/lua/plugins/spider.lua
return {
	"chrisgrieser/nvim-spider",
	opts = {
		subwordMovement = true,
		skipInsignificantPunctuation = true,
		consistentOperatorPending = false,
		customPatterns = {},
	},
	keys = {
		{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Spider forward word" },
		{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Spider forward end" },
		{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Spider backward word" },
		{ "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "Spider backward end" },
	},
}
