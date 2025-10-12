return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
        disable_filetype = { "TelescopePrompt" },
        fast_wrap = {}
    }
}
