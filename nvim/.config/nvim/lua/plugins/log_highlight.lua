-- ~/.config/nvim/lua/plugins/log_highlight.lua
return {
	{
		"fei6409/log-highlight.nvim",
		ft = "log",

		opts = {
			extension = {
				"log",
				"out",
			},

			pattern = {
				".*%.log",
				".*%.out",
				".*logcat.*",
				".*journal.*",
			},
		},
	},
}
