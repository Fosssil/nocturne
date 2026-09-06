---@type vim.lsp.Config
local config = {}

config.cmd = {
	"qmlls", "-E"
}

config.filetypes = {
	"qml",
	"qmljs",
}

return config
