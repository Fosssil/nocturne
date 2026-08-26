-- ~/.config/nvim/lua/core/options.lua
local opt = vim.opt

-- Basic UI settings
opt.shortmess:append("I") -- Skip intro
opt.mouse = "nv" -- Mouse support is 'on'
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.cursorline = true -- Highlight cursorline
opt.laststatus = 3 -- Global statusline
opt.linebreak = true -- Prevent mid-word splitting
opt.cmdheight = 0 -- New cmdline popup UX
opt.list = false -- Shows invisible characters
opt.formatoptions:remove({ "c", "r", "o" }) -- Don't auto comment new lines
opt.errorbells = false -- Disable error bell
opt.visualbell = false -- Disable visual bell
opt.splitkeep = "screen"

-- Behaviour
opt.smoothscroll = true
opt.inccommand = "split" -- Previews substitutions
opt.clipboard = "unnamedplus" -- System clipboard sync
opt.scrolloff = 0 -- Keep content visible '0' lines below and above | Previous 8
opt.undofile = true -- Persistent undo without swap clutter
opt.swapfile = false -- Turn off swap file
opt.signcolumn = "yes" -- vertical column to the left of the line numbers
opt.confirm = true -- Confirm to save before exiting
opt.completeopt = { "menu", "menuone", "noselect" } -- Completion menu behavior

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false
opt.foldlevel = 99

-- Indentation
opt.tabstop = 4 -- Tabs occupy 4 columns
opt.softtabstop = 4 -- Tab/Backspace uses 4 columns
opt.shiftwidth = 4 -- Indentation width
opt.expandtab = false -- Use tabs instead of spaces
opt.autoindent = true -- Autoindent
opt.smartindent = true -- Smart indentation
opt.breakindent = true -- Wrap indent visually
opt.shiftround = true -- Round indentation to shiftwidth

-- Search
opt.ignorecase = true -- Ignore case...
opt.smartcase = true -- ...unless capital in search
opt.hlsearch = true -- Highlight matches
opt.incsearch = true -- Incremental search
opt.wrapscan = true -- Search stop at file end

-- Split behavior
opt.splitbelow = true -- Horizontal splits below
opt.splitright = true -- Vertical splits to the right

-- Performance
opt.updatetime = 250 -- Faster completion
opt.timeoutlen = 300 -- Faster mapped sequences

-- Optional:
-- opt.lazyredraw = true -- Optimization for macros or fast edits
-- opt.colorcolumn = "80" -- enable for projects with strict line-length limits.
-- opt.modeline = true -- Special comments in files that set buffer-local options
-- opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Tabs, trailing spaces
-- opt.scrolljump = 5 -- Smooth scroll
-- opt.cursorcolumn = true                               -- Highlight cursorcolumn
-- opt.mousemodel = "extend" -- Better mouse behavior on selecting/scrolling
