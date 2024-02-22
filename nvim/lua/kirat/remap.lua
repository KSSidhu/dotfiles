vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- New Tab
vim.keymap.set("n", "te", ":tabedit")

-- Split Window
vim.keymap.set("n", "ss", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
vim.keymap.set("n", "<Space>", "<C-w>w")
vim.keymap.set("", "sh", "<C-w>h")
vim.keymap.set("", "sk", "<C-w>k")
vim.keymap.set("", "sj", "<C-w>j")
vim.keymap.set("", "sl", "<C-w>l")
vim.keymap.set("", "<C-a>", "ggVG") -- Select all
