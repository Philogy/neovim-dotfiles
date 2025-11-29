local setup_filetype = function(filetype, opts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function(_)
      for opt, value in pairs(opts) do
        if opt == "commentstring" then
          vim.bo.commentstring = value .. " %s"
        else
          vim.opt_local[opt] = value
        end
      end
    end
  })
end

vim.filetype.add({
  extension = {
    huff = "huff",
    balls = "balls",
    glsl = "glsl",
    sen = "sensei",
    jai = "jai",
    tc = "treecalc",
    sir = "sensei-ir"
  }
})

setup_filetype("lua", { shiftwidth = 2 })
setup_filetype("json", { shiftwidth = 4 })
setup_filetype("solidity", { shiftwidth = 4 })
setup_filetype("huff", { shiftwidth = 4, textwidth = 150 })
setup_filetype("python", { shiftwidth = 4 })
setup_filetype("c", { shiftwidth = 4 })
setup_filetype("balls", { shiftwidth = 4 })
setup_filetype("javascript", { shiftwidth = 2 })
setup_filetype("typescript", { shiftwidth = 2 })
setup_filetype("beancount", { shiftwidth = 2 })
setup_filetype("sensei", { shiftwidth = 4, commentstring = "//" })
setup_filetype("jai", { shiftwidth = 4 })
setup_filetype("treecalc", { shiftwidth = 4, commentstring = "//" })
setup_filetype("sensei-ir", { shiftwidth = 4, commentstring = "//" })
