local ls = require 'luasnip'
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

return {
  s('p', fmt('printf("{}: %d\\n", {});{}', { rep(1), i(1), i(0) })),
  s('pr', fmt('printf("{}\\n");{}', { i(1), i(0) })),
  s('enum', fmt([[typedef enum : uint8_t {{
    {}
}} {};{}]], { i(2), i(1), i(0) })),
  s('struct', fmt([[typedef struct {{
    {}
}} {};{}]], { i(2), i(1), i(0) }))
}, {

}
