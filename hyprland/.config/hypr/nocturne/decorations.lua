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

		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,

		dim_modal = true,
		dim_inactive = false,
		dim_special = 0.2,

		border_part_of_window = true,
	},
})
