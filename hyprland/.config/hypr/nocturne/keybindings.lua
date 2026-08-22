-- ╭───────────────────────────────────────────────────────────────────╮
-- │ Nocturne                                                          │
-- │ Keybindings                                                       │
-- ╰───────────────────────────────────────────────────────────────────╯

local mainMod = "SUPER"
local secondMod = "ALT"

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
-- Clipboard
hl.bind(
	secondMod .. " + V",
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu -p 'Clipboard' -i -theme ~/.config/rofi/clipboard/theme.rasi | cliphist decode | wl-copy"
	),
	{ description = "Open Clipboard" }
)
-- Screenshot
hl.bind(
	"" .. " + PRINT",
	hl.dsp.exec_cmd("hyprshot -m output --freeze --output-folder /home/$USER/Pictures/Screenshots"),
	{
		description = "Take full Screenshot",
	}
)

hl.bind(
	"SHIFT" .. " + PRINT",
	hl.dsp.exec_cmd("hyprshot -m region --freeze --output-folder /home/$USER/Pictures/Screenshots"),
	{
		description = "Take regional Screenshot",
	}
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

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
	{ locked = true, repeating = true }
)

-- ─[ Window Resize ]───────────────────────────────────────────────

local resizeStep = 40

hl.bind(
	mainMod .. " + SHIFT + left",
	hl.dsp.window.resize({ x = -resizeStep, y = 0, relative = true }),
	{ repeating = true, description = "Resize window left" }
)

hl.bind(
	mainMod .. " + SHIFT + right",
	hl.dsp.window.resize({ x = resizeStep, y = 0, relative = true }),
	{ repeating = true, description = "Resize window right" }
)

hl.bind(
	mainMod .. " + SHIFT + up",
	hl.dsp.window.resize({ x = 0, y = -resizeStep, relative = true }),
	{ repeating = true, description = "Resize window up" }
)

hl.bind(
	mainMod .. " + SHIFT + down",
	hl.dsp.window.resize({ x = 0, y = resizeStep, relative = true }),
	{ repeating = true, description = "Resize window down" }
)

hl.bind(
	mainMod .. " + J",
	hl.dsp.layout("togglesplit"),
	{ description = "Toggle split orientation" }
)

-- Example window rules that are useful
-- Ignore maximize requests from all apps. You'll probably like this.

local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
