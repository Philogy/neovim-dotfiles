local ls = require 'luasnip'
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

return {
  s(
    'p',
    fmt('print(f\'{}: {{{}}}\')', { rep(1), i(1) })
  ),
  s(
    'main',
    fmt([[if __name__ == '__main__':
    {}
    ]], { i(0) })
  ),
  s(
    'pr',
    fmt('print({})', { i(0) })
  ),
  s(
    'b',
    fmt([[def main():
    {}

if __name__ == '__main__':
    main()]], { i(0) })
  )
}, {

}
