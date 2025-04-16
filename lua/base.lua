-- Editor
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.textwidth = 100
vim.opt.wrap = true
vim.opt.linebreak = true

-- Indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true

-- color things
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.background = "dark"

-- search / cmd
vim.opt.ignorecase = true -- ignore
vim.opt.incsearch = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 5

-- Symbols for specific spaces
vim.opt.list = true
vim.opt.listchars = { tab = '>-', trail = '·' }

-- Remember Undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.nvim/undo')

-- Disable mouse
vim.opt.mouse = ""
vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,t:blinkon0"
