hl.config({
	general = {
		border_size = 1,

		gaps_in = 6,
		gaps_out = 20,
		float_gaps = 0,
		gaps_workspaces = 0,

		-- Border colors:
		-- inactive → Catppuccin Mocha subtle neutral
		-- active   → Catppuccin Mocha Mauve
		-- nogroup  → to be finalized

		no_focus_fallback = false,

		resize_on_border = true,
		extend_border_grab_area = 8,
		hover_icon_on_border = true,

		allow_tearing = false,
		resize_corner = 0,
		modal_parent_blocking = true,
	},

	decoration = {
		rounding = 8,
		rounding_power = 4.0,

		active_opacity = 0.94,
		inactive_opacity = 0.92,
		fullscreen_opacity = 1.0,

		dim_modal = true,
		dim_inactive = false,
		dim_special = 0.2,

		border_part_of_window = true,
		blur = {
			enabled = true,

			size = 8,
			passes = 1,

			ignore_opacity = true,
			new_optimizations = true,
			xray = false,

			noise = 0.0117,
			contrast = 0.9,
			brightness = 1.5,

			vibrancy = 0.1696,
			vibrancy_darkness = 0.0,

			special = false,

			popups = true,
			popups_ignorealpha = 0.2,

			input_methods = false,
			input_methods_ignorealpha = 0.2,
		},
		shadow = {
			enabled = true,

			range = 8,
			render_power = 3,
			sharp = false,

			color = "0xee1a1a1a",
			-- color_inactive = "0xaa11111b",
			offset = { 0, 2 },
			scale = 1.0,
		},
	},
})
