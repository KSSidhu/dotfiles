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

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}
		vim.filetype.add({
			pattern = {
				["*.blade.php"] = "blade",
			},
		})
	end,
}
