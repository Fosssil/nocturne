-- ~/.config/nvim/lua/plugins/blink.lua
return {
	"saghen/blink.cmp",

	version = "1.*",

	-- build = "cargo build --release",

	dependencies = {
		"rafamadriz/friendly-snippets",
		"yaocccc/blink-cmp-cmdlinehistory",
		"mikavilpas/blink-ripgrep.nvim",
		"xieyonn/blink-cmp-dat-word",
		"xzbdmw/colorful-menu.nvim",
	},
	init = function()
		config = function(_, opts)
			require("colorful-menu").setup({
				ls = {
					lua_ls = {
						arguments_hl = "@comment",
					},

					gopls = {
						align_type_to_right = true,
						preserve_type_when_truncate = true,
					},

					basedpyright = {
						extra_info_hl = "@comment",
					},

					fallback = true,
					fallback_extra_info_hl = "@comment",
				},

				fallback_highlight = "@variable",
				max_width = 60,
			})

			require("blink.cmp").setup(opts)
		end

		vim.api.nvim_create_autocmd("CmdlineEnter", {
			callback = function()
				local t = vim.fn.getcmdtype()

				if t == ":" or t == "/" or t == "?" then
					vim.schedule(function()
						if vim.fn.mode() == "c" then
							require("blink.cmp").show()
						end
					end)
				end
			end,
		})
	end,
	opts = {
		keymap = {
			-- We'll design this ourselves
			preset = "none",

			["<Down>"] = {
				"select_next",
				"fallback",
			},

			["<Up>"] = {
				"select_prev",
				"fallback",
			},

			["<CR>"] = {
				"accept",
				"fallback",
			},

			["<Esc>"] = {
				"cancel",
				"fallback",
			},
		},

		snippets = {
			preset = "default",
			opts = {
				use_label_description = true,
			},
		},

		sources = {

			default = {
				"lsp",
				"buffer",
				"snippets",
				"path",
				"ripgrep",
			},

			per_filetype = {
				lua = {
					inherit_defaults = true,
					"lazydev",
				},
				markdown = {
					inherit_defaults = true,
					"datword",
				},

				text = {
					inherit_defaults = true,
					"datword",
				},

				gitcommit = {
					inherit_defaults = true,
					"datword",
				},

				rst = {
					inherit_defaults = true,
					"datword",
				},
			},
			providers = {
				cmdline = {
					min_keyword_length = function(ctx)
						if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
							return 2
						end

						return 0
					end,
				},

				lazydev = {
					name = "Lua",
					module = "lazydev.integrations.blink",

					-- score_offset = 200,
				},

				lsp = {
					name = "LSP",
					fallbacks = { "buffer" },
					-- score_offset = 100,
				},

				path = {
					name = "Path",
					-- score_offset = 20,
				},

				buffer = {
					name = "Buf",
					-- score_offset = 5,
				},

				snippets = {
					name = "Snip",
					-- score_offset = -10,
				},

				clhistory = {
					name = "Hist",
					module = "cmdlinehistory",
					-- score_offset = 75,

					opts = {
						fixedkeyword = true,
					},
				},

				ripgrep = {
					name = "Proj",
					module = "blink-ripgrep",
					-- score_offset = -2,

					opts = {
						prefix_min_len = 4,

						backend = {
							use = "gitgrep-or-ripgrep",
						},

						ripgrep = {
							max_filesize = "1M",
							search_casing = "--smart-case",
						},

						debug = false,
					},
				},

				datword = {
					name = "Dict",
					module = "blink-cmp-dat-word",

					-- score_offset = -15,
					min_keyword_length = 3,

					opts = {
						paths = {
							"/usr/share/dict/american-english",
						},

						spellsuggest = true,
					},
				},
			},
		},

		completion = {
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 100,
			},

			ghost_text = {
				enabled = true,

				show_with_selection = true,
				show_without_selection = false,

				show_with_menu = true,
				show_without_menu = false,
			},

			menu = {

				direction_priority = function()
					local blink = require("blink.cmp")

					local ctx = blink.get_context()
					local item = blink.get_selected_item()

					if not ctx or not item then
						return { "s", "n" }
					end

					local text = item.textEdit and item.textEdit.newText or item.insertText or item.label

					if text:find("\n") then
						vim.g.blink_cmp_upwards_ctx_id = ctx.id
						return { "n", "s" }
					end

					if vim.g.blink_cmp_upwards_ctx_id == ctx.id then
						return { "n", "s" }
					end

					return { "s", "n" }
				end,

				min_width = 45,
				max_height = 20,
				scrolloff = 2,
				scrollbar = true,

				draw = {
					components = {
						label = {
							width = {
								fill = true,
								max = 60,
							},

							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,

							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},

						kind = {
							width = {
								min = 9,
								max = 12,
							},
						},

						kind_icon = {
							ellipsis = false,

							text = function(ctx)
								return " " .. ctx.kind_icon .. "  "
							end,

							highlight = function(ctx)
								return {
									{
										group = ctx.kind_hl,
										priority = 20000,
									},
								}
							end,
						},
					},

					align_to = "label",
					padding = { 2, 2 },
					gap = 3,

					columns = {
						{ "kind_icon" },
						{
							"label",
							gap = 2,
						},
						{
							"kind",
						},
						{
							"source_name",
						},
					},
				},
			},
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				"score",
				"sort_text",
				"label",
			},
		},

		cmdline = {
			keymap = {
				preset = "inherit",

				--[[ ["<CR>"] = {
					"accept_and_enter",
					"fallback",
				}, ]]
			},

			sources = function()
				local t = vim.fn.getcmdtype()

				if t == ":" then
					return {
						"clhistory",
						"cmdline",
						"buffer",
					}
				end

				if t == "/" or t == "?" then
					return {
						"clhistory",
						"buffer",
					}
				end

				return {}
			end,

			completion = {
				menu = {
					auto_show = function()
						return vim.fn.getcmdtype() == ":"
					end,
				},

				ghost_text = {
					enabled = true,
				},
			},
		},
	},
}
