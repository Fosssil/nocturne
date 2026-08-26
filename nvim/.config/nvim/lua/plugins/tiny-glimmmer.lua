return {
	{
		"rachartier/tiny-glimmer.nvim",
		enabled = false,
		event = "VeryLazy",
		priority = 10,

		opts = {
			------------------------------------------------------------------
			-- General
			------------------------------------------------------------------
			enabled = true,
			disable_warnings = true,
			autoreload = true,

			refresh_interval_ms = 10,
			text_change_batch_timeout_ms = 50,

			------------------------------------------------------------------
			-- Operations
			------------------------------------------------------------------
			overwrite = {
				auto_map = true,

				yank = {
					enabled = true,
					default_animation = {
						name = "fade",
						settings = {
							from_color = "DiffText",
							to_color = "Normal",
						},
					},
				},

				paste = {
					enabled = true,
					default_animation = {
						name = "reverse_fade",
						settings = {
							from_color = "DiffAdd",
							to_color = "Normal",
						},
					},

					paste_mapping = "p",
					Paste_mapping = "P",
				},

				search = {
					enabled = true,
					default_animation = {
						name = "fade",
						settings = {
							from_color = "Search",
							to_color = "Normal",
						},
					},

					next_mapping = "n",
					prev_mapping = "N",
				},

				undo = {
					enabled = false,
				},

				redo = {
					enabled = false,
				},
			},

			------------------------------------------------------------------
			-- Integrations
			------------------------------------------------------------------
			support = {
				substitute = {
					enabled = false,
				},
			},

			------------------------------------------------------------------
			-- Presets
			------------------------------------------------------------------
			presets = {
				pulsar = {
					enabled = false,
				},
			},

			transparency_color = nil,

			------------------------------------------------------------------
			-- Base animations
			------------------------------------------------------------------
			animations = {
				fade = {
					max_duration = 240,
					min_duration = 160,

					easing = "outQuad",

					chars_for_max_duration = 12,

					from_color = "Visual",
					to_color = "Normal",

					font_style = {},
				},

				reverse_fade = {
					max_duration = 240,
					min_duration = 160,

					easing = "outQuad",

					chars_for_max_duration = 12,

					from_color = "Visual",
					to_color = "Normal",

					font_style = {},
				},
			},

			------------------------------------------------------------------
			-- Disabled filetypes
			------------------------------------------------------------------
			hijack_ft_disabled = {
				"alpha",
				"snacks_dashboard",
			},

			------------------------------------------------------------------
			-- Virtual text
			------------------------------------------------------------------
			virt_text = {
				priority = 2048,
			},
		},
	},
}
