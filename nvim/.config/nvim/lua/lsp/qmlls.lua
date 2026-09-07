---@type vim.lsp.Config
return {
	"qmlls",
	cmd = { "/usr/bin/qmlls6" },
	filetypes = { "qml", "qmljs" },
	single_file_support = true,
	workspace_required = false,
	root_markers = { ".git", "shell.qml", "qml.ini", ".qmlls.ini" },
}
