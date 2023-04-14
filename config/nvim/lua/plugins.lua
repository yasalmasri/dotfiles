-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  -- use {
  --   "bluz71/vim-nightfly-guicolors",
  --   config = function()
  --     vim.cmd("colorscheme nightfly")
  --   end
  -- }

  use {
    'dracula/vim', as = 'dracula',
    as = 'dracula',
    --event = 'ColorSchemePre',
    config = function()
      vim.api.nvim_command 'colorscheme dracula'
    end,
  }

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
      local ft = require('Comment.ft')
      ft.set('asterisk', '; %s')
    end,
  }

  -- file explorer
  use {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require('configs.nvim-tree')
    end,
  }

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('configs.lualine')
    end,
  }

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
      require('configs.telescope')
    end,
  }

  -- autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'L3MON4D3/LuaSnip',
        requires = {
          { 'rafamadriz/friendly-snippets', }
        },
        config = function()
          require 'luasnip/loaders/from_vscode'.lazy_load()
        end,
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
    },
    config = function()
      require 'configs.nvim-cmp'
    end,
  }

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('configs.treesitter')
    end,
  })

  -- auto closing
  use {
    "windwp/nvim-autopairs",
    config = function()
      require('configs.autopairs')
    end,
  }
  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter"
  }

  -- git integration
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('configs.gitsigns')
    end,
  }

  use {
    'farfanoide/inflector.vim',
    config = function()
      vim.g.inflector_mapping = "gI"
    end,
  }

  use {
    'vim-test/vim-test',
    setup = function()
      require 'configs.vim-test'.setup()
    end,
    config = function()
      require 'configs.vim-test'.config()
    end,
    cmd = { 'TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit' }
  }

  use {
    "ngmy/vim-rubocop",
    config = function()
      -- vim.g.vimrubocop_keymap = 0
      vim.g.vimrubocop_rubocop_cmd = 'bundle exec rubocop '
      vim.g.vimrubocop_extra_args = '-A'
      -- vim.nmap = "<Leader>r :RuboCop<CR>"
    end,
  }

  use {
    "modille/groovy.vim",
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
