return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"cpp",
				"javascript",
				"typescript",
				"tsx",
				"lua",
				"dockerfile",
				"rust",
				"go",
				"css",
				"json",
				"html",
				"php",
			},
			highlight = { enable = true },
			indent = { enable = true },
			-- autotag html auto close plugin
			autotag = {
				enable = true,
			},
		})
	end,
}
