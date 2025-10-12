return {
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        opts = {
            terminal = true,
            style = 'auto',
            transparent = false,
            italics = false,
            guicursor = false
        }
    },
}
