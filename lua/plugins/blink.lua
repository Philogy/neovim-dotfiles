return {
    "saghen/blink.cmp",
    version = '1.*',
    opts = {
        keymap = {
            preset = "default",
            ['<C-j>'] = { 'snippet_forward', 'fallback' },
            ['<C-k>'] = { 'snippet_backward', 'fallback' },
        },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },
    }
}
