return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                        ]],
			[[         ／l、          ]],
			[[        （ﾟ､ ｡ ７       ]],
			[[         l  ~ヽ         ]],
			[[         じしf_,)ノ     ]],
			[[                        ]],
		}

		dashboard.opts.opts.margin = 55
		alpha.setup(dashboard.opts)
	end,
}
