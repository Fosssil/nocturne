-- ~/.config/nvim/lua/plugins/multicursor.lua

return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",

	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local map = vim.keymap.set

		--------------------------------------------------
		-- Cursor Creation
		--------------------------------------------------

		map({ "n", "x" }, "<leader>mn", function()
			mc.matchAddCursor(1)
		end, {
			desc = "Next Match",
		})

		map({ "n", "x" }, "<leader>ms", function()
			mc.matchSkipCursor(1)
		end, {
			desc = "Skip Match",
		})

		map({ "n", "x" }, "<leader>mN", function()
			mc.matchAllAddCursors()
		end, {
			desc = "All Matches",
		})

		map({ "n", "x" }, "<leader>m<Up>", function()
			mc.lineAddCursor(-1)
		end, {
			desc = "Add Cursor Above",
		})

		map({ "n", "x" }, "<leader>m<Down>", function()
			mc.lineAddCursor(1)
		end, {
			desc = "Add Cursor Below",
		})

		--------------------------------------------------
		-- Mouse
		--------------------------------------------------

		map("n", "<C-LeftMouse>", mc.handleMouse)
		map("n", "<C-LeftDrag>", mc.handleMouseDrag)
		map("n", "<C-LeftRelease>", mc.handleMouseRelease)

		--------------------------------------------------
		-- Multicursor Layer
		--------------------------------------------------

		mc.addKeymapLayer(function(layer)
			-- Move between cursors
			layer({ "n", "x" }, "<Left>", mc.prevCursor)
			layer({ "n", "x" }, "<Right>", mc.nextCursor)

			-- Exit multicursor mode
			layer("n", "<Esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)

		--------------------------------------------------
		-- Highlights
		--------------------------------------------------

		local hl = vim.api.nvim_set_hl

		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { link = "Cursor" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
