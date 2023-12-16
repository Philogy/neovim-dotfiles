local status, indent_blankline = pcall(require, 'ibl')
if (not status) then return end

indent_blankline.setup {
  scope = {
    enabled = false
  },
  whitespace = {
    remove_blankline_trail = true,
  },
  indent = { char = '¦' }
}
