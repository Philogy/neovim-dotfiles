local ft = require('guard.filetype')

ft("zig"):fmt("lsp")
ft("lua"):fmt("lsp")
ft("typescript,javascript,typescriptreact"):fmt("prettier")
ft("python"):fmt("autopep8")
ft("rust"):fmt("lsp")

ft("solidity"):fmt({
  cmd = "forge",
  args = { "fmt" },
  stdin = false
})
