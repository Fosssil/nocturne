hl.window_rule({
	name = "xwayland-video-bridge",

	match = {
		class = "xwaylandvideobridge",
	},

	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	max_size = { 1, 1 },
	opacity = "0.0 override",
})

hl.window_rule({
	name = "mpv-floating",

	match = {
		class = "mpv",
	},

	float = true,
	center = true,
	size = { 1200, 600 },

	opaque = true,
	opacity = "1.0 override",
})

hl.window_rule({
	name = "rofi",

	match = {
		class = "^(rofi)$",
		title = "^(rofi)$",
	},

	float = true,
})

hl.window_rule({
	name = "blueman-manager",

	match = {
		class = "^(blueman-manager)$",
	},

	float = true,
	move = { 975, 38 },
	size = { 935, 665 },
})

hl.window_rule({
	name = "pavucontrol",

	match = {
		class = "^(org.pulseaudio.pavucontrol)$",
	},

	float = true,
	move = { 970, 37 },
	size = { 940, 505 },
})

hl.window_rule({
	name = "xdg-desktop-portal-gtk",

	match = {
		class = "^(xdg-desktop-portal-gtk)$",
	},

	float = true,
	size = { 970, 611 },
})

hl.window_rule({
	name = "dolphin-library",

	match = {
		initial_title = "Library",
	},

	float = true,
	center = true,
	size = { 975, 470 },
})

hl.window_rule({
    name = "xwayland-video-bridge",
    match = { class = "xwaylandvideobridge" },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = { 1, 1 },
    opacity = "0.0 override",
})

hl.layer_rule({
	name = "rofi",
	match = {
		namespace = "rofi",
	},

	blur = true,
	blur_popups = true,
	dim_around = true,
})
