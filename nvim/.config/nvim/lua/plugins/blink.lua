-- ~/.config/nvim/lua/plugins/blink.lua
return {
	"saghen/blink.cmp",
	version = "1.*",
	-- build = "cargo build --release",

	dependencies = {
		"yaocccc/blink-cmp-cmdlinehistory",
		"mikavilpas/blink-ripgrep.nvim",
		"xieyonn/blink-cmp-dat-word",
		"xzbdmw/colorful-menu.nvim",
	},

	init = function()
		config = function(_, opts)
			require("colorful-menu").setup({
				ls = {
					lua_ls = { arguments_hl = "@comment" },
					basedpyright = { extra_info_hl = "@comment" },
					gopls = {
						align_type_to_right = true,
						preserve_type_when_truncate = true,
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

	-- ++ Blink Options +-----------------------------+
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {

		-- ++ Keymaps +-----------------------------------+
		keymap = {
			preset = "none",

			["<Down>"] = {
				"select_next",
				"fallback",
			},

			["<Up>"] = {
				"select_prev",
				"fallback",
			},

			["<Tab>"] = {
				"select_next",
				"fallback",
			},

			["<S-Tab>"] = {
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

		-- ++ appearance +--------------------------------+
		appearance = {
			nerd_font_variant = "mono",
		},

		-- ++ Completion Menu +---------------------------+
		completion = {
			-- Documentation menu
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 100,
			},

			-- Ghost Text
			ghost_text = {
				enabled = true,
				show_with_menu = true,
				show_with_selection = true,
				show_without_menu = false,
				show_without_selection = false,
			},

			-- Menu
			menu = {
				min_width = 45,
				max_height = 20,
				scrolloff = 2,
				scrollbar = true,
				direction_priority = { "s", "n" },
				-- Change border type in options.lua

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

		sources = {

			--Disabling snippets
			transform_items = function(_, items)
				local CompletionItemKind = require("blink.cmp.types").CompletionItemKind

				return vim.tbl_filter(function(item)
					return item.kind ~= CompletionItemKind.Snippet
				end, items)
			end,

			default = {
				"lsp",
				"path",
				"ripgrep",
				"buffer",
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
					-- default was buffer
					fallbacks = { "ripgrep" },
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
						prefix_min_len = 2,

						project_root_marker = ".git",

						backend = {
							use = "gitgrep-or-ripgrep",
						},

						ripgrep = {
							max_filesize = "1M",
							search_casing = "--smart-case",
							ripgrep = {
								additional_paths = { "/usr/share/dict/american-english" },
							},
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

		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"score",
				"exact",
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
