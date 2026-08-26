-- ~/.config/nvim/lua/plugins/dial.lua
return {
	"monaqa/dial.nvim",

	keys = {
		{
			"<C-a>",
			function()
				require("dial.map").manipulate("increment", "normal")
			end,
			mode = "n",
			desc = "Increment",
		},
		{
			"<C-x>",
			function()
				require("dial.map").manipulate("decrement", "normal")
			end,
			mode = "n",
			desc = "Decrement",
		},
		{
			"g<C-a>",
			function()
				require("dial.map").manipulate("increment", "gnormal")
			end,
			mode = "n",
			desc = "Increment (global)",
		},
		{
			"g<C-x>",
			function()
				require("dial.map").manipulate("decrement", "gnormal")
			end,
			mode = "n",
			desc = "Decrement (global)",
		},
		{
			"<C-a>",
			function()
				require("dial.map").manipulate("increment", "visual")
			end,
			mode = "x",
			desc = "Increment",
		},
		{
			"<C-x>",
			function()
				require("dial.map").manipulate("decrement", "visual")
			end,
			mode = "x",
			desc = "Decrement",
		},
		{
			"g<C-a>",
			function()
				require("dial.map").manipulate("increment", "gvisual")
			end,
			mode = "x",
			desc = "Increment (global)",
		},
		{
			"g<C-x>",
			function()
				require("dial.map").manipulate("decrement", "gvisual")
			end,
			mode = "x",
			desc = "Decrement (global)",
		},
	},

	config = function()
		local augend = require("dial.augend")

		require("dial.config").augends:register_group({
			default = {
				-- Numbers
				augend.integer.alias.decimal,
				augend.integer.alias.hex,

				-- Dates & time
				augend.date.alias["%Y-%m-%d"],
				augend.date.alias["%Y/%m/%d"],
				augend.date.alias["%H:%M"],

				-- Versions
				augend.semver.alias.semver,

				-- Built-ins
				augend.constant.alias.bool,
				augend.constant.alias.Bool,

				-- Alphabet
				augend.constant.alias.alpha,
				augend.constant.alias.Alpha,

				-- Colors
				augend.hexcolor.new(),

				------------------------------------------------------------------
				-- Custom Toggles
				------------------------------------------------------------------

				augend.constant.new({
					elements = { "on", "off" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "yes", "no" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "enable", "disable" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "enabled", "disabled" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "start", "stop" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "open", "close" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "up", "down" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "left", "right" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "min", "max" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "dev", "prod" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "get", "set" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "public", "private" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "horizontal", "vertical" },
					word = true,
					cyclic = true,
				}),

				augend.constant.new({
					elements = { "width", "height" },
					word = true,
					cyclic = true,
				}),
			},
		})
	end,
}
