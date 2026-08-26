-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			local ts = require("nvim-treesitter")

			------------------------------------------------------------------
			-- Tree-sitter
			------------------------------------------------------------------

			ts.setup({})

			------------------------------------------------------------------
			-- Tree-sitter Textobjects
			------------------------------------------------------------------

			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,

					include_surrounding_whitespace = false,

					selection_modes = {
						["@function.outer"] = "V",
						["@class.outer"] = "V",
					},
				},

				move = {
					set_jumps = true,
				},
			})

			------------------------------------------------------------------
			-- Enable Tree-sitter for supported buffers
			------------------------------------------------------------------

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup(
					"TreesitterAutoStart",
					{ clear = true }
				),

				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			------------------------------------------------------------------
			-- Tree-sitter Context
			------------------------------------------------------------------

			require("treesitter-context").setup({
				enable = true,
				max_lines = 5,
				trim_scope = "outer",
				mode = "cursor",
				separator = "─",
				zindex = 20,
			})
		end,
	},
}
