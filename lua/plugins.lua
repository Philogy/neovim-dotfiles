local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

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

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- visual
  -- use { 'folke/tokyonight.nvim', branch = 'main' }
  -- use 'navarasu/onedark.nvim' -- main theme
  use {
    'uloco/bluloco.nvim',
    requires = { 'rktjmp/lush.nvim' }
  }

  use 'vyperlang/vim-vyper'

  use 'mattdf/vim-yul'

  use {
    'nvim-lualine/lualine.nvim', -- status line
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use 'lukas-reineke/indent-blankline.nvim' -- indents
  use 'lewis6991/gitsigns.nvim'             -- mark git changes
  use 'kyazdani42/nvim-web-devicons'        -- File icons

  use 'lark-parser/vim-lark-syntax'
  use 'Louis-Amas/noir-vim-support' -- Noir Syntax

  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'wuwe1/vim-huff'

  -- Utils (Shortcuts, etc.)
  use { 'kylechui/nvim-surround', tag = '*' }
  use 'windwp/nvim-autopairs'
  use 'b3nj5m1n/kommentary' -- comments
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- LSP & Autocompletion
  use 'neovim/nvim-lspconfig'   -- general lsp configs for languages
  use 'williamboman/mason.nvim' -- lsp server and fixer install UI
  use 'williamboman/mason-lspconfig.nvim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp' -- Completion

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'rust-lang/rust.vim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    tag = '0.1.5'
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
