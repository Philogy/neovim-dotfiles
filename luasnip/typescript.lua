local ls = require 'luasnip'
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

local licenseChoice = function(pos)
  return c(pos, { t('UNLICENSED'), t('MIT'), t('GPL-3.0-only') })
end

return {
  s(
    'c',
    fmt('console.log(\'{}:\', {})', { i(1), rep(1) })
  ),
  s('co', fmt('console.log({})', { i(1) }))
}, {

}
