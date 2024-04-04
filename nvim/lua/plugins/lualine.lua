return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- I just wanted to trim the mode name length
    local mode_map = {
      ["n"] = "N",
      ["no"] = "O·P",
      ["nov"] = "O·P",
      ["noV"] = "O·P",
      ["no\22"] = "O·P",
      ["niI"] = "N·I",
      ["niR"] = "N·R",
      ["niV"] = "N",
      ["nt"] = "N·T",
      ["v"] = "V",
      ["vs"] = "V",
      ["V"] = "V·L",
      ["Vs"] = "V·L",
      ["\22"] = "V·B",
      ["\22s"] = "V·B",
      ["s"] = "S",
      ["S"] = "S·L",
      ["\19"] = "S·B",
      ["i"] = "I",
      ["ic"] = "I·C",
      ["ix"] = "I·X",
      ["R"] = "R",
      ["Rc"] = "R·C",
      ["Rx"] = "R·X",
      ["Rv"] = "V·R",
      ["Rvc"] = "RVC",
      ["Rvx"] = "RVX",
      ["c"] = "C",
      ["cv"] = "EX",
      ["ce"] = "EX",
      ["r"] = "R",
      ["rm"] = "M",
      ["r?"] = "C",
      ["!"] = "SH",
      ["t"] = "T",
    }

    local function modes()
      return mode_map[vim.api.nvim_get_mode().mode] or "__"
    end

    local icons = {
      git = {
        added = " ",
        modified = " ",
        removed = " ",
      },
    }

    require("lualine").setup({
      options = {
        theme = "onedark",
      },
      sections = {
        lualine_a = { modes },
        lualine_b = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
      },
    })
  end,
}
