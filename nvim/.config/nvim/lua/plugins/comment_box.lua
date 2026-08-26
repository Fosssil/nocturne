-- ~/.config/nvim/lua/plugins/comment-box.lua

return {
	"LudoPinelli/comment-box.nvim",

	cmd = {
		"CBline",
		"CBllline",
		"CBline12",
		"CBllbox",
		"CBcatalog",
		"CBrline6",
		"CBd",
	},

	opts = {
		comment_style = "line",
		doc_width = 100,
		box_width = 70,
		line_width = 90,

		outer_blank_lines_above = false,
		outer_blank_lines_below = false,
		inner_blank_lines = false,

		line_blank_line_above = false,
		line_blank_line_below = false,
	},

	keys = {
		{
			"<leader>cl",
			"<cmd>CBline9<CR>",
			mode = "n",
			desc = "Comment Line",
		},

		{
			"<leader>ct",
			"<cmd>CBllline6<CR>",
			mode = { "n", "x", "v" },
			desc = "Comment line Title",
		},

		{
			"<leader>cb",
			"<cmd>CBllbox<CR>",
			mode = { "n", "x" },
			desc = "Comment Box",
		},
	},
}
