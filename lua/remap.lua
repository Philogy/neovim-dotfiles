-- Remap leader to <Space>
vim.g.mapleader = ' '

-- Disable moving with space.
vim.keymap.set("n", "<Space>", "<nop>")

-- Consistent up/down/left/right window navigation across normal, insert & terminal modes.
vim.keymap.set("n", "<A-h>", "<C-W>h")
vim.keymap.set("n", "<A-l>", "<C-W>l")
vim.keymap.set("n", "<A-j>", "<C-W>j")
vim.keymap.set("n", "<A-k>", "<C-W>k")
vim.keymap.set("i", "<A-h>", "<Esc><C-W>hi")
vim.keymap.set("i", "<A-l>", "<Esc><C-W>li")
vim.keymap.set("i", "<A-j>", "<Esc><C-W>ji")
vim.keymap.set("i", "<A-k>", "<Esc><C-W>ki")
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-W>h")
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-W>l")
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-W>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-W>k")

-- Exit Terminal
vim.keymap.set('t', '<A-q>', '<C-\\><C-n>')

-- Buffer Management
vim.keymap.set('n', '\\c', ':bp|sp|bn|bd!<CR>') -- Kill Current Buffer
-- Disable highlight until next search
vim.keymap.set("n", "<leader>s", vim.cmd.nohl)

-- Temporary explorer access
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
