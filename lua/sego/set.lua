vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.colorcolumn = "110"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.scrolloff = 8

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd('colorscheme nightfly')

vim.opt.cursorline = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
