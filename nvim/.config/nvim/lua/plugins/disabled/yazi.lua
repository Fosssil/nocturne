return {
	"mikavilpas/yazi.nvim",
	enabled = false,
	version = "*",
	event = "VeryLazy",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	keys = {
		{
			"<leader>e",
			mode = { "n", "v" },
			"<cmd>Yazi toggle<CR>",
			desc = "Explorer",
		},
		{
			"<leader>E",
			"<cmd>Yazi cwd<CR>",
			desc = "Explorer (cwd)",
		},
		{
			"<C-Up>",
			"<cmd>Yazi toggle<CR>",
			desc = "Resume Yazi",
		},
	},

	opts = {
		open_for_directories = true,
		open_multiple_tabs = true,

		floating_window_scaling_factor = 0.9,
		yazi_floating_window_border = "rounded",
		yazi_floating_window_winblend = 0,

		keymaps = {
			show_help = "<F1>",
		},
	},

	init = function()
		-- Disable netrw if Yazi is handling directories
		vim.g.loaded_netrwPlugin = 1
	end,
}
