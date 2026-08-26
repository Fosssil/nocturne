-- ~/.config/nvim/lua/core/keymaps.lua

-- ── Plugins with keymaps outside this file ──────────────────────────────────────────────
-- mini.surround
-- Blink
-- comment
-- comment-box
-- dial
-- hlsense
-- in_and_out
-- mini.move
-- multicursor
-- spider

local map = vim.keymap.set

-- Default options
local defaults = {
	noremap = true,
	silent = true,
}

-- Helper
local function key(mode, lhs, rhs, desc, extra)
	map(mode, lhs, rhs, vim.tbl_extend("force", defaults, { desc = desc }, extra or {}))

end

-- ── Align ───────────────────────────────────────────────────────────────────────────────
key("x", "<leader>a", "ga", "Align", { remap = true })

-- ── Empty line ──────────────────────────────────────────────────────────────────────────
key("n", "[<Space>", "O<Esc>", "Add Empty Line Above")
key("n", "]<Space>", "o<Esc>", "Add Empty Line Below")


-- ──────────────────────────────────────────────────────────────────────────────────────────
-- Telescope
-- ──────────────────────────────────────────────────────────────────────────────────────────

key("n", "<leader>ff", "<cmd>Telescope find_files<CR>", "Find Files")
key("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", "File Browser")
key("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", "Live Grep")
key("n", "<leader>fb", "<cmd>Telescope buffers<CR>", "Buffers")
key("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", "Help Tags")
key("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", "Recent Files")

-- Git / Telescope
key("n", "<leader>gs", "<cmd>Telescope git_status<CR>", "Git Status")
key("n", "<leader>gh", "<cmd>Telescope git_file_history<CR>", "Git File History")

-- Undo
key("n", "<leader>u", "<cmd>Telescope undo<CR>", "Undo History")

-- ──────────────────────────────────────────────────────────────────────────────────────────
-- Buffers
-- ──────────────────────────────────────────────────────────────────────────────────────────

key("n", "<leader>bn", "<cmd>bnext<CR>", "Next Buffer")
key("n", "<leader>bp", "<cmd>bprevious<CR>", "Previous Buffer")
key("n", "<leader>bd", "<cmd>Bdelete<CR>", "Delete Buffer")

-- ──────────────────────────────────────────────────────────────────────────────────────────
-- Formatting
-- ──────────────────────────────────────────────────────────────────────────────────────────

key({ "n", "x" }, "<leader>fd", function()
	local conform = require("conform")
	local bufnr = vim.api.nvim_get_current_buf()

	local before = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)

	conform.format({
		bufnr = bufnr,
		async = true,
		lsp_format = "fallback",
	}, function(err)
		if err then
			vim.notify("Formatting failed: " .. err, vim.log.levels.ERROR)
			return
		end

		vim.schedule(function()
			local after = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)

			if vim.deep_equal(before, after) then
				vim.notify("Nothing to format", vim.log.levels.INFO)
			else
				vim.notify("Formatted", vim.log.levels.INFO)
			end
		end)
	end)
end, "Format Buffer")

--------------------------------------------------
-- Arrow Keys (Disable arrow keys in n, i, v mode)
--------------------------------------------------

for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
	vim.keymap.set({ "n", "v" }, key, "<Nop>", {
		silent = true,
		desc = "Disable arrow key",
	})
end
--------------------------------------------------
-- General
--------------------------------------------------

key("n", "<leader>w", "<cmd>w<CR>", "Save File")
key("n", "<leader>q", "<cmd>q<CR>", "Quit")

--------------------------------------------------
-- Editing
--------------------------------------------------

key("v", "p", '"_dP', "Paste Without Yanking")
key({ "n", "v" }, "<leader>y", '"+y', "Yank To Clipboard")

--------------------------------------------------
-- Windows
--------------------------------------------------

-- Navigation
key("n", "<C-h>", "<C-w>h", "Focus Left Window")
key("n", "<C-j>", "<C-w>j", "Focus Lower Window")
key("n", "<C-k>", "<C-w>k", "Focus Upper Window")
key("n", "<C-l>", "<C-w>l", "Focus Right Window")

-- Creation
key("n", "<leader>sv", "<cmd>vsplit<CR>", "Vertical Split")
key("n", "<leader>sh", "<cmd>split<CR>", "Horizontal Split")

-- Closing
key("n", "<leader>wc", "<cmd>close<CR>", "Close Window")
key("n", "<leader>wo", "<cmd>only<CR>", "Close Other Windows")

-- Resize
key("n", "<C-Up>", "<cmd>resize +2<CR>", "Increase Window Height")
key("n", "<C-Down>", "<cmd>resize -2<CR>", "Decrease Window Height")
key("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "Decrease Window Width")
key("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "Increase Window Width")

-- Equalize
key("n", "<leader>we", "<C-w>=", "Equalize Windows")





--------------------------------------------------
-- LSP
--------------------------------------------------

key("n", "K", vim.lsp.buf.hover, "Hover Documentation")
key("n", "gd", vim.lsp.buf.definition, "Go to Definition")
key("n", "gr", vim.lsp.buf.references, "Go to References")

key("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
key("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

-- ──────────────────────────────────────────────────────────────────────────────────────────
-- Treesitter Textobjects
-- ──────────────────────────────────────────────────────────────────────────────────────────

key({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, "Around Function")

key({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, "Inside Function")

key({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, "Around Class")

key({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, "Inside Class")

key({ "x", "o" }, "aa", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end, "Around Parameter")

key({ "x", "o" }, "ia", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end, "Inside Parameter")

-- Treesitter Movement
key({ "n", "x", "o" }, "]m", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, "Next Function")

key({ "n", "x", "o" }, "[m", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, "Previous Function")

key({ "n", "x", "o" }, "]]", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, "Next Class")

key({ "n", "x", "o" }, "[[", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, "Previous Class")

-- Treesitter Movement Repeat
key({ "n", "x", "o" }, ";", function()
	require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()
end, "Next Treesitter Object")

key({ "n", "x", "o" }, ",", function()
	require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()
end, "Previous Treesitter Object")
