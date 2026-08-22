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

-- ─[ Window Management ]────────────────────────────────────────────

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close active window" })

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })

hl.bind(mainMod .. " + V", hl.dsp.window.float(), { description = "Toggle floating" })

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Toggle pseudotiling" })
