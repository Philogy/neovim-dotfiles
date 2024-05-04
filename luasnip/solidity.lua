local ls = require 'luasnip'
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node
local c = ls.choice_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

local licenseChoice = function(pos)
  return c(pos, { t('UNLICENSED'), t('MIT'), t('GPL-2.0-or-later'), t('AGPL-3.0-only') })
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
        i(2),
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
        i(2),
        i(3),
        i(4),
        i(0)
      }

    )
  ),
  s(
    'lb',
    fmt('emit log_named_bytes("{}", {});', { i(1), rep(1) })
  ),
  s(
    'ly',
    fmt('emit log_named_bytes32("{}", {});', { i(1), rep(1) })
  ),
  s(
    'lu',
    fmt('emit log_named_uint("{}", {});', { i(1), rep(1) })
  ),
  s(
    'ldu',
    fmt('emit log_named_decimal_uint("{}", {}, {});', { i(1), rep(1), c(2, { t('18'), t('6'), t('8') }) })
  ),
  s(
    'rr',
    fmt('returndatacopy(returndatasize(), returndatasize(), {})', { i(0) })
  ),
  s(
    'logs',
    fmt(
      [[emit log_named_string("{}", {});

]],
      { i(1), rep(1) }
    )
  ),
  s(
    'la',
    fmt([[emit log_named_address("{}", {});

]],
      { i(1), rep(1) })
  ),
  s(
    'eq',
    fmt([[assertEq({}, {});

]],
      { i(1), i(2) })
  ),
  s('pr',
    fmt([[vm.startPrank({});
{}
vm.stopPrank();]], { i(1), i(2) })
  ),
  s('dev',
    fmt([[/**
 * @dev {1}
 */]], { i(1) })),
  s('ic', fmt('import {{console2 as console}} from "forge-std/console2.sol";{}', { i(0) })),
  s('asm', fmt([[assembly ("memory-safe") {{
    {}
}}{}]], { i(1), i(0) })),
  s('c', fmt('console.log("{}: %s", {});{}', { i(1), rep(1), i(0) })),
  s('co', fmt('console.log("{}");{}', { i(1), i(0) })),
  s('cb', fmt('console.log("{}: %s", {} ? "true" : "false");{}', { i(1), rep(1), i(0) })),
  s('sc',

    fmt(
      [[
      // SPDX-License-Identifier: {}
      pragma solidity {};

      import {{Script}} from "forge-std/Script.sol";
      import {{Test}} from "forge-std/Test.sol";
      import {{console2 as console}} from "forge-std/console2.sol";

      /// @author philogy <https://github.com/philogy>
      contract {}Script is Test, Script {{
          function run() public {{
              uint256 pk = vm.envUint("PRIV_KEY");
              address me = vm.addr(pk);
              vm.startBroadcast(pk);
              {}
              vm.stopBroadcast();
          }}
          {}
      }}
      ]],
      {
        licenseChoice(1),
        i(2),
        i(3),
        i(4),
        i(0)
      }

    )

  ),
  s(
    'fori',
    fmt([[for (uint i = 0; i < {}; i++) {{
    {}
}}]], { i(1), i(0) })
  )

}, {

}
