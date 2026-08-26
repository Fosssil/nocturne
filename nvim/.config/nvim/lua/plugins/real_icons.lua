return {
	"Mirsmog/real-icons.nvim",
	build = ":RealIcons install",
	opts = {
		integrations = {
			telescope = true,
			lualine = true,
		},
	},
}
