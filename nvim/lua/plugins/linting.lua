return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"sontungexpt/better-diagnostic-virtual-text",
		config = function()
			require("better-diagnostic-virtual-text").setup({
				inline = false,
			})

			-- Disable default diagnostics to avoid conflicts
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
