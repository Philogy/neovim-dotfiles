local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })


---@diagnostic disable-next-line: redundant-parameter
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      -- timeout_ms = 200000

    }),
    -- null_ls.builtins.code_actions.eslint,
    -- null_ls.builtins.formatting.eslint,
    -- null_ls.builtins.diagnostics.pylint.with({ diagnostics_format = '[pylint] #{m}\n(#{c})' }),
    -- null_ls.builtins.diagnostics.solhint.with({ diagnostics_format = '[solhint] #{m}\n(#{c})' }),
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.completion.spell,
  },
  on_attach = function(client, _)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = 0,
        callback = function()
          if vim.bo.filetype ~= "solidity" then
            -- organize_imports()
            vim.lsp.buf.format()
          end
        end
      })
    end
  end,
})

vim.api.nvim_create_user_command('DisableLspFormatting', function()
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
