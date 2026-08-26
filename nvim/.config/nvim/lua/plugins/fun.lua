-- ~/.config/nvim/lua/plugins/fun.lua
return {

	{
		"eandrju/cellular-automaton.nvim",

		cmd = {
			"CellularAutomaton",
		},
	},

	{
		"axsaucedo/neovim-power-mode",

		cmd = {
			"PowerModeToggle",
			"PowerModeEnable",
			"PowerModeDisable",
			"PowerModeStyle",
			"PowerModeShake",
			"PowerModeFireWall",
			"PowerModeInterrupt",
			"PowerModeStatus",
		},

		opts = {
			auto_enable = false,

			particles = {
				preset = "stars",
			},

			backspace = {
				enabled = true,
				preset = "fire",
			},

			combo = {
				enabled = true,
			},

			shake = {
				mode = "scroll",
			},

			fire_wall = {
				enabled = true,
			},
		},
	},

	{
		"jerrywang1981/keystroke.nvim",

		cmd = {
			"KeyStrokeEnable",
			"KeyStrokeDisable",
			"KeyStrokeToggle",
			"KeyStroke",
		},

		config = function()
			require("keystroke").setup({
				auto_start = false,

				handlers = {
					["i"] = {
						sound = {
							callback = require("keystroke.sound").play_sound,

							options = {
								style = "typewriter",
								style = "bubble",
								style = "sword",
								style = "mario",
								style = "default",
							},
						},
					},

					["*"] = {},
				},
			})
		end,
	},
}
