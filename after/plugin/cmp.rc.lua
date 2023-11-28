local status, cmp = pcall(require, 'cmp')
if (not status) then return end

local lspkind = require 'lspkind'

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    -- ['<Esc>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.abort()
    --     fallback()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    ['<C-y>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' }
  },
  snippet = {
    expand = function(args)
      local luasnip_status, luasnip = pcall(require, 'luasnip')
      if (not luasnip_status) then return end
      luasnip.lsp_expand(args.body)
    end

  },
  formatting = {
    format = lspkind.cmp_format { with_text = false, maxwidth = 50 }
  }
}

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
