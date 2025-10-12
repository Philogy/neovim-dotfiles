local function config()
    require("ibl").setup({
        scope = {
            enabled = false
        },
        whitespace = {
            remove_blankline_trail = false,
        },
        indent = { char = '¦' }
    })
end

return {
    "lukas-reineke/indent-blankline.nvim",
    config = config
}
