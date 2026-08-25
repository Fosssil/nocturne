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
	stiffness = 70,
	dampening = 12,
})
