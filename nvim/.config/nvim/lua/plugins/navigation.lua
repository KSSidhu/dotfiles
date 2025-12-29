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
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				search = {
					enabled = true,
				},
				char = {
					jump_labels = true,
				},
			},
		},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"shahshlok/vim-coach.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		config = function()
			require("vim-coach").setup()
		end,
		keys = {
			{ "<leader>?", "<cmd>VimCoach<cr>", desc = "Vim Coach" },
		},
	},
	{
		"saghen/blink.indent",
		--- @module 'blink.indent'
		--- @type blink.indent.Config
		-- opts = {},
	},
}
