local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local checkstyle_diagnostics = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "java" },
  -- null_ls.generator creates an async source
  -- that spawns the command with the given arguments and options
  generator = null_ls.generator({
    command = "java -jar ~/.local/share/checkstyle/checkstyle-10.5.0-all.jar",
    args = { "-c", "~/.local/share/checkstyle/checkstyle.xml" },
    to_stdin = true,
    from_stderr = true,
    -- use helpers to parse the output from string matchers,
    -- or parse it manually with a function
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
        groups = { "row", "col", "message" },
      },
      {
        pattern = [[:(%d+) [%w-/]+ (.*)]],
        groups = { "row", "message" },
      },
    }),
  })
}

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.diagnostics.checkstyle.with({
    --   extra_args = { "-c", "~/.local/share/checkstyle/checkstyle.xml" }, -- or "/sun_checks.xml" or path to self written rules
    -- }),
  }
})

-- null_ls.register(checkstyle_diagnostics)
