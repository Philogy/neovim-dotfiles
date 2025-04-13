-- Connect System <> Vim Clipboards
vim.opt.clipboard:append { "unnamedplus" }

-- Temporarily highlights content that is being highlighted
vim.api.nvim_create_autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.hl.on_yank({
            timeout = 140,
        })
    end,
})
