local ft = require('guard.filetype')

ft("zig"):fmt("lsp")
ft("lua"):fmt("lsp")
ft("python"):fmt("autopep8")
ft("rust"):fmt("rustfmt")
ft("solidity"):fmt({
  cmd = "forge",
  args = { "fmt" },
  stdin = false
})
