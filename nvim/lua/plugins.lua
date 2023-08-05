-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'dinhhuy258/git.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'duane9/nvim-rg'
  use 'glidenote/memolist.vim'
  use 'junegunn/vim-easy-align'
  use "windwp/nvim-autopairs"
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function() require("nvim-surround").setup({}) end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'lambdalisue/fern.vim'
  use {
    'TheLeoP/fern-renderer-web-devicons.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- appearance
  use 'AlexvZyl/nordic.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require 'lualine'.setup {
        options = {
          icons_enabled = false,
          theme = 'nordic',
          section_separators = '',
          component_separators = ''
        }
      }
    end
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
    end,
    requires = { "kkharji/sqlite.lua" }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use { "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      {
        'L3MON4D3/LuaSnip',
        tag = "v1.*",
        requires = 'saadparwaiz1/cmp_luasnip',
        --       run = 'make install_jsregexp',
      }
    }
  }
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function() require("fidget").setup {} end,
  }

  -- Github copilot
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  use { 'mattn/emmet-vim',
    ft = { 'html', 'css', 'react' }
  }
end)
