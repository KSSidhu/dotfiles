return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>gf",
			function()
				require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 500 })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
			css = { "prettierd" },
			json = { "prettier" },
			golang = { "gofumpt", "goimports" },
			php = { "php-cs-fixer" },
			blade = { "blade-formatter" },
		},
		formatters = {
			["php-cs-fixer"] = {
				command = "php-cs-fixer",
				args = {
					"fix",
					"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
					"$FILENAME",
				},
				stdin = false,
			},
		},
	},
}
