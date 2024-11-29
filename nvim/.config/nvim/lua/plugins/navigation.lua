return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			columns = { "icon" },
			keymaps = {
				["<C-h>"] = false,
			},
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
				is_always_hidden = function(name, _)
					return vim.startswith(name, "..")
				end,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- set marks specific to each git branch inside git repository
			mark_branch = true,
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "add current buffer" })

			vim.keymap.set("n", "<leader>hx", function()
				harpoon:list():remove()
			end, { desc = "remove current buffer" })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<leader>hp", function()
				harpoon:list():prev()
			end, { desc = "toggle previous buffer in harpoon list" })
			vim.keymap.set("n", "<leader>hn", function()
				harpoon:list():next()
			end, { desc = "toggle next buffer in harpoon list" })

			vim.keymap.set("n", "<leader>hm", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "open harpoon list" })
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"sethen/line-number-change-mode.nvim",
		config = function()
			local palette = require("nightfox.palette").load("duskfox")
			if palette == nil then
				return nil
			end

			require("line-number-change-mode").setup({
				mode = {
					i = {
						bg = palette.green.base,
						fg = palette.fg1,
						bold = true,
					},
					n = {
						bg = palette.blue.base,
						fg = palette.fg1,
						bold = true,
					},
					R = {
						bg = palette.orange.base,
						fg = palette.fg1,
						bold = true,
					},
					v = {
						bg = palette.magenta.base,
						fg = palette.sel0,
						bold = true,
					},
					V = {
						bg = palette.magenta.base,
						fg = palette.sel0,
						bold = true,
					},
				},
			})
		end,
	},
}
