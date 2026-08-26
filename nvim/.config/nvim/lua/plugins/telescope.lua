-- ~/.config/nvim/lua/plugins/telescope.lua
return {
	{
		"nvim-telescope/telescope.nvim",

		version = "*",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",

			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
			},

			{
				"isak102/telescope-git-file-history.nvim",
				dependencies = {
					"tpope/vim-fugitive",
				},
			},
		},

		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					prompt_prefix = "  ",
					selection_caret = "▎ ",
					entry_prefix = "  ",
					multi_icon = "󰄬 ",

					sorting_strategy = "ascending",
					layout_strategy = "horizontal",

					path_display = { "smart" },
					winblend = 0,

					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.58,
							results_width = 0.8,
						},

						vertical = {
							mirror = false,
						},

						width = 0.90,
						height = 0.90,

						preview_cutoff = 120,
					},

					file_ignore_patterns = {
						"^.git/",
						"^node_modules/",
						"^dist/",
						"^build/",
						"^target/",
						"^.cache/",
						"^.next/",
						"^coverage/",
					},
				},

				pickers = {
					find_files = {
						hidden = true,
					},

					live_grep = {
						additional_args = function()
							return { "--hidden" }
						end,
					},

					buffers = {
						sort_mru = true,
						ignore_current_buffer = true,
					},

					oldfiles = {
						only_cwd = true,
					},
				},

				extensions = {
					git_file_history = {},

					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},

					file_browser = {
						hijack_netrw = true,
						hidden = true,
						respect_gitignore = true,
						grouped = true,
						initial_mode = "normal",
					},

					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
			telescope.load_extension("ui-select")
			telescope.load_extension("git_file_history")
		end,
	},
}
