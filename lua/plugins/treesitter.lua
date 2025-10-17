local function config()
    vim.g._ts_force_sync_parsing = true
    require("nvim-treesitter.configs").setup {
        highlight = {
            enable = true
        },
        ensure_installed = {
            "vimdoc",
            "javascript",
            "tsx",
            "json",
            "css",
            "toml",
            "solidity",
            "python",
            "beancount",
            "rust",
            "nix",
            "lua",
            "comment",
            "lalrpop",
            "zig",
            "c"
        }
    }
end
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = config
}
