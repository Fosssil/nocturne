---@type vim.lsp.Config
local config = {}

config.capabilities = {
	experimental = {
		serverStatusNotification = true,

		commands = {
			commands = {
				"rust-analyzer.showReferences",
				"rust-analyzer.runSingle",
				"rust-analyzer.debugSingle",
			},
		},
	},
}

config.settings = {
	["rust-analyzer"] = {
		lens = {
			enable = true,

			run = {
				enable = true,
			},

			debug = {
				enable = true,
			},

			updateTest = {
				enable = true,
			},

			implementations = {
				enable = true,
			},

			references = {
				adt = {
					enable = true,
				},

				enumVariant = {
					enable = true,
				},

				method = {
					enable = true,
				},

				trait = {
					enable = true,
				},
			},
		},
	},
}

config.before_init = function(init_params, cfg)
	if cfg.settings and cfg.settings["rust-analyzer"] then
		init_params.initializationOptions = cfg.settings["rust-analyzer"]
	end

	vim.lsp.commands["rust-analyzer.runSingle"] = function(command)
		local r = command.arguments[1]

		local cmd = { "cargo", unpack(r.args.cargoArgs) }

		if r.args.executableArgs and #r.args.executableArgs > 0 then
			vim.list_extend(cmd, { "--", unpack(r.args.executableArgs) })
		end

		local proc = vim.system(cmd, {
			cwd = r.args.cwd,
			env = r.args.environment,
		})

		local result = proc:wait()

		if result.code == 0 then
			vim.notify(result.stdout, vim.log.levels.INFO)
		else
			vim.notify(result.stderr, vim.log.levels.ERROR)
		end
	end
end

return config
