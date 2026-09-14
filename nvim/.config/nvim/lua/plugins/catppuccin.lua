-- ~/.config/nvim/lua/plugins/catppuccin.lua
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "mocha",
		no_bold = false,
		no_italic = false,
		no_underline = false,
		term_colors = true,
		transparent_background = false,
		background = { light = "latte", dark = "mocha" },
		float = { solid = false, transparent = false },
		dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			keywords = { "italic" },
			loops = { "italic" },
			functions = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},

		-- ++ LSP +---------------------------------------+
		lsp_styles = {
			inlay_hints = { background = true },
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				warnings = { "underline" },
				hints = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
		},

		-- ++ Highlight Overrides +-----------------------+
		custom_highlights = function(colors)
			return {
				Normal = { bg = colors.mantle },
				-- Line
				LineNr = { fg = colors.overlay2 },
				CursorLineNr = { fg = colors.peach, bold = true },
				-- Lazy
				LazyNormal = { bg = colors.base },
				LazyBorder = { fg = colors.teal, bg = colors.surface1 },
				LazyTitle = { fg = colors.green, bg = colors.mantle, bold = true },

				-- ++ Blink Completion Menu +---------------------+

				-- Menu
				BlinkCmpMenu = { bg = colors.mantle },
				BlinkCmpMenuSelection = { bg = colors.surface1 },
				BlinkCmpDoc = { bg = colors.surface0 },

				-- Borders
				-- BlinkCmpMenuBorder = { bg = colors.mantle, fg = colors.overlay1 },
				-- BlinkCmpDocBorder = { bg = colors.surface0, fg = colors.overlay1 },

				-- Matched / secondary information
				BlinkCmpLabelMatch = { fg = colors.peach, bold = true },
				BlinkCmpLabelDescription = { fg = colors.subtext1, italic = true },
				BlinkCmpSource = { fg = colors.overlay1, italic = true },
				BlinkCmpGhostText = { fg = colors.overlay0, italic = true },

				-- Semantic completion kinds
				BlinkCmpKindText = { fg = colors.subtext1 },
				BlinkCmpKindMethod = { fg = colors.lavender, bold = true },
				BlinkCmpKindFunction = { fg = colors.mauve, bold = true },
				BlinkCmpKindConstructor = { fg = colors.flamingo, bold = true },

				BlinkCmpKindField = { fg = colors.teal, bold = true },
				BlinkCmpKindVariable = { fg = colors.blue, bold = true },
				BlinkCmpKindProperty = { fg = colors.sapphire, bold = true },

				BlinkCmpKindClass = { fg = colors.yellow, bold = true },
				BlinkCmpKindInterface = { fg = colors.pink, bold = true },
				BlinkCmpKindStruct = { fg = colors.peach, bold = true },

				BlinkCmpKindModule = { fg = colors.peach, bold = true },
				BlinkCmpKindUnit = { fg = colors.sky, bold = true },
				BlinkCmpKindValue = { fg = colors.green, bold = true },

				BlinkCmpKindEnum = { fg = colors.rosewater, bold = true },
				BlinkCmpKindEnumMember = { fg = colors.flamingo, bold = true },

				BlinkCmpKindKeyword = { fg = colors.red, bold = true },
				BlinkCmpKindConstant = { fg = colors.maroon, bold = true },

				BlinkCmpKindSnippet = { fg = colors.green, bold = true },

				BlinkCmpKindFile = { fg = colors.sky, bold = true },
				BlinkCmpKindFolder = { fg = colors.yellow, bold = true },

				BlinkCmpKindReference = { fg = colors.sapphire, bold = true },
				BlinkCmpKindColor = { fg = colors.flamingo, bold = true },
				BlinkCmpKindEvent = { fg = colors.pink, bold = true },
				BlinkCmpKindOperator = { fg = colors.red, bold = true },
				BlinkCmpKindTypeParameter = { fg = colors.lavender, bold = true },

				-- ++ Grug Far +----------------------------------+
				GrugFarInputLabel = { fg = colors.blue, bold = true },
				GrugFarHelpHeader = { fg = colors.peach, bold = true },
				GrugFarResultsMatch = { fg = colors.peach, bold = true },
				GrugFarHelpHeaderKey = { fg = colors.mauve, bold = true },
				GrugFarResultsChange = { fg = colors.green, bold = true },

				-- ++ Hlsearch +----------------------------------+
				Search = { bg = colors.surface1 },
				CurSearch = { fg = colors.base, bg = colors.peach, bold = true },
				HlSearchLens = { fg = colors.base, bg = colors.yellow, bold = true },
				HlSearchLensNear = { fg = colors.base, bg = colors.teal, bold = true },
				HlSearchNear = { bg = colors.surface2, underline = true, bold = true },
			}
		end,

		-- ++ Plugin Integrations +-----------------------+
		auto_integrations = true,
		integrations = {
			blink_pairs = true,
			blink_cmp = { style = "bordered" },
			blink_indent = true,
			lualine = {
				all = function(colors)
					return {
						normal = {
							a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
							b = { fg = colors.mauve },
						},
						insert = {
							a = { bg = colors.green, fg = colors.base, gui = "bold" },
							b = { fg = colors.green },
						},
						visual = {
							a = { bg = colors.yellow, fg = colors.base, gui = "bold" },
							b = { fg = colors.yellow },
						},
						replace = {
							a = { bg = colors.red, fg = colors.base, gui = "bold" },
							b = { fg = colors.red },
						},
						command = {
							a = { bg = colors.peach, fg = colors.base, gui = "bold" },
							b = { fg = colors.peach },
						},
						terminal = {
							a = { bg = colors.green, fg = colors.base, gui = "bold" },
							b = { fg = colors.green },
						},
					}
				end,
			},
			colorful_winsep = { enabled = true, color = "peach" },
			gitsigns = { enabled = true, transparent = false },
			grug_far = true,
			telescope = { enabled = true },
			treesitter = true,
			treesitter_context = true,
			mason = true,
			neotree = true,
			render_markdown = true,
			nvim_web_devicons = true,
			nvim_surround = true,
			rainbow_delimiters = true,
			snacks = { enabled = true, indent_scope_color = "" },
			mini = { enabled = true, indentscope_color = "" },
			which_key = true,
			notify = true,
			noice = true,
			lsp_trouble = true,
			dap = true,
			dap_ui = true,
			navic = { enabled = true, custom_bg = "NONE" },
			illuminate = { enabled = true, lsp = true },
			native_lsp = {
				enabled = true,
				virtual_text = { errors = {}, warnings = {}, hints = {}, information = {} },
				underlines = {
					errors = { "underline" },
					warnings = { "underline" },
					hints = { "underline" },
					information = { "underline" },
				},
			},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
