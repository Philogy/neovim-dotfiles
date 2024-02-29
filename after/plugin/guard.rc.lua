local guard = require('guard')
local ft = require('guard.filetype')

ft('lua'):fmt('lsp')
ft('typescript,javascript,typescriptreact'):fmt('prettier')

ft('python'):fmt('autopep8')

guard.setup({
  fmt_on_save = true,
  lsp_as_default_formatter = false,
})
