-- ~/.config/nvim/lua/plugins/blink.lua
return {
	"saghen/blink.cmp",
	version = "1.*",
	-- build = "cargo build --release",

	dependencies = {
		"nvim-mini/mini.icons",
		"onsails/lspkind.nvim",
		"xzbdmw/colorful-menu.nvim",
		"xieyonn/blink-cmp-dat-word",
		"mikavilpas/blink-ripgrep.nvim",
		"yaocccc/blink-cmp-cmdlinehistory",
	},

	-- ++ Config for colorful-menu +------------------+
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
		vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", {
			bold = true,
		})
		require("blink.cmp").setup(opts)
	end,

	-- ++ function to set enter behavior in cmdline +-+
	init = function()
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
				window = { border = "bold" },
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
				border = "bold", -- We can hange border type (for floating windows) in options.lua
				draw = {
					gap = 1,
					padding = { 1, 2 },
					align_to = "cursor",
					treesitter = { "lsp" },
					columns = {
						{ "label", gap = 3 },
						{ "kind_icon" },
						{ "kind" },
						-- { "source_name" },
						{ "source_id" },
					},
					components = {
						kind = {
							width = {
								min = 9,
								max = 12,
							},
						},
						label = {
							width = {
								fill = true,
								max = 60,
							},
							-- Text
							text = function(ctx)
								local highlights_info = require("colorful-menu").blink_highlights(ctx)
								if highlights_info ~= nil then
									-- Or you want to add more item to label
									return highlights_info.label
								else
									return ctx.label
								end
							end,
							-- highlight
							highlight = function(ctx)
								local highlights = {}
								local highlights_info = require("colorful-menu").blink_highlights(ctx)
								if highlights_info ~= nil then
									highlights = highlights_info.highlights
								end
								for _, idx in ipairs(ctx.label_matched_indices) do
									table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
								end
								-- Do something else
								return highlights
							end,
						},
						kind_icon = {
							ellipsis = false,
							-- text
							text = function(ctx)
								if ctx.source_name ~= "Path" then
									return require("lspkind").symbol_map[ctx.kind] or "" .. ctx.icon_gap
								end
								local is_unknown_type = vim.tbl_contains(
									{ "link", "socket", "fifo", "char", "block", "unknown" },
									ctx.item.data.type
								)
								local mini_icon, _ = require("mini.icons").get(
									is_unknown_type and "os" or ctx.item.data.type,
									is_unknown_type and "" or ctx.label
								)
								return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
							end,
							-- highlight
							highlight = function(ctx)
								if ctx.source_name ~= "Path" then
									return ctx.kind_hl
								end
								local is_unknown_type = vim.tbl_contains(
									{ "link", "socket", "fifo", "char", "block", "unknown" },
									ctx.item.data.type
								)
								local mini_icon, mini_hl = require("mini.icons").get(
									is_unknown_type and "os" or ctx.item.data.type,
									is_unknown_type and "" or ctx.label
								)
								return mini_icon ~= nil and mini_hl or ctx.kind_hl
							end,
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
