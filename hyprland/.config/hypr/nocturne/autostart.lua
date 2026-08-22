--==========================================================
-- Nocturne
-- Session autostart
--==========================================================

hl.on("hyprland.start", function()
	-- Theme / environment initialization
	-- hl.exec_cmd("~/.config/hypr/scripts/theme.sh")

	-- Clipboard history
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("waybar")

	-- OSD daemon
	hl.exec_cmd("swayosd-server")
end)
