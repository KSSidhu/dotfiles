return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local configs = require("bufferline")
    local frappe = require("catppuccin.palettes").get_palette("frappe")

    configs.setup({
      options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp",
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = { bg = frappe.bg },
          },
          frappe = {
            background = { bg = frappe.bg },
          },
        },
      }),
    })
  end,
}
