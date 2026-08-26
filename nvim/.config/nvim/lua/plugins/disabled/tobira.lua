-- ~/.config/nvim/lua/plugins/tobira.lua

return {
	"kamegoro/tobira.nvim",
	event = "VeryLazy",
	enabled = false,

	opts = {
		-- Show suggestion after 1 second of inactivity.
		idle_delay = 1000,

		-- Passive suggestions.
		idle_suggestions = true,

		-- Don't repeat suggestions too often (10 minutes).
		suggestion_cooldown = 600,

		-- Show each suggestion at most twice per session.
		max_shown = 2,

		-- Detect helper plugins and adjust suggestions.
		integrations = true,
	},
}
