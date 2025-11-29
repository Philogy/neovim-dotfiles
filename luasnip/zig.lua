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
    fmt('std.debug.print("{}: {{{}}}\\n", .{{ {} }});', { rep(1), c(2, { i(2), t("") }), i(1) })
  ),
  s(
    'pr',
    fmt('std.debug.print("{}\\n", .{{  }});', { i(1) })
  ),
  s(
    'std',
    fmt('const std = @import("std");{}', { i(0) })
  ),
}, {

}
