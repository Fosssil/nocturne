-- ~/.config/nvim/lua/plugins/in-and-out.lua

return {
	"ysmb-wtsg/in-and-out.nvim",

	keys = {
		{
			"<C-CR>",
			function()
				require("in-and-out").in_and_out()
			end,
			mode = "i",
			desc = "Jump out of surrounding pair",
		},
	},
}
