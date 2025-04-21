local setup_filetype = function(filetype, opts)
  vim.api.nvim_create_autocmd("FileType", {
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
    huff = "huff",
    balls = "balls",
    glsl = "glsl",
    sei = "sensei"
  }
})

setup_filetype("lua", { shiftwidth = 2 })
setup_filetype("solidity", { shiftwidth = 4 })
setup_filetype("huff", { shiftwidth = 4, textwidth = 150 })
setup_filetype("python", { shiftwidth = 4 })
setup_filetype("c", { shiftwidth = 4 })
setup_filetype("balls", { shiftwidth = 4 })
setup_filetype("javascript", { shiftwidth = 2 })
setup_filetype("typescript", { shiftwidth = 2 })
setup_filetype("beancount", { shiftwidth = 2 })
setup_filetype("sensei", { shiftwidth = 4 })
