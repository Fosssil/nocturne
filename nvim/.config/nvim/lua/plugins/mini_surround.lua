return {
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
}
