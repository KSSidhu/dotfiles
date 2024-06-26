return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			icons = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			},
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "fade_in_slide_out",
			timeout = 3000,
			background_colour = "#000000",
		})
		vim.notify = require("notify")
	end,
}
