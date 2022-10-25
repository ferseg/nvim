local color = {
  green = "#BCE29E",
  blue = "#9ADCFF",
  yellow = "#FFF89A",
  violet = "#B1AFFF"
}

local lualine_nightfly = require("lualine.themes.nightfly")

lualine_nightfly.normal.a.bg = color.blue
lualine_nightfly.insert.a.bg = color.green
lualine_nightfly.visual.a.bg = color.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = color.yellow
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = lualine_nightfly,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', },
    lualine_c = {'filename', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
