local function config_telescope()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", function() builtin.find_files({ no_ignore = false, hidden = false }) end,
      { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>pf", function() builtin.git_files({ show_untracked = true }) end,
      { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>ph", function() builtin.find_files({ no_ignore = true, hidden = true }) end,
      { desc = "Telescope find hidden/dotfiles files" })
    vim.keymap.set("n", "<leader>r", function() builtin.live_grep({ hidden = true }) end, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>o", builtin.oldfiles, { desc = "Telescope recent files" })
    vim.keymap.set("n", "\\\\b", builtin.buffers)
    vim.keymap.set("n", "gR", function() builtin.lsp_references() end)
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config_telescope
}
