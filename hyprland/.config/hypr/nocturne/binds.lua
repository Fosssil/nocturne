-- ╭───────────────────────────────────────────────────────────────────╮
-- │ Nocturne                                                          │
-- │ Keybindings                                                       │
-- ╰───────────────────────────────────────────────────────────────────╯

local mainMod = "SUPER"
local secondMod = "ALT"
local shiftMod = "SHIFT"

-- ─[ Applications ]──────────────────────────────────────────────────

hl.bind(secondMod .. " + T", hl.dsp.exec_cmd("kitty"), { description = "Open terminal" })

hl.bind(
	secondMod .. " + B",
	hl.dsp.exec_cmd("/usr/bin/zen-browser"),
	{ description = "Open browser" }
)

hl.bind(secondMod .. " + E", hl.dsp.exec_cmd("dolphin"), { description = "Open file manager" })

hl.bind(
	secondMod .. " + R",
	hl.dsp.exec_cmd("rofi -show drun -i -theme ~/.config/rofi/launcher/theme.rasi"),
	{ description = "Open rofi menu" }
)

hl.bind(
	secondMod .. " + N",
	hl.dsp.exec_cmd(
		"obsidian --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
	),
	{ description = "Open obsidian" }
)

hl.bind(
	secondMod .. " + SPACE",
	hl.dsp.exec_cmd(
		"rofi -show calc -modi calc -no-show-match -no-sort -no-history -terse -no-bold -theme ~/.config/rofi/calc/theme.rasi"
	),
	{ description = "Open calculator" }
)
-- ─[ Window Management ]────────────────────────────────────────────

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close active window" })

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })

hl.bind(mainMod .. " + V", hl.dsp.window.float(), { description = "Toggle floating" })

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Toggle pseudotiling" })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- workspace
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
