vim.g.mapleader = " "

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.showmode = false

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.colorcolumn = "80"
vim.opt.wrap = false -- don't wrap lines
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10

-- Make pane switching more "vim-like"
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight line cursor is on
vim.opt.cursorline = true

-- backspace & refresh
vim.opt.updatetime = 50
vim.opt.backspace = { "start", "eol", "indent" }

-- Open file explorer
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- Split Windows
vim.keymap.set("n", "<leader>ss", ":split<Return>", {})
vim.keymap.set("n", "<leader>vs", ":vsplit<Return>", {})

vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>+")
vim.keymap.set("n", "<M-s>", "<C-W>-")

-- Fold Configuration
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4

-- Custom remaps
vim.keymap.set("n", "U", "<C-r>", { noremap = true })

-------------------------------------------------------------------------------
-------------------------------- autocmds -------------------------------------
-------------------------------------------------------------------------------

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Highlight when yanking text
-- Pulled from kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua)
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.diagnostic.config({ virtual_text = false })
