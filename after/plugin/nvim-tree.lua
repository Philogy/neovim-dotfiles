local nvim_tree = require('nvim-tree')
local api = require("nvim-tree.api")

nvim_tree.setup({
  update_focused_file = {
    enable = true
  },
  view = {
    side = "right"
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true
    }
  },
  on_attach = function(bufnr)
    -- Remap option builder.
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true
      }
    end

    -- ensure the default mappings are attached
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "n", api.fs.create, opts("Create File or Directory"))
    vim.keymap.set("n", "m", api.marks.bulk.move, opts("Move Bookmarked"))
    vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))

    -- Mark and go one down to next
    vim.keymap.set("n", "<Tab>", function()
      api.marks.toggle()
      vim.cmd('norm! j')
    end, opts("Toggle mark and go to next"))
    -- Clear marks (if confirmed)
    vim.keymap.set("n", "M", function()
      local x = vim.fn.input({
        prompt = "Clear marks (Y/n)?",
        cancelreturn = "n"
      })
      if x == "" or x == "y" or x == "Y" then
        api.marks.clear()
        print("marks cleared")
      else
        print("cancelled")
      end
    end, opts("Clear all marks"))

    vim.keymap.set("n", "<Esc>", function()
      if api.tree.is_tree_buf() then
        api.tree.close()
      end
    end)
  end,
})

vim.keymap.set("n", "<C-n>", function()
  if api.tree.is_visible() and api.tree.is_tree_buf() then -- if you're in the tree assume you're toggling closed
    -- also clear marks on close
    api.marks.clear()
    api.tree.close()
  elseif api.tree.is_visible() then --
    api.tree.open()
  else
    api.tree.collapse_all()
    api.tree.open()
  end
end)
