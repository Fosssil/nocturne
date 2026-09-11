-- ~/.config/nvim/lua/plugins/mason_autoinstaller.lua
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},

	opts = {
		ensure_installed = {

			-- ++ Language Servers +--------------------------+
			"ansiblels",
			"bashls",
			"basedpyright",
			"cssls",
			"dockerls",
			"docker_compose_language_service",
			"clangd",
			"gopls",
			"gh_actions_ls",
			"html",
			"jsonls",
			"lua_ls",
			"marksman",
			"rust_analyzer",
			"yamlls",
			"taplo",
			"terraformls",

			-- ++ Formatters +--------------------------------+
			"alejandra",
			"clang-format",
			"dockerfmt",
			"goimports",
			"gofumpt",
			"google-java-format",
			"markdownlint-cli2",
			"prettier",
			"prettierd",
			"qmlformat",
			"rustfmt",
			"ruff_format",
			"ruff_organise_imports",
			"shfmt",
			"stylua",
			"taplo",
			"terraform_fmt",
			"xmlformatter",
			"yamlfmt",

			-- ++ Linters +-----------------------------------+
			"actionlint",
			"ansible-lint",
			"golangci-lint",
			"htmlhint",
			"hadolint",
			"jsonlint",
			"luacheck",
			"markdownlint-cli2",
			"ruff",
			"shellcheck",
			"stylelint",
			"tflint",
			"yamllint",
		},

		run_on_start = true,
		start_delay = 3000,
		debounce_hours = 24,
		auto_update = false,

		integrations = {
			["mason-lspconfig"] = true,
		},
	},
}
