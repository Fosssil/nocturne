-- ~/.config/nvim/lua/plugins/telescope_undo.lua

return {
	"debugloop/telescope-undo.nvim",

	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
	},

	opts = {
		extensions = {
			undo = {
				use_delta = false,
				side_by_side = false,

				layout_strategy = "horizontal",

				layout_config = {
					height = 0.9,
					width = 0.9,
					preview_width = 0.55,
				},

				vim_diff_opts = {
					ctxlen = 3,
				},

				entry_format = "state #$ID, $STAT, $TIME",
				time_format = "%H:%M:%S",
				saved_only = false,
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)
		telescope.load_extension("undo")
	end,
}
