vim.keymap.set(
	"n",
	"<leader>gg",
	"i \
if err != nil {\
\
}<Esc>",
	{desc = "Inserts basic error check code for Golang"}
)
