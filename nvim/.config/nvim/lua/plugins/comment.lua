-- ~/.config/nvim/lua/plugins/comment.lua
return {
	"celeste3z/celeste_comment.nvim",
	lazy = false,
	opts = {
		keep_cursor = true,
		keep_selection = "accurate",
		insert_space = true,
		ignore_empty_lines = "always",
		fallback_to_block = "if_line_cms_wrapped",

		mappings = {
			line_toggle = "<leader>/",
			line_toggle_cur = "<leader>/",
			line_toggle_visual = "<leader>/",

			block_toggle = "<leader>?",
			block_toggle_cur = "<leader>?",
			block_toggle_visual = "<leader>?",

			line_textobject = "",
			block_textobject = "",
			auto_textobject = "",
			uncomment_auto = "",

			line_add_below = "",
			line_add_above = "",
			line_add_eol = "",
			line_invert = "",
			line_force_add = "",
			line_force_remove = "",
		},
	},
}
