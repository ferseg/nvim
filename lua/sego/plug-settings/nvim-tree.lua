-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    width = 40,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = false,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "┗",
        edge = "┃",
        item = "┣",
        bottom = "─",
        none = " ",
      },
    },
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    debounce_delay = 10,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
      },
  },
  filters = {
    dotfiles = true,
  },
})
