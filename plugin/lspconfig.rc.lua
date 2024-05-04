local status, lsp = pcall(require, 'lspconfig')
if not status then return end


local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.rename() end, opts)
end


require 'lspconfig.configs'.solidity = {
  default_config = {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = lsp.util.find_git_ancestor,
    single_file_support = true,
  },
}

lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascript.jsx' },
  cmd = { 'typescript-language-server', '--stdio' },
})

lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      rustfmt = {
        extraArgs = { "+nightly", },
      },
    }
  }
}

lsp.lua_ls.setup({
  on_attach = on_attach,
  settings = {

    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global P
        globals = { "vim" },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
})

lsp.solidity.setup({
  on_attach = on_attach,
})

lsp.pyright.setup({
  on_attach = on_attach,
})
