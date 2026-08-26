---@type vim.lsp.Config
local config = {}

config.capabilities = {
    experimental = {
        showReferencesCommandId = "client.showReferences",
    },
}

return config
