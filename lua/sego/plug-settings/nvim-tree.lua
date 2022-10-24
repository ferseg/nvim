-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "name",
  view = {
    adaptive_size = true,
    width = 40,
  },
  renderer = {
    indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            folder = {
              arrow_closed = "▷",
              arrow_open = "▼",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "○",
              staged = "◉",
              unmerged = "",
              renamed = "◑",
              untracked = "◍",
              deleted = "",
              ignored = "◌",
            },
          },
        },
    group_empty = false,
  },
  filters = {
    dotfiles = true,
  },
})
