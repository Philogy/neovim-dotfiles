local status, mason = pcall(require, "mason")
local status2, mason_lsp = pcall(require, "mason-lspconfig")
if (not status) or (not status2) then return end

mason.setup()
mason_lsp.setup {
  ensure_installed = {},
}
