-- ~/.config/nvim/lua/plugins/comment-box.lua

return {
	"LudoPinelli/comment-box.nvim",

	cmd = {
		"CBline",
		"CBllline",
		"CBllbox",
		"CBcatalog",
		"CBd",
	},

	opts = {
		comment_style = "line",
		doc_width = 80,
		box_width = 40,
		line_width = 50,

		outer_blank_lines_above = true, -- Blank line above the box
		outer_blank_lines_below = true, -- Blank line below the box
		inner_blank_lines = false, -- Blank line above & below the text

		line_blank_line_above = false, -- Blank line above the line
		line_blank_line_below = false, -- Blank line below the line
	},

	keys = {
		{
			"<leader>cl",
			"<cmd>CBline15<CR>",
			mode = "n",
			desc = "Comment Line",
		},

		{
			"<leader>ct",
			"<cmd>CBllline17<CR>",
			mode = { "n", "x", "v" },
			desc = "Comment line Title",
		},

		{
			"<leader>cb",
			"<cmd>CBllbox2<CR>",
			mode = { "n", "x" },
			desc = "Comment Box",
		},
	},
}
