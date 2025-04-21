local ts = require("nvim-treesitter.configs")

ts.setup {
  highlight = {
    enable = true,
    disable = { "toml" }
  },
  indent = {
    enable = true,
    disable = { "python" }
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
    "zig"
  }
}
