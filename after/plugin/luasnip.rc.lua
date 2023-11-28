local status, luasnip = pcall(require, 'luasnip')
if (not status) then return end

require 'luasnip.loaders.from_lua'.load { paths = '~/.config/nvim/luasnip/' }

local opts = { noremap = true, silent = true }
vim.keymap.set({ 'i', 'n' }, '<C-j>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, opts)
vim.keymap.set({ 'i', 'n' }, '<C-k>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, opts)
vim.keymap.set({ 'i', 'n' }, '<C-l>', function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, opts)

vim.keymap.set({ 'i', 'n' }, '<leader><leader>s', '<cmd>source ~/.config/nvim/after/plugin/luasnip.rc.lua<cr>', opts)


luasnip.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true
}
