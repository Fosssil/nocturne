-- ~/.config/nvim/lua/plugins/autoinstaller.lua
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	dependencies = {
		"mason-org/mason.nvim",
	},

	opts = {
		ensure_installed = {
			------------------------------------------------------------------
			-- Language Servers
			------------------------------------------------------------------
			-- Core
			"lua_ls",
			"bashls",
			-- Documentation & Config
			"jsonls",
			"yamlls",
			"taplo",
			"marksman",
			-- Web
			"html",
			"cssls",
			-- DevOps
			"dockerls",
			"docker_compose_language_service",
			"terraformls",
			"ansiblels",
			"gh_actions_ls",
			-- General Languages
			"clangd",
			"basedpyright",
			"rust_analyzer",
			"gopls",
			-- Linux
			"hyprls",

			------------------------------------------------------------------
			-- Formatters
			------------------------------------------------------------------
			"stylua",
			"shfmt",
			"prettierd",
			"yamlfmt",
			"taplo",
			"gofumpt",
			"goimports",
			"clang-format",
			"rustfmt",
			"ruff_format",
			"ruff_organise_imports",
			"markdownlint-cli2",
			"dockerfmt",
			"terraform_fmt",

			------------------------------------------------------------------
			-- Linters
			------------------------------------------------------------------
			"luacheck",
			"shellcheck",
			"jsonlint",
			"yamllint",
			"stylelint",
			"htmlhint",
			"markdownlint-cli2",
			"hadolint",
			"actionlint",
			"ansible-lint",
			"tflint",
			"golangci-lint",
			"ruff",
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
