local default_bindins_to_remove = {
  { "n", "gri" },
  { "n", "grr" },
  { "x", "gra" },
  { "n", "gra" },
  { "n", "grn" }
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>e", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, opts)

    for _, binding in ipairs(default_bindins_to_remove) do
      local mode = binding[1]
      local key = binding[2]
      if vim.fn.maparg(key, mode) ~= "" then
        vim.keymap.del(mode, key)
      end
    end

    vim.lsp.inlay_hint.enable()
  end
})

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  }
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      rustfmt = {
        extraArgs = { "+nightly", },
      },
    }
  }
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("zls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("solidity_ls_nomicfoundation")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("clangd")
