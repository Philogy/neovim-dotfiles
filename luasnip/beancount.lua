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
    'eth',
    fmt([[
  {}: "{}"
  {}-link: "https://etherscan.io/tx/{}"]], {
      i(1),
      i(2),
      rep(1),
      rep(2)
    })
  ),
  s(
    'poly',
    fmt([[
  {}: "{}"
  {}-link: "https://polygonscan.com/tx/{}"]], {
      i(1),
      i(2),
      rep(1),
      rep(2)
    })
  ),
  s(
    'link',
    fmt([[
  {}: "{}"
  {}-link: "https://{}/{}"]], {
      i(1),
      i(2),
      rep(1),
      i(3),
      rep(2)
    })
  )
}, {

}
