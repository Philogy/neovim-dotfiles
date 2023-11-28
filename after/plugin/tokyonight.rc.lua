local status, tokyonight = pcall(require, 'tokyonight')
if (not status) then return end

tokyonight.setup({
  style = 'storm',
  transparent = true,
  terminal_colors = false
})

vim.cmd('colorscheme tokyonight')
