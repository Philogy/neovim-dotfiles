vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    if vim.bo.filetype ~= 'solidity' then
      vim.lsp.buf.format()
    end
  end
})
