-- ~/.config/nvim/lua/plugins/lsp.lua
return {

	---------------------------------------------------------------------
	-- Mason
	---------------------------------------------------------------------

	{
		"mason-org/mason.nvim",

		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	---------------------------------------------------------------------
	-- Mason LSPConfig
	---------------------------------------------------------------------

	{
		"mason-org/mason-lspconfig.nvim",

		dependencies = {
			"mason-org/mason.nvim",
		},

		opts = {
			automatic_enable = true,
		},
	},

	---------------------------------------------------------------------
	-- LSP
	---------------------------------------------------------------------

	{
		"neovim/nvim-lspconfig",

		event = {
			"BufReadPost",
			"BufNewFile",
		},

		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			-- "hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local lsp = require("lsp")

			local servers = {
				ansiblels = require("lsp.ansiblels"),
				bashls = require("lsp.bashls"),
				cssls = require("lsp.cssls"),
				docker_compose_language_service = require("lsp.docker_compose"),
				dockerls = require("lsp.dockerls"),
				html = require("lsp.html"),
				jsonls = require("lsp.jsonls"),
				lua_ls = require("lsp.lua_ls"),
				marksman = require("lsp.marksman"),
				taplo = require("lsp.taplo"),
				terraformls = require("lsp.terraformls"),
				yamlls = require("lsp.yamlls"),
			}

			for name, config in pairs(servers) do
				assert(type(config) == "table", ("%s did not return a config table"):format(name))

				local merged = vim.tbl_deep_extend("force", config, {
					capabilities = vim.tbl_deep_extend("force", config.capabilities or {}, lsp.capabilities),
				})

				vim.lsp.config(name, merged)
			end
		end,
	},
}
