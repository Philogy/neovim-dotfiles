require("toggleterm").setup()

local Terminal = require('toggleterm.terminal').Terminal
local floating  = Terminal:new({
  hidden = true,
  direction = "float"
})

vim.keymap.set("n", "<leader>t", function() vim.cmd.ToggleTerm() end)
vim.keymap.set("n", "<leader>g", function() floating:toggle() end)
