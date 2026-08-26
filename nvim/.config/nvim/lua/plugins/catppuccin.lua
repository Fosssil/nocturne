-- ~/.config/nvim/lua/plugins/catppuccin.lua
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},

		transparent_background = false,
		float = {
			transparent = false,
			solid = false,
		},

		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		-- Text Styles

		no_italic = false,
		no_bold = false,
		no_underline = false,

		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = { "italic" },
			keywords = { "italic" },
			functions = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},

		-- LSP

		lsp_styles = {
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = {},
				ok = {},
			},

			underlines = {
				errors = { "underline" },
				warnings = { "underline" },
				hints = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},

			inlay_hints = {
				background = true,
			},
		},

		-- Highlight Overrides

		custom_highlights = function(colors)
			return {

				Normal = {
					bg = colors.mantle,
				},

				LineNr = {
					fg = colors.overlay2,
				},

				CursorLineNr = {
					fg = colors.peach,
					bold = true,
				},

				LazyNormal = { bg = colors.base },
				LazyBorder = { fg = colors.teal, bg = colors.surface1 },
				LazyTitle = { fg = colors.green, bg = colors.mantle, bold = true },

				----------------------------------------------------------------------
				-- Blink Completion Menu
				----------------------------------------------------------------------

				BlinkCmpMenu = {
					bg = colors.surface0,
				},

				BlinkCmpMenuBorder = {
					bg = colors.surface0,
					fg = colors.overlay1,
				},

				BlinkCmpMenuSelection = {
					bg = colors.surface1,
				},

				BlinkCmpDoc = {
					bg = colors.surface1,
				},

				BlinkCmpDocBorder = {
					bg = colors.surface1,
					fg = colors.overlay1,
				},

				----------------------------------------------------------------------
				-- Matched characters
				----------------------------------------------------------------------

				BlinkCmpLabelMatch = {
					fg = colors.peach,
					bold = true,
				},

				BlinkCmpLabelDescription = {
					fg = colors.overlay1,
					italic = true,
				},

				BlinkCmpSource = {
					fg = colors.overlay0,
					italic = true,
				},

				BlinkCmpGhostText = {
					fg = colors.overlay0,
					italic = true,
				},

				----------------------------------------------------------------------
				-- Semantic completion kinds
				----------------------------------------------------------------------

				BlinkCmpKindText = {
					fg = colors.subtext1,
				},

				BlinkCmpKindMethod = {
					fg = colors.lavender,
					bold = true,
				},

				BlinkCmpKindFunction = {
					fg = colors.mauve,
					bold = true,
				},

				BlinkCmpKindConstructor = {
					fg = colors.flamingo,
					bold = true,
				},

				BlinkCmpKindField = {
					fg = colors.teal,
					bold = true,
				},

				BlinkCmpKindVariable = {
					fg = colors.blue,
					bold = true,
				},

				BlinkCmpKindProperty = {
					fg = colors.teal,
					bold = true,
				},

				BlinkCmpKindClass = {
					fg = colors.yellow,
					bold = true,
				},

				BlinkCmpKindInterface = {
					fg = colors.pink,
					bold = true,
				},

				BlinkCmpKindStruct = {
					fg = colors.yellow,
					bold = true,
				},

				BlinkCmpKindModule = {
					fg = colors.peach,
					bold = true,
				},

				BlinkCmpKindUnit = {
					fg = colors.sky,
					bold = true,
				},

				BlinkCmpKindValue = {
					fg = colors.green,
					bold = true,
				},

				BlinkCmpKindEnum = {
					fg = colors.rosewater,
					bold = true,
				},

				BlinkCmpKindEnumMember = {
					fg = colors.rosewater,
					bold = true,
				},

				BlinkCmpKindKeyword = {
					fg = colors.red,
					bold = true,
				},

				BlinkCmpKindConstant = {
					fg = colors.maroon,
					bold = true,
				},

				BlinkCmpKindSnippet = {
					fg = colors.green,
					bold = true,
				},

				BlinkCmpKindFile = {
					fg = colors.sky,
					bold = true,
				},

				BlinkCmpKindFolder = {
					fg = colors.peach,
					bold = true,
				},

				BlinkCmpKindReference = {
					fg = colors.sapphire,
					bold = true,
				},

				BlinkCmpKindColor = {
					fg = colors.flamingo,
					bold = true,
				},

				BlinkCmpKindEvent = {
					fg = colors.pink,
					bold = true,
				},

				BlinkCmpKindOperator = {
					fg = colors.red,
					bold = true,
				},

				BlinkCmpKindTypeParameter = {
					fg = colors.lavender,
					bold = true,
				},

				GrugFarHelpHeader = {
					fg = colors.peach,
					bold = true,
				},

				GrugFarHelpHeaderKey = {
					fg = colors.mauve,
					bold = true,
				},

				GrugFarInputLabel = {
					fg = colors.blue,
					bold = true,
				},

				GrugFarResultsMatch = {
					fg = colors.peach,
					bold = true,
				},

				GrugFarResultsChange = {
					fg = colors.green,
					bold = true,
				},

				HlSearchLens = {
					fg = colors.base,
					bg = colors.yellow,
					bold = true,
				},

				HlSearchLensNear = {
					fg = colors.base,
					bg = colors.teal,
					bold = true,
				},

				HlSearchNear = {
					bg = colors.surface2,
					underline = true,
					bold = true,
				},

				Search = {
					bg = colors.surface1,
				},

				CurSearch = {
					fg = colors.base,
					bg = colors.peach,
					bold = true,
				},
			}
		end,

		-- Plugin Integrations

		auto_integrations = true,
		integrations = {

			blink_cmp = {
				style = "bordered",
			},

			lualine = {
				all = function(colors)
					return {
						normal = {
							a = {
								bg = colors.mauve,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.mauve,
							},
						},

						insert = {
							a = {
								bg = colors.green,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.green,
							},
						},
						visual = {
							a = {
								bg = colors.yellow,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.yellow,
							},
						},

						replace = {
							a = {
								bg = colors.red,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.red,
							},
						},

						command = {
							a = {
								bg = colors.peach,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.peach,
							},
						},

						terminal = {
							a = {
								bg = colors.green,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.green,
							},
						},
					}
				end,
			},

			gitsigns = {
				enabled = true,
				transparent = false,
			},

			telescope = {
				enabled = true,
			},

			treesitter = true,
			treesitter_context = true,

			mason = true,

			neotree = true,

			render_markdown = true,

			rainbow_delimiters = true,

			snacks = {
				enabled = true,
				indent_scope_color = "",
			},

			mini = {
				enabled = true,
				indentscope_color = "",
			},

			which_key = true,

			notify = true,

			noice = true,

			lsp_trouble = true,

			dap = true,
			dap_ui = true,

			navic = {
				enabled = true,
				custom_bg = "NONE",
			},

			illuminate = {
				enabled = true,
				lsp = true,
			},

			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = {},
					warnings = {},
					hints = {},
					information = {},
				},

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
