local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print('no tree')
  return
end


local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.balls = {
  install_info = {
    url = 'https://github.com/Philogy/tree-sitter-balls',
    files = { 'src/parser.c' },
    branch = 'main',
    generate_requires_npm = true,          -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  }
}


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
    'lua',
    'balls'
  }
}
