-- ~/.config/nvim/lua/plugins/grug_far.lua
return {
	{
		"MagicDuck/grug-far.nvim",
		enabled = false,
		cmd = { "GrugFar", "GrugFarWithin" },

		opts = {

			windowTitle = "Project Search & Replace",
			engine = "ripgrep",

			transient = true,

			minSearchChars = 2,

			history = {
				autoSave = true,
			},
			windowCreationCommand = "vertical botright split",
		},
	},
}
