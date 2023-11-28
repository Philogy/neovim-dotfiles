local setup_filetype = function(filetype, opts)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function(_)
      for opt, value in pairs(opts) do
        vim.opt_local[opt] = value
      end
    end
  })
end

vim.filetype.add({
  extension = {
    huff = 'huff',
    yul = 'yul',
    nr = 'rust'
  }
})

setup_filetype('solidity', { shiftwidth = 4 })
setup_filetype('huff', { shiftwidth = 4 })
setup_filetype('python', { shiftwidth = 4 })
setup_filetype('noir', { shiftwidth = 4 })
setup_filetype('yul', { shiftwidth = 4 })
