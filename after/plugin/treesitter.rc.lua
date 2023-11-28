local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print('no tree')
  return
end

ts.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { "python" }
  },
  ensure_installed = {
    'javascript',
    'tsx',
    'json',
    'css',
    'toml',
    'solidity',
    'python',
    'beancount',
    'rust',
    'nix',
    'lua'
  }
}
