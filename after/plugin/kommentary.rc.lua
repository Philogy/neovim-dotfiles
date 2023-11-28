local status, kommentary = pcall(require, 'kommentary.config')
if (not status) then return end

kommentary.configure_language('default', {
  prefer_single_line_comments = true
})

local opts = { noremap = true, silent = true }
vim.keymap.set({ 'n' }, 'gcc', '<Plug>kommentary_line_default', opts)
vim.keymap.set({ 'v' }, 'gc', '<Plug>kommentary_visual_default<esc>', opts)
