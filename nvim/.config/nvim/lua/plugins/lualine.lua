-- ~/.config/nvim/lua/plugins/lualine.lua
return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},

	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-nvim",
				globalstatus = true,
				icons_enabled = true,
				always_divide_middle = true,

				component_separators = {
					left = "│",
					right = "│",
				},

				section_separators = {
					left = "",
					right = "",
				},
			},

			----------------------------------------------------------------
			-- Statusline
			----------------------------------------------------------------
			sections = {
				------------------------------------------------------------
				-- Left
				------------------------------------------------------------
				lualine_a = {
					{
						"mode",
						icon = "",
					},
				},

				lualine_b = {
					{
						"buffers",

						show_filename_only = true,
						hide_filename_extension = false,
						show_modified_status = true,

						mode = 0,

						max_length = function()
							return math.floor(vim.o.columns * 0.40)
						end,

						use_mode_colors = true,

						symbols = {
							modified = " 󰎂",
							alternate_file = "#",
							directory = "",
						},
					},
				},

				lualine_c = {},

				------------------------------------------------------------
				-- Right
				------------------------------------------------------------

				lualine_x = {

					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						update_in_insert = false,

						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
					},

					{
						"diff",
						symbols = {
							added = "+ ",
							modified = "✱ ",
							removed = "- ",
						},
						colored = true,
						cond = function()
							return vim.b.gitsigns_head ~= nil
						end,
					},
				},

				lualine_y = {
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })

						if #clients == 0 then
							return ""
						end

						return " " .. clients[1].name
					end,
				},

				lualine_z = {
					"location",
				},
			},

			extensions = {
				"lazy",
				"fzf",
				"mason",
				"oil",
			},
		})
	end,
}
