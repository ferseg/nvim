local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end

vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

--local utils = require "core.utils"

--  client.server_capabilities.documentFormattingProvider = false
--  client.server_capabilities.documentRangeFormattingProvider = false

--  utils.load_mappings("lspconfig", { buffer = bufnr })

--  if client.server_capabilities.signatureHelpProvider then
--    require("nvchad_ui.signature").setup(client)
--  end
--end

--local nvim_cmp = require("cmp_nvim_lsp")
local on_attach = require("sego.lsp.handlers").on_attach-- function(client, bufnr)
local capabilities = require("sego.lsp.handlers").capabilities --nvim_cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Data directory - change it to your liking
local HOME = os.getenv "HOME"
local WORKSPACE_PATH = HOME .. "/workspace/java/"
local JDTLS_LOCATION = HOME .. "/.local/share/nvim/mason/packages/jdtls"

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name

local root_markers = { ".git", "mvnw", }-- "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
  cmd = {
      "/Library/Java/JavaVirtualMachines/jdk-17.0.4.1.jdk/Contents/Home/bin/java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-javaagent:" .. JDTLS_LOCATION .. "/lombok.jar",
      "-Xbootclasspath/a:" .. JDTLS_LOCATION .. "/lombok.jar",
      "-jar", JDTLS_LOCATION .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
      "-configuration", JDTLS_LOCATION .. "/config_mac",
      "-data", workspace_dir,
  },
  autostart=true,
  filetypes={"java"},
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = root_dir,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
        updateSnapshots = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
--        settings = {
--          url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
--          profile = "GoogleStyle",
--        },
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      enabled = true,
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "org",
        "com"
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 3,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  -- init_options = {
  --   bundles = {},
  -- },

}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
-- Add the commands
require("jdtls.setup").add_commands()
