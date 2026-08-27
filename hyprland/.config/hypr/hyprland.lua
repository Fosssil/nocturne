-- ╭───────────────────────────────────────────────────────────────────╮
-- │ Nocturne                                                          │
-- │ Hyprland 0.56.2                                                   │
-- ╰───────────────────────────────────────────────────────────────────╯

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)

require("nocturne.monitors")
require("nocturne.keybindings")
require("nocturne.autostart")
require("nocturne.config")
require("nocturne.layout")
require("nocturne.gestures")
require("nocturne.decorations")
require("nocturne.animations")
require("nocturne.env")

local colors = require("themes.catppuccin-mocha")
