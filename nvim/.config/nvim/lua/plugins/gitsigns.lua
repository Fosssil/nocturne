-- ~/.config/nvim/lua/plugins/gitsigns.lua
return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },

		config = function()
			require("gitsigns").setup({
				signcolumn = true,
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				numhl = false,
				linehl = false,
				word_diff = false,
				attach_to_untracked = true,
				current_line_blame = true,
				watch_gitdir = { follow_files = true },
				signs = {
					add = { text = "+" },
					change = { text = "│" },
					delete = { text = "󰍵" },
					topdelete = { text = "󰍵" },
					changedelete = { text = "~" },
					untracked = { text = "│" },
				},
				signs_staged = {
					add = { text = "+" },
					change = { text = "│" },
					delete = { text = "󰍵" },
					topdelete = { text = "󰍵" },
					changedelete = { text = "~" },
					untracked = { text = "│" },
				},
				current_line_blame_opts = {
					virt_text = false,
					virt_text_pos = "right_align",
					delay = 500,
					ignore_whitespace = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				preview_config = { border = "rounded", style = "minimal", relative = "cursor", row = 0, col = 1 },
			})
		end,
	},
}
