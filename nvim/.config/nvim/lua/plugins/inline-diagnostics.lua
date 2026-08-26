-- ~/.config/nvim/lua/plugins/inline-diagnostics.lua
return {
	"rachartier/tiny-inline-diagnostic.nvim",

	event = "LspAttach",

	priority = 1000,

	opts = {
		----------------------------------------------------------------------
		-- Appearance
		----------------------------------------------------------------------
		preset = "powerline",

		transparent_bg = false,
		transparent_cursorline = true,

		----------------------------------------------------------------------
		-- Highlight Groups
		----------------------------------------------------------------------
		hi = {
			error = "DiagnosticError", -- Highlight for error diagnostics
			warn = "DiagnosticWarn", -- Highlight for warning diagnostics
			info = "DiagnosticInfo", -- Highlight for info diagnostics
			hint = "DiagnosticHint", -- Highlight for hint diagnostics

			arrow = "NonText", -- Highlight for the arrow pointing to diagnostic
			background = "CursorLine", -- Background highlight for diagnostics
			mixing_color = "Normal", -- Color to blend background with (or "None")
		},

		----------------------------------------------------------------------
		-- Behaviour
		----------------------------------------------------------------------
		options = {

			show_source = {
				enabled = false,
			},

			use_icons_from_diagnostic = true,
			set_arrow_to_diag_color = false,
			show_code = false,

			throttle = 10,
			------------------------------------------------------------------
			-- Messages
			------------------------------------------------------------------

			add_messages = {
				messages = true,
				display_count = true,
				use_max_severity = false,
				show_multiple_glyphs = false,
			},

			------------------------------------------------------------------
			-- Multiple lines
			------------------------------------------------------------------

			multilines = {
				enabled = true,
				always_show = true,
				trim_whitespaces = true,
			},

			------------------------------------------------------------------
			-- Related diagnostics
			------------------------------------------------------------------

			show_related = {
				enabled = false,
			},

			------------------------------------------------------------------
			-- Cursor behaviour
			------------------------------------------------------------------
			show_diags_only_under_cursor = false,

			enable_on_insert = false,

			enable_on_select = false,

			------------------------------------------------------------------
			-- Wrapping
			------------------------------------------------------------------

			overflow = {
				mode = "wrap",
				padding = 1,
			},

			break_line = {
				enabled = false,
			},

			------------------------------------------------------------------
			-- Formatting
			------------------------------------------------------------------

			format = function(diag)
				local msg = diag.message

				msg = msg:gsub("%.$", "")

				msg = msg:gsub("^Unused local ", "Unused local: ")
				msg = msg:gsub("^Unused function ", "Unused function: ")
				msg = msg:gsub("^Undefined global ", "Unknown variable: ")
				msg = msg:gsub("^Link to non%-existent link definition with label ", "Missing link: ")

				return msg
			end,

			------------------------------------------------------------------

			override_open_float = true,
		},
	},
}
