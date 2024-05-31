return {
	{
		"williamboman/mason.nvim",
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
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end

			-------------------------------------------------------------------------
			------- Override hover windows to have borders and have max size --------
			-------------------------------------------------------------------------
			local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
			local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
				vim.lsp.handlers.hover,
				{ border = "rounded", max_width = max_width, max_height = max_height }
			)

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
				max_width = max_width,
				max_height = max_height,
			})

			vim.diagnostic.config({ float = { border = "rounded" } })
			-------------------------------------------------------------------------
			-------------------------------------------------------------------------

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {},
				},
			})
			-- lspconfig.tailwindcss.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.volar.setup({
				capabilities = capabilities,
				filetypes = {
					"vue",
				},
				init_options = {
					typescript = {
						tsdk = "/Users/kiratsidhu/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib",
					},
					preferences = {
						disableSuggestions = true,
					},
					languageFeatures = {
						implementation = true,
						references = true,
						definition = true,
						typeDefinition = true,
						callHierarchy = true,
						hover = true,
						rename = true,
						renameFileRefactoring = true,
						signatureHelp = true,
						codeAction = true,
						workspaceSymbol = true,
						diagnostics = true,
						semanticTokens = true,
						completion = {
							defaultTagNameCase = "both",
							defaultAttrNameCase = "kebabCase",
							getDocumentNameCasesRequest = false,
							getDocumentSelectionRequest = false,
						},
					},
				},
			})
			lspconfig.svelte.setup({
				capabilities = capabilities,
				filetypes = { "svelte" },
				on_attach = function(client, bufnr)
					if client.name == "svelte" then
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts", "*.svelte" },
							callback = function(ctx)
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
							end,
						})
					end
					if vim.bo[bufnr].filetype == "svelte" then
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts", "*.svelte" },
							callback = function(ctx)
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
							end,
						})
					end
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
