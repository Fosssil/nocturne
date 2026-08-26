-- ~/.config/nvim/lua/plugins/lint.lua
return {
	{
		"mfussenegger/nvim-lint",

		event = {
			"BufReadPost",
			"BufNewFile",
		},

		cmd = {
			"Lint",
		},

		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "luacheck" },

				python = { "ruff" },

				sh = { "shellcheck" },
				bash = { "shellcheck" },

				javascript = { "oxlint" },
				typescript = { "oxlint" },

				html = { "htmlhint" },

				css = { "stylelint" },
				scss = { "stylelint" },

				json = { "jsonlint" },

				markdown = { "markdownlint-cli2" },

				yaml = { "yamllint" },

				dockerfile = { "hadolint" },

				terraform = { "tflint" },

				nix = { "statix" },

				go = { "golangcilint" },

				rust = { "clippy" },

				c = { "clangtidy" },
				cpp = { "clangtidy" },
			}

			local group = vim.api.nvim_create_augroup("NocturneLint", {
				clear = true,
			})

			vim.api.nvim_create_autocmd("BufWritePost", {
				group = group,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.api.nvim_create_user_command("Lint", function()
				lint.try_lint()
			end, {
				desc = "Run configured linter(s)",
			})
		end,
	},
}
