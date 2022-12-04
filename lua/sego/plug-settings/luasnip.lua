local ls = require("luasnip")
local sn = ls.parser.parse_snippet

ls.config.set_config = {
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI",
}

ls.snippets = {
  all = {},
  java = {
    sn("jutm", "@Test\n\tvoid test${1:name} () {\n\t\t$0\n}")
  }
}

require("luasnip.loaders.from_vscode").lazy_load {
  paths = "./snippets",
}
