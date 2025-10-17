local ls = require 'luasnip'
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local f = ls.function_node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

local licenseChoice = function(pos)
  return c(pos, { t('MIT'), t('BUSL-1.1'), t('AGPL-3.0-only'), t('UNLICENSED'), })
end

return {
  s(
    'b',
    fmt(
      [[
      // SPDX-License-Identifier: {}
      pragma solidity {};

      /// @author philogy <https://github.com/philogy>
      {} {} {{
          {}

      }}
      ]],
      {
        licenseChoice(1),
        c(2, { t('^0.8.0'), i(2) }),
        c(3, { t('contract'), t('interface'), t('abstract contract'), t('library') }),
        i(4),
        i(0)
      }),
    {}
  ),
  s(
    'bt',
    fmt(
      [[
      // SPDX-License-Identifier: {}
      pragma solidity {};

      import {{Test}} from "forge-std/Test.sol";

      /// @author philogy <https://github.com/philogy>
      contract {}Test is Test {{
          function setUp() public {{
              {}
          }}
          {}
      }}
      ]],
      {
        licenseChoice(1),
        c(2, { t('^0.8.0'), i(2) }),
        i(3),
        i(4),
        i(0)
      }

    )
  ),
  s(
    't',
    fmt([[function test_{}() public {} {{
    {}

}}]], { i(1), i(2), i(3) })
  ),
  s('ft',
    fmt([[function test_fuzzing{}({}) public {} {{
    {}

}}]], { i(1), i(2), i(3), i(4) })
  ),
  s('pr',
    fmt([[vm.startPrank({});
{}
vm.stopPrank();]], { i(1), i(2) })
  ),
  s('dev',
    fmt("/**\n * @dev {1}\n */", { i(1) })),
  s('im', fmt('import {{{}{}}} from "{}";{}', {
    f(function(args)
      local matches = string.match(args[1][1], ".*")
      vim.print(matches)
      if matches == nil then
        return ""
      else
        return matches[1]
      end
    end, { 1 }),
    i(2),
    i(1),
    i(0)
  })),
  s('ic', fmt('import {{console}} from "forge-std/console.sol";{}', { i(0) })),
  s('ics', fmt('import {{safeconsole as console}} from "forge-std/safeconsole.sol";', {})),
  s('ivm',
    fmt('import {{Vm}} from "forge-std/Vm.sol";Vm constant vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);', {})),
  s('if', fmt('import {{FormatLib}} from "super-sol/libraries/FormatLib.sol";{}', { i(0) })),
  s('solady', fmt('import {{{}}} from "solady/src/{}/{}.sol";{}', { i(1), i(2), rep(1), i(0) })),
  s('uf', fmt('using FormatLib for *;{}', { i(0) })),
  s('mem', fmt('/// @solidity memory-safe-assembly\n{}', { i(0) })),
  s('co', fmt('console.log("{}");{}', { i(1), i(0) })),
  s('c', fmt('console.log("{}: %s", {}{});', { i(1), rep(1), c(2, { t(""), t(".toStr()"), t(".fmtD()") }) })),
  s('cx', fmt('console.log("{}: %x", uint({}));', { i(1), rep(1), })),
  s('cb', fmt('console.logBytes({});', { i(1), })),
  s('asm', fmt("assembly {}{{\n\t{}\n}}", { c(1, { t(""), t("(\"memory-safe\") ") }), i(0) })),
  s('for', fmt([[for (uint256 {} = {}; {} < {}; {}{}) {{
    {}
}}]], {
    c(1, { t("i"), t("j"), i(1) }),
    c(2, { t("0"), i(2) }),
    rep(1),
    i(3),
    rep(1),
    c(4, { t("++"), i(4) }),
    i(0)
  })),
  s('fori', fmt([[for (uint256 i = 0; i < {}; i++) {{
    {}
}}]], { i(1), i(0) })),

  s('forj', fmt([[for (uint256 j = 0; j < {}; j++) {{
    {}
}}]], { i(1), i(0) })),
  s('forin', fmt([[for (uint256 {} = 0; {} < {}.length; {}++) {{
    {} = {}[{}];
    {}
}}]], {
    c(1, { t("i"), t("j"), i(1) }),
    rep(1),
    i(2),
    rep(1),
    i(3),
    rep(2),
    rep(1),
    i(0)
  })),
  s(
    'struct',
    fmt(
      [[
      // SPDX-License-Identifier: {}
      pragma solidity {};

      struct {} {{
          {}
      }}

      using {}Lib for {} global;

      /// @author philogy <https://github.com/philogy>
      library {}Lib {{
          {}
      }}
      ]],
      {
        licenseChoice(1),
        c(2, { t('^0.8.13'), i(2) }),
        i(3),
        i(4),
        rep(3),
        rep(3),
        rep(3),
        i(0)
      }),
    {}
  ),
  s(
    'type',
    fmt(
      [[
      // SPDX-License-Identifier: {}
      pragma solidity {};

      type {} is uint256;

      using {}Lib for {} global;

      /// @author philogy <https://github.com/philogy>
      library {}Lib {{
          {}
      }}
      ]],
      {
        licenseChoice(1),
        c(2, { t('^0.8.13'), i(2) }),
        i(3),
        rep(3),
        rep(3),
        rep(3),
        i(0)
      }),
    {}
  ),
  s(
    'dc',
    fmt('if (DEBUG_LOGS) console.log("{}");{}', { i(1), i(0) })
  ),
  s('sum', fmt([[0;
for (uint256 {} = 0; {} < {}.length; {}++) {{
    {} += {}[{}];
}}]], {
    c(1, { t("i"), t("j"), t("k"), i(1) }),
    rep(1),
    i(2),
    rep(1),
    i(3),
    rep(2),
    rep(1)
  })),
  s(
    'expect_revert',
    fmt('/// forge-config: default.allow_internal_expect_revert = true', {})
  ),
  s('uconst', fmt('uint256 constant {} = {};{}', { i(1), i(2), i(0) }))
}, {

}
