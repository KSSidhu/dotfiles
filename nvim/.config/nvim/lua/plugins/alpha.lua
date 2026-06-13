return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			" _______________________________________________________________________ ",
			'|[] CarrotsShell                                                  |F]|!"|',
			'|"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"|',
			"|nvim/.config/nvim> nvim progress.lua                                 | |",
			"|                                                                     | |",
			"|                                                                     | |",
			"|                                                                     |_|",
			"|_____________________________________________________________________|/|",
		}

		dashboard.section.header.opts.position = "center"
		alpha.setup(dashboard.opts)
	end,
}
