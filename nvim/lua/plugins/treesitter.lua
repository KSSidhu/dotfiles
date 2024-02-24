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
				"rust",
				"go",
				"css",
				"json",
				"html",
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
