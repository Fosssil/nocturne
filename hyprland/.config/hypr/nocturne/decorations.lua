local colors = require("themes.catppuccin-mocha")
hl.config({
	general = {
		border_size = 2,

		gaps_in = 4,
		gaps_out = 10,
		float_gaps = 0,
		gaps_workspaces = 0,

		col = {
			active_border = colors.mauve,
			inactive_border = colors.surface1,
			nogroup_border = colors.peach,
			nogroup_border_active = colors.red,
		},

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

		active_opacity = 1,
		inactive_opacity = 0.90,
		fullscreen_opacity = 1.0,

		dim_modal = true,
		dim_inactive = false,
		dim_special = 0.2,

		border_part_of_window = true,
		blur = {
			enabled = false,

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

			-- color = "0xee1a1a1a",
			-- color_inactive = "0xaa11111b",
			color = "#" .. colors.crustAlpha .. "cc",
			offset = { 0, 2 },
			scale = 1.0,
		},
	},
})
