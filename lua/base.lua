vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.foldenable = false
vim.opt.autoindent = true
vim.opt.si = true
vim.opt.textwidth = 100
vim.opt.wrap = true -- No wrap lines
vim.opt.linebreak = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.termguicolors = true

-- Show symbols for specific spaces etc.
vim.opt.list = true
vim.opt.listchars = { tab = '>-', trail = '·' }

-- Mouse
vim.opt.mouse = ''

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:9m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

-- highlight yankP
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

vim.opt.formatoptions:append { 'r' }

-- Connect System <> Vim Clipboards
vim.opt.clipboard:append { 'unnamedplus' }
