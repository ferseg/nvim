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
  use { 'bluz71/vim-nightfly-guicolors' }
  use { "EdenEast/nightfox.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "rafamadriz/neon" }
  use { 'B4mbus/oxocarbon-lua.nvim' }

  -- ===========================================
  -- CMP
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "saadparwaiz1/cmp_luasnip" }

  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- ===========================================
  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" } -- simple to use language server installer
  use { "mfussenegger/nvim-jdtls" }
  use { "mfussenegger/nvim-dap" }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { "glepnir/lspsaga.nvim" }

  -- ===========================================
  -- Treesitter (Highlight)
  use { "nvim-treesitter/nvim-treesitter" }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }
  use { "p00f/nvim-ts-rainbow" }

  -- ===========================================
  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use {'nvim-telescope/telescope-ui-select.nvim' }

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

  -- Illuminate
  use { "RRethy/vim-illuminate" }

  -- Blankline
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Null ls
  use { "jose-elias-alvarez/null-ls.nvim" }
end)
