return {
	{
		"williamboman/mason.nvim",
		version = "~1.0.0",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		version = "~1.0.0",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"dockerls",
					"docker_compose_language_service",
					"tsserver",
					"cssls",
					"clangd",
					"gopls",
					"volar",
					"phpactor",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				-- Find the Typescript client attached to buffer
				local clients = vim.lsp.get_clients({ bufnr = 0, name = "ts_ls" })
				local client = clients[1]
				client:exec_cmd(params)
			end

			vim.lsp.config["lua_ls"] = {
				capabilities = capabilities,
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
					},
				},
			}
			vim.lsp.config("ts_ls", {
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vim.fn.stdpath("data")
								.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
							languages = { "vue" },
						},
					},
				},
				capabilities = capabilities,
				-- commands = {
				-- 	OrganizeImports = {
				-- 		organize_imports,
				-- 		description = "Organize Imports",
				-- 	},
				-- },
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})
			--	vim.api.nvim_create_autocmd("BufWritePre", {
			--		callback = organize_imports,
			--	})
			vim.api.nvim_create_user_command(
				"OrganizeImports",
				organize_imports,
				{ desc = "Organize TypeScript imports" }
			)

			vim.lsp.config("dockerls", {
				capabilities = capabilities,
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})

			vim.lsp.config("phpactor", {
				capabilities = capabilities,
				cmd = { "phpactor", "language-server" },
				filetypes = { "php" },
				root_markers = { ".git", "composer.json", ".phpactor.json", ".phpactor.yml" },
				workspace_required = true,
			})

			vim.lsp.config("rust_analyzer", {
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {},
				},
			})

			vim.lsp.config("vue_ls", {
				capabilities = capabilities,
				init_options = {
					vue = {
						hybridMode = false,
					},
					typescript = {
						tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
					},
				},
			})
			vim.lsp.enable({
				"vue_ls",
				"rust_analyzer",
				"ts_ls",
				"lua_ls",
				"clangd",
				"phpactor",
				"cssls",
				"dockerls",
				"gopls",
			})
			--	lspconfig.eslint.setup({
			--		capabilities = capabilities,
			--	})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

			vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx)
				vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
			end
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
		end,
	},
}
