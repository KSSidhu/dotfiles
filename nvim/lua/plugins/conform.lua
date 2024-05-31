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
			svelte = { { "prettier", "prettierd" } },
			css = { "prettierd" },
			json = { "prettier" },
			golang = { "gofumpt", "goimports" },
		},
	},
}
