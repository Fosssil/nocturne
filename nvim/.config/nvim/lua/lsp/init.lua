-- plugins/lsp.lua
-- │
-- ▼
-- require("lsp.init")
-- │
-- ▼
-- Capabilities
-- │
-- ▼
-- ────────────────────────────
-- │        │       │        │
-- ▼        ▼       ▼        ▼
-- lua_ls bashls jsonls html ...

-- ~/.config/nvim/lua/lsp/init.lua

local M = {}
M.capabilities = require("blink.cmp").get_lsp_capabilities()
return M
