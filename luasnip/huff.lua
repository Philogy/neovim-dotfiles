local ls = require 'luasnip'
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

return {
  s(
    'macro',
    fmt(
      [[
#define macro {}({}) = takes({}) returns({}) {{
    {}
}}
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(0)

      }),
    {}
  ),
  s(
    'main',
    fmt(
      [[
#define macro MAIN() = takes(0) returns(0) {{
    {}
}}]]
      ,
      {
        i(0)
      }),
    {}
  ),
  s(
    'const',
    fmt('#define constant {} = 0x{}', { i(1), i(2) }),
    {}
  )
}, {

}
