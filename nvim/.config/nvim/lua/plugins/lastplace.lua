-- ~/.config/nvim/lua/plugins/lastplace.lua
return {
	"nxhung2304/lastplace.nvim",

	event = "BufReadPost",

	opts = {
		jump_only_if_not_visible = true,
		center_on_jump = true,
	},
}
