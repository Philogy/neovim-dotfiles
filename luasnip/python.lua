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
    fmt('print(f\'{}: {{{}{}}}\'){}', { rep(1), i(1), i(2), i(3) })
  ),
  s(
    'pr',
    fmt('print(f\'{}\')', { i(1), })
  ),
}, {

}
