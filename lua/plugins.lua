local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


local function menus_and_navigation(use)
  -- File search menu
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- File tree
  use { "nvim-tree/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  -- Autocompletion menus
  use "hrsh7th/nvim-cmp"
  -- Path-based completion for cmp.
  use "hrsh7th/cmp-path"
  -- LSP-based completion for cmp.
  use "hrsh7th/cmp-nvim-lsp"
  -- Buffer base completion
  use "hrsh7th/cmp-buffer"
  -- Dedicated terminal windows
  use "akinsho/toggleterm.nvim"
end

local function extra_shortcuts(use)
  -- Create persisting "file anchors" to ease navigation
  use { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { "nvim-lua/plenary.nvim" } }
  -- Allow easily modifying surrounding brackets etc.
  use { "kylechui/nvim-surround", tag = "*" }
  -- Automatically close pairs.
  use "windwp/nvim-autopairs"
  -- Snippets
  use { "L3MON4D3/LuaSnip" }
end

local function style(use)
  -- Highlight indents
  use "lukas-reineke/indent-blankline.nvim"
  -- Main theme
  use { "uloco/bluloco.nvim", requires = { "rktjmp/lush.nvim" } }
  -- Status line
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
  -- In-editor git change marker & git blame
  use "lewis6991/gitsigns.nvim"
end

local function language_support(use)
  -- Highlighting & parsing for most languages.
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  -- Default configs
  use 'neovim/nvim-lspconfig'
  -- Installer
  use { "williamboman/mason.nvim" }
  -- LSP Status indicator
  use { "j-hui/fidget.nvim" }
  -- Formatters on save
  use {
    "nvimdev/guard.nvim",
    requires = {
      "nvimdev/guard-collection",
    },
  }
  -- Markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
end

require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  menus_and_navigation(use)
  extra_shortcuts(use)
  style(use)
  language_support(use)

  if packer_bootstrap then
    require('packer').sync()
  end
end)
