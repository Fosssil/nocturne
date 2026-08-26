-- ~/.config/nvim/lua/plugins/which-key.lua
return {
	{
		"folke/which-key.nvim",

		event = "VeryLazy",

		opts = {
			-- ─────────────────────────────────────────────────────────────
			-- Appearance
			-- ─────────────────────────────────────────────────────────────

			preset = "modern",

			delay = 300,

			win = {
				border = "rounded",
				padding = { 1, 2 },
				no_overlap = true,
				title = true,
				title_pos = "center",
			},

			layout = {
				width = {
					min = 24,
					max = 60,
				},

				spacing = 3,
			},

			-- Keep the ordering intentional.
			sort = {
				"manual",
				"group",
				"alphanum",
				"mod",
			},

			-- ─────────────────────────────────────────────────────────────
			-- Icons
			-- ─────────────────────────────────────────────────────────────

			icons = {
				mappings = true,

				breadcrumb = "»",
				separator = "➜",
				group = "+",
				ellipsis = "…",

				-- Let WhichKey/mini.icons handle actual icon selection.
				-- We don't want 47 hand-picked emoji icons fighting each
				-- other for attention.
				rules = {},

				colors = true,
			},

			-- ─────────────────────────────────────────────────────────────
			-- Triggers
			-- ─────────────────────────────────────────────────────────────

			triggers = {
				{ "<auto>", mode = "nixsotc" },

				-- mini.surround uses:
				-- sa / sd / sr / sf / sF / sh
				{ "s", mode = "n" },
			},

			-- ─────────────────────────────────────────────────────────────
			-- Built-in WhichKey helpers
			-- ─────────────────────────────────────────────────────────────

			plugins = {
				marks = true,
				registers = true,

				spelling = {
					enabled = true,
					suggestions = 20,
				},

				presets = {
					-- We deliberately disable these because they add a huge
					-- amount of generic Vim information to our workflow.
					--
					-- g is intentionally kept out because we use g for our
					-- own Git-related conventions.
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},

			-- ─────────────────────────────────────────────────────────────
			-- Display
			-- ─────────────────────────────────────────────────────────────

			show_help = true,
			show_keys = true,

			disable = {
				buftypes = {},
				filetypes = {
					"telescopeprompt",
					"lazy",
					"mason",
				},
			},

			-- ─────────────────────────────────────────────────────────────
			-- Our keymap hierarchy
			-- ─────────────────────────────────────────────────────────────

			spec = {
				-- Buffer management
				{
					"<leader>b",
					group = "Buffers",
				},

				-- Code / comments / LSP
				{
					"<leader>c",
					group = "Code",
				},

				-- Find / format
				{
					"<leader>f",
					group = "Find / Format",
				},

				-- Git
				{
					"<leader>g",
					group = "Git",
				},

				-- Multicursor
				{
					"<leader>m",
					group = "Multicursor",
				},

				-- Split / window management
				{
					"<leader>s",
					group = "Windows",
				},

				-- Surround
				{
					"s",
					group = "Surround",
					mode = "n",
				},

				-- Undo
				{
					"<leader>u",
					desc = "Undo History",
				},

				-- Save / quit
				{
					"<leader>w",
					desc = "Save File",
				},

				{
					"<leader>q",
					desc = "Quit",
				},

				-- Clipboard
				{
					"<leader>y",
					desc = "Yank To Clipboard",
					mode = { "n", "v" },
				},

				-- Align
				{
					"<leader>a",
					desc = "Align",
					mode = "x",
				},

				-- Format
				{
					"<leader>fd",
					desc = "Format Buffer",
				},

				-- LSP
				{
					"<leader>rn",
					desc = "Rename Symbol",
				},

				{
					"<leader>ca",
					desc = "Code Action",
				},

				-- Windows
				{
					"<C-h>",
					desc = "Focus Left Window",
				},

				{
					"<C-j>",
					desc = "Focus Lower Window",
				},

				{
					"<C-k>",
					desc = "Focus Upper Window",
				},

				{
					"<C-l>",
					desc = "Focus Right Window",
				},

				-- LSP navigation
				{
					"K",
					desc = "Hover Documentation",
				},

				{
					"gd",
					desc = "Go To Definition",
				},

				{
					"gr",
					desc = "Go To References",
				},
			},
		},
	},
}
