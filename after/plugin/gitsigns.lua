local gitsigns = require("gitsigns")
gitsigns.setup {
  current_line_blame_opts = {
    delay = 200
  }
}

vim.keymap.set("n", "\\gb", gitsigns.toggle_current_line_blame)
