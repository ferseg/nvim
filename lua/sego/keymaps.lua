
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

-- Navigate between tabs (TODO)
nnoremap('<TAB>', ":tabnext<CR>")
nnoremap('<S-TAB>', ":tabprevious<CR>")

-- Line movements
nnoremap('<C-S-Up>', ":m -2<CR>")
nnoremap('<C-S-Down>', ":m +1<CR>")
vbnoremap('<C-S-Up>', ":m '<-2<CR>gv-gv")
vbnoremap('<C-S-Down>', ":m '>+1<CR>gv-gv")


-- Telescope
local builtin = require('telescope.builtin')
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fw", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)


-- Nvimtree
nnoremap("<leader>e", ":NvimTreeToggle<CR>")
nnoremap("<leader>ef", ":NvimTreeFocus<CR>")
inoremap("<C-e>", ":NvimTreeToggle<CR>")