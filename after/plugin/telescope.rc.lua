local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = telescope.extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      initial_mode = 'normal',
      theme = 'dropdown',
      grouped = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end
        },
        ['n'] = {
          ['n'] = fb_actions.create,
          ['m'] = fb_actions.move,
          ['r'] = fb_actions.rename,
          ['d'] = fb_actions.remove,
          ['c'] = fb_actions.copy,
          ['h'] = fb_actions.goto_parent_dir,
          ['I'] = fb_actions.toggle_hidden,
          ['B'] = fb_actions.toggle_browser,
          ['<C-n>'] = actions.close
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
local normal = { initial_mode = 'normal' }

vim.keymap.set('n', '<leader>f', function() builtin.find_files({ hidden = false }) end, opts)
vim.keymap.set('n', '<leader>o', function() builtin.oldfiles(normal) end, opts)
vim.keymap.set('n', '<leader>pF', function() builtin.find_files({ hidden = true }) end, opts)
vim.keymap.set('n', '<leader>r', function() builtin.live_grep({ hidden = true }) end, opts)
vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
vim.keymap.set('n', 'gn', function() builtin.diagnostics() end, opts)
vim.keymap.set('n', 'gr', function() builtin.lsp_references() end, opts)

vim.keymap.set('n', '<leader>b', function()
  builtin.buffers({ ignore_current_buffer = true, sort_mru = true })
end, opts)

local open_filebrowser = function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    file_ignore_patterns = {},
    respect_gitignore = false
  })
end
vim.keymap.set('n', '<C-n>', open_filebrowser, opts)
vim.keymap.set('n', '<CR>', open_filebrowser, opts)
