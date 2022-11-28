
local term_opts = { silent = true }

-- Shorten function name
local keymap = function(mode)
    local opts = { noremap = true, silent = true }
    return function(key, command)
        return vim.keymap.set(mode, key, command, opts)
    end
end

local nnoremap = keymap('n')
local inoremap = keymap('i')
local vnoremap = keymap('v')
local vbnoremap = keymap('x')


--Remap space as leader key
keymap("")("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save with ctrl+s
nnoremap('<C-s>', ":w<CR>")
inoremap('<C-s>', "<ESC> | :w<CR>")

inoremap('jj', "<ESC><CR>")

-- Navigate between tabs (TODO)
nnoremap('<TAB>', ":bnext<CR>")
nnoremap('<S-TAB>', ":bprevious<CR>")
nnoremap('<leader>x', ":bdelete<CR>")

-- Line movements
nnoremap('<C-S-Up>', ":m -2<CR>")
nnoremap('<C-S-Down>', ":m +1<CR>")
vbnoremap('<C-S-Up>', ":m '<-2<CR>gv-gv")
vbnoremap('<C-S-Down>', ":m '>+1<CR>gv-gv")
nnoremap('<Up>', "<NOP>")
nnoremap('<Down>', "<NOP>")
nnoremap('<Left>', "<NOP>")
nnoremap('<Right>', "<NOP>")

-- Telescope
local builtin = require('telescope.builtin')
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fw", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)
nnoremap("<leader>th", function () builtin.colorscheme({enable_preview = true}) end)
nnoremap("<leader>tk", builtin.keymaps)

-- Telescope git
nnoremap("<leader>gst", builtin.git_status)
nnoremap("<leader>gfc", builtin.git_bcommits)
nnoremap("<leader>gac", builtin.git_commits)
nnoremap("<leader>tbr", builtin.git_branches)

-- Telescope lsp
nnoremap("gr", builtin.lsp_references)
nnoremap("<leader>tim", builtin.lsp_implementations)
-- nnoremap("<leader>ca", builtin.lsp_code_actions)

-- Nvimtree
nnoremap("<leader>e", ":NvimTreeToggle<CR>")
nnoremap("<leader>fe", ":NvimTreeFocus<CR>")
inoremap("<C-e>", ":NvimTreeToggle<CR>")


-- Gitsigns
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
nnoremap("<leader>gdf", ":Gitsigns diffthis<CR>")
-- local gs = package.loaded.gitsigns



-- DAP debug
nnoremap("<leader>dtc", ":lua require('jdtls').test_class()<CR>")
nnoremap("<leader>dtm", ":lua require('jdtls').test_nearest_method()<CR>")


--[[ local keymap = {
    d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
  } ]]
