-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},

	{
		"nvim-mini/mini.surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("mini.surround").setup(opts)

			require("which-key").add({
				{ "s", group = "Surround" },
				{ "sa", desc = "Add Surrounding" },
				{ "sd", desc = "Delete Surrounding" },
				{ "sr", desc = "Replace Surrounding" },
				{ "sf", desc = "Find Surrounding Right" },
				{ "sF", desc = "Find Surrounding Left" },
				{ "sh", desc = "Highlight Surrounding" },
			})
		end,
	},
}
