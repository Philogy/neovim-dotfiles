vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.sol",
  callback = function()
    vim.fn.jobstart({ "forge", "fmt", vim.fn.expand("%") }, {
      on_exit = function()
        -- reload file if it changed
        vim.schedule(function()
          -- only reload if buffer still exists and isn’t modified
          if vim.api.nvim_buf_is_valid(0) and not vim.bo.modified then
            vim.cmd("edit!")
          end
        end)
      end,
    })
  end,
})
