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
    fmt('println!("{}: {{{}}}", {});', { rep(1), c(2, { t(":?"), t("") }), i(1) })
  ),
  s('pr', fmt('println!("{}");', { i(1) })),
  s('hex', fmt('println!("{}: {{}}", hex::encode(&{}));', { i(1), rep(1) })),
  s('struct', fmt([[#[derive(Debug, Clone)]
{}struct {} {{
  {}

}}]], { c(1, { t(""), t("pub ") }), i(2), i(0) })),
  s('tests', fmt([[#[cfg(test)]
mod tests {{
    use super::*;
    {}
}}]], { i(0) }))
}, {

}
