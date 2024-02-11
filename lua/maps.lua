local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment / Decrement
keymap.set('n', '+', '<C-a>', opts)
keymap.set('n', '-', '<C-x>', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Window Navigation
keymap.set('n', '<A-h>', '<C-W>h', opts)
keymap.set('n', '<A-l>', '<C-W>l', opts)
keymap.set('n', '<A-j>', '<C-W>j', opts)
keymap.set('n', '<A-k>', '<C-W>k', opts)
keymap.set('i', '<A-h>', '<Esc><C-W>hi', opts)
keymap.set('i', '<A-l>', '<Esc><C-W>li', opts)
keymap.set('i', '<A-j>', '<Esc><C-W>ji', opts)
keymap.set('i', '<A-k>', '<Esc><C-W>ki', opts)
keymap.set('t', '<A-h>', '<C-\\><C-n><C-W>h', opts)
keymap.set('t', '<A-l>', '<C-\\><C-n><C-W>l', opts)
keymap.set('t', '<A-j>', '<C-\\><C-n><C-W>j', opts)
keymap.set('t', '<A-k>', '<C-\\><C-n><C-W>k', opts)

-- Resize Window
keymap.set('n', '<C-w>l', '<C-w><', opts)
keymap.set('n', '<C-w>h', '<C-w>>', opts)
keymap.set('n', '<C-w>j', '<C-w>+', opts)
keymap.set('n', '<C-w>k', '<C-w>-', opts)

-- Buffer Management
keymap.set('n', '<leader>c', ':bp|sp|bn|bd!<CR>', opts) -- Kill Current Buffer

-- Exit Terminal
keymap.set('t', '<A-q>', '<C-\\><C-n>', opts)

-- Disable Highlighting
keymap.set('n', '<Space>', ':nohl<CR>', opts)

-- Theme
local set_bg = function(bg)
  return function()
    vim.o.background = bg
    vim.cmd('syntax off')
    vim.cmd('syntax on')
  end
end
keymap.set('n', '<leader>td', set_bg('dark'), opts)
keymap.set('n', '<leader>tl', set_bg('light'), opts)

-- Toggle EOL chars
local function set_eol(cond)
  if cond then
    vim.opt.listchars:append({ eol = '↴' })
  else
    vim.opt.listchars:remove({ 'eol' })
  end
end

local toggled_eol = false
set_eol(toggled_eol)

keymap.set('n', '<leader>h', function()
  set_eol(not toggled_eol)
  toggled_eol = not toggled_eol
end)

-- Plugin UI Shortcuts
keymap.set('n', '<leader>m', ':Mason<CR>', opts) -- open Mason UI

-- Spell checking
-- keymap.set('n', '<leader>sr', function() vim.opt_local.spelllang = nil end, opts)
-- keymap.set('n', '<leader>se', function() vim.opt_local.spelllang = 'en_us' end, opts)

keymap.set('n', '<leader>q', function()
  vim.cmd('wa')
  vim.cmd('qa')
end, opts)

-- Forge fmt
keymap.set({ 'n' }, '<leader>t', ':!forge fmt<CR>', opts)
