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

		dashboard.section.header.opts.position = "center"
		alpha.setup(dashboard.opts)
	end,
}
