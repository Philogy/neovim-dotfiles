local options = {
    keymaps = {
        ["<leader>h"] = { "actions.parent", mode = "n" },
        ["<C-n>"] = { "actions.close", mode = "n" }
    },
    skip_confirm_for_simple_edits = true
}

local function config()
    require('oil').setup(options)
    vim.keymap.set("n", "<C-N>", "<CMD>Oil<CR>")
end

return {
    "stevearc/oil.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
    config = config,
    lazy = false,
}
