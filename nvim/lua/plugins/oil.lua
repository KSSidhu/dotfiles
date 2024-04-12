return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
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
}
