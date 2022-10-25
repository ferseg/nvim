-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim'}
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-lua/popup.nvim" }

  use {
	"windwp/nvim-autopairs",
  }

  use { "nvim-tree/nvim-web-devicons" }

  -- ===========================================
  -- color theme
  use { 'joshdick/onedark.vim' }
  use { 'altercation/vim-colors-solarized' }
  use { 'bluz71/vim-nightfly-guicolors' }

  -- ===========================================
  -- CMP
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "mfussenegger/nvim-jdtls" }

  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- ===========================================
  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" } -- simple to use language server installer

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  -- ===========================================
  -- Treesitter (Highlight)
  use { "nvim-treesitter/nvim-treesitter" }

  -- ===========================================
  -- Telescope
  use { "nvim-telescope/telescope.nvim" }

  -- ===========================================
  -- Nvim Tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- ===========================================
  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}
  
  -- Gitsigns
  use { "lewis6991/gitsigns.nvim" }

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end
  }
end)
