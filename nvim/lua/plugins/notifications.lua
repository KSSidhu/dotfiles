return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline",
			format = {
				search_down = { kind = "search", pattern = "^/", icon = "⌕ ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = "⌕ ", lang = "regex" },
			},
		},
		lsp = {
			progress = {
				enabled = false,
			},
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			long_message_to_split = true, -- long messages will be sent to a split
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
