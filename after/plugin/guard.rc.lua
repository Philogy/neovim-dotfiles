local guard = require('guard')
local ft = require('guard.filetype')

ft("lua"):fmt('lsp'):append('stylua')

require('guard').setup {
  fmt_on_save = true,
  lsp_as_default_formatter = true,
}
