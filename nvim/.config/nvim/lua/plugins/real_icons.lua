return {
	"Mirsmog/real-icons.nvim",
	build = ":RealIcons install",
	opts = {
		icon_set = "catppuccin",
		integrations = {
			telescope = true,
			lualine = true,
			telescope_file_browser = true,
		},
	},
}
