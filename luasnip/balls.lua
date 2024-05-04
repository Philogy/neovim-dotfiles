local ls = require 'luasnip'
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

return {
  s(
    'fn',
    fmt(
      [[
fn {}<z0>({}) -> ({}) {{
    {}
}}
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(0)
      }),
    {}
  ),
  s(
    'extern',
    fmt('extern {}({}) stack({}, {}){}', { i(1), i(2), i(3), i(4), i(0) })
  )
}, {

}
