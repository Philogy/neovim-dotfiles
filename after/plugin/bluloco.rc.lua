local status, bluloco = pcall(require, 'bluloco')
if (not status) then return end

bluloco.setup({
  terminal = true,
  style = 'auto',
  transparent = false,
  italics = false,
  guicursor = false
})

vim.cmd('colorscheme bluloco')
