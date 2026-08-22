--==========================================================
-- Nocturne
-- Session autostart
--==========================================================

hl.on("hyprland.start", function()
	-- ─[ Clipboard ]─────────────────────────────────────────

	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- ─[ Desktop ]───────────────────────────────────────────

	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")

	-- ─[ OSD ]───────────────────────────────────────────────

	hl.exec_cmd("swayosd-server")
end)
