---@type vim.lsp.Config
local config = {}

config.capabilities = {
	textDocument = {
		completion = {
			editsNearCursor = true,
		},
	},

	offsetEncoding = {
		"utf-8",
		"utf-16",
	},
}

---@class ClangdInitializeResult : lsp.InitializeResult
---@field offsetEncoding? string

---@param init_result ClangdInitializeResult
config.on_init = function(client, init_result)
	if init_result.offsetEncoding then
		client.offset_encoding = init_result.offsetEncoding
	end
end

return config
