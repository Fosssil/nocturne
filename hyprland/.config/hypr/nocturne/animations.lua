-- ╭───────────────────────────────────────────────────────────────────╮
-- │ Nocturne                                                         │
-- │ Animation Curves                                                  │
-- ╰───────────────────────────────────────────────────────────────────╯

-- ─[ Curves ]────────────────────────────────────────────────────────

hl.curve("nocturneEase", {
	type = "bezier",
	points = {
		{ 0.16, 1.0 },
		{ 0.3, 1.0 },
	},
})

hl.curve("nocturneSmooth", {
	type = "bezier",
	points = {
		{ 0.22, 1.0 },
		{ 0.36, 1.0 },
	},
})

hl.curve("nocturneSpring", {
	type = "spring",
	mass = 1,
	stiffness = 78,
	dampening = 9.5,
})

hl.curve("nocturneMotion", {
	type = "spring",
	mass = 1,
	stiffness = 105,
	dampening = 14,
})

hl.curve("nocturneWorkspace", {
	type = "bezier",
	points = {
		{ 0.20, 0.85 },
		{ 0.35, 1.0 },
	},
})

-- ─[ Global ]────────────────────────────────────────────────────────

hl.config({
	animations = {
		enabled = true,
		workspace_wraparound = false,
	},
})

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 7,
	bezier = "nocturneEase",
})

-- ─[ Windows ]───────────────────────────────────────────────────────

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 5,
	spring = "nocturneSpring",
	style = "popin",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 5,
	spring = "nocturneSpring",
	style = "popin 82%",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 7,
	bezier = "nocturneEase",
	style = "popin 90%",
})

hl.animation({
	leaf = "windowsMove",
	enabled = true,
	speed = 4,
	-- spring = "nocturneSpring",
	spring = "nocturneMotion",
})

-- ─[ Workspaces ]────────────────────────────────────────────────────

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 7,
	bezier = "nocturneWorkspace",
	style = "slide 90%",
})

hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 7,
	bezier = "nocturneWorkspace",
	style = "slide 90%",
})

hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 7,
	bezier = "nocturneWorkspace",
	style = "slidefade 90%",
})

hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = 6,
	bezier = "nocturneSmooth",
	style = "slidefade 20%",
})

-- ─[ Focus ]─────────────────────────────────────────────────────────

hl.animation({
	leaf = "fadeSwitch",
	enabled = true,
	speed = 2,
	bezier = "nocturneEase",
})

hl.animation({
	leaf = "fadeDpms",
	enabled = true,
	speed = 10,
	bezier = "nocturneSmooth",
})

-- ─[ layers ]─────────────────────────────────────────────────────────────────────────────

hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 5,
	bezier = "nocturneSmooth",
	style = "fade",
})

hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 5,
	bezier = "nocturneSmooth",
	style = "fade",
})

hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 5,
	bezier = "nocturneSmooth",
	style = "fade",
})
