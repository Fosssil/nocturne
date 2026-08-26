-- ~/.config/nvim/lua/plugins/format.lua
local prettier = {
	"prettierd",
	"prettier",
	stop_after_first = true,
}

local function first(bufnr, ...)
	local conform = require("conform")

	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end

	return select(1, ...)
end

return {
	{
		"stevearc/conform.nvim",

		event = "BufReadPre",

		cmd = {
			"ConformInfo",
			"Format",
		},

		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,

		opts = {
			default_format_opts = {
				lsp_format = "fallback",
			},

			log_level = vim.log.levels.ERROR,

			notify_on_error = true,
			notify_no_formatters = true,

			formatters_by_ft = {
				lua = { "stylua" },

				python = {
					"ruff_organize_imports",
					"ruff_format",
				},

				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },
				fish = { "fish_indent" },

				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,

				json = prettier,
				jsonc = prettier,

				html = prettier,
				css = prettier,
				scss = prettier,
				less = prettier,

				markdown = function(bufnr)
					return {
						first(bufnr, "prettierd", "prettier"),
						"injected",
					}
				end,

				yaml = { "yamlfmt" },
				toml = { "taplo" },
				xml = { "xmlformatter" },

				dockerfile = { "dockerfmt" },

				terraform = { "terraform_fmt" },
				helm = { "prettier" },

				nix = { "alejandra" },

				rust = { "rustfmt" },

				go = {
					"goimports",
					"gofumpt",
				},

				c = { "clang-format" },
				cpp = { "clang-format" },

				java = { "google-java-format" },
			},
		},

		config = function(_, opts)
			require("conform").setup(opts)

			vim.api.nvim_create_user_command("Format", function(args)
				local range

				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]

					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end

				require("conform").format({
					async = true,
					range = range,
					lsp_format = "fallback",
				})
			end, {
				desc = "Format buffer",
				range = true,
			})
		end,
	},
}
